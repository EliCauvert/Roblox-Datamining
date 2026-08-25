local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

function isMultiItemPurchase(p0)
	-- upvalues: requestTypeModule (ref)
	return p0 == requestTypeModule.Look
end

return isMultiItemPurchase