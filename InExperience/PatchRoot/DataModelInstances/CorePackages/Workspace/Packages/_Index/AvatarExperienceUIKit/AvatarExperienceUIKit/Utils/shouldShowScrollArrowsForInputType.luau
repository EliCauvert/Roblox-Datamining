local ResponsiveModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Responsive)

return function(Touch): boolean
	-- upvalues: ResponsiveModule (copy)
	return Touch ~= ResponsiveModule.Input.Touch
end