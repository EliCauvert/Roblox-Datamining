local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local AutocompleteSuggestionTableModule = require(Modules.LuaApp.Models.AutocompleteSuggestionTable)
local AutocompleteGetLocalCacheModule = require(Modules.LuaApp.Http.Requests.AutocompleteGetLocalCache)
local AddAutocompleteSuggestionTableModule = require(Modules.LuaApp.Actions.AddAutocompleteSuggestionTable)
local PromiseModule = require(Modules.LuaApp.Promise)

local function _(Text, p1): string
	return "luaapp.autocomplete.getlocalcache." .. Text .. "." .. (p1 or "none")
end

local ApiFetchAutocompleteLocalCache = {}

function ApiFetchAutocompleteLocalCache.Fetch(p1, NewPageNumber, p2, p3)
	-- upvalues: PerformFetch (copy), AutocompleteGetLocalCacheModule (copy), AutocompleteSuggestionTableModule (copy), AddAutocompleteSuggestionTableModule (copy), ApiFetchAutocompleteLocalCache (copy), PromiseModule (copy)
	return PerformFetch.Single("luaapp.autocomplete.getlocalcache." .. NewPageNumber .. "." .. (p2 or "none"), function(p4)
		-- upvalues: AutocompleteGetLocalCacheModule (upval), p1 (copy), NewPageNumber (copy), p2 (copy), p3 (copy), AutocompleteSuggestionTableModule (upval), AddAutocompleteSuggestionTableModule (upval), ApiFetchAutocompleteLocalCache (upval), PromiseModule (upval)
		return AutocompleteGetLocalCacheModule(p1, NewPageNumber, p2, p3):andThen(function(Result)
			-- upvalues: AutocompleteSuggestionTableModule (upval), p4 (copy), AddAutocompleteSuggestionTableModule (upval), ApiFetchAutocompleteLocalCache (upval), p1 (upval), p2 (upval), p3 (upval), PromiseModule (upval)
			if not Result or not Result.responseBody then
				return PromiseModule.reject()
			end
			local ResponseBody = Result.responseBody
			AutocompleteSuggestionTableModule.fromJsonData(ResponseBody):match(function(p5)
				-- upvalues: p4 (upval), AddAutocompleteSuggestionTableModule (upval)
				p4:dispatch(AddAutocompleteSuggestionTableModule(p5))
			end):matchError(function(p5)
				warn(p5)
			end)
			
			if ResponseBody.hasNextPage and ResponseBody.pageNumber then
				p4:dispatch(ApiFetchAutocompleteLocalCache.Fetch(p1, ResponseBody.pageNumber + 1, p2, p3))
			end
			return PromiseModule.resolve()
		end, function(p5)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(p5)
		end)
	end)
end

return ApiFetchAutocompleteLocalCache