local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local assetInfoModule = require(profilePlatform.Common.AssetInfo)

return roduxModule.createReducer({}, {
	[require(profilePlatform.Networking.NetworkingCurrentlyWearing).GetItemDetails.Succeeded.name] = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local t = {}
		
		for i, v in p1.responseBody.data do
			local var5 = assetInfoModule.fromAsset(v)
			t[var5.id] = var5
		end
		return cryoModule.Dictionary.join(p0, t)
	end
})