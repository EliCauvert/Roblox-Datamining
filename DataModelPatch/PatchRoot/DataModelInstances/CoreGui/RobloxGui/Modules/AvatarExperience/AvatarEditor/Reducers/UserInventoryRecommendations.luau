local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Catalog.Models.SortResults)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.AppendUserInventoryRecommendations).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local v1 = p1[p2.searchUuid]
		
		return if v1 and not p2.forceUpdate then CryoModule.Dictionary.join(p1, {
			[p2.searchUuid] = {
				items = CryoModule.List.join(v1.items, p2.sortResults.items),
				initialStorageTime = v1.initialStorageTime,
				nextPageCursor = p2.sortResults.nextPageCursor,
				previousPageCursor = p2.sortResults.previousPageCursor,
				keyword = p2.sortResults.keyword
			}
		}) else CryoModule.Dictionary.join(p1, {
			[p2.searchUuid] = CryoModule.Dictionary.join(p2.sortResults, { initialStorageTime = tick() })
		})
	end
})