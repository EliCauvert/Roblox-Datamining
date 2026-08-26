local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

function isMultiItemPurchase(p1)
	-- upvalues: requestTypeModule (ref)
	return p1 == requestTypeModule.Look
end

return isMultiItemPurchase