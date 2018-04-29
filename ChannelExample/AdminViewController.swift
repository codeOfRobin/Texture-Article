//
//  AdminViewController.swift
//  ChannelExample
//
//  Created by Robin Malhotra on 24/04/18.
//  Copyright © 2018 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit

class AdminViewController: UIViewController, ASTableDataSource {

	let tableNode = ASTableNode()

	let tags = ["tag", "taggy tag", "tag taggy tag tag", "tagismus maximus taginess"]

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.addSubnode(tableNode)
		tableNode.dataSource = self
		tableNode.view.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = view.bounds
	}

	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}

	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		return TagCell(tags)
	}

}
