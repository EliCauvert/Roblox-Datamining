local ResponsiveModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Responsive)

return function(): boolean --[[ Line: 6 | Named "useIsDirectional" ]]
	-- upvalues: ResponsiveModule (copy)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	
	return ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional or UseLastInputResult == ResponsiveModule.Input.Directional
end