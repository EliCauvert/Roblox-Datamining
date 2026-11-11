local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ obtainedCatalogMetadata = false }, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.SetCatalogMetadata).name] = function(_, p1)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join({ obtainedCatalogMetadata = true }, p1.metadata)
	end
})