local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)
local AssetInfoModule = require(ProfilePlatform.Common.AssetInfo)

return require(Parent.Rodux).createReducer({}, {
	[require(ProfilePlatform.Networking.NetworkingCurrentlyWearing).GetItemDetails.Succeeded.name] = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local FromAssetResults = {}
		
		for _, entry in p2.responseBody.data do
			local FromAssetResult = AssetInfoModule.fromAsset(entry)
			FromAssetResults[FromAssetResult.id] = FromAssetResult
		end
		return CryoModule.Dictionary.join(p1, FromAssetResults)
	end
})