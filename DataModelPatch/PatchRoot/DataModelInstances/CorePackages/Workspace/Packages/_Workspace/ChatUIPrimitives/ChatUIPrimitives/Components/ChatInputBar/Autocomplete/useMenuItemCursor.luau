local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function()
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			radius = UDim.new(0, UseTokensResult.Radius.Small),
			offset = UseTokensResult.Size.Size_200,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	end, { UseTokensResult })
end