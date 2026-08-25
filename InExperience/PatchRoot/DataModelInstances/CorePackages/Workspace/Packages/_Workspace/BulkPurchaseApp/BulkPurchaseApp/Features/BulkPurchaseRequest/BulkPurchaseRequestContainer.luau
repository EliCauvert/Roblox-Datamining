local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local bulkPurchaseRequestModule = require(script.Parent.BulkPurchaseRequest)
local useBulkPurchaseRequestPropsModule = require(script.Parent.useBulkPurchaseRequestProps)

return function()
	-- upvalues: useBulkPurchaseRequestPropsModule (ref), reactModule (ref), bulkPurchaseRequestModule (ref)
	return reactModule.createElement(bulkPurchaseRequestModule, useBulkPurchaseRequestPropsModule())
end