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

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), externalSettingsModule (ref), counterModule (ref), purchaseFlowModule (ref), selectedRobuxPackageModule (ref), getPaymentPlatformModule (ref), paymentPlatformModule (ref), getCounterCombinationsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: analyticsModule (copy), externalSettingsModule (copy), counterModule (copy), p1 (ref), purchaseFlowModule (copy), selectedRobuxPackageModule (copy), getPaymentPlatformModule (copy), paymentPlatformModule (copy), getCounterCombinationsModule (copy)
		local var1 = p3[analyticsModule]
		local var2 = p3[externalSettingsModule]
		local var3 = counterModule.toRawValue(p1)
		local state = p2:getState()
		local purchaseFlow = state.purchaseFlow
		
		for i, v in getCounterCombinationsModule("PurchasePrompt", var3, paymentPlatformModule.toRawValue(getPaymentPlatformModule(var2.getPlatform())), if purchaseFlow ~= nil then nil else purchaseFlowModule.toRawValue(purchaseFlow), selectedRobuxPackageModule.getRobuxPurchaseAmount(state)) do
			var1.sendCounter(v)
		end
	end)
end