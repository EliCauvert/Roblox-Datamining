local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local config = {
	emptyStateText = "Feature.Catalog.Search.LandingPage.Empty"
}

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		backgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
		backgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Transparency,
		textColorGroup = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis,
		textFontGroup = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body
	}
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDesignTokensFunction (copy), mapTokens (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
	return ReactModule.createElement(StyledTextLabel, {
		fontStyle = UseDesignTokensResult.textFontGroup,
		colorStyle = UseDesignTokensResult.textColorGroup,
		text = p1.text or UseLocalizationResult.emptyStateText,
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Center,
		textYAlignment = Enum.TextYAlignment.Center,
		automaticSize = Enum.AutomaticSize.XY,
		size = UDim2.fromScale(1, 1)
	})
end