local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.Style)
local fFlagRenameDeprecatedUIBloxTokens = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

return function(_, p0) --[[ line: 50 ]]
	-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
	return {
		Color = {
			backgroundUiColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Surface.Surface_300 else p0.Semantic.Color.BackgroundUi.Default,
			separatorColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Stroke.Emphasis else p0.Semantic.Color.Common.Divider,
			textColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Content.Emphasis else p0.Semantic.Color.Text.Emphasis,
			buttonColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Content.Emphasis else p0.Semantic.Color.Text.Emphasis,
			buttonTextColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.Surface.Surface_300 else p0.Semantic.Color.BackgroundUi.Default
		},
		Size = {
			displayWidth = 1920,
			promptWidth = 1080,
			imageWidth = 566,
			imageHeight = 324,
			buttonHeight = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_1200 else p0.Global.Size_600,
			iconSize = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_400 else p0.Global.Size_200
		},
		Space = {
			titlePadding = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_300 else p0.Global.Space_150,
			bodyPadding = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_600 else p0.Global.Space_300,
			iconPadding = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_100 else p0.Global.Space_50
		},
		Radius = {
			cornerRadius = if fFlagRenameDeprecatedUIBloxTokens then p0.Radius.Medium else p0.Semantic.Radius.Medium,
			buttonRadius = if fFlagRenameDeprecatedUIBloxTokens then p0.Radius.Small else p0.Semantic.Radius.Small
		},
		Typography = {
			label = if fFlagRenameDeprecatedUIBloxTokens then p0.Typography.TitleLarge else p0.Semantic.Typography.Subheader,
			header = if fFlagRenameDeprecatedUIBloxTokens then p0.Typography.HeadingSmall else p0.Semantic.Typography.Header,
			caption = if fFlagRenameDeprecatedUIBloxTokens then p0.Typography.BodyLarge else p0.Semantic.Typography.Body
		}
	}
end