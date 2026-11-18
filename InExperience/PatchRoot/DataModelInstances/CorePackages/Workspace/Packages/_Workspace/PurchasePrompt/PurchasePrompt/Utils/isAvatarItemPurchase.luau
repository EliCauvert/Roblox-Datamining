local RequestTypeModule = require(script.Parent.Parent.Enums.RequestType)
local config = {
	[RequestTypeModule.Asset] = true,
	[RequestTypeModule.Bundle] = true,
	[RequestTypeModule.Look] = true,
	[RequestTypeModule.RobuxUpsell] = true
}

return function(p1): boolean
	-- upvalues: config (copy)
	return config[p1] == true
end