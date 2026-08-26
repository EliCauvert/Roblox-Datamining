local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local useEventConnectionModule = require(reactUtils.useEventConnection)

return function(p1)
	-- upvalues: reactModule (ref), useEventConnectionModule (ref)
	p1 = p1 or game:GetService("Selection")
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		return p1:Get()
	end)
	useEventConnectionModule(p1.SelectionChanged, function()
		-- upvalues: var2 (ref), p1 (ref)
		var2(p1:Get())
	end, {})
	
	return var1
end