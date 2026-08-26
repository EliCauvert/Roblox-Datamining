local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(p1)
	-- upvalues: requestTypeModule (ref)
	return p1.promptRequest.requestType ~= requestTypeModule.None
end