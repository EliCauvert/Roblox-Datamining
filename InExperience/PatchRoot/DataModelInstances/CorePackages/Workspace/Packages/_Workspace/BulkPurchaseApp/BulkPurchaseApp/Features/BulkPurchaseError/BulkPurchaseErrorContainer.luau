local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local BulkPurchaseErrorModule = require(script.Parent.BulkPurchaseError)
local UseBulkPurchaseErrorPropsModule = require(script.Parent.useBulkPurchaseErrorProps)

return function()
	-- upvalues: UseBulkPurchaseErrorPropsModule (copy), ReactModule (copy), BulkPurchaseErrorModule (copy)
	return ReactModule.createElement(BulkPurchaseErrorModule, (UseBulkPurchaseErrorPropsModule()))
end