local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local FlagsModule = require(Foundation.Utility.Flags)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local DevAssertModule = require(Foundation.Utility.devAssert)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction = FoundationCloudAssetsModule.preloadAsset

return function(p1)
	-- upvalues: DashModule (copy), FlagsModule (copy), DevAssertModule (copy), Assets (copy), PreloadAssetFunction (copy)
	if typeof(p1) == "string" then
		p1 = { p1 }
	end
	DashModule.forEach(p1, function(p2)
		-- upvalues: FlagsModule (upval), DevAssertModule (upval), Assets (upval), PreloadAssetFunction (upval)
		local Message: string = `preloadAssets should only be used with valid FoundationCloudAssets; {p2} is an invalid name`
		
		if FlagsModule.FoundationDevOnlyPropAsserts then
			DevAssertModule(Assets[p2], Message)
			
			if not Assets[p2] then return end
		else
			assert(Assets[p2], Message)
		end
		PreloadAssetFunction(p2)
	end)
end