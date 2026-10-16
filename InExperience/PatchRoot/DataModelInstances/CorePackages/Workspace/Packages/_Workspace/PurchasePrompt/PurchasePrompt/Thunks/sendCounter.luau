local Parent = script.Parent.Parent
local CounterModule = require(Parent.Enums.Counter)
local PurchaseFlowModule = require(Parent.Enums.PurchaseFlow)
local PaymentPlatformModule = require(Parent.Enums.PaymentPlatform)
local AnalyticsModule = require(Parent.Services.Analytics)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local GetPaymentPlatformModule = require(Parent.Utils.getPaymentPlatform)
local GetCounterCombinationsModule = require(Parent.Utils.getCounterCombinations)
local SelectedRobuxPackageModule = require(Parent.Utils.SelectedRobuxPackage)
local ThunkModule = require(Parent.Thunk)
local list = { AnalyticsModule, ExternalSettingsModule }

return function(p1) --[[ Line: 23 | Named "sendCounter" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), CounterModule (copy), PurchaseFlowModule (copy), SelectedRobuxPackageModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy), GetCounterCombinationsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 24 ]]
		-- upvalues: AnalyticsModule (upval), ExternalSettingsModule (upval), CounterModule (upval), p1 (copy), PurchaseFlowModule (upval), SelectedRobuxPackageModule (upval), GetPaymentPlatformModule (upval), PaymentPlatformModule (upval), GetCounterCombinationsModule (upval)
		local v1 = p3[AnalyticsModule]
		local v2 = p3[ExternalSettingsModule]
		local RawValue = CounterModule.toRawValue(p1)
		local State = p2:getState()
		local PurchaseFlow = State.purchaseFlow
		local RawValue1 = if PurchaseFlow == nil then nil else PurchaseFlowModule.toRawValue(PurchaseFlow)
		for _, value in GetCounterCombinationsModule("PurchasePrompt", RawValue, PaymentPlatformModule.toRawValue((GetPaymentPlatformModule((v2.getPlatform())))), RawValue1, (SelectedRobuxPackageModule.getRobuxPurchaseAmount(State))) do
			v1.sendCounter(value)
		end
	end)
end