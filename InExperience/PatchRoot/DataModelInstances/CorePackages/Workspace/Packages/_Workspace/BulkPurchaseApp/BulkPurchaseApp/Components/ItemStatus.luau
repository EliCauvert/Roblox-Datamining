local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local itemStatusToItemStatusKeyModule = require(bulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local itemStatusKeyToLocalizationKeyModule = require(bulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function mapTokens(p1)
	return {
		successColor = p1.Color.System.Success,
		failureColor = p1.Color.System.Alert,
		fontStyle = p1.Typography.BodySmall
	}
end

return function(p1)
	-- upvalues: useDesignTokens (ref), mapTokens (ref), useLocalization (ref), itemStatusKeyToLocalizationKeyModule (ref), itemStatusToItemStatusKeyModule (ref), reactModule (ref), styledTextLabel (ref)
	local var1 = useDesignTokens(mapTokens)
	
	return reactModule.createElement(styledTextLabel, {
		textWrapped = true,
		fontStyle = var1.fontStyle,
		colorStyle = if p1.status == Enum.MarketplaceItemPurchaseStatus.Success then var1.successColor else var1.failureColor,
		text = useLocalization(itemStatusKeyToLocalizationKeyModule)[itemStatusToItemStatusKeyModule[p1.status]],
		size = UDim2.fromScale(1, 1),
		textXAlignment = Enum.TextXAlignment.Right,
		textYAlignment = Enum.TextYAlignment.Top,
		lineHeight = var1.fontStyle.LineHeight
	})
end