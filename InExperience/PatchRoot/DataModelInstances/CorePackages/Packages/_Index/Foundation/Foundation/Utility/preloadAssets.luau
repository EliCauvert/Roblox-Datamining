local Parent = script:FindFirstAncestor("Foundation").Parent
local DashModule = require(Parent.Dash)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction = FoundationCloudAssetsModule.preloadAsset

return function(p1) --[[ Line: 9 ]]
	-- upvalues: DashModule (copy), Assets (copy), PreloadAssetFunction (copy)
	if typeof(p1) == "string" then
		p1 = { p1 }
	end
	DashModule.forEach(p1, function(p2) --[[ Line: 12 ]]
		-- upvalues: Assets (upval), PreloadAssetFunction (upval)
		assert(Assets[p2], `preloadAssets should only be used with valid FoundationCloudAssets; {p2} is an invalid name`)
		PreloadAssetFunction(p2)
	end)
end