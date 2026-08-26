local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local collectibleInstanceModule = require(parent.Models.CollectibleInstance)

return roduxModule.createReducer({}, {
	[require(parent.Actions.SetCollectibleResellableInstances).name] = function(p1, p2)
		-- upvalues: collectibleInstanceModule (ref), cryoModule (ref)
		local collectibleItemId = p2.collectibleItemId
		local t = {}
		
		for i, v in p2.collectibleItemInstances do
			local var1 = collectibleInstanceModule.fromGetCollectibleItemInstances(v)
			t[var1.collectibleInstanceId] = var1
		end
		return cryoModule.Dictionary.join(p1, { [collectibleItemId] = t })
	end
})