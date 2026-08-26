local appChat = script:FindFirstAncestor("AppChat")
local foundationCloudAssetsModule = require(appChat.Parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local loadFoundationCloudAsset = require(appChat.Logger):new("loadFoundationCloudAsset")

return function(value)
	-- upvalues: preloadAsset (ref), assets (ref), loadFoundationCloudAsset (ref)
	preloadAsset(value)
	local var1 = assets[value]
	
	if var1 then
		return var1.assetId, var1.size
	end
	loadFoundationCloudAsset:error("FoundationCloudAsset not found: %s", value)
	
	return "", { X = 0, Y = 0 }
end