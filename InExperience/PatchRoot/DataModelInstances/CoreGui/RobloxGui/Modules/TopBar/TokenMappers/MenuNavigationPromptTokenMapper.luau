local _ = require(game:GetService("CorePackages").Workspace.Packages.Style)

return function(_, p0)
	return {
		Color = {
			backgroundUiColor = p0.Color.Surface.Surface_300,
			separatorColor = p0.Color.Stroke.Emphasis,
			textColor = p0.Color.Content.Emphasis,
			buttonColor = p0.Color.Content.Emphasis,
			buttonTextColor = p0.Color.Surface.Surface_300
		},
		Size = {
			displayWidth = 1920,
			promptWidth = 1080,
			imageWidth = 566,
			imageHeight = 324,
			buttonHeight = p0.Size.Size_1200,
			iconSize = p0.Size.Size_400
		},
		Space = {
			titlePadding = p0.Size.Size_300,
			bodyPadding = p0.Size.Size_600,
			iconPadding = p0.Size.Size_100
		},
		Radius = {
			cornerRadius = p0.Radius.Medium,
			buttonRadius = p0.Radius.Small
		},
		Typography = {
			label = p0.Typography.TitleLarge,
			header = p0.Typography.HeadingSmall,
			caption = p0.Typography.BodyLarge
		}
	}
end