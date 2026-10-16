local ResponsiveModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Responsive)

return function(Touch): boolean --[[ Line: 9 | Named "shouldShowScrollArrowsForInputType" ]]
	-- upvalues: ResponsiveModule (copy)
	return Touch ~= ResponsiveModule.Input.Touch
end