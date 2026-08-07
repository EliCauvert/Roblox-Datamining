local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local networkingCatalogModule = require(profilePlatform.Networking.NetworkingCatalog)
local assetInfoModule = require(profilePlatform.Common.AssetInfo)
local enumsModule = require(profilePlatform.Common.Enums)

return roduxModule.createReducer({}, {
	[networkingCatalogModule.GetItemAndBundleDetails.Succeeded.name] = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: enumsModule (ref), assetInfoModule (ref), cryoModule (ref)
		local t = {}
		
		for i, v in p1.responseBody.data do
			if v.itemType == enumsModule.ItemTypes.Bundle then
				local var7 = assetInfoModule.fromAsset(v)
				t[var7.id] = var7
			end
		end
		return cryoModule.Dictionary.union(p0, t)
	end
})