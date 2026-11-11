local FFlagAXRootSlotBasedEditorFlag = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
game:DefineFastFlag("AXUprankBundles", false)

return function()
	-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
	return FFlagAXRootSlotBasedEditorFlag and game:GetFastFlag("AXUprankBundles")
end