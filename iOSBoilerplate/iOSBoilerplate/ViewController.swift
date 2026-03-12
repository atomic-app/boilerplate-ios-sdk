//
//  ViewController.swift
//  iOSBoilerplate
//
//  Created by Eric on 23/12/22.
//

import UIKit
import AtomicSDK

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    private let badgeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBadgeLabel()
        
        // To initialise the badge before the container is opened.
        AACSession.observeStreamContainer(identifier: AtomicSettings.streamContainerId, configuration: nil) { [weak self] _ in
            self?.fetchAndUpdateBadge()
        }

        // To update the unseen badge once some of the cards are displayed in the container.
        // If there are multiple containers displaying, we can convert the events to solid AACSDKEvent classes to fetch the stream container id to filter out irrelevant container events.
        AACSession.observeSDKEvents { [weak self] event in
            switch event.eventType {
            case .cardDisplayed, .cardFeedUpdated:
                self?.fetchAndUpdateBadge()
            default:
                break
            }
        }
    }

    private func fetchAndUpdateBadge() {
        AACSession.userMetrics { [weak self] metrics, _ in
            guard let metrics = metrics else { return }
            let count = metrics.unseenCardsForStreamContainer(withId: AtomicSettings.streamContainerId)
            DispatchQueue.main.async {
                self?.updateBadge(count)
            }
        }
    }

    private func configureBadgeLabel() {
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .systemRed
        badgeLabel.font = .systemFont(ofSize: 12, weight: .bold)
        badgeLabel.textAlignment = .center
        badgeLabel.clipsToBounds = true
        badgeLabel.isHidden = true
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(badgeLabel)

        NSLayoutConstraint.activate([
            badgeLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: -8),
            badgeLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 8),
            badgeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            badgeLabel.widthAnchor.constraint(greaterThanOrEqualTo: badgeLabel.heightAnchor)
        ])
    }

    private func updateBadge(_ count: Int) {
        if count > 0 {
            badgeLabel.text = " \(count) "
            badgeLabel.isHidden = false
            badgeLabel.sizeToFit()
            badgeLabel.layer.cornerRadius = badgeLabel.frame.height / 2
        } else {
            badgeLabel.isHidden = true
        }
    }

    @IBAction func didTapDefaultContainer(_ sender: Any) {
        let config = AACConfiguration()
        let container = AACStreamContainerViewController(identifier: AtomicSettings.streamContainerId, configuration: config)
        present(container, animated: true)
    }
}

