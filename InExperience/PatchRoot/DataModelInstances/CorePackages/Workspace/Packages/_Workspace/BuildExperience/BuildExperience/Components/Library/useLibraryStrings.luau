local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.LibraryTypes)
local t = {
	title = localizationStringsModule.LIBRARY_TITLE,
	empty = localizationStringsModule.LIBRARY_EMPTY,
	image = localizationStringsModule.LIBRARY_IMAGES_2D,
	sound = localizationStringsModule.LIBRARY_SOUNDS,
	modelUnavailable = localizationStringsModule.LIBRARY_MODEL_UNAVAILABLE,
	searchPlaceholder = localizationStringsModule.LIBRARY_SEARCH_PLACEHOLDER
}
local t_1 = {
	model = {
		localizationStringsModule.LIBRARY_OBJECTS_3D,
		"3D Objects"
	},
	object = { localizationStringsModule.LIBRARY_OBJECT, "Object" },
	world = { localizationStringsModule.LIBRARY_WORLD, "World" },
	searchEmpty = {
		localizationStringsModule.LIBRARY_SEARCH_EMPTY,
		"No search results found"
	}
}

return function()
	-- upvalues: localizationModule (ref), t (ref), reactModule (ref), t_1 (ref)
	local var1 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local cloned = table.clone(localizationModule.Hooks.useLocalization(t))
	
	for i, v in t_1 do
		local var2 = v[1]
		local var3 = v[2]
		local ok, status = pcall(function()
			-- upvalues: var1 (ref), var2 (ref)
			assert(var1 ~= nil, "Library localization context is unavailable")
			
			return var1:Format(var2)
		end)
		cloned[i] = if ok and type(status) == "string" and (status ~= "" and status ~= var2) then status else var3
	end
	local var4 = reactModule.useRef(cloned)
	
	for i_1, v_1 in cloned do
		if var4.current[i_1] ~= v_1 then
			var4.current = cloned
			break
		end
	end
	return var4.current
end