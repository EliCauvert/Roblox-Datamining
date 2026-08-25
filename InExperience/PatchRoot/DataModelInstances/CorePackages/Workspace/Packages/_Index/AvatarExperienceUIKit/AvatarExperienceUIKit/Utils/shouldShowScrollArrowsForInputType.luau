local responsiveModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Responsive)

return function(p0)
	-- upvalues: responsiveModule (ref)
	return p0 ~= responsiveModule.Input.Touch
end