//
//  MessagesViewController.swift
//  ChannelExample
//
//  Created by Robin Malhotra on 29/04/18.
//  Copyright © 2018 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

enum Avatar {
	case url(URL)
	case image(UIImage)
}

struct PostViewModel {
	let name: String
	let avatar: Avatar
	let time: Date
	let message: String
}

class MessagesViewController: UIViewController, ASTableDataSource {

	let tableNode = ASTableNode()

	let posts: [PostViewModel] = [
		PostViewModel(name: "Robot 1", avatar: .url(URL(string: "https://robohash.org/asdf")!), time: Date(), message: "beep booop"),
		PostViewModel(name: "Robot 2", avatar: .url(URL(string: "https://robohash.org/asdf1")!), time: Date(), message: "AN SSL ERROR HAS OCCURED AND A SECURE CONNECTION TO THE SERVER CANNOT BE MADE"),
		PostViewModel(name: "Robot 1", avatar: .url(URL(string: "https://robohash.org/asdf")!), time: Date(), message: "AN ARTFULLY WORDED TRAGEDY"),
		PostViewModel(name: "Robot 1", avatar: .url(URL(string: "https://robohash.org/asdf1")!), time: Date(), message: """
		TO LIVE
		CONDITION: OR
		NOT TO LIVE
		IF TRUE
		THAT IS THE QUESTION
		""")
	]

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.addSubnode(tableNode)

		tableNode.dataSource = self
		tableNode.view.tableFooterView = UIView()
		tableNode.view.separatorStyle = .none

		tableNode.inverted = true

    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = view.bounds
	}

	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}

	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}

	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		return PostNode(viewModel: posts[indexPath.row])
	}
}
