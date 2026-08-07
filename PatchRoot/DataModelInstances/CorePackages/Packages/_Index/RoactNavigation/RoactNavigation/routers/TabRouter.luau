-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local object = require(parent_1.Parent.LuauPolyfill).Object
local switchRouterModule = require(parent.SwitchRouter)
local backBehaviorModule = require(parent_1.BackBehavior)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: backBehaviorModule (ref), object (ref), switchRouterModule (ref)
	local t = {
		resetOnBlur = false,
		backBehavior = backBehaviorModule.InitialRoute
	}
	
	if p1 then
		t = object.assign(t, p1)
	end
	return switchRouterModule(p0, t)
end