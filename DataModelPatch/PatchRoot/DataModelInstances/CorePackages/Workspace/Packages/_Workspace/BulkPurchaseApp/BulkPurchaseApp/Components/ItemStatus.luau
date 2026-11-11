local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local ItemStatusToItemStatusKeyModule = require(BulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local ItemStatusKeyToLocalizationKeyModule = require(BulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		successColor = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.System.Success else p1.Semantic.Color.Common.Success,
		failureColor = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.System.Alert else p1.Semantic.Color.Common.Alert,
		fontStyle = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodySmall else p1.Semantic.Typography.CaptionBody
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), UseLocalizationFunction (copy), ItemStatusKeyToLocalizationKeyModule (copy), ItemStatusToItemStatusKeyModule (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
	return ReactModule.createElement(StyledTextLabel, {
		textWrapped = true,
		fontStyle = UseDesignTokensResult.fontStyle,
		colorStyle = if p1.status == Enum.MarketplaceItemPurchaseStatus.Success then UseDesignTokensResult.successColor else UseDesignTokensResult.failureColor,
		text = UseLocalizationFunction(ItemStatusKeyToLocalizationKeyModule)[ItemStatusToItemStatusKeyModule[p1.status]],
		size = UDim2.fromScale(1, 1),
		textXAlignment = Enum.TextXAlignment.Right,
		textYAlignment = Enum.TextYAlignment.Top,
		lineHeight = UseDesignTokensResult.fontStyle.LineHeight
	})
end