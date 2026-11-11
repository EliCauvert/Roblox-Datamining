local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local AutocompleteSuggestionModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.AutocompleteSuggestion)
local SearchEventUtil = {
	getSuggestionNameTypeStrings = function(p1)
		-- upvalues: ArgCheckModule (copy), AutocompleteSuggestionModule (copy)
		ArgCheckModule.isType(p1.type, "number", "entry.type")
		
		if p1.type == AutocompleteSuggestionModule.EntryType.Keyword then
			ArgCheckModule.isType(p1.searchQuery, "string", "entry.searchQuery")
			
			return { type = "kwd", name = p1.searchQuery }
		elseif p1.type == AutocompleteSuggestionModule.EntryType.Rich then
			ArgCheckModule.isType(p1.canonicalTitle, "string", "entry.canonicalTitle")
			
			return { type = "rich", name = p1.canonicalTitle }
		else
			return { name = "unknown", type = "unknown" }
		end
	end
}

function SearchEventUtil.convertSuggestionsToString(p1): string
	-- upvalues: ArgCheckModule (copy), SearchEventUtil (copy)
	ArgCheckModule.isType(p1, "table", "suggestions")
	
	if not p1 then
		return ""
	end
	local List = {}
	
	for i = 1, #p1 do
		local SuggestionNameTypeStrings = SearchEventUtil.getSuggestionNameTypeStrings(p1[i])
		table.insert(List, SuggestionNameTypeStrings.name .. "|" .. SuggestionNameTypeStrings.type)
	end
	return table.concat(List, ",")
end

return SearchEventUtil