local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(CorePackages.Packages.Rodux).createReducer({ OrderedList = {}, RemovedList = {} }, {
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { OrderedList = p2.currentSort })
	end,
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { OrderedList = {}, RemovedList = {} })
	end,
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.AddRemovedItem).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			RemovedList = CryoModule.Dictionary.join(p1.RemovedList or {}, { [p2.removedAssetId] = p2.removedAssetTypeId })
		})
	end,
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { RemovedList = {} })
	end
})