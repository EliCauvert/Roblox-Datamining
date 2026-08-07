local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local bulkPurchaseErrorModule = require(script.Parent.BulkPurchaseError)
local useBulkPurchaseErrorPropsModule = require(script.Parent.useBulkPurchaseErrorProps)

return function() --[[ line: 8 | named "BulkPurchaseErrorContainer" ]]
	-- upvalues: useBulkPurchaseErrorPropsModule (ref), reactModule (ref), bulkPurchaseErrorModule (ref)
	return reactModule.createElement(bulkPurchaseErrorModule, useBulkPurchaseErrorPropsModule())
end