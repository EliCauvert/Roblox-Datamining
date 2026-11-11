local FFlagAXMoveCatalogFilterToL1Navigation = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation
game:DefineFastFlag("AXEnableCategoryPills9", false)

return function()
	-- upvalues: FFlagAXMoveCatalogFilterToL1Navigation (copy)
	return FFlagAXMoveCatalogFilterToL1Navigation and game:GetFastFlag("AXEnableCategoryPills9")
end