local _ = require(game:GetService("CorePackages").Workspace.Packages.Style)

return function(_, p1)
	return {
		Color = {
			backgroundUiColor = p1.Color.Surface.Surface_300,
			separatorColor = p1.Color.Stroke.Emphasis,
			textColor = p1.Color.Content.Emphasis,
			buttonColor = p1.Color.Content.Emphasis,
			buttonTextColor = p1.Color.Surface.Surface_300
		},
		Size = {
			displayWidth = 1920,
			promptWidth = 1080,
			imageWidth = 566,
			imageHeight = 324,
			buttonHeight = p1.Size.Size_1200,
			iconSize = p1.Size.Size_400
		},
		Space = {
			titlePadding = p1.Size.Size_300,
			bodyPadding = p1.Size.Size_600,
			iconPadding = p1.Size.Size_100
		},
		Radius = {
			cornerRadius = p1.Radius.Medium,
			buttonRadius = p1.Radius.Small
		},
		Typography = {
			label = p1.Typography.TitleLarge,
			header = p1.Typography.HeadingSmall,
			caption = p1.Typography.BodyLarge
		}
	}
end