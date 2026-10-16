local Rodux = require(script.Parent.Parent.Parent.dependencies).Rodux
local _ = require(script.Parent.AnalyticsTypes)
local BySessionKeyModule = require(script.bySessionKey)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: Rodux (copy), BySessionKeyModule (copy)
	return Rodux.combineReducers({ bySessionKey = BySessionKeyModule(p1) })
end