local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local formatNumberModule = require(parent.Utility.formatNumber)
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local useRobuxTextModule = require(parent.Generic.Hooks.useRobuxText)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local _ = require(parent.ProductPurchase.PricingTypes)

return function(p1)
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), reactModule (ref), formatNumberModule (ref), localizationService (ref), useRobuxTextModule (ref), view (ref), text (ref)
	local var1 = if p1.itemPrice then p1.itemPrice.priceInRobux else p1.amount
	local var2 = useLocalization({
		Total = "Feature.Catalog.Label.TotalUnformatted",
		TotalPrice = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Label.TotalPriceV2" else nil
	})
	local var3 = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then useRobuxTextModule(var1) else reactModule.useMemo(function()
		-- upvalues: formatNumberModule (copy), localizationService (copy), var1 (ref)
		return utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, var1 or 0)
	end, { var1, localizationService.RobloxLocaleId })
	
	return reactModule.createElement(view, {
		tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
	}, {
		BorderContainer = reactModule.createElement(view, {
			tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
		}, {
			LeftSide = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row gap-small align-y-center align-x-start padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				RobuxAmount = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then var2.TotalPrice else var2.Total,
					tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall" else "auto-xy text-label-medium content-default text-align-x-left padding-y-xsmall"
				})
			}),
			RightSide = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				RobuxPrice = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
					RichText = true,
					Text = var3
				}) else reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall",
					Text = var3
				})
			})
		})
	})
end