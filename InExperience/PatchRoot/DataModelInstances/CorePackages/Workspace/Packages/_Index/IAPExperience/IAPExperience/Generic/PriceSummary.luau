local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseRobuxTextModule = require(Parent.Generic.Hooks.useRobuxText)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local _ = require(Parent.ProductPurchase.PricingTypes)

return function(p1) --[[ Line: 29 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), UseRobuxTextModule (copy), View (copy), Text (copy)
	local PriceInRobux = if p1.itemPrice then p1.itemPrice.priceInRobux else p1.amount
	local UseLocalizationResult = UseLocalizationFunction({
		Total = "Feature.Catalog.Label.TotalUnformatted",
		TotalPrice = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Label.TotalPriceV2" else nil
	})
	local UseRobuxTextModuleResult = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then UseRobuxTextModule(PriceInRobux) else ReactModule.useMemo(function(): string --[[ Line: 38 ]]
		-- upvalues: FormatNumberModule (upval), LocalizationService (upval), PriceInRobux (copy)
		return utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, PriceInRobux or 0)
	end, { PriceInRobux, LocalizationService.RobloxLocaleId })
	
	return ReactModule.createElement(View, {
		tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
	}, {
		BorderContainer = ReactModule.createElement(View, {
			tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
		}, {
			LeftSide = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row gap-small align-y-center align-x-start padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				RobuxAmount = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then UseLocalizationResult.TotalPrice else UseLocalizationResult.Total,
					tag = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall" else "auto-xy text-label-medium content-default text-align-x-left padding-y-xsmall"
				})
			}),
			RightSide = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				RobuxPrice = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
					RichText = true,
					Text = UseRobuxTextModuleResult
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall",
					Text = UseRobuxTextModuleResult
				})
			})
		})
	})
end