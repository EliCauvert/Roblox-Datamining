local SearchTypes = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppEnums).SearchTypes
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchAutocompleteGameSuggestionModule = require(Modules.LuaApp.Thunks.ApiFetchAutocompleteGameSuggestion)
local ApiFetchAutocompleteAvatarSuggestionModule = require(Modules.LuaApp.Thunks.ApiFetchAutocompleteAvatarSuggestion)

return {
	Fetch = function(p1, p2, p3, Auto)
		-- upvalues: SearchTypes (copy), ApiFetchAutocompleteAvatarSuggestionModule (copy), ApiFetchAutocompleteGameSuggestionModule (copy)
		if Auto == SearchTypes.Catalog then
			return ApiFetchAutocompleteAvatarSuggestionModule.Fetch(p1, p2)
		elseif Auto == SearchTypes.Games or Auto == SearchTypes.Auto or Auto == SearchTypes.TopResults then
			return ApiFetchAutocompleteGameSuggestionModule.Fetch(p1, p2, p3)
		elseif Auto == SearchTypes.Players then
			return ApiFetchAutocompleteGameSuggestionModule.Fetch(p1, p2, p3)
		else
			error(`Unrecognized search type for fetching autocomplete suggestions: {Auto}`)
		end
	end,
	GetFetchingStatus = function(p4, p5, Auto)
		-- upvalues: SearchTypes (copy), ApiFetchAutocompleteAvatarSuggestionModule (copy), ApiFetchAutocompleteGameSuggestionModule (copy)
		if Auto == SearchTypes.Catalog then
			return ApiFetchAutocompleteAvatarSuggestionModule.GetFetchingStatus(p4, p5)
		elseif Auto == SearchTypes.Games or Auto == SearchTypes.Auto or Auto == SearchTypes.TopResults then
			return ApiFetchAutocompleteGameSuggestionModule.GetFetchingStatus(p4, p5)
		elseif Auto == SearchTypes.Players then
			return ApiFetchAutocompleteGameSuggestionModule.GetFetchingStatus(p4, p5)
		else
			error(`Unrecognized search type for fetching status for autocomplete suggestions: {Auto}`)
		end
	end
}