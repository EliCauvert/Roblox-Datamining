local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.AppendSearchInCatalog).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local v1 = p1[p2.searchUuid]
		
		if v1 then
			p2.searchInCatalog.items = CryoModule.List.join(v1.items, p2.searchInCatalog.items)
			
			return CryoModule.Dictionary.join(p1, { [p2.searchUuid] = p2.searchInCatalog })
		else
			return CryoModule.Dictionary.join(p1, { [p2.searchUuid] = p2.searchInCatalog })
		end
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.searchUuid] = CryoModule.None })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetSearchInCatalog).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.searchUuid] = p2.searchInCatalog })
	end
})