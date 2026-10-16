local ReactModule = require(script:FindFirstAncestor("CommercePurchaseApp").Parent.React)
local CommercePurchaseErrorModule = require(script.Parent.CommercePurchaseError)
local UseCommercePurchaseErrorPropsModule = require(script.Parent.useCommercePurchaseErrorProps)

return function() --[[ Line: 8 | Named "CommercePurchaseErrorContainer" ]]
	-- upvalues: UseCommercePurchaseErrorPropsModule (copy), ReactModule (copy), CommercePurchaseErrorModule (copy)
	return ReactModule.createElement(CommercePurchaseErrorModule, (UseCommercePurchaseErrorPropsModule()))
end