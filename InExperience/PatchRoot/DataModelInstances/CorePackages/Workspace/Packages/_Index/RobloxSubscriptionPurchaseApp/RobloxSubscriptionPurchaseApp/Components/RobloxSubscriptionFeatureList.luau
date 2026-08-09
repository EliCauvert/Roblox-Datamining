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
local array = luauPolyfillModule.Array
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

local function FeatureRow(p0) --[[ line: 31 ]]
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

local function getVirtualTransactionDiscounts(p1) --[[ line: 47 ]]
	if not p1 or not p1.VirtualTransactionDiscounts then
		return nil, nil
	end
	local var10 = nil
	local var11 = nil
	
	for i, v in ipairs(p1.VirtualTransactionDiscounts) do
		if typeof(v) == "table" and typeof(v.PeriodIndex) == "number" then
			if v.PeriodIndex == 0 then
				var10 = var10 or v
			elseif v.PeriodIndex > 0 and (var11 == nil or v.PeriodIndex < var11.PeriodIndex) then
				var11 = v
			end
		end
	end
	return var10, var11
end

local function _(p2) --[[ line: 75 | named "getPrivateServerDiscount" ]]
	-- upvalues: array (ref)
	return if p2 and p2.PrivateServerDiscounts then array.find(p2.PrivateServerDiscounts, function(p3) --[[ line: 80 ]]
		return typeof(p3) == "table" and (typeof(p3.PeriodIndex) == "number" and p3.PeriodIndex == 0)
	end) else nil
end

return function(p4) --[[ line: 85 | named "RobloxSubscriptionFeatureList" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), getVirtualTransactionDiscounts (ref), array (ref), FeatureRow (ref), robloxPlusUpdateDiscountIcons (ref), iconName (ref), reactModule (ref), view (ref)
	local var12 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local var13 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(var12 and (var12.PeriodType and (tostring(var12.PeriodType) or "")), true)
	})
	local featureConfig = var12 and (var12.ProductTypeDetails and (var12.ProductTypeDetails.RobloxSubscriptionProductDetails and var12.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig))
	local var15, var16 = getVirtualTransactionDiscounts(featureConfig)
	local var17 = if featureConfig and featureConfig.PrivateServerDiscounts then array.find(featureConfig.PrivateServerDiscounts, function(p5) --[[ line: 80 ]]
		return typeof(p5) == "table" and (typeof(p5.PeriodIndex) == "number" and p5.PeriodIndex == 0)
	end) else nil
	local var18 = useLocalization({
		robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr",
		privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount",
		baseVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst",
			discountPercent = if var15 then var15.DiscountPercent else 0
		},
		nextVirtualTransactionDiscountText = {
			"Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond",
			discountPercent = if var16 then var16.DiscountPercent else 0,
			periodIndex = if var16 then var16.PeriodIndex else 0,
			periodType = var13.periodType
		}
	})
	local t = {}
	
	local function _(p6, p7) --[[ line: 122 | named "addRow" ]]
		-- upvalues: t (ref), FeatureRow (copy)
		table.insert(t, FeatureRow({ layoutOrder = #t + 1, iconName = p6, text = p7 }))
	end
	
	if var15 and typeof(var15.DiscountPercent) == "number" then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = if robloxPlusUpdateDiscountIcons then iconName.Tag else iconName.TagSparkle,
			text = var18.baseVirtualTransactionDiscountText
		}))
	end
	if var16 and typeof(var16.DiscountPercent) == "number" then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = if robloxPlusUpdateDiscountIcons then iconName.TagArrowUp else iconName.TagSparkleArrowUp,
			text = var18.nextVirtualTransactionDiscountText
		}))
	end
	if var17 and typeof(var17.DiscountPercent) == "number" then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Controller,
			text = var18.privateServerDiscountText
		}))
	end
	if featureConfig and featureConfig.IsRobuxTransferEnabled then
		table.insert(t, FeatureRow({
			layoutOrder = #t + 1,
			iconName = iconName.Robux,
			text = var18.robuxTransfersText
		}))
	end
	return reactModule.createElement(view, {
		tag = "col auto-y size-full-0 align-x-left gap-medium padding-top-large",
		LayoutOrder = p4.layoutOrder
	}, t)
end