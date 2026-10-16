local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local CollectibleInstanceModule = require(Parent.Models.CollectibleInstance)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Parent.Actions.SetCollectibleResellableInstances).name] = function(p1, p2) --[[ Line: 13 ]]
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
	end
})