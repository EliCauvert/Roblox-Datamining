local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AutocompleteSuggestionModule = require(Modules.LuaApp.Models.AutocompleteSuggestion)
local AutocompleteAvatarSuggestModule = require(Modules.LuaApp.Http.Requests.AutocompleteAvatarSuggest)
local AddAvatarAutocompleteSuggestionModule = require(Modules.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion)

local function _(Text): string
	return "luaapp.autocomplete.avatar.suggestion." .. Text
end

return {
	Fetch = function(p1, Prefix)
		-- upvalues: PerformFetch (copy), AutocompleteAvatarSuggestModule (copy), AutocompleteSuggestionModule (copy), AddAvatarAutocompleteSuggestionModule (copy), PromiseModule (copy), Logging (copy)
		return PerformFetch.Single("luaapp.autocomplete.avatar.suggestion." .. Prefix, function(p2)
			-- upvalues: AutocompleteAvatarSuggestModule (upval), p1 (copy), Prefix (copy), AutocompleteSuggestionModule (upval), AddAvatarAutocompleteSuggestionModule (upval), PromiseModule (upval), Logging (upval)
			return AutocompleteAvatarSuggestModule(p1, Prefix):andThen(function(Result)
				-- upvalues: Prefix (upval), AutocompleteSuggestionModule (upval), p2 (copy), AddAvatarAutocompleteSuggestionModule (upval), PromiseModule (upval), Logging (upval)
				if not Result or not Result.responseBody then
					return PromiseModule.reject()
				end
				local ResponseBody = Result.responseBody
				local FromJsonDataAvatarResult = if ResponseBody.Args ~= nil and Prefix == ResponseBody.Args.Prefix then AutocompleteSuggestionModule.fromJsonDataAvatar(ResponseBody) else nil
				
				if FromJsonDataAvatarResult then
					FromJsonDataAvatarResult:match(function(p3)
						-- upvalues: p2 (upval), AddAvatarAutocompleteSuggestionModule (upval), Prefix (upval)
						p2:dispatch(AddAvatarAutocompleteSuggestionModule(Prefix, p3))
					end):matchError(function(p3)
						warn(p3)
					end)
					
					return PromiseModule.resolve(Result)
				else
					Logging.warn("Response from AutocompleteAvatarSuggest is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.autocomplete.avatar.suggestion." .. Text)
	end
}