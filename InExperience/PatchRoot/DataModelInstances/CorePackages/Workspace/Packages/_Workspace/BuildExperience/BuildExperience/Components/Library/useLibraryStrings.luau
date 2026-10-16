local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.LibraryTypes)
local config = {
	title = LocalizationStringsModule.LIBRARY_TITLE,
	empty = LocalizationStringsModule.LIBRARY_EMPTY,
	image = LocalizationStringsModule.LIBRARY_IMAGES_2D,
	sound = LocalizationStringsModule.LIBRARY_SOUNDS,
	modelUnavailable = LocalizationStringsModule.LIBRARY_MODEL_UNAVAILABLE,
	searchPlaceholder = LocalizationStringsModule.LIBRARY_SEARCH_PLACEHOLDER
}
local config1 = {
	model = {
		LocalizationStringsModule.LIBRARY_OBJECTS_3D,
		"3D Objects"
	},
	object = { LocalizationStringsModule.LIBRARY_OBJECT, "Object" },
	world = { LocalizationStringsModule.LIBRARY_WORLD, "World" },
	searchEmpty = {
		LocalizationStringsModule.LIBRARY_SEARCH_EMPTY,
		"No search results found"
	}
}

return function() --[[ Line: 27 | Named "useLibraryStrings" ]]
	-- upvalues: LocalizationModule (copy), config (copy), ReactModule (copy), config1 (copy)
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local Copy = table.clone((LocalizationModule.Hooks.useLocalization(config)))
	
	for i, value in config1 do
		local v1 = value[1]
		local v2 = value[2]
		local Success, Result = pcall(function() --[[ Line: 33 ]]
			-- upvalues: UseContextResult (copy), v1 (copy)
			assert(UseContextResult ~= nil, "Library localization context is unavailable")
			
			return UseContextResult:Format(v1)
		end)
		Copy[i] = if Success and type(Result) == "string" and Result ~= "" and Result ~= v1 then Result else v2
	end
	local UseRefResult = ReactModule.useRef(Copy)
	
	for i1, value1 in Copy do
		if UseRefResult.current[i1] ~= value1 then
			UseRefResult.current = Copy
			break
		end
	end
	return UseRefResult.current
end