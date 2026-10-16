local Parent = script:FindFirstAncestor("SplitPane").Parent
local Breakpoint = require(Parent.Foundation).Enums.Breakpoint
local ResolveBreakpointFunction = require(Parent.AppComposition).resolveBreakpoint
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local Large = Breakpoint.Large
local config = {
	[Breakpoint.XSmall] = 1,
	[Breakpoint.Small] = 2,
	[Breakpoint.Medium] = 3,
	[Breakpoint.Large] = 4,
	[Breakpoint.XLarge] = 5,
	[Breakpoint.XXLarge] = 6
}

local function _(p1, p2): boolean --[[ Line: 30 | Named "isBreakpointAtLeast" ]]
	-- upvalues: config (copy)
	return (config[p2] or 0) <= (config[p1] or 0)
end

return {
	isSplitEnabledForWidth = function(p1: number): boolean --[[ Line: 34 ]]
		return p1 >= 800
	end,
	shouldDefaultToCollapsed = function(p1): boolean --[[ Line: 38 ]]
		-- upvalues: FFlagEnableSplitPane (copy), ResolveBreakpointFunction (copy), Large (copy), config (copy)
		return if FFlagEnableSplitPane then not ((config[Large] or 0) <= (config[ResolveBreakpointFunction(p1)] or 0)) else false
	end
}