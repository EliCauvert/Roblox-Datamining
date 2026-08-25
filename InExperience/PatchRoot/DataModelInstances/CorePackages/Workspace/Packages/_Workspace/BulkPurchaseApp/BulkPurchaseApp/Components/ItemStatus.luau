local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local itemStatusToItemStatusKeyModule = require(bulkPurchaseApp.Enums.ItemStatusToItemStatusKey)
local itemStatusKeyToLocalizationKeyModule = require(bulkPurchaseApp.Enums.ItemStatusKeyToLocalizationKey)

local function mapTokens(p0)
	return {
		successColor = p0.Color.System.Success,
		failureColor = p0.Color.System.Alert,
		fontStyle = p0.Typography.BodySmall
	}
end

return function(p1)
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