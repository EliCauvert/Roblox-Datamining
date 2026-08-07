local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function() --[[ line: 10 | named "useMenuItemCursor" ]]
	-- upvalues: foundationModule (ref), reactModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	
	return reactModule.useMemo(function() --[[ line: 12 ]]
		-- upvalues: var2 (ref)
		return {
			radius = UDim.new(0, var2.Radius.Small),
			offset = var2.Size.Size_200,
			borderWidth = var2.Stroke.Thicker
		}
	end, { var2 })
end