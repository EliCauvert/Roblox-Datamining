local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(p0) --[[ line: 5 ]]
	-- upvalues: requestTypeModule (ref)
	return p0.promptRequest.requestType ~= requestTypeModule.None
end