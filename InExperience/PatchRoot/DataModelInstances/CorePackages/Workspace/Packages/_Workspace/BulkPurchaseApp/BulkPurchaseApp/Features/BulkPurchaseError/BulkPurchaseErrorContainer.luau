local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local BulkPurchaseErrorModule = require(script.Parent.BulkPurchaseError)
local UseBulkPurchaseErrorPropsModule = require(script.Parent.useBulkPurchaseErrorProps)

return function() --[[ Line: 8 | Named "BulkPurchaseErrorContainer" ]]
	-- upvalues: UseBulkPurchaseErrorPropsModule (copy), ReactModule (copy), BulkPurchaseErrorModule (copy)
	return ReactModule.createElement(BulkPurchaseErrorModule, (UseBulkPurchaseErrorPropsModule()))
end