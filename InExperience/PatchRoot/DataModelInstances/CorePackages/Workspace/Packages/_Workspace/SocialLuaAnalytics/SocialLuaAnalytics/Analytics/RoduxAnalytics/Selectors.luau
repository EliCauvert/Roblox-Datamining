local _ = require(script.Parent.AnalyticsTypes)
local getSessionIdByKeyModule = require(script.getSessionIdByKey)

return function(p0) --[[ line: 4 ]]
	-- upvalues: getSessionIdByKeyModule (ref)
	return { getSessionIdByKey = getSessionIdByKeyModule(p0) }
end