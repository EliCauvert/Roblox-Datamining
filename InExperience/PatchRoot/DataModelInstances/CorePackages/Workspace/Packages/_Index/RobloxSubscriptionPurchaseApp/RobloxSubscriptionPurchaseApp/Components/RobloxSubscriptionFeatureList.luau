local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetPeriodTypeDisplayLabelModule = require(RobloxSubscriptionPurchaseApp.Utils.getPeriodTypeDisplayLabel)
local GetFreeTrialOfferModule = require(RobloxSubscriptionPurchaseApp.Utils.getFreeTrialOffer)
local GetTrialUnlockDaysModule = require(RobloxSubscriptionPurchaseApp.Utils.getTrialUnlockDays)
local IsSupportedTrialPeriodTypeModule = require(RobloxSubscriptionPurchaseApp.Utils.isSupportedTrialPeriodType)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxPlusUpdateDiscountIcons = game:DefineFastFlag("RobloxPlusUpdateDiscountIcons", false)
local FFlagRobloxPlusEnableNewFeatureListModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusEnableNewFeatureList)
local FFlagRobloxPlusTrialDiscountTimingModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusTrialDiscountTiming)
local FFlagEnablePlusReferralLandingSheet = require(Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local Array = require(Parent.LuauPolyfill).Array
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

local function FeatureRow(p1)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, { name = p1.iconName, size = IconSize.Medium }),
		FeatureText = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left",
			Text = p1.text
		})
	})
end

local function getVirtualTransactionDiscounts(FeatureConfig)
	if not FeatureConfig or not FeatureConfig.VirtualTransactionDiscounts then
		return nil, nil
	end
	local v1 = nil
	local v2 = nil
	
	for _, virtualTransactionDiscount in ipairs(FeatureConfig.VirtualTransactionDiscounts) do
		if typeof(virtualTransactionDiscount) == "table" and typeof(virtualTransactionDiscount.PeriodIndex) == "number" then
			if virtualTransactionDiscount.PeriodIndex == 0 then
				v1 = v1 or virtualTransactionDiscount
			elseif virtualTransactionDiscount.PeriodIndex > 0 and (v2 == nil or virtualTransactionDiscount.PeriodIndex < v2.PeriodIndex) then
				v2 = virtualTransactionDiscount
			end
		end
	end
	return v1, v2
end

local function _(p1)
	-- upvalues: Array (copy)
	return if p1 and p1.PrivateServerDiscounts then Array.find(p1.PrivateServerDiscounts, function(p2): boolean
		return typeof(p2) == "table" and typeof(p2.PeriodIndex) == "number" and p2.PeriodIndex == 0
	end) else nil
end

return function(p1)
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), GetPeriodTypeDisplayLabelModule (copy), FFlagRobloxPlusTrialDiscountTimingModule (copy), GetFreeTrialOfferModule (copy), IsSupportedTrialPeriodTypeModule (copy), UseLocalizationFunction (copy), getVirtualTransactionDiscounts (copy), Array (copy), GetTrialUnlockDaysModule (copy), FeatureRow (copy), FFlagRobloxPlusEnableNewFeatureListModule (copy), IconName (copy), RobloxPlusUpdateDiscountIcons (copy), ReactModule (copy), View (copy), FFlagEnablePlusReferralLandingSheet (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local Text: string = UseSignalStateResult and UseSignalStateResult.PeriodType and tostring(UseSignalStateResult.PeriodType) or ""
	local PeriodTypeDisplayLabelModule = GetPeriodTypeDisplayLabelModule(Text, true)
	local FreeTrialOfferModule = if FFlagRobloxPlusTrialDiscountTimingModule then GetFreeTrialOfferModule(UseSignalStateResult) else nil
	local IsSupportedTrialPeriodTypeModule1 = FFlagRobloxPlusTrialDiscountTimingModule and (FreeTrialOfferModule ~= nil and IsSupportedTrialPeriodTypeModule(FreeTrialOfferModule.PeriodType))
	local UseLocalizationResult = UseLocalizationFunction({ periodType = PeriodTypeDisplayLabelModule })
	local FeatureConfig = UseSignalStateResult and (UseSignalStateResult.ProductTypeDetails and (UseSignalStateResult.ProductTypeDetails.RobloxSubscriptionProductDetails and UseSignalStateResult.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig))
	local VirtualTransactionDiscounts, VirtualTransactionDiscounts2 = getVirtualTransactionDiscounts(FeatureConfig)
	local FindResult = if FeatureConfig and FeatureConfig.PrivateServerDiscounts then Array.find(FeatureConfig.PrivateServerDiscounts, function(p2): boolean
		return typeof(p2) == "table" and typeof(p2.PeriodIndex) == "number" and p2.PeriodIndex == 0
	end) else nil
	local TrialUnlockDaysModule = if IsSupportedTrialPeriodTypeModule1 then GetTrialUnlockDaysModule(FreeTrialOfferModule, VirtualTransactionDiscounts2 and VirtualTransactionDiscounts2.PeriodIndex, Text) else nil
	local UseLocalizationResult1 = UseLocalizationFunction({
		robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr",
		privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount",
		discountFeatureText = "Feature.RobloxSubscription.Description.Benefit.DiscountV2",
		customizeFeatureText = "Feature.RobloxSubscription.Description.Benefit.Customize",
		baseVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst",
			discountPercent = VirtualTransactionDiscounts and VirtualTransactionDiscounts.DiscountPercent or 0
		},
		nextVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond",
			discountPercent = VirtualTransactionDiscounts2 and VirtualTransactionDiscounts2.DiscountPercent or 0,
			periodIndex = VirtualTransactionDiscounts2 and VirtualTransactionDiscounts2.PeriodIndex or 0,
			periodType = UseLocalizationResult.periodType
		},
		discountFeatureTextV3 = if IsSupportedTrialPeriodTypeModule1 then {
			"Feature.RobloxSubscription.Description.Benefit.DiscountV3",
			trialUnlockDays = TrialUnlockDaysModule
		} else nil
	})
	local List = {}
	
	local function _(IconName, Text)
		-- upvalues: List (copy), FeatureRow (upval)
		table.insert(List, FeatureRow({
			layoutOrder = #List + 1,
			iconName = IconName,
			text = Text
		}))
	end
	
	if FFlagRobloxPlusEnableNewFeatureListModule then
		if p1.noPurchaseMethodRequired then
			if VirtualTransactionDiscounts then
				table.insert(List, FeatureRow({
					layoutOrder = #List + 1,
					iconName = IconName.Tag,
					text = UseLocalizationResult1.baseVirtualTransactionDiscountText
				}))
			end
		else
			if VirtualTransactionDiscounts and VirtualTransactionDiscounts2 then
				table.insert(List, FeatureRow({
					layoutOrder = #List + 1,
					iconName = IconName.Tag,
					text = if IsSupportedTrialPeriodTypeModule1 then UseLocalizationResult1.discountFeatureTextV3 else UseLocalizationResult1.discountFeatureText
				}))
			elseif VirtualTransactionDiscounts and not VirtualTransactionDiscounts2 then
				table.insert(List, FeatureRow({
					layoutOrder = #List + 1,
					iconName = IconName.Tag,
					text = UseLocalizationResult1.baseVirtualTransactionDiscountText
				}))
			end
			table.insert(List, FeatureRow({
				layoutOrder = #List + 1,
				iconName = IconName.PaintBrush,
				text = UseLocalizationResult1.customizeFeatureText
			}))
		end
	else
		if VirtualTransactionDiscounts and typeof(VirtualTransactionDiscounts.DiscountPercent) == "number" then
			table.insert(List, FeatureRow({
				layoutOrder = #List + 1,
				iconName = if RobloxPlusUpdateDiscountIcons then IconName.Tag else IconName.TagSparkle,
				text = UseLocalizationResult1.baseVirtualTransactionDiscountText
			}))
		end
		if VirtualTransactionDiscounts2 and (typeof(VirtualTransactionDiscounts2.DiscountPercent) == "number" and not p1.noPurchaseMethodRequired) then
			table.insert(List, FeatureRow({
				layoutOrder = #List + 1,
				iconName = if RobloxPlusUpdateDiscountIcons then IconName.TagArrowUp else IconName.TagSparkleArrowUp,
				text = UseLocalizationResult1.nextVirtualTransactionDiscountText
			}))
		end
	end
	if FindResult and typeof(FindResult.DiscountPercent) == "number" then
		table.insert(List, FeatureRow({
			layoutOrder = #List + 1,
			iconName = IconName.Controller,
			text = UseLocalizationResult1.privateServerDiscountText
		}))
	end
	if FeatureConfig and FeatureConfig.IsRobuxTransferEnabled then
		table.insert(List, FeatureRow({
			layoutOrder = #List + 1,
			iconName = IconName.Robux,
			text = UseLocalizationResult1.robuxTransfersText
		}))
	end
	return ReactModule.createElement(View, {
		tag = if FFlagEnablePlusReferralLandingSheet and p1.compact then "col auto-y size-full-0 align-x-left gap-small padding-top-small" else "col auto-y size-full-0 align-x-left gap-medium padding-top-large",
		LayoutOrder = p1.layoutOrder
	}, List)
end