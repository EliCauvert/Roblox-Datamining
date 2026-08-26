local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({}, {
	[require(profilePlatform.Networking.NetworkingAsset).GetAssetDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local responseBody = p2.responseBody
		
		return cryoModule.Dictionary.join(p1, {
			[tostring(responseBody.assetId)] = {
				assetId = responseBody.assetId,
				displayName = responseBody.displayName,
				assetType = responseBody.assetType
			}
		})
	end
})