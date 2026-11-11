local RequestTypeModule = require(script.Parent.Parent.Enums.RequestType)

function isMultiItemPurchase(Look): boolean
	-- upvalues: RequestTypeModule (copy)
	return Look == RequestTypeModule.Look
end

return isMultiItemPurchase