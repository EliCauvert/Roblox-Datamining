local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local config = {
	emptyStateText = "Feature.Catalog.Search.LandingPage.Empty"
}

local function mapTokens(p1)
	return {
		backgroundColor = p1.Color.Surface.Surface_0.Color3,
		backgroundTransparency = p1.Color.Surface.Surface_0.Transparency,
		textColorGroup = p1.Color.Content.Emphasis,
		textFontGroup = p1.Typography.BodyLarge
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