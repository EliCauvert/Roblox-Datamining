local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions

return roduxModule.createReducer({
	activated = false,
	selectedIndex = 1,
	autocompleteType = "none",
	results = {}
}, {
	[require(actions.AutocompleteDropdownActivated).name] = function(p0, p1) --[[ line: 28 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, { activated = p1.activated })
	end,
	[require(actions.AutocompleteDropdownResultsChanged).name] = function(p2, p3) --[[ line: 31 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p2, { selectedIndex = 1, results = p3.results })
	end,
	[require(actions.AutocompleteDropdownSelectionChanged).name] = function(p4, p5) --[[ line: 40 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p4, { selectedIndex = p5.selectedIndex })
	end,
	[require(actions.AutocompleteDropdownTypeChanged).name] = function(p6, p7) --[[ line: 46 ]]
		-- upvalues: dictionary (ref)
		return if p7.autocompleteType == p6.autocompleteType then p6 else dictionary.join(p6, {
			activated = false,
			selectedIndex = 1,
			autocompleteType = p7.autocompleteType,
			results = {}
		})
	end,
	[require(actions.AutocompleteDropdownDeactivated).name] = function(p8, _) --[[ line: 57 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p8, {
			autocompleteType = "none",
			activated = false,
			selectedIndex = 1,
			results = {}
		})
	end
})