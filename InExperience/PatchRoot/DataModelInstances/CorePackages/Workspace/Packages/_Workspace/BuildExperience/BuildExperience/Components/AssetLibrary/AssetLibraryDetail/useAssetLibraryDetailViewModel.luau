local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(script.Parent.AssetLibraryDetailView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local _ = require(buildExperience.Components.Chat.ChatActions)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), reactModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local item = value.item
	local var2 = if item.kind == "Model" then var1.model elseif item.kind == "Image" then var1.image else var1.audio
	
	return {
		status = "Ready",
		asset = reactModule.useMemo(function()
			-- upvalues: item (ref), var2 (ref)
			return {
				assetId = nil,
				createTime = nil,
				updateTime = nil,
				creatorName = nil,
				displayName = item.displayName,
				description = item.path,
				assetType = item.kind,
				displayType = var2,
				thumbnail = item.thumbnail,
				contentId = item.contentId
			}
		end, { item, var2 }),
		strings = var1,
		onBack = value.onBack,
		chatActions = value.chatActions,
		presentation = value.presentation
	}
end