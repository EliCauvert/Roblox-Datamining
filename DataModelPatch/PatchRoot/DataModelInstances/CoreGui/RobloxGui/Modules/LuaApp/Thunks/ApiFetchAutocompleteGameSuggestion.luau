local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AutocompleteSuggestionModule = require(Modules.LuaApp.Models.AutocompleteSuggestion)
local AutocompleteGameGetSuggestionModule = require(Modules.LuaApp.Http.Requests.AutocompleteGameGetSuggestion)
local AddAutocompleteSuggestionModule = require(Modules.LuaApp.Actions.AddAutocompleteSuggestion)
local ApiFetchGameIconsFunction = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons

local function _(Text): string
	return "luaapp.autocomplete.game.suggestion." .. Text
end

return {
	Fetch = function(p1, Prefix, p2)
		-- upvalues: PerformFetch (copy), AutocompleteGameGetSuggestionModule (copy), AutocompleteSuggestionModule (copy), AddAutocompleteSuggestionModule (copy), ApiFetchGameIconsFunction (copy), PromiseModule (copy), Logging (copy)
		return PerformFetch.Single("luaapp.autocomplete.game.suggestion." .. Prefix, function(p3)
			-- upvalues: AutocompleteGameGetSuggestionModule (upval), p1 (copy), Prefix (copy), p2 (copy), AutocompleteSuggestionModule (upval), AddAutocompleteSuggestionModule (upval), ApiFetchGameIconsFunction (upval), PromiseModule (upval), Logging (upval)
			return AutocompleteGameGetSuggestionModule(p1, Prefix, p2):andThen(function(Result)
				-- upvalues: Prefix (upval), AutocompleteSuggestionModule (upval), p3 (copy), AddAutocompleteSuggestionModule (upval), ApiFetchGameIconsFunction (upval), p1 (upval), PromiseModule (upval), Logging (upval)
				if not Result or not Result.responseBody then
					return PromiseModule.reject()
				end
				local ResponseBody = Result.responseBody
				local FromJsonDataResult = if Prefix == ResponseBody.prefix then AutocompleteSuggestionModule.fromJsonData(ResponseBody) else nil
				
				if FromJsonDataResult then
					FromJsonDataResult:match(function(p4)
						-- upvalues: p3 (upval), AddAutocompleteSuggestionModule (upval), Prefix (upval), AutocompleteSuggestionModule (upval), ApiFetchGameIconsFunction (upval), p1 (upval)
						p3:dispatch(AddAutocompleteSuggestionModule(Prefix, p4))
						local List = {}
						
						for i = 1, #p4.entries do
							local Entry = p4.entries[i]
							
							if Entry.type == AutocompleteSuggestionModule.EntryType.Rich then
								table.insert(List, Entry.universeId)
							end
						end
						if #List > 0 then
							p3:dispatch(ApiFetchGameIconsFunction(p1, List))
						end
					end):matchError(function(p5)
						warn(p5)
					end)
					
					return PromiseModule.resolve(Result)
				else
					Logging.warn("Response from AutocompleteGameGetSuggestion is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
			end)
		end)
	end,
	GetFetchingStatus = function(p3, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p3, "luaapp.autocomplete.game.suggestion." .. Text)
	end
}