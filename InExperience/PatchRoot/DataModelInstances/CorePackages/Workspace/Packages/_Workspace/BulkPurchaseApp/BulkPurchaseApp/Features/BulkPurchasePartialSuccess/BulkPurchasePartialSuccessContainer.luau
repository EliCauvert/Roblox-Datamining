local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local bulkPurchasePartialSuccessModule = require(script.Parent.BulkPurchasePartialSuccess)
local useBulkPurchasePartialSuccessPropsModule = require(script.Parent.useBulkPurchasePartialSuccessProps)

return function() --[[ line: 8 | named "BulkPurchasePartialSuccessContainer" ]]
	-- upvalues: useBulkPurchasePartialSuccessPropsModule (ref), reactModule (ref), bulkPurchasePartialSuccessModule (ref)
	return reactModule.createElement(bulkPurchasePartialSuccessModule, useBulkPurchasePartialSuccessPropsModule())
end