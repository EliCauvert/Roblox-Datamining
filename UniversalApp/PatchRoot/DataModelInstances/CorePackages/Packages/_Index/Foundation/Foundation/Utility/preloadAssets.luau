local parent = script:FindFirstAncestor("Foundation").Parent
local dashModule = require(parent.Dash)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset

return function(p1)
	-- upvalues: dashModule (ref), assets (ref), preloadAsset (ref)
	if typeof(p1) == "string" then
		p1 = { p1 }
	end
	dashModule.forEach(p1, function(p2)
		-- upvalues: assets (copy), preloadAsset (copy)
		assert(assets[p2], `preloadAssets should only be used with valid FoundationCloudAssets; {p2} is an invalid name`)
		preloadAsset(p2)
	end)
end