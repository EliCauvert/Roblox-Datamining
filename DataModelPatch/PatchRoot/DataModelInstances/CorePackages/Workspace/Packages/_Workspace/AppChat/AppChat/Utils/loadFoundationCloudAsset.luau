local AppChat = script:FindFirstAncestor("AppChat")
local FoundationCloudAssetsModule = require(AppChat.Parent.FoundationCloudAssets)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction = FoundationCloudAssetsModule.preloadAsset
local LoadFoundationCloudAsset = require(AppChat.Logger):new("loadFoundationCloudAsset")

return function(p1)
	-- upvalues: PreloadAssetFunction (copy), Assets (copy), LoadFoundationCloudAsset (copy)
	PreloadAssetFunction(p1)
	local Asset = Assets[p1]
	
	if Asset then
		return Asset.assetId, Asset.size
	else
		LoadFoundationCloudAsset:error("FoundationCloudAsset not found: %s", p1)
		
		return "", { X = 0, Y = 0 }
	end
end