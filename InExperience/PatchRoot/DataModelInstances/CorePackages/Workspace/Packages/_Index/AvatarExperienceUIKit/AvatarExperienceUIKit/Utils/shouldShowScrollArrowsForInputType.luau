local responsiveModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.Responsive)

return function(p0) --[[ line: 9 | named "shouldShowScrollArrowsForInputType" ]]
	-- upvalues: responsiveModule (ref)
	return p0 ~= responsiveModule.Input.Touch
end