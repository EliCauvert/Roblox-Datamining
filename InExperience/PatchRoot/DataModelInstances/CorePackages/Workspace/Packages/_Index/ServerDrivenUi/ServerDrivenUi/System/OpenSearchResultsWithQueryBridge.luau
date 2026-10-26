local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FFlagLuaAppSduiSearchAutocomplete = require(Parent.SharedFlags).FFlagLuaAppSduiSearchAutocomplete
local NewResult = require(Parent.AppCommonLib).Signal.new()
local List = {}

local function connectAutocompleteHost(ConfirmSearch, SuggestionClicked)
	-- upvalues: List (copy)
	local config = {
		confirmSearch = ConfirmSearch,
		suggestionClicked = SuggestionClicked
	}
	table.insert(List, config)
	
	return {
		disconnect = function(_)
			-- upvalues: List (upval), config (copy)
			local FoundIndex: number? = table.find(List, config)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	}
end

local function runSuggestionClicked(p1, p2, p3, p4)
	-- upvalues: List (copy)
	for i = #List, 1, -1 do
		local SuggestionClickedFunction = List[i].suggestionClicked
		
		if SuggestionClickedFunction and SuggestionClickedFunction(p1, p2, p3, p4) then break end
	end
end

return {
	run = function(p5, p6, Enabled, p7)
		-- upvalues: FFlagLuaAppSduiSearchAutocomplete (copy), List (copy), NewResult (copy)
		if not FFlagLuaAppSduiSearchAutocomplete then
			NewResult:fire(p5, p6)
			
			return
		end
		if Enabled and p7 then
			for i = #List, 1, -1 do
				if List[i].confirmSearch(p5, p6, p7) then return end
			end
		end
		NewResult:fire(p5, p6, Enabled == true, p7)
	end,
	connect = function(p8)
		-- upvalues: NewResult (copy)
		return NewResult:connect(p8)
	end,
	connectAutocompleteHost = if FFlagLuaAppSduiSearchAutocomplete then connectAutocompleteHost else nil,
	runSuggestionClicked = if FFlagLuaAppSduiSearchAutocomplete then runSuggestionClicked else nil
}