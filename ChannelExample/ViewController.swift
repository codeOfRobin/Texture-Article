//
//  ViewController.swift
//  ChannelExample
//
//  Created by Robin Malhotra on 22/04/18.
//  Copyright © 2018 Robin Malhotra. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController, ASTableDataSource {

	let tableNode = ASTableNode()
	let channels = ["a11y-l10n-i18n", "apple-rumours", "appnouncements", "aww", "book-club", "bugs", "canada", "career-advice", "carthage"].map{ NSLocalizedString($0, comment: $0) }

	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubnode(tableNode)
		tableNode.view.separatorStyle = .none

		tableNode.backgroundColor = Styles.Colors.channelBackground
		tableNode.dataSource = self
		// Do any additional setup after loading the view, typically from a nib.
	}


	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = view.bounds
	}

	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return channels.count
	}

	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}

	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		return ChannelCell(name: "\(channels[indexPath.row])", count: indexPath.row * Int(pow(Double(10), Double(indexPath.row))))
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}


