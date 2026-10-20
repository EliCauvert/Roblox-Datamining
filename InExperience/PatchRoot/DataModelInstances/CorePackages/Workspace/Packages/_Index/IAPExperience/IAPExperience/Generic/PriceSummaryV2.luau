local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseRobuxTextModule = require(Parent.Generic.Hooks.useRobuxText)
local UsePlaceholderLocalizationModule = require(Parent.Generic.Hooks.usePlaceholderLocalization)
local PriceLineItemModule = require(Parent.Generic.PriceLineItem)
local DiscountRowModule = require(Parent.Generic.DiscountRow)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local _ = require(Parent.ProductPurchase.PricingTypes)
local PriceSummaryV2UseLocalizedBreakdown = game:DefineFastFlag("PriceSummaryV2UseLocalizedBreakdown", false)

local function _(p1): boolean --[[ Line: 42 | Named "shouldShowPriceBreakdown" ]]
	if p1 then
		local BasePriceInRobux = p1.basePriceInRobux
		local PriceInRobux = p1.priceInRobux
		
		return typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and PriceInRobux < BasePriceInRobux
	else
		return false
	end
end

return function(p1) --[[ Line: 53 | Named "PriceSummaryV2" ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), UsePlaceholderLocalizationModule (copy), PriceSummaryV2UseLocalizedBreakdown (copy), UseRobuxTextModule (copy), ReactModule (copy), PriceLineItemModule (copy), DiscountRowModule (copy), View (copy), Divider (copy), Text (copy)
	local ItemPrice = p1.itemPrice
	local PriceInRobux = if ItemPrice then ItemPrice.priceInRobux else p1.amount
	local v1 = nil
	
	if ItemPrice then
		local BasePriceInRobux = ItemPrice.basePriceInRobux
		local PriceInRobux1 = ItemPrice.priceInRobux
		v1 = typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux1) == "number" and PriceInRobux1 < BasePriceInRobux
	else
		v1 = false
	end
	local UseLocalizationResult = UseLocalizationFunction({
		Total = "Feature.Catalog.Label.TotalUnformatted",
		TotalPrice = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Label.TotalPriceV2" else nil
	})
	local UseLocalizationResult1 = if PriceSummaryV2UseLocalizedBreakdown then UseLocalizationFunction({
		TotalLabel = "IAPExperience.PurchasePrompt.Label.Total",
		SubtotalLabel = if p1.subtotalItemCount then {
			"IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount",
			itemCount = p1.subtotalItemCount
		} else "IAPExperience.PurchasePrompt.Label.Subtotal"
	}) else UsePlaceholderLocalizationModule({
		TotalLabel = "IAPExperience.PurchasePrompt.Label.Total",
		SubtotalLabel = if p1.subtotalItemCount then {
			"IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount",
			itemCount = p1.subtotalItemCount
		} else "IAPExperience.PurchasePrompt.Label.Subtotal"
	})
	local UseRobuxTextModuleResult = UseRobuxTextModule(PriceInRobux)
	local UseRobuxTextModuleResult1 = UseRobuxTextModule((if v1 and ItemPrice then ItemPrice.basePriceInRobux else PriceInRobux or 0) or 0)
	
	if not v1 or not ItemPrice then
		return ReactModule.createElement(View, {
			tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
		}, {
			BorderContainer = ReactModule.createElement(View, {
				tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
			}, {
				LeftSide = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row gap-small align-y-center align-x-start padding-y-xsmall",
					Size = UDim2.new(0.5, 0, 0, 0)
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
					Size = UDim2.new(0.5, 0, 0, 0)
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
	local LayoutOrder = 1
	local config = {
		SubtotalRow = ReactModule.createElement(PriceLineItemModule, {
			label = UseLocalizationResult1.SubtotalLabel,
			amount = UseRobuxTextModuleResult1,
			LayoutOrder = LayoutOrder
		})
	}
	local NewLayoutOrder = LayoutOrder + 1
	
	for i, discount in ipairs(ItemPrice.discounts) do
		if discount.amountInRobux > 0 then
			config["DiscountRow_" .. tostring(i)] = ReactModule.createElement(DiscountRowModule, {
				discount = discount,
				label = discount.localizedDiscountAttribution,
				LayoutOrder = NewLayoutOrder
			})
			NewLayoutOrder += 1
		end
	end
	config.BreakdownDivider = ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y shrink-0 self-stretch padding-top-small",
		LayoutOrder = NewLayoutOrder
	}, {
		Line = ReactModule.createElement(Divider, { tag = "size-full-0 auto-y" })
	})
	config.TotalRow = ReactModule.createElement(PriceLineItemModule, {
		textStyle = "text-title-medium",
		tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-y-xsmall",
		label = UseLocalizationResult1.TotalLabel,
		amount = UseRobuxTextModuleResult,
		LayoutOrder = NewLayoutOrder + 1
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-xsmall"
	}, {
		BorderContainer = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y shrink-0 radius-medium padding-x-large padding-y-small stroke-default gap-xsmall"
		}, config)
	})
end