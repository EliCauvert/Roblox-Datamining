local parent = script.Parent.Parent
local counterModule = require(parent.Enums.Counter)
local purchaseFlowModule = require(parent.Enums.PurchaseFlow)
local paymentPlatformModule = require(parent.Enums.PaymentPlatform)
local analyticsModule = require(parent.Services.Analytics)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local getPaymentPlatformModule = require(parent.Utils.getPaymentPlatform)
local getCounterCombinationsModule = require(parent.Utils.getCounterCombinations)
local selectedRobuxPackageModule = require(parent.Utils.SelectedRobuxPackage)
local thunkModule = require(parent.Thunk)
local list = { analyticsModule, externalSettingsModule }

return function(p0) --[[ line: 23 | named "sendCounter" ]]
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), externalSettingsModule (ref), counterModule (ref), purchaseFlowModule (ref), selectedRobuxPackageModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), getCounterCombinationsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2) --[[ line: 24 ]]
		-- upvalues: analyticsModule (copy), externalSettingsModule (copy), counterModule (copy), p0 (ref), purchaseFlowModule (copy), selectedRobuxPackageModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), getCounterCombinationsModule (copy)
		local var10 = p2[analyticsModule]
		local var11 = p2[externalSettingsModule]
		local var12 = counterModule.toRawValue(p0)
		local state = p1:getState()
		local purchaseFlow = state.purchaseFlow
		
		for i, v in getCounterCombinationsModule("PurchasePrompt", var12, paymentPlatformModule.toRawValue(getPaymentPlatformModule(var11.getPlatform())), if purchaseFlow ~= nil then nil else purchaseFlowModule.toRawValue(purchaseFlow), selectedRobuxPackageModule.getRobuxPurchaseAmount(state)) do
			var10.sendCounter(v)
		end
	end)
end