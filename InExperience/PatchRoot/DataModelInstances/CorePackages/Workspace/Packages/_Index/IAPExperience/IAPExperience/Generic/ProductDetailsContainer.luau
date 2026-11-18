local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UnifiedProductDetailsModule = require(IAPExperience.Generic.UnifiedProductDetails)
local PriceSummaryV2Module = require(IAPExperience.Generic.PriceSummaryV2)
local DiscountSummaryModule = require(IAPExperience.Generic.DiscountSummary)
local MultiItemPriceShowsDiscountAccordionModule = require(IAPExperience.Generic.multiItemPriceShowsDiscountAccordion)
local ManageRecommendationsMenuViewModule = require(IAPExperience.Generic.ManageRecommendationsMenu.ManageRecommendationsMenuView)
local UnifiedPurchaseModalTypeEnumModule = require(IAPExperience.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(IAPExperience.ProductPurchase.PricingTypes)
local _ = require(IAPExperience.Enums.VirtualItemBadgeType)
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule = require(IAPExperience.Flags.FFlagPurchasePromptVLOPUpsellSettingsEntryPoint)
local FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule = require(IAPExperience.Flags.FFlagPurchasePromptVLOPAppUpsellSettingsEntryPoint)

local function _(p1): boolean
	if p1 then
		local BasePriceInRobux = p1.basePriceInRobux
		local PriceInRobux = p1.priceInRobux
		
		return typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and PriceInRobux < BasePriceInRobux
	else
		return false
	end
end

local function withManageRecommendationsMenu(Element, ManageRecommendationsMenu, LayoutOrder)
	-- upvalues: ReactModule (copy), View (copy), ManageRecommendationsMenuViewModule (copy)
	return if ManageRecommendationsMenu then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, {
		Details = ReactModule.createElement(View, { tag = "size-full-0 auto-y padding-right-xxlarge" }, { Details = Element }),
		ManageRecommendationsMenu = ReactModule.createElement(View, {
			tag = "position-top-right anchor-top-right auto-xy",
			ZIndex = 2
		}, {
			Menu = ReactModule.createElement(ManageRecommendationsMenuViewModule, ManageRecommendationsMenu)
		})
	}) else Element
end

return function(p1)
	-- upvalues: MultiItemPriceShowsDiscountAccordionModule (copy), UnifiedPurchaseModalTypeEnumModule (copy), ReactModule (copy), View (copy), UnifiedProductDetailsModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), DiscountSummaryModule (copy), FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule (copy), FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule (copy), withManageRecommendationsMenu (copy), PriceSummaryV2Module (copy)
	local ItemPrice = p1.product and p1.product.itemPrice
	local v1 = nil
	
	if ItemPrice then
		local BasePriceInRobux = ItemPrice.basePriceInRobux
		local PriceInRobux = ItemPrice.priceInRobux
		v1 = typeof(BasePriceInRobux) == "number" and typeof(PriceInRobux) == "number" and PriceInRobux < BasePriceInRobux
	else
		v1 = false
	end
	local MultiItemPriceShowsDiscountAccordionModuleResult = MultiItemPriceShowsDiscountAccordionModule(ItemPrice)
	local _UDim2 = UDim2.new(1, 0, 0, 100)
	
	if p1.purchaseModalType ~= UnifiedPurchaseModalTypeEnumModule.MultiItem then
		local Element = if ItemPrice and MultiItemPriceShowsDiscountAccordionModuleResult then if v1 then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2,
			Visible = not p1.hideDiscountSummary
		}, {
			Discount = ReactModule.createElement(DiscountSummaryModule, {
				itemPrice = ItemPrice,
				savingsSummary = p1.savingsSummary
			})
		}) else nil elseif v1 then nil else nil
		local Element1 = ReactModule.createElement(UnifiedProductDetailsModule, {
			layoutOrder = 1,
			isPortrait = false,
			isCompact = p1.isCompact,
			itemIcon = p1.product.itemIcon,
			itemName = p1.product.itemName,
			itemRobuxCost = p1.product.itemRobuxCost,
			itemPrice = ItemPrice,
			model = p1.product.model,
			subtitleView = p1.subtitleView,
			itemDisplayPrice = p1.product.itemDisplayPrice,
			isLoading = p1.isLoading,
			priceSuffix = p1.priceSuffix,
			includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.includePriceSuffixOnOriginal else nil,
			priceText = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.priceText else nil
		})
		
		return ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top gap-medium size-full-0 auto-y",
			Size = if MultiItemPriceShowsDiscountAccordionModuleResult then _UDim2 else nil
		}, {
			Details = if FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule or FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule then withManageRecommendationsMenu(Element1, p1.manageRecommendationsMenu, 1) else Element1,
			DiscountSummary = Element
		})
	elseif MultiItemPriceShowsDiscountAccordionModule(ItemPrice) then
		local Element = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top gap-medium size-full-0 auto-y"
		}, {
			Details = if p1.hideProductDetails then nil else ReactModule.createElement(UnifiedProductDetailsModule, {
				layoutOrder = 1,
				isPortrait = false,
				isCompact = p1.isCompact,
				itemIcon = p1.product.itemIcon,
				itemName = p1.product.itemName,
				itemRobuxCost = ItemPrice.priceInRobux,
				itemPrice = ItemPrice,
				model = p1.product.model,
				subtitleView = p1.subtitleView,
				itemDisplayPrice = p1.product.itemDisplayPrice,
				isLoading = p1.isLoading,
				priceSuffix = p1.priceSuffix,
				includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.includePriceSuffixOnOriginal else nil,
				priceText = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.priceText else nil
			}),
			DiscountSummary = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-xxsmall",
				LayoutOrder = 2,
				Visible = not p1.hideDiscountSummary
			}, {
				Discount = ReactModule.createElement(DiscountSummaryModule, {
					itemPrice = ItemPrice,
					savingsSummary = p1.savingsSummary
				})
			})
		})
		
		return if FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule or FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule then withManageRecommendationsMenu(Element, p1.manageRecommendationsMenu) else Element
	elseif v1 then
		local Element = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top size-full-0",
			Size = _UDim2
		}, {
			Summary = ReactModule.createElement(PriceSummaryV2Module, {
				amount = p1.product.itemRobuxCost,
				itemPrice = ItemPrice,
				subtotalItemCount = p1.subtotalItemCount
			})
		})
		
		return if FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule or FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule then withManageRecommendationsMenu(Element, p1.manageRecommendationsMenu) else Element
	else
		local Element = ReactModule.createElement(PriceSummaryV2Module, {
			amount = p1.product.itemRobuxCost,
			itemPrice = ItemPrice,
			subtotalItemCount = p1.subtotalItemCount
		})
		
		return if FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule or FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule then withManageRecommendationsMenu(Element, p1.manageRecommendationsMenu) else Element
	end
end