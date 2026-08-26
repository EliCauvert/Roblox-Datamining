local responsiveModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Responsive)

return function(p1)
	-- upvalues: responsiveModule (ref)
	return p1 ~= responsiveModule.Input.Touch
end