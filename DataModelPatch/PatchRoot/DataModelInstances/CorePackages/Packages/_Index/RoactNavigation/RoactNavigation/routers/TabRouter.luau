local Parent = script.Parent
local Parent1 = Parent.Parent
local Object = require(Parent1.Parent.LuauPolyfill).Object
local SwitchRouterModule = require(Parent.SwitchRouter)
local BackBehaviorModule = require(Parent1.BackBehavior)

return function(p1, p2)
	-- upvalues: BackBehaviorModule (copy), Object (copy), SwitchRouterModule (copy)
	local AssignResult = {
		resetOnBlur = false,
		backBehavior = BackBehaviorModule.InitialRoute
	}
	
	if p2 then
		AssignResult = Object.assign(AssignResult, p2)
	end
	return SwitchRouterModule(p1, AssignResult)
end