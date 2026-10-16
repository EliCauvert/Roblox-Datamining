local RequestTypeModule = require(script.Parent.Parent.Enums.RequestType)

function isMultiItemPurchase(Look): boolean --[[ Line: 4 ]]
	-- upvalues: RequestTypeModule (copy)
	return Look == RequestTypeModule.Look
end

return isMultiItemPurchase