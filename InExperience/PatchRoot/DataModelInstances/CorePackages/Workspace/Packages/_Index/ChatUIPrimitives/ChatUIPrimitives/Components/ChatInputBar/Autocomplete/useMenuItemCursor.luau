local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function()
	-- upvalues: foundationModule (ref), reactModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			radius = UDim.new(0, var1.Radius.Small),
			offset = var1.Size.Size_200,
			borderWidth = var1.Stroke.Thicker
		}
	end, { var1 })
end