local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local assetLibraryDetailViewModule = require(script.Parent.AssetLibraryDetailView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local getGameMediaForUniverseModule = require(buildExperience.utils.getGameMediaForUniverse)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), assetLibraryDetailViewModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local var2 = getGameMediaForUniverseModule(value.universeId)
	local var3 = reactModule.useMemo(function()
		-- upvalues: value (ref), var1 (ref), var2 (ref)
		if value.assetId == value.universeId then
			return {
				description = nil,
				assetType = "Image",
				createTime = nil,
				updateTime = nil,
				creatorName = nil,
				assetId = value.assetId,
				displayName = var1.icon,
				displayType = var1.image,
				thumbnail = var2.icon
			}
		end
		for i, v in var2.thumbnails do
			if v.mediaType == "image" and tonumber(v.id) == value.assetId and v.assetSource ~= nil then
				return {
					description = nil,
					assetType = "Image",
					createTime = nil,
					updateTime = nil,
					creatorName = nil,
					assetId = value.assetId,
					displayName = `{var1.thumbnail} {i}`,
					displayType = var1.image,
					thumbnail = v.assetSource
				}
			end
		end
		return nil
	end, {
		var2.icon,
		var2.thumbnails,
		value.assetId,
		value.universeId,
		var1
	})
	
	return reactModule.createElement(assetLibraryDetailViewModule, {
		asset = var3,
		status = if var3 ~= nil then "Failed" else "Ready",
		strings = {
			assetUnavailable = var1.assetUnavailable,
			title = var1.title,
			updated = var1.updated
		},
		onBack = value.onBack,
		presentation = value.presentation
	})
end