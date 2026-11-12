local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local _ = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local ResolveBreakpointModule = require(AppComposition.resolveBreakpoint)

return function(Callback)
	-- upvalues: SignalsModule (copy), ResolveBreakpointModule (copy)
	return (SignalsModule.createComputed(function(p1)
		-- upvalues: ResolveBreakpointModule (upval), Callback (copy)
		return ResolveBreakpointModule(Callback(p1))
	end))
end