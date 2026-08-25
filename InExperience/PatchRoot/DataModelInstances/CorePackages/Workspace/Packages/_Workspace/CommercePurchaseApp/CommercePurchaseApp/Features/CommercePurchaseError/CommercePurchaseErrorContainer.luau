local reactModule = require(script:FindFirstAncestor("CommercePurchaseApp").Parent.React)
local commercePurchaseErrorModule = require(script.Parent.CommercePurchaseError)
local useCommercePurchaseErrorPropsModule = require(script.Parent.useCommercePurchaseErrorProps)

return function()
	-- upvalues: useCommercePurchaseErrorPropsModule (ref), reactModule (ref), commercePurchaseErrorModule (ref)
	return reactModule.createElement(commercePurchaseErrorModule, useCommercePurchaseErrorPropsModule())
end