local parent = script.Parent
local parent_1 = parent.Parent
local object = require(parent_1.Parent.LuauPolyfill).Object
local switchRouterModule = require(parent.SwitchRouter)
local backBehaviorModule = require(parent_1.BackBehavior)

return function(p1, p2)
	-- upvalues: backBehaviorModule (ref), object (ref), switchRouterModule (ref)
	local t = {
		resetOnBlur = false,
		backBehavior = backBehaviorModule.InitialRoute
	}
	
	if p2 then
		t = object.assign(t, p2)
	end
	return switchRouterModule(p1, t)
end