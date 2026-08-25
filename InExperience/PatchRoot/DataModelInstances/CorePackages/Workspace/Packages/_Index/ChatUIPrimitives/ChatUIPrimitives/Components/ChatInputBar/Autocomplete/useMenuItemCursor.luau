local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function()
	-- upvalues: foundationModule (ref), reactModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			radius = UDim.new(0, var2.Radius.Small),
			offset = var2.Size.Size_200,
			borderWidth = var2.Stroke.Thicker
		}
	end, { var2 })
end