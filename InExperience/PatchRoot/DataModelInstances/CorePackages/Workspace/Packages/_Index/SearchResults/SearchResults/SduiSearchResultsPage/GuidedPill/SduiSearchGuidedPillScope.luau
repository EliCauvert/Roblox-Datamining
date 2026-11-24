local GetSduiClientPageScopeFunction = require(script:FindFirstAncestor("SearchResults").Parent.SduiCoreSystem).getSduiClientPageScope
local Fields = {
	SelectedPill = "selectedPill",
	Suggestions = "suggestions"
}

local function _(p1): boolean
	return typeof(p1) == "string" and p1 ~= ""
end

return {
	Fields = Fields,
	clear = function(p1)
		-- upvalues: GetSduiClientPageScopeFunction (copy), Fields (copy)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
		SduiClientPageScope.set(Fields.SelectedPill, nil)
		SduiClientPageScope.set(Fields.Suggestions, nil)
	end,
	getSelectedOptionForRequest = function(p1)
		-- upvalues: GetSduiClientPageScopeFunction (copy), Fields (copy)
		local GetResult = GetSduiClientPageScopeFunction(p1).get(Fields.SelectedPill)
		local IsNotGetResultMatch: boolean = typeof(GetResult) == "string" and GetResult ~= ""
		
		return if IsNotGetResultMatch then GetResult else nil
	end,
	freezeSuggestions = function(p1, p2)
		-- upvalues: GetSduiClientPageScopeFunction (copy), Fields (copy)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
		
		if #p2 ~= 0 and SduiClientPageScope.get(Fields.Suggestions) == nil then
			SduiClientPageScope.set(Fields.Suggestions, p2)
			
			return
		end
	end,
	getSuggestionsForRequest = function(p1)
		-- upvalues: GetSduiClientPageScopeFunction (copy), Fields (copy)
		return GetSduiClientPageScopeFunction(p1).get(Fields.Suggestions)
	end
}