local IAPExperience = script:FindFirstAncestor("IAPExperience")
local parent = IAPExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local foundationModule = require(parent.Foundation)
local accordion = foundationModule.Accordion
local view = foundationModule.View
local divider = foundationModule.Divider
local iconName = foundationModule.Enums.IconName
local formatNumberModule = require(IAPExperience.Utility.formatNumber)
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRobuxTextModule = require(IAPExperience.Generic.Hooks.useRobuxText)
local useDiscountAccordionConfigModule = require(IAPExperience.Generic.Hooks.useDiscountAccordionConfig)
local discountType = require(IAPExperience.ProductPurchase.PricingTypes).DiscountType
local discountRowModule = require(IAPExperience.Generic.DiscountRow)
local priceLineItemModule = require(IAPExperience.Generic.PriceLineItem)
local fFlagPurchasePromptFetchCartPricing = sharedFlagsModule.FFlagPurchasePromptFetchCartPricing
local char = utf8.char(57346)

return function(p0)
	-- upvalues: localizationService (ref), useRobuxTextModule (ref), reactModule (ref), discountRowModule (ref), fFlagPurchasePromptFetchCartPricing (ref), useLocalization (ref), char (ref), formatNumberModule (ref), discountType (ref), useDiscountAccordionConfigModule (ref), priceLineItemModule (ref), view (ref), accordion (ref), iconName (ref), divider (ref)
	local itemPrice = p0.itemPrice
	local robloxLocaleId = localizationService.RobloxLocaleId
	local discounts = itemPrice.discounts
	local var11 = useRobuxTextModule(itemPrice.basePriceInRobux)
	local var12 = useRobuxTextModule(itemPrice.priceInRobux)
	local var13, var14 = reactModule.useMemo(function()
		-- upvalues: discounts (ref), reactModule (copy), discountRowModule (copy), fFlagPurchasePromptFetchCartPricing (copy)
		local var18 = 0
		local t = {}
		
		for i, v in ipairs(discounts) do
			if v.amountInRobux > 0 then
				var18 += v.amountInRobux
				t["DiscountRow_" .. tostring(i)] = reactModule.createElement(discountRowModule, {
					discount = v,
					label = if fFlagPurchasePromptFetchCartPricing then v.localizedDiscountAttribution else nil,
					LayoutOrder = i + 1
				})
			end
		end
		return var18, t
	end, { discounts })
	local var15 = useLocalization({
		Subtotal = "IAPExperience.PurchasePrompt.Label.Subtotal",
		Total = "IAPExperience.PurchasePrompt.Label.Total",
		BlackbirdSummary = {
			"IAPExperience.PurchasePrompt.Label.BlackbirdSummary",
			robuxIcon = char,
			savingsAmount = formatNumberModule(robloxLocaleId, var13)
		}
	})
	local var16 = reactModule.useMemo(function()
		-- upvalues: discounts (ref), discountType (copy)
		for i, v in ipairs(discounts) do
			if v.type == discountType.BlackbirdSubscription or v.type == discountType.RobloxPlusSubscription then
				return true
			end
		end
		return false
	end, { discounts })
	local _ = nil
	local showAccordion = nil
	local accordionHeaderText = nil
	local accordionLeadingIcon = nil
	
	if fFlagPurchasePromptFetchCartPricing then
		local var17 = useDiscountAccordionConfigModule({
			itemPrice = itemPrice,
			hasSubscriptionDiscount = var16,
			blackbirdSummaryText = var15.BlackbirdSummary,
			savingsSummary = p0.savingsSummary
		})
		showAccordion = var17.showAccordion
		accordionHeaderText = var17.accordionHeaderText
		accordionLeadingIcon = var17.accordionLeadingIcon
	end
	return if fFlagPurchasePromptFetchCartPricing and not showAccordion then nil elseif fFlagPurchasePromptFetchCartPricing or var16 and itemPrice.basePriceInRobux ~= itemPrice.priceInRobux then reactModule.createElement(view, {
		tag = {
			["size-full-0 auto-y padding-x-small stroke-default radius-medium"] = fFlagPurchasePromptFetchCartPricing,
			["size-full-0 auto-y stroke-default radius-medium padding-x-small"] = not fFlagPurchasePromptFetchCartPricing
		}
	}, {
		AccordionContent = reactModule.createElement(accordion.Root, { size = "Small", width = UDim.new(1, 0) }, {
			SavingsItem = reactModule.createElement(accordion.Item, {
				id = "discount",
				isExpanded = false,
				hasDivider = false,
				LayoutOrder = 1,
				leadingIcon = if fFlagPurchasePromptFetchCartPricing then accordionLeadingIcon else iconName.RobloxPlus,
				text = if fFlagPurchasePromptFetchCartPricing then accordionHeaderText else var15.BlackbirdSummary
			}, reactModule.createElement(view, {
				tag = {
					["col gap-xsmall size-full-0 auto-y"] = fFlagPurchasePromptFetchCartPricing,
					["col size-full-0 auto-y gap-xsmall"] = not fFlagPurchasePromptFetchCartPricing
				}
			}, {
				BreakdownSection = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = {
						["col gap-xsmall size-full-0 auto-y padding-y-xsmall"] = fFlagPurchasePromptFetchCartPricing,
						["col size-full-0 auto-y gap-xsmall padding-y-xsmall"] = not fFlagPurchasePromptFetchCartPricing
					}
				}, reactModule.useMemo(function()
					-- upvalues: reactModule (copy), priceLineItemModule (copy), var15 (ref), var11 (ref), var14 (ref)
					local t = {
						SubtotalRow = reactModule.createElement(priceLineItemModule, { LayoutOrder = 1, label = var15.Subtotal, amount = var11 })
					}
					
					for i, v in pairs(var14) do
						t[i] = v
					end
					return t
				end, { var15.Subtotal, var11, var14 })),
				BreakdownDivider = reactModule.createElement(divider, { LayoutOrder = 2 }),
				TotalRow = reactModule.createElement(priceLineItemModule, {
					textStyle = "text-caption-medium",
					tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-top-small",
					LayoutOrder = 3,
					label = var15.Total,
					amount = var12
				})
			}))
		})
	}) else nil
end