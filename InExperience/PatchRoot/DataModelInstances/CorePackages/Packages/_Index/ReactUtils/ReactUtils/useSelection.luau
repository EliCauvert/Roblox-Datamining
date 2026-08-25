local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local useEventConnectionModule = require(reactUtils.useEventConnection)

return function(p0)
	-- upvalues: reactModule (ref), useEventConnectionModule (ref)
	p0 = p0 or game:GetService("Selection")
	local var4, var5 = reactModule.useState(function()
		-- upvalues: p0 (ref)
		return p0:Get()
	end)
	useEventConnectionModule(p0.SelectionChanged, function()
		-- upvalues: var5 (ref), p0 (ref)
		var5(p0:Get())
	end, {})
	
	return var4
end