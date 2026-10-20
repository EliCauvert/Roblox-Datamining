local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local CollectibleInstanceModule = require(Modules.AvatarExperience.Common.Models.CollectibleInstance)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResellableInstances).name] = function(p1, p2)
		-- upvalues: CollectibleInstanceModule (copy), CryoModule (copy)
		local CollectibleItemId = p2.collectibleItemId
		local FromGetCollectibleItemInstancesResults = {}
		
		for _, collectibleItemInstance in p2.collectibleItemInstances do
			local FromGetCollectibleItemInstancesResult = CollectibleInstanceModule.fromGetCollectibleItemInstances(collectibleItemInstance)
			FromGetCollectibleItemInstancesResults[FromGetCollectibleItemInstancesResult.collectibleInstanceId] = FromGetCollectibleItemInstancesResult
		end
		return CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = FromGetCollectibleItemInstancesResults
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.UpdateCollectibleResellableInstance).name] = function(p3, p4)
		-- upvalues: CryoModule (copy)
		local CollectibleItemId = p4.collectibleItemId
		local CollectibleInstanceId = p4.collectibleInstanceId
		local CollectibleInstanceData = p4.collectibleInstanceData
		local v1 = p3[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p3, {
			[CollectibleItemId] = CryoModule.Dictionary.join(v1, { [CollectibleInstanceId] = CollectibleInstanceData })
		}) else p3
	end
})