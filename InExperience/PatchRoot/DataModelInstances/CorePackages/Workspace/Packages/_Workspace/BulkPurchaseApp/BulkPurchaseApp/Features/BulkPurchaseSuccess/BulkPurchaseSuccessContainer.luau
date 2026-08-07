local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local bulkPurchaseSuccessModule = require(script.Parent.BulkPurchaseSuccess)
local useBulkPurchaseSuccessPropsModule = require(script.Parent.useBulkPurchaseSuccessProps)

return function() --[[ line: 8 | named "BulkPurchaseSuccessContainer" ]]
	-- upvalues: useBulkPurchaseSuccessPropsModule (ref), reactModule (ref), bulkPurchaseSuccessModule (ref)
	return reactModule.createElement(bulkPurchaseSuccessModule, useBulkPurchaseSuccessPropsModule())
end