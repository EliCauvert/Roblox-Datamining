local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local luauPolyfillModule = require(parent.LuauPolyfill)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getPeriodTypeDisplayLabelModule = require(robloxSubscriptionPurchaseApp.Utils.getPeriodTypeDisplayLabel)
local signalsReactModule = require(parent.SignalsReact)
local robloxPlusUpdateDiscountIcons = game:DefineFastFlag("RobloxPlusUpdateDiscountIcons", false)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local fFlagRobloxPlusEnableNewFeatureListModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusEnableNewFeatureList)
local array = luauPolyfillModule.Array
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

local function FeatureRow(p1)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = reactModule.createElement(icon, { name = p1.iconName, size = iconSize.Medium }),
		FeatureText = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left",
			Text = p1.text
		})
	})
end

local function getVirtualTransactionDiscounts(p1)
	if not p1 or not p1.VirtualTransactionDiscounts then
		return nil, nil
	end
	local var1 = nil
	local var2 = nil
	
	for i, v in ipairs(p1.VirtualTransactionDiscounts) do
		if typeof(v) == "table" and typeof(v.PeriodIndex) == "number" then
			if v.PeriodIndex == 0 then
				var1 = var1 or v
			elseif v.PeriodIndex > 0 and (var2 == nil or v.PeriodIndex < var2.PeriodIndex) then
				var2 = v
			end
		end
	end
	return var1, var2
end

local function _(p2)
	-- upvalues: array (ref)
	return if p2 and p2.PrivateServerDiscounts then array.find(p2.PrivateServerDiscounts, function(p3)
		return typeof(p3) == "table" and (typeof(p3.PeriodIndex) == "number" and p3.PeriodIndex == 0)
	end) else nil
end

return function(p2)
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), getVirtualTransactionDiscounts (ref), array (ref), FeatureRow (ref), fFlagRobloxPlusEnableNewFeatureListModule (ref), iconName (ref), robloxPlusUpdateDiscountIcons (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), reactModule (ref), view (ref)
	local var3 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local var4 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(var3 and (var3.PeriodType and (tostring(var3.PeriodType) or "")), true)
	})
	local featureConfig = var3 and (var3.ProductTypeDetails and (var3.ProductTypeDetails.RobloxSubscriptionProductDetails and var3.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig))
	local var5, var6 = getVirtualTransactionDiscounts(featureConfig)
	local var7 = if featureConfig and featureConfig.PrivateServerDiscounts then array.find(featureConfig.PrivateServerDiscounts, function(p3)
		return typeof(p3) == "table" and (typeof(p3.PeriodIndex) == "number" and p3.PeriodIndex == 0)
	end) else nil
	local var8 = useLocalization({
		robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr",
		privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount",
		discountFeatureText = "Feature.RobloxSubscription.Description.Benefit.DiscountV2",
		customizeFeatureText = "Feature.RobloxSubscription.Description.Benefit.Customize",
		baseVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst",
			discountPercent = if var5 then var5.DiscountPercent else 0
		},
		nextVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond",
			discountPercent = if var6 then var6.DiscountPercent else 0,
			periodIndex = if var6 then var6.PeriodIndex else 0,
			periodType = var4.periodType
		}
	})
	local t = {}
	
	local function _(p3, p4)
		-- upvalues: t (ref), FeatureRow (copy)
		table.insert(t, FeatureRow({ layoutOrder = #t + 1, iconName = p3, text = p4 }))
	end
	
	if not fFlagRobloxPlusEnableNewFeatureListModule then
		if var5 and typeof(var5.DiscountPercent) == "number" then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = if robloxPlusUpdateDiscountIcons then iconName.Tag else iconName.TagSparkle,
				text = var8.baseVirtualTransactionDiscountText
			}))
		end
		if var6 and typeof(var6.DiscountPercent) == "number" and (not fFlagRobloxPlusFAEFreeTrialModule or not p2.noPurchaseMethodRequired) then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = if robloxPlusUpdateDiscountIcons then iconName.TagArrowUp else iconName.TagSparkleArrowUp,
				text = var8.nextVirtualTransactionDiscountText
			}))
		end
	elseif not p2.noPurchaseMethodRequired then
		if var5 and var6 then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = iconName.Tag,
				text = var8.discountFeatureText
			}))
		elseif var5 and not var6 then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = iconName.Tag,
				text = var8.baseVirtualTransactionDiscountText
			}))
		end
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.PaintBrush,
			text = var8.customizeFeatureText
		}))
	elseif var5 then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Tag,
			text = var8.baseVirtualTransactionDiscountText
		}))
	end
	if var7 and typeof(var7.DiscountPercent) == "number" then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Controller,
			text = var8.privateServerDiscountText
		}))
	end
	if featureConfig and featureConfig.IsRobuxTransferEnabled then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Robux,
			text = var8.robuxTransfersText
		}))
	end
	return reactModule.createElement(view, {
		tag = "col auto-y size-full-0 align-x-left gap-medium padding-top-large",
		LayoutOrder = p2.layoutOrder
	}, t)
end