//
//  PostNode.swift
//  ChannelExample
//
//  Created by Robin Malhotra on 29/04/18.
//  Copyright © 2018 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class PostNode: ASCellNode {
	let avatarNode = ASNetworkImageNode()
	let nameNode = ASTextNode()
	let timeNode = ASTextNode()
	let messageNode = ASTextNode()

	init(viewModel: PostViewModel) {
		super.init()
		self.automaticallyManagesSubnodes = true
		avatarNode.style.width = ASDimensionMake(36)
		avatarNode.style.height = ASDimensionMake(36)

		switch viewModel.avatar {
		case .image(let image):
			avatarNode.image = image
		case .url(let url):
			avatarNode.url = url
		}

		let dateFormatter = DateFormatter()
		dateFormatter.timeStyle = .short
		dateFormatter.dateStyle = .medium
		nameNode.attributedText = NSAttributedString(string: viewModel.name, attributes: Styles.Text.messageSenderName)
		timeNode.attributedText = NSAttributedString(string: dateFormatter.string(from: viewModel.time), attributes: Styles.Text.sentTime)
		messageNode.attributedText = NSAttributedString(string: viewModel.message, attributes: Styles.Text.message)
	}

	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let nameAndDate = ASStackLayoutSpec(direction: .horizontal, spacing: 12.0, justifyContent: .start, alignItems: .center, children: [nameNode, timeNode])
		let nameAndMessage = ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .start, alignItems: .start, children: [nameAndDate, messageNode])

		let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 12.0, justifyContent: .start, alignItems: .start, children: [avatarNode, nameAndMessage])
		nameAndMessage.style.flexShrink = 0.1
		return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 9, left: 12, bottom: 9, right: 12), child: stack)
	}
}
