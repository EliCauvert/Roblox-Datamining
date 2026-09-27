local constants = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Constants

return function()
	-- upvalues: constants (ref)
	return constants.DRAWER_ANIM_SETTINGS.duration
end