local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({}, {
	[require(ProfilePlatform.Networking.NetworkingAsset).GetAssetDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local ResponseBody = p2.responseBody
		
		return CryoModule.Dictionary.join(p1, {
			[tostring(ResponseBody.assetId)] = {
				assetId = ResponseBody.assetId,
				displayName = ResponseBody.displayName,
				assetType = ResponseBody.assetType
			}
		})
	end
})