local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local responsiveModule = require(parent.Responsive)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref)
	local var1 = useTokens()
	
	return {
		isVisible = p1 and not (responsiveModule.useLastInput() == responsiveModule.Input.Directional and not responsiveModule.useIsSpatial()),
		height = var1.Size.Size_700,
		bottomOffset = var1.Gap.XXSmall,
		occupiedHeight = var1.Size.Size_700 + var1.Gap.XXSmall
	}
end