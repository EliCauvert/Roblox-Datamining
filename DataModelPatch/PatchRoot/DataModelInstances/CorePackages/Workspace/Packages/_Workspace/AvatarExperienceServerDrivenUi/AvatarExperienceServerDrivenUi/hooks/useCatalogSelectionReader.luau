local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local ReactModule = require(AvatarExperienceServerDrivenUi.Parent.React)
local CatalogSelectionReaderContextModule = require(AvatarExperienceServerDrivenUi.Context.CatalogSelectionReaderContext)

return function()
	-- upvalues: ReactModule (copy), CatalogSelectionReaderContextModule (copy)
	return ReactModule.useContext(CatalogSelectionReaderContextModule.Context)
end