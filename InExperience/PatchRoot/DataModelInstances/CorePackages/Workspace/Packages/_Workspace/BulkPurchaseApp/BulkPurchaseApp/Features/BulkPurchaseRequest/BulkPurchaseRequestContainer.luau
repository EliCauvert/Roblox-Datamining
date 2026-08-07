local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local bulkPurchaseRequestModule = require(script.Parent.BulkPurchaseRequest)
local useBulkPurchaseRequestPropsModule = require(script.Parent.useBulkPurchaseRequestProps)

return function() --[[ line: 8 | named "BulkPurchaseRequestContainer" ]]
	-- upvalues: useBulkPurchaseRequestPropsModule (ref), reactModule (ref), bulkPurchaseRequestModule (ref)
	return reactModule.createElement(bulkPurchaseRequestModule, useBulkPurchaseRequestPropsModule())
end