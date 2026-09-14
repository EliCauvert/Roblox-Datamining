local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.AssetLibraryTypes)
local t = {
	assetUnavailable = "Feature.Build.Message.AssetDetailsUnavailable",
	audio = "Feature.Build.Label.Sounds",
	created = "Feature.Build.Label.Created",
	empty = "Feature.Build.Message.NoAssetsFound",
	icon = "Feature.Build.Label.IconThumbnails",
	image = "Feature.Build.Label.IconThumbnails",
	limited = "Feature.Build.Label.Limited",
	loadError = "Feature.Build.Message.AssetsLoadFailed",
	model = "Feature.Build.Label.Models3D",
	purchased = "Feature.Build.Label.Purchased",
	retry = "CommonUI.Features.Labels.Retry",
	searchPlaceholder = "Feature.Build.Label.SearchAssets",
	shared = "Feature.Build.Label.Shared",
	showMore = "CommonUI.Controls.Action.ShowMore",
	thumbnail = "Feature.Build.Label.IconThumbnails",
	title = "Feature.Build.Title.AssetLibrary",
	updated = "Feature.Build.Label.Updated"
}

return function()
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref)
	local cloned = table.clone(useLocalization(t))
	cloned.model = "Models"
	local var1 = reactModule.useRef(cloned)
	
	for i, v in cloned do
		if var1.current[i] ~= v then
			var1.current = cloned
			break
		end
	end
	return var1.current
end