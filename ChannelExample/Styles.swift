//
//  Styles.swift
//  ChannelExample
//
//  Created by Robin Malhotra on 22/04/18.
//  Copyright © 2018 Robin Malhotra. All rights reserved.
//

import UIKit

func style(from color: UIColor, font: UIFont) -> [NSAttributedStringKey: Any] {
	return [
		NSAttributedStringKey.font: font,
		NSAttributedStringKey.foregroundColor: color
	]
}

extension UIFont {
	var withMonospacedNumbers: UIFont {
		// https://stackoverflow.com/questions/30854690/how-to-get-monospaced-numbers-in-uilabel-on-ios-9
		let features = [
			[
				UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
				UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
			]
		]

		let fontDescriptor = self.fontDescriptor.addingAttributes(
			[UIFontDescriptor.AttributeName.featureSettings: features]
		)

		return UIFont(descriptor: fontDescriptor, size: self.pointSize)
	}
}

enum Styles {

	enum Text {
		//TODO: should you have `style` at the end
		static let pillText = style(from: Colors.channelTitle, font: UIFont.preferredFont(forTextStyle: .subheadline).withMonospacedNumbers)
		static let channelTitle = style(from: Colors.channelTitle, font: UIFont.preferredFont(forTextStyle: .headline))
		static let pound = style(from: Colors.secondaryTitle, font: UIFont.preferredFont(forTextStyle: .title3))
		static let tag = style(from: Colors.tagTitle, font: UIFont.preferredFont(forTextStyle: .body))
	}

	enum Colors {
		static let channelBackground = UIColor(red:0.26, green:0.19, blue:0.25, alpha:1.00)
		static let pillBackground = UIColor(red:0.83, green:0.19, blue:0.27, alpha:1.00)
		static let pillText = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
		static let channelTitle = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
		static let secondaryTitle = UIColor(red:0.51, green:0.46, blue:0.51, alpha:1.00)
		static let tagTitle = UIColor(red:0.37, green:0.42, blue:0.45, alpha:1.00)
	}
}
