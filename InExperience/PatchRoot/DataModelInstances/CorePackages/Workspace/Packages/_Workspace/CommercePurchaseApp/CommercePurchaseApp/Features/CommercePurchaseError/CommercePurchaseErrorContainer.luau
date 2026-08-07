local reactModule = require(script:FindFirstAncestor("CommercePurchaseApp").Parent.React)
local commercePurchaseErrorModule = require(script.Parent.CommercePurchaseError)
local useCommercePurchaseErrorPropsModule = require(script.Parent.useCommercePurchaseErrorProps)

return function() --[[ line: 8 | named "CommercePurchaseErrorContainer" ]]
	-- upvalues: useCommercePurchaseErrorPropsModule (ref), reactModule (ref), commercePurchaseErrorModule (ref)
	return reactModule.createElement(commercePurchaseErrorModule, useCommercePurchaseErrorPropsModule())
end