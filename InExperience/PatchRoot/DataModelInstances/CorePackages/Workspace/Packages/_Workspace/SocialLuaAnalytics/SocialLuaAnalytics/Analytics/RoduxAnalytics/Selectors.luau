local _ = require(script.Parent.AnalyticsTypes)
local GetSessionIdByKeyModule = require(script.getSessionIdByKey)

return function(p1)
	-- upvalues: GetSessionIdByKeyModule (copy)
	return { getSessionIdByKey = GetSessionIdByKeyModule(p1) }
end