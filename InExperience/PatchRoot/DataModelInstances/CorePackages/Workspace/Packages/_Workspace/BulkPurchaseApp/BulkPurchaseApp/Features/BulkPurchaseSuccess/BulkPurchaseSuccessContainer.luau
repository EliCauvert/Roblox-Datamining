local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)
local BulkPurchaseSuccessModule = require(script.Parent.BulkPurchaseSuccess)
local UseBulkPurchaseSuccessPropsModule = require(script.Parent.useBulkPurchaseSuccessProps)

return function() --[[ Line: 8 | Named "BulkPurchaseSuccessContainer" ]]
	-- upvalues: UseBulkPurchaseSuccessPropsModule (copy), ReactModule (copy), BulkPurchaseSuccessModule (copy)
	return ReactModule.createElement(BulkPurchaseSuccessModule, (UseBulkPurchaseSuccessPropsModule()))
end