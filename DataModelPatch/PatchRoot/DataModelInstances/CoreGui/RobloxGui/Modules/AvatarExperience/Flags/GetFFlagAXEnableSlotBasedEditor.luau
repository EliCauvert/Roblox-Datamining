local FFlagAXRootSlotBasedEditorFlag = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
game:DefineFastFlag("AXEnableSlotBasedEditor3", false)

return function()
	-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
	return FFlagAXRootSlotBasedEditorFlag and game:GetFastFlag("AXEnableSlotBasedEditor3")
end