local rodux = require(script.Parent.Parent.Parent.dependencies).Rodux
local _ = require(script.Parent.AnalyticsTypes)
local bySessionKeyModule = require(script.bySessionKey)

return function(p1)
	-- upvalues: rodux (ref), bySessionKeyModule (ref)
	return rodux.combineReducers({ bySessionKey = bySessionKeyModule(p1) })
end