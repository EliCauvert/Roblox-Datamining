local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local itemStatusToItemStatusKeyModule = require(bulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local itemStatusKeyToLocalizationKeyModule = require(bulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function mapTokens(p0) --[[ line: 14 ]]
	-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
	return {
		successColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.System.Success else p0.Semantic.Color.Common.Success,
		failureColor = if fFlagRenameDeprecatedUIBloxTokens then p0.Color.System.Alert else p0.Semantic.Color.Common.Alert,
		fontStyle = if fFlagRenameDeprecatedUIBloxTokens then p0.Typography.BodySmall else p0.Semantic.Typography.CaptionBody
	}
end

return function(p1) --[[ line: 32 | named "ItemStatus" ]]
	-- upvalues: useDesignTokens (ref), mapTokens (ref), useLocalization (ref), itemStatusKeyToLocalizationKeyModule (ref), itemStatusToItemStatusKeyModule (ref), reactModule (ref), styledTextLabel (ref)
	local var5 = useDesignTokens(mapTokens)
	
	return reactModule.createElement(styledTextLabel, {
		textWrapped = true,
		fontStyle = var5.fontStyle,
		colorStyle = if p1.status == Enum.MarketplaceItemPurchaseStatus.Success then var5.successColor else var5.failureColor,
		text = useLocalization(itemStatusKeyToLocalizationKeyModule)[itemStatusToItemStatusKeyModule[p1.status]],
		size = UDim2.fromScale(1, 1),
		textXAlignment = Enum.TextXAlignment.Right,
		textYAlignment = Enum.TextYAlignment.Top,
		lineHeight = var5.fontStyle.LineHeight
	})
end