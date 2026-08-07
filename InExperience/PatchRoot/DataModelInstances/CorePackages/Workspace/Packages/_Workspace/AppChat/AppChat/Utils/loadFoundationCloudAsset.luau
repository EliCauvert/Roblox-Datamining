local appChat = script:FindFirstAncestor("AppChat")
local foundationCloudAssetsModule = require(appChat.Parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local loadFoundationCloudAsset = require(appChat.Logger):new("loadFoundationCloudAsset")

return function(value) --[[ line: 12 | named "loadFoundationCloudAsset" ]]
	-- upvalues: preloadAsset (ref), assets (ref), loadFoundationCloudAsset (ref)
	preloadAsset(value)
	local var3 = assets[value]
	
	if var3 then
		return var3.assetId, var3.size
	end
	loadFoundationCloudAsset:error("FoundationCloudAsset not found: %s", value)
	
	return "", { X = 0, Y = 0 }
end