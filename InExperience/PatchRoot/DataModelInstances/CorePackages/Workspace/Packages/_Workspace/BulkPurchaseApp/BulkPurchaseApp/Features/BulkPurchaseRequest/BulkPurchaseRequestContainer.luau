local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local BulkPurchaseRequestModule = require(script.Parent.BulkPurchaseRequest)
local UseBulkPurchaseRequestPropsModule = require(script.Parent.useBulkPurchaseRequestProps)

return function()
	-- upvalues: UseBulkPurchaseRequestPropsModule (copy), ReactModule (copy), BulkPurchaseRequestModule (copy)
	return ReactModule.createElement(BulkPurchaseRequestModule, (UseBulkPurchaseRequestPropsModule()))
end