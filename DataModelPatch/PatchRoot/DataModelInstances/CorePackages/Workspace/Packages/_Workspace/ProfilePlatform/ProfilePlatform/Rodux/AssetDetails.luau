local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)
local AssetInfoModule = require(ProfilePlatform.Common.AssetInfo)
local EnumsModule = require(ProfilePlatform.Common.Enums)

return require(Parent.Rodux).createReducer({}, {
	[require(ProfilePlatform.Networking.NetworkingCatalog).GetItemAndBundleDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: EnumsModule (copy), AssetInfoModule (copy), CryoModule (copy)
		local FromAssetResults = {}
		
		for _, entry in p2.responseBody.data do
			if entry.itemType == EnumsModule.ItemTypes.Asset then
				local FromAssetResult = AssetInfoModule.fromAsset(entry)
				FromAssetResults[FromAssetResult.id] = FromAssetResult
			end
		end
		return CryoModule.Dictionary.union(p1, FromAssetResults)
	end
})