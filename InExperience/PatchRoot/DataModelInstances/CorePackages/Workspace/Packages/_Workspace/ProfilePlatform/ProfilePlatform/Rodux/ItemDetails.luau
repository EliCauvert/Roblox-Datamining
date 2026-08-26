local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local assetInfoModule = require(profilePlatform.Common.AssetInfo)

return roduxModule.createReducer({}, {
	[require(profilePlatform.Networking.NetworkingCurrentlyWearing).GetItemDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local t = {}
		
		for i, v in p2.responseBody.data do
			local var1 = assetInfoModule.fromAsset(v)
			t[var1.id] = var1
		end
		return cryoModule.Dictionary.join(p1, t)
	end
})