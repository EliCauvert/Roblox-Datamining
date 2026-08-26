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

return function(p1)
	-- upvalues: localizationService (ref), useRobuxTextModule (ref), reactModule (ref), discountRowModule (ref), fFlagPurchasePromptFetchCartPricing (ref), useLocalization (ref), char (ref), formatNumberModule (ref), discountType (ref), useDiscountAccordionConfigModule (ref), priceLineItemModule (ref), view (ref), accordion (ref), iconName (ref), divider (ref)
	local itemPrice = p1.itemPrice
	local robloxLocaleId = localizationService.RobloxLocaleId
	local discounts = itemPrice.discounts
	local var1 = useRobuxTextModule(itemPrice.basePriceInRobux)
	local var2 = useRobuxTextModule(itemPrice.priceInRobux)
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: discounts (ref), reactModule (copy), discountRowModule (copy), fFlagPurchasePromptFetchCartPricing (copy)
		local var5 = 0
		local t = {}
		
		for i, v in ipairs(discounts) do
			if v.amountInRobux > 0 then
				var5 += v.amountInRobux
				t["DiscountRow_" .. tostring(i)] = reactModule.createElement(discountRowModule, {
					discount = v,
					label = if fFlagPurchasePromptFetchCartPricing then v.localizedDiscountAttribution else nil,
					LayoutOrder = i + 1
				})
			end
		end
		return var5, t
	end, { discounts })
	local var6 = useLocalization({
		Subtotal = "IAPExperience.PurchasePrompt.Label.Subtotal",
		Total = "IAPExperience.PurchasePrompt.Label.Total",
		BlackbirdSummary = {
			"IAPExperience.PurchasePrompt.Label.BlackbirdSummary",
			robuxIcon = char,
			savingsAmount = formatNumberModule(robloxLocaleId, var3)
		}
	})
	local var7 = reactModule.useMemo(function()
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
		local var8 = useDiscountAccordionConfigModule({
			itemPrice = itemPrice,
			hasSubscriptionDiscount = var7,
			blackbirdSummaryText = var6.BlackbirdSummary,
			savingsSummary = p1.savingsSummary
		})
		showAccordion = var8.showAccordion
		accordionHeaderText = var8.accordionHeaderText
		accordionLeadingIcon = var8.accordionLeadingIcon
	end
	return if fFlagPurchasePromptFetchCartPricing and not showAccordion then nil elseif fFlagPurchasePromptFetchCartPricing or var7 and itemPrice.basePriceInRobux ~= itemPrice.priceInRobux then reactModule.createElement(view, {
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
				text = if fFlagPurchasePromptFetchCartPricing then accordionHeaderText else var6.BlackbirdSummary
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
					-- upvalues: reactModule (copy), priceLineItemModule (copy), var6 (ref), var1 (ref), var4 (ref)
					local t = {
						SubtotalRow = reactModule.createElement(priceLineItemModule, { LayoutOrder = 1, label = var6.Subtotal, amount = var1 })
					}
					
					for i, v in pairs(var4) do
						t[i] = v
					end
					return t
				end, { var6.Subtotal, var1, var4 })),
				BreakdownDivider = reactModule.createElement(divider, { LayoutOrder = 2 }),
				TotalRow = reactModule.createElement(priceLineItemModule, {
					textStyle = "text-caption-medium",
					tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-top-small",
					LayoutOrder = 3,
					label = var6.Total,
					amount = var2
				})
			}))
		})
	}) else nil
end