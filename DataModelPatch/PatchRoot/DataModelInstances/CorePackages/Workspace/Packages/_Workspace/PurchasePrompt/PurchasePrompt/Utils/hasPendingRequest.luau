local RequestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(p1): boolean
	-- upvalues: RequestTypeModule (copy)
	return p1.promptRequest.requestType ~= RequestTypeModule.None
end