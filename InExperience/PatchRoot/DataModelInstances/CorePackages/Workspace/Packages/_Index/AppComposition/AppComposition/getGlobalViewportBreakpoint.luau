local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local DisplayModule = require(Parent.Display)
local _ = require(Parent.Foundation)
local ResolveBreakpointModule = require(AppComposition.resolveBreakpoint)

return (require(Parent.Signals).createComputed(function(p1) --[[ Line: 11 ]]
	-- upvalues: DisplayModule (copy), ResolveBreakpointModule (copy)
	return ResolveBreakpointModule((DisplayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)))
end))