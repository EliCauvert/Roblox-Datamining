local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function() --[[ Line: 10 | Named "useMenuItemCursor" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.useMemo(function() --[[ Line: 12 ]]
		-- upvalues: UseTokensResult (copy)
		return {
			radius = UDim.new(0, UseTokensResult.Radius.Small),
			offset = UseTokensResult.Size.Size_200,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	end, { UseTokensResult })
end