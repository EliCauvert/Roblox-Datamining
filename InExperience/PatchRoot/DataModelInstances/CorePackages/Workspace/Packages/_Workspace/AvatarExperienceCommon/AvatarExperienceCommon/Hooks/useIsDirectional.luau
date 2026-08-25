local responsiveModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Responsive)

return function()
	-- upvalues: responsiveModule (ref)
	return if responsiveModule.usePreferredInput() ~= responsiveModule.Input.Directional then responsiveModule.useLastInput() == responsiveModule.Input.Directional else true
end