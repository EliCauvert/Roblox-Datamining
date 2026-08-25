local parent = script:FindFirstAncestor("Foundation").Parent
local dashModule = require(parent.Dash)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset

return function(p0)
	-- upvalues: dashModule (ref), assets (ref), preloadAsset (ref)
	if typeof(p0) == "string" then
		p0 = { p0 }
	end
	dashModule.forEach(p0, function(p1)
		-- upvalues: assets (copy), preloadAsset (copy)
		assert(assets[p1], `preloadAssets should only be used with valid FoundationCloudAssets; {p1} is an invalid name`)
		preloadAsset(p1)
	end)
end