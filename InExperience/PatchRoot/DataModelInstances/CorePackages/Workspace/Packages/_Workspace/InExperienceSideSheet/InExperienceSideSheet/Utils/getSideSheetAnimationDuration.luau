local Constants = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Constants

return function()
	-- upvalues: Constants (copy)
	return Constants.DRAWER_ANIM_SETTINGS.duration
end