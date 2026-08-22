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

local function FeatureRow(p0) --[[ line: 34 ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium",
		LayoutOrder = p0.layoutOrder
	}, {
		Icon = reactModule.createElement(icon, { name = p0.iconName, size = iconSize.Medium }),
		FeatureText = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left",
			Text = p0.text
		})
	})
end

local function getVirtualTransactionDiscounts(p1) --[[ line: 50 ]]
	if not p1 or not p1.VirtualTransactionDiscounts then
		return nil, nil
	end
	local var12 = nil
	local var13 = nil
	
	for i, v in ipairs(p1.VirtualTransactionDiscounts) do
		if typeof(v) == "table" and typeof(v.PeriodIndex) == "number" then
			if v.PeriodIndex == 0 then
				var12 = var12 or v
			elseif v.PeriodIndex > 0 and (var13 == nil or v.PeriodIndex < var13.PeriodIndex) then
				var13 = v
			end
		end
	end
	return var12, var13
end

local function _(p2) --[[ line: 78 | named "getPrivateServerDiscount" ]]
	-- upvalues: array (ref)
	return if p2 and p2.PrivateServerDiscounts then array.find(p2.PrivateServerDiscounts, function(p3) --[[ line: 83 ]]
		return typeof(p3) == "table" and (typeof(p3.PeriodIndex) == "number" and p3.PeriodIndex == 0)
	end) else nil
end

return function(p4) --[[ line: 88 | named "RobloxSubscriptionFeatureList" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), getVirtualTransactionDiscounts (ref), array (ref), FeatureRow (ref), fFlagRobloxPlusEnableNewFeatureListModule (ref), iconName (ref), robloxPlusUpdateDiscountIcons (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), reactModule (ref), view (ref)
	local var14 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local var15 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(var14 and (var14.PeriodType and (tostring(var14.PeriodType) or "")), true)
	})
	local featureConfig = var14 and (var14.ProductTypeDetails and (var14.ProductTypeDetails.RobloxSubscriptionProductDetails and var14.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig))
	local var17, var18 = getVirtualTransactionDiscounts(featureConfig)
	local var19 = if featureConfig and featureConfig.PrivateServerDiscounts then array.find(featureConfig.PrivateServerDiscounts, function(p5) --[[ line: 83 ]]
		return typeof(p5) == "table" and (typeof(p5.PeriodIndex) == "number" and p5.PeriodIndex == 0)
	end) else nil
	local var20 = useLocalization({
		robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr",
		privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount",
		discountFeatureText = "Feature.RobloxSubscription.Description.Benefit.DiscountV2",
		customizeFeatureText = "Feature.RobloxSubscription.Description.Benefit.Customize",
		baseVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst",
			discountPercent = if var17 then var17.DiscountPercent else 0
		},
		nextVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond",
			discountPercent = if var18 then var18.DiscountPercent else 0,
			periodIndex = if var18 then var18.PeriodIndex else 0,
			periodType = var15.periodType
		}
	})
	local t = {}
	
	local function _(p6, p7) --[[ line: 127 | named "addRow" ]]
		-- upvalues: t (ref), FeatureRow (copy)
		table.insert(t, FeatureRow({ layoutOrder = #t + 1, iconName = p6, text = p7 }))
	end
	
	if not fFlagRobloxPlusEnableNewFeatureListModule then
		if var17 and typeof(var17.DiscountPercent) == "number" then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = if robloxPlusUpdateDiscountIcons then iconName.Tag else iconName.TagSparkle,
				text = var20.baseVirtualTransactionDiscountText
			}))
		end
		if var18 and typeof(var18.DiscountPercent) == "number" and (not fFlagRobloxPlusFAEFreeTrialModule or not p4.noPurchaseMethodRequired) then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = if robloxPlusUpdateDiscountIcons then iconName.TagArrowUp else iconName.TagSparkleArrowUp,
				text = var20.nextVirtualTransactionDiscountText
			}))
		end
	elseif not p4.noPurchaseMethodRequired then
		if var17 and var18 then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = iconName.Tag,
				text = var20.discountFeatureText
			}))
		elseif var17 and not var18 then
			table.insert(t, FeatureRow({
				layoutOrder = #t + 1,
				iconName = iconName.Tag,
				text = var20.baseVirtualTransactionDiscountText
			}))
		end
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.PaintBrush,
			text = var20.customizeFeatureText
		}))
	elseif var17 then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Tag,
			text = var20.baseVirtualTransactionDiscountText
		}))
	end
	if var19 and typeof(var19.DiscountPercent) == "number" then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Controller,
			text = var20.privateServerDiscountText
		}))
	end
	if featureConfig and featureConfig.IsRobuxTransferEnabled then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Robux,
			text = var20.robuxTransfersText
		}))
	end
	return reactModule.createElement(view, {
		tag = "col auto-y size-full-0 align-x-left gap-medium padding-top-large",
		LayoutOrder = p4.layoutOrder
	}, t)
end