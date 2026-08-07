local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local _ = require(parent.Foundation)
local resolveBreakpointModule = require(appComposition.resolveBreakpoint)

return signalsModule.createComputed(function(p0) --[[ line: 11 ]]
	-- upvalues: displayModule (ref), resolveBreakpointModule (ref)
	return resolveBreakpointModule(displayModule.GetDisplayStore(p0).getDesignSpaceViewportWidth(p0))
end)