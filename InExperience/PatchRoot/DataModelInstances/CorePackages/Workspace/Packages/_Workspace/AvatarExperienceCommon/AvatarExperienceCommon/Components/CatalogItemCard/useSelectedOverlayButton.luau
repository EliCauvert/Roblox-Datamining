local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1) --[[ Line: 18 | Named "useSelectedOverlayButton" ]]
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseIsSpatialResult = ResponsiveModule.useIsSpatial()
	local NoUseIsSpatialResult: boolean = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional and not UseIsSpatialResult
	
	return {
		isVisible = p1 and not NoUseIsSpatialResult,
		height = UseTokensResult.Size.Size_700,
		bottomOffset = UseTokensResult.Gap.XXSmall,
		occupiedHeight = UseTokensResult.Size.Size_700 + UseTokensResult.Gap.XXSmall
	}
end