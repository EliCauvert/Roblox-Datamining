local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local BulkPurchasePartialSuccessModule = require(script.Parent.BulkPurchasePartialSuccess)
local UseBulkPurchasePartialSuccessPropsModule = require(script.Parent.useBulkPurchasePartialSuccessProps)

return function() --[[ Line: 8 | Named "BulkPurchasePartialSuccessContainer" ]]
	-- upvalues: UseBulkPurchasePartialSuccessPropsModule (copy), ReactModule (copy), BulkPurchasePartialSuccessModule (copy)
	return ReactModule.createElement(BulkPurchasePartialSuccessModule, (UseBulkPurchasePartialSuccessPropsModule()))
end