local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.AssetLibraryTypes)
local t = {
	assetUnavailable = "Feature.Build.Message.AssetDetailsUnavailable",
	audio = "Feature.Build.Label.Sounds",
	created = "Feature.Build.Label.Created",
	empty = "Feature.Build.Message.NoAssetsFound",
	image = "Feature.Build.Label.Images2D",
	loadError = "Feature.Build.Message.AssetsLoadFailed",
	model = "Feature.Build.Label.Models3D",
	purchased = "Feature.Build.Label.Purchased",
	retry = "CommonUI.Features.Labels.Retry",
	searchPlaceholder = "Feature.Build.Label.SearchAssets",
	shared = "Feature.Build.Label.Shared",
	showMore = "CommonUI.Controls.Action.ShowMore",
	title = "Feature.Build.Title.AssetLibrary",
	updated = "Feature.Build.Label.Updated"
}

return function()
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref)
	local var1 = useLocalization(t)
	local var2 = reactModule.useRef(var1)
	
	for i, v in var1 do
		if var2.current[i] ~= v then
			var2.current = var1
			break
		end
	end
	return var2.current
end