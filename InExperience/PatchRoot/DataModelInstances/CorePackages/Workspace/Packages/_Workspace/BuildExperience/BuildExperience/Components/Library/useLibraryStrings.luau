local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local useLocalization = localizationModule.Hooks.useLocalization
local _ = require(script.Parent.LibraryTypes)
local t = {
	model = "Feature.Build.Label.Models3D",
	retry = "CommonUI.Features.Labels.Retry"
}

return function()
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), localizationModule (ref)
	local var1 = useLocalization(t)
	local var2 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local ok, status = pcall(function()
		-- upvalues: var2 (ref)
		assert(var2 ~= nil, "Library localization context is unavailable")
		
		return var2:Format("Feature.Build.Title.Library")
	end)
	local cloned = table.clone(var1)
	cloned.title = if ok and type(status) == "string" and (status ~= "" and status ~= "Feature.Build.Title.Library") then status else "Library"
	cloned.empty = "No assets found."
	cloned.loadError = "Unable to load assets."
	cloned.model = "Models"
	cloned.modelUnavailable = "This asset is no longer available."
	cloned.searchPlaceholder = "Search assets"
	local var3 = reactModule.useRef(cloned)
	
	for i, v in cloned do
		if var3.current[i] ~= v then
			var3.current = cloned
			break
		end
	end
	return var3.current
end