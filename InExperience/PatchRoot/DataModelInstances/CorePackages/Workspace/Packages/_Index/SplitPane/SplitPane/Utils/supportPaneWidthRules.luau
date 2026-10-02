local parent = script:FindFirstAncestor("SplitPane").Parent
local foundationModule = require(parent.Foundation)
local appCompositionModule = require(parent.AppComposition)
local sharedFlagsModule = require(parent.SharedFlags)
local breakpoint = foundationModule.Enums.Breakpoint
local resolveBreakpoint = appCompositionModule.resolveBreakpoint
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local large = breakpoint.Large
local t = {
	[breakpoint.XSmall] = 1,
	[breakpoint.Small] = 2,
	[breakpoint.Medium] = 3,
	[breakpoint.Large] = 4,
	[breakpoint.XLarge] = 5,
	[breakpoint.XXLarge] = 6
}

local function _(p1, p2)
	-- upvalues: t (ref)
	return (t[p2] or 0) <= (t[p1] or 0)
end

return {
	isSplitEnabledForWidth = function(p1)
		return p1 >= 800
	end,
	shouldDefaultToCollapsed = function(p1)
		-- upvalues: fFlagEnableSplitPane (ref), resolveBreakpoint (ref), large (ref), t (ref)
		return if fFlagEnableSplitPane then not ((t[large] or 0) <= (t[resolveBreakpoint(p1)] or 0)) else false
	end
}