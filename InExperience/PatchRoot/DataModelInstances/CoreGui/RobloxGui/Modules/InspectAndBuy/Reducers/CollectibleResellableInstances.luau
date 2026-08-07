local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local collectibleInstanceModule = require(parent.Models.CollectibleInstance)

return roduxModule.createReducer({}, {
	[require(parent.Actions.SetCollectibleResellableInstances).name] = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: collectibleInstanceModule (ref), cryoModule (ref)
		local collectibleItemId = p1.collectibleItemId
		local t = {}
		
		for i, v in p1.collectibleItemInstances do
			local var5 = collectibleInstanceModule.fromGetCollectibleItemInstances(v)
			t[var5.collectibleInstanceId] = var5
		end
		return cryoModule.Dictionary.join(p0, { [collectibleItemId] = t })
	end
})