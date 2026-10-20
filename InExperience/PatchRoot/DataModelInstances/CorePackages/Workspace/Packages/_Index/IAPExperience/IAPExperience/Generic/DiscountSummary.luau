local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Accordion = FoundationModule.Accordion
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local FormatNumberModule = require(IAPExperience.Utility.formatNumber)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRobuxTextModule = require(IAPExperience.Generic.Hooks.useRobuxText)
local UseDiscountAccordionConfigModule = require(IAPExperience.Generic.Hooks.useDiscountAccordionConfig)
local DiscountType = require(IAPExperience.ProductPurchase.PricingTypes).DiscountType
local DiscountRowModule = require(IAPExperience.Generic.DiscountRow)
local PriceLineItemModule = require(IAPExperience.Generic.PriceLineItem)
local Character = utf8.char(57346)

return function(p1)
	-- upvalues: LocalizationService (copy), UseRobuxTextModule (copy), ReactModule (copy), DiscountRowModule (copy), UseLocalizationFunction (copy), Character (copy), FormatNumberModule (copy), DiscountType (copy), UseDiscountAccordionConfigModule (copy), PriceLineItemModule (copy), View (copy), Accordion (copy), Divider (copy)
	local ItemPrice = p1.itemPrice
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local Discounts = ItemPrice.discounts
	local UseRobuxTextModuleResult = UseRobuxTextModule(ItemPrice.basePriceInRobux)
	local UseRobuxTextModuleResult1 = UseRobuxTextModule(ItemPrice.priceInRobux)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Discounts (copy), ReactModule (upval), DiscountRowModule (upval)
		local NewAmountInRobux = 0
		local Elements = {}
		
		for i, discount in ipairs(Discounts) do
			if discount.amountInRobux > 0 then
				NewAmountInRobux += discount.amountInRobux
				Elements["DiscountRow_" .. tostring(i)] = ReactModule.createElement(DiscountRowModule, {
					discount = discount,
					label = discount.localizedDiscountAttribution,
					LayoutOrder = i + 1
				})
			end
		end
		return NewAmountInRobux, Elements
	end, { Discounts })
	local UseLocalizationResult = UseLocalizationFunction({
		Subtotal = "IAPExperience.PurchasePrompt.Label.Subtotal",
		Total = "IAPExperience.PurchasePrompt.Label.Total",
		BlackbirdSummary = {
			"IAPExperience.PurchasePrompt.Label.BlackbirdSummary",
			robuxIcon = Character,
			savingsAmount = FormatNumberModule(RobloxLocaleId, UseMemoResult)
		}
	})
	local UseDiscountAccordionConfigModuleResult = UseDiscountAccordionConfigModule({
		itemPrice = ItemPrice,
		hasSubscriptionDiscount = ReactModule.useMemo(function(): boolean
			-- upvalues: Discounts (copy), DiscountType (upval)
			for _, discount in ipairs(Discounts) do
				if discount.type == DiscountType.BlackbirdSubscription or discount.type == DiscountType.RobloxPlusSubscription then
					return true
				end
			end
			return false
		end, { Discounts }),
		blackbirdSummaryText = UseLocalizationResult.BlackbirdSummary,
		savingsSummary = p1.savingsSummary
	})
	local AccordionHeaderText = UseDiscountAccordionConfigModuleResult.accordionHeaderText
	local AccordionLeadingIcon = UseDiscountAccordionConfigModuleResult.accordionLeadingIcon
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), PriceLineItemModule (upval), UseLocalizationResult (copy), UseRobuxTextModuleResult (copy), UseMemoResult2 (copy)
		local config = {
			SubtotalRow = ReactModule.createElement(PriceLineItemModule, {
				LayoutOrder = 1,
				label = UseLocalizationResult.Subtotal,
				amount = UseRobuxTextModuleResult
			})
		}
		
		for i, value in pairs(UseMemoResult2) do
			config[i] = value
		end
		return config
	end, {
		UseLocalizationResult.Subtotal,
		UseRobuxTextModuleResult,
		UseMemoResult2
	})
	
	return if UseDiscountAccordionConfigModuleResult.showAccordion then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-x-small stroke-default radius-medium"
	}, {
		AccordionContent = ReactModule.createElement(Accordion.Root, { size = "Small", width = UDim.new(1, 0) }, {
			SavingsItem = ReactModule.createElement(Accordion.Item, {
				id = "discount",
				isExpanded = false,
				hasDivider = false,
				LayoutOrder = 1,
				leadingIcon = AccordionLeadingIcon,
				text = AccordionHeaderText
			}, ReactModule.createElement(View, { tag = "col gap-xsmall size-full-0 auto-y" }, {
				BreakdownSection = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-xsmall size-full-0 auto-y padding-y-xsmall"
				}, UseMemoResult1),
				BreakdownDivider = ReactModule.createElement(Divider, { LayoutOrder = 2 }),
				TotalRow = ReactModule.createElement(PriceLineItemModule, {
					textStyle = "text-caption-medium",
					tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-top-small",
					LayoutOrder = 3,
					label = UseLocalizationResult.Total,
					amount = UseRobuxTextModuleResult1
				})
			}))
		})
	}) else nil
end