-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local stackRouterModule = require(parent.routers.StackRouter)
local stackViewModule = require(parent.views.RobloxStackView.StackView)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: stackRouterModule (ref), createNavigatorModule (ref), stackViewModule (ref)
	return createNavigatorModule(stackViewModule, stackRouterModule(p0, p1), p1 or {})
end