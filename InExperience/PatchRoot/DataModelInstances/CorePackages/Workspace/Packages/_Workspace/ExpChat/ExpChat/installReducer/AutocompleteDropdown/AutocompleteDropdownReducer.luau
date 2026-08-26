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
	[require(actions.AutocompleteDropdownActivated).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { activated = p2.activated })
	end,
	[require(actions.AutocompleteDropdownResultsChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { selectedIndex = 1, results = p2.results })
	end,
	[require(actions.AutocompleteDropdownSelectionChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, { selectedIndex = p2.selectedIndex })
	end,
	[require(actions.AutocompleteDropdownTypeChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return if p2.autocompleteType == p1.autocompleteType then p1 else dictionary.join(p1, {
			activated = false,
			selectedIndex = 1,
			autocompleteType = p2.autocompleteType,
			results = {}
		})
	end,
	[require(actions.AutocompleteDropdownDeactivated).name] = function(p1, _)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			autocompleteType = "none",
			activated = false,
			selectedIndex = 1,
			results = {}
		})
	end
})