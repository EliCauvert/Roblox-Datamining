local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local networkingCatalogModule = require(profilePlatform.Networking.NetworkingCatalog)
local assetInfoModule = require(profilePlatform.Common.AssetInfo)
local enumsModule = require(profilePlatform.Common.Enums)

return roduxModule.createReducer({}, {
	[networkingCatalogModule.GetItemAndBundleDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: enumsModule (ref), assetInfoModule (ref), cryoModule (ref)
		local t = {}
		
		for i, v in p2.responseBody.data do
			if v.itemType == enumsModule.ItemTypes.Bundle then
				local var1 = assetInfoModule.fromAsset(v)
				t[var1.id] = var1
			end
		end
		return cryoModule.Dictionary.union(p1, t)
	end
})