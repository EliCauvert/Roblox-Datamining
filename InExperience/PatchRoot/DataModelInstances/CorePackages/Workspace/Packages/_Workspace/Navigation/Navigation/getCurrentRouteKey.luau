local _ = require(script.Parent.types)
local GetCurrentRouteStateModule = require(script.Parent.getCurrentRouteState)

return function(p1) --[[ Line: 7 | Named "getCurrentRouteKey" ]]
	-- upvalues: GetCurrentRouteStateModule (copy)
	local CurrentRouteStateModule = GetCurrentRouteStateModule(p1)
	
	return if CurrentRouteStateModule then CurrentRouteStateModule.key else nil
end