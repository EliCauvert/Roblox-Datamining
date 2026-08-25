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
	local var2 = useLocalization(t)
	local var3 = reactModule.useRef(var2)
	
	for i, v in var2 do
		if var3.current[i] ~= v then
			var3.current = var2
			break
		end
	end
	return var3.current
end