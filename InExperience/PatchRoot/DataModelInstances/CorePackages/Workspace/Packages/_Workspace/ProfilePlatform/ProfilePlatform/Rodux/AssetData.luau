local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({}, {
	[require(profilePlatform.Networking.NetworkingAsset).GetAssetDetails.Succeeded.name] = function(p0, p1) --[[ line: 27 ]]
		-- upvalues: cryoModule (ref)
		local responseBody = p1.responseBody
		
		return cryoModule.Dictionary.join(p0, {
			[tostring(responseBody.assetId)] = {
				assetId = responseBody.assetId,
				displayName = responseBody.displayName,
				assetType = responseBody.assetType
			}
		})
	end
})