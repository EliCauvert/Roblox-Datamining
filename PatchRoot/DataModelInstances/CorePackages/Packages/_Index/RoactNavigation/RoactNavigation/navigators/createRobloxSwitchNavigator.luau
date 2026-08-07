-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local switchRouterModule = require(parent.routers.SwitchRouter)
local robloxSwitchViewModule = require(parent.views.RobloxSwitchView)

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: switchRouterModule (ref), createNavigatorModule (ref), robloxSwitchViewModule (ref)
	return createNavigatorModule(robloxSwitchViewModule, switchRouterModule(p0, p1), p1 or {})
end