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
local fFlagPurchasePromptFetchCartPricing = require(parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local _ = require(parent.ProductPurchase.PricingTypes)
local priceSummaryV2UseLocalizedBreakdown = game:DefineFastFlag("PriceSummaryV2UseLocalizedBreakdown", false)

local function _(p1)
	if p1 then
		local basePriceInRobux = p1.basePriceInRobux
		local priceInRobux = p1.priceInRobux
		
		return typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	end
	return false
end

return function(p1)
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), usePlaceholderLocalizationModule (ref), priceSummaryV2UseLocalizedBreakdown (ref), useRobuxTextModule (ref), reactModule (ref), priceLineItemModule (ref), discountRowModule (ref), fFlagPurchasePromptFetchCartPricing (ref), view (ref), divider (ref), text (ref)
	local var1
	local itemPrice = p1.itemPrice
	local var2 = if itemPrice then itemPrice.priceInRobux else p1.amount
	
	if itemPrice then
		local basePriceInRobux = itemPrice.basePriceInRobux
		local priceInRobux = itemPrice.priceInRobux
		var1 = typeof(basePriceInRobux) == "number" and (typeof(priceInRobux) == "number" and priceInRobux < basePriceInRobux)
	else
		var1 = false
	end
	local var3 = useLocalization({
		Total = "Feature.Catalog.Label.TotalUnformatted",
		TotalPrice = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Label.TotalPriceV2" else nil
	})
	local var4 = if priceSummaryV2UseLocalizedBreakdown then useLocalization({
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
	local var5 = useRobuxTextModule(var2)
	local var6 = useRobuxTextModule((if var1 and itemPrice then itemPrice.basePriceInRobux else var2 or 0) or 0)
	
	if not var1 or not itemPrice then
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
						Text = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then var3.TotalPrice else var3.Total,
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
						Text = var5
					}) else reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall",
						Text = var5
					})
				})
			})
		})
	end
	local t = {}
	local var7 = 1
	t.SubtotalRow = reactModule.createElement(priceLineItemModule, {
		label = var4.SubtotalLabel,
		amount = var6,
		LayoutOrder = var7
	})
	var7 += 1
	
	for i, v in ipairs(itemPrice.discounts) do
		if v.amountInRobux > 0 then
			t["DiscountRow_" .. tostring(i)] = reactModule.createElement(discountRowModule, {
				discount = v,
				label = if fFlagPurchasePromptFetchCartPricing then v.localizedDiscountAttribution else nil,
				LayoutOrder = var7
			})
			var7 += 1
		end
	end
	t.BreakdownDivider = reactModule.createElement(view, {
		tag = "col size-full-0 auto-y shrink-0 self-stretch padding-top-small",
		LayoutOrder = var7
	}, {
		Line = reactModule.createElement(divider, { tag = "size-full-0 auto-y" })
	})
	t.TotalRow = reactModule.createElement(priceLineItemModule, {
		textStyle = "text-title-medium",
		tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-y-xsmall",
		label = var4.TotalLabel,
		amount = var5,
		LayoutOrder = var7 + 1
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-xsmall"
	}, {
		BorderContainer = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y shrink-0 radius-medium padding-x-large padding-y-small stroke-default gap-xsmall"
		}, t)
	})
end