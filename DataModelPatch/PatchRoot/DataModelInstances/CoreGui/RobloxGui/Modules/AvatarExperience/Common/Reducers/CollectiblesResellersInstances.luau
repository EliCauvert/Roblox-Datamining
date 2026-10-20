local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local CollectibleInstanceModule = require(Modules.AvatarExperience.Common.Models.CollectibleInstance)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances).name] = function(p1, p2)
		-- upvalues: CollectibleInstanceModule (copy), CryoModule (copy)
		local CollectibleItemId = p2.collectibleItemId
		local Instances = {}
		local InstanceIdsList = {}
		
		for _, collectibleItemInstance in p2.collectibleItemInstances do
			local FromGetCollectibleResellersResult = CollectibleInstanceModule.fromGetCollectibleResellers(collectibleItemInstance, CollectibleItemId)
			Instances[FromGetCollectibleResellersResult.collectibleInstanceId] = FromGetCollectibleResellersResult
			table.insert(InstanceIdsList, FromGetCollectibleResellersResult.collectibleInstanceId)
		end
		return CryoModule.Dictionary.join(p1, {
			[CollectibleItemId] = { Instances = Instances, InstanceIdsList = InstanceIdsList }
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.AppendCollectibleResellersInstances).name] = function(p3, p4)
		-- upvalues: CollectibleInstanceModule (copy), CryoModule (copy)
		local CollectibleItemId = p4.collectibleItemId
		local Instances = {}
		local InstanceIdsList = {}
		
		for _, collectibleItemInstance in p4.collectibleItemInstances do
			local FromGetCollectibleResellersResult = CollectibleInstanceModule.fromGetCollectibleResellers(collectibleItemInstance, CollectibleItemId)
			Instances[FromGetCollectibleResellersResult.collectibleInstanceId] = FromGetCollectibleResellersResult
			table.insert(InstanceIdsList, FromGetCollectibleResellersResult.collectibleInstanceId)
		end
		local v1 = p3[CollectibleItemId]
		
		return if v1 then CryoModule.Dictionary.join(p3, {
			[CollectibleItemId] = {
				Instances = CryoModule.Dictionary.join(v1.Instances, Instances),
				InstanceIdsList = CryoModule.List.join(v1.InstanceIdsList, InstanceIdsList)
			}
		}) else CryoModule.Dictionary.join(p3, {
			[CollectibleItemId] = { Instances = Instances, InstanceIdsList = InstanceIdsList }
		})
	end
})