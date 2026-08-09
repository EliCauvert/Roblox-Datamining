local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local divider = foundationModule.Divider
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local useRobuxTextModule = require(parent.Generic.Hooks.useRobuxText)
local usePlaceholderLocalizationModule = require(parent.Generic.Hooks.usePlaceholderLocalization)
local priceLineItemModule = require(parent.Generic.PriceLineItem)
local discountRowModule = require(parent.Generic.DiscountRow)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagUnifiedPurchaseFlowLowercaseTotalPriceModule = require(parent.Flags.FFlagUnifiedPurchaseFlowLowercaseTotalPrice)
local fFlagPurchasePromptFetchCartPricing = require(parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local _ = require(parent.ProductPurchase.PricingTypes)
local priceSummaryV2UseLocalizedBreakdown = game:DefineFastFlag("PriceSummaryV2UseLocalizedBreakdown", false)

local function _(p0) --[[ line: 47 | named "shouldShowPriceBreakdown" ]]
	if p0 then
		local basePriceInRobux = p0.basePriceInRobux
		local priceInRobux = p0.priceInRobux
		
		return typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	end
	return false
end

return function(p1) --[[ line: 58 | named "PriceSummaryV2" ]]
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagUnifiedPurchaseFlowLowercaseTotalPriceModule (ref), usePlaceholderLocalizationModule (ref), priceSummaryV2UseLocalizedBreakdown (ref), useRobuxTextModule (ref), reactModule (ref), priceLineItemModule (ref), discountRowModule (ref), fFlagPurchasePromptFetchCartPricing (ref), view (ref), divider (ref), text (ref)
	local var9
	local itemPrice = p1.itemPrice
	local var8 = if itemPrice then itemPrice.priceInRobux else p1.amount
	
	if itemPrice then
		local basePriceInRobux = itemPrice.basePriceInRobux
		local priceInRobux = itemPrice.priceInRobux
		var9 = typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	else
		var9 = false
	end
	local var10 = useLocalization({
		Total = "Feature.Catalog.Label.TotalUnformatted",
		TotalPrice = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if fFlagUnifiedPurchaseFlowLowercaseTotalPriceModule then "IAPExperience.PurchasePrompt.Label.TotalPriceV2" else "IAPExperience.PurchasePrompt.Label.TotalPrice" else nil
	})
	local var11 = if priceSummaryV2UseLocalizedBreakdown then useLocalization({
		TotalLabel = "IAPExperience.PurchasePrompt.Label.Total",
		SubtotalLabel = if p1.subtotalItemCount then {
			"IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount",
			itemCount = p1.subtotalItemCount
		} else "IAPExperience.PurchasePrompt.Label.Subtotal"
	}) else usePlaceholderLocalizationModule({
		TotalLabel = "IAPExperience.PurchasePrompt.Label.Total",
		SubtotalLabel = if p1.subtotalItemCount then {
			"IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount",
			itemCount = p1.subtotalItemCount
		} else "IAPExperience.PurchasePrompt.Label.Subtotal"
	})
	local var12 = useRobuxTextModule(var8)
	local var13 = useRobuxTextModule((if var9 and itemPrice then itemPrice.basePriceInRobux else var8 or 0) or 0)
	
	if not var9 or not itemPrice then
		return reactModule.createElement(view, {
			tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
		}, {
			BorderContainer = reactModule.createElement(view, {
				tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
			}, {
				LeftSide = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row gap-small align-y-center align-x-start padding-y-xsmall",
					Size = UDim2.new(0.5, 0, 0, 0)
				}, {
					RobuxAmount = reactModule.createElement(text, {
						LayoutOrder = 1,
						Text = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then var10.TotalPrice else var10.Total,
						tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall" else "auto-xy text-label-medium content-default text-align-x-left padding-y-xsmall"
					})
				}),
				RightSide = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
					Size = UDim2.new(0.5, 0, 0, 0)
				}, {
					RobuxPrice = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
						RichText = true,
						Text = var12
					}) else reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall",
						Text = var12
					})
				})
			})
		})
	end
	local t = {}
	local var15 = 1
	t.SubtotalRow = reactModule.createElement(priceLineItemModule, {
		label = var11.SubtotalLabel,
		amount = var13,
		LayoutOrder = var15
	})
	var15 += 1
	
	for i, v in ipairs(itemPrice.discounts) do
		if v.amountInRobux > 0 then
			t["DiscountRow_" .. tostring(i)] = reactModule.createElement(discountRowModule, {
				discount = v,
				label = if fFlagPurchasePromptFetchCartPricing then v.localizedDiscountAttribution else nil,
				LayoutOrder = var15
			})
			var15 += 1
		end
	end
	t.BreakdownDivider = reactModule.createElement(view, {
		tag = "col size-full-0 auto-y shrink-0 self-stretch padding-top-small",
		LayoutOrder = var15
	}, {
		Line = reactModule.createElement(divider, { tag = "size-full-0 auto-y" })
	})
	t.TotalRow = reactModule.createElement(priceLineItemModule, {
		textStyle = "text-title-medium",
		tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-y-xsmall",
		label = var11.TotalLabel,
		amount = var12,
		LayoutOrder = var15 + 1
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-xsmall"
	}, {
		BorderContainer = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y shrink-0 radius-medium padding-x-large padding-y-small stroke-default gap-xsmall"
		}, t)
	})
end