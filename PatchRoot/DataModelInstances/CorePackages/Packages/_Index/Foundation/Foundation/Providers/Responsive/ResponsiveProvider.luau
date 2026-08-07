-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local gridConfigModule = require(foundation.Utility.Responsive.GridConfig)
local responsiveContextModule = require(parent.ResponsiveContext)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	config = {
		breakpoint = breakpointConfigModule,
		grid = gridConfigModule
	}
}

return function(p0) --[[ line: 26 | named "ResponsiveProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), responsiveContextModule (ref)
	local var7 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(responsiveContextModule.Provider, { value = var7 }, var7.children)
end