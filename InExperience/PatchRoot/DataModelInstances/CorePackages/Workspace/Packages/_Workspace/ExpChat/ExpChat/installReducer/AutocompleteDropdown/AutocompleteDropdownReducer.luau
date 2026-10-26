local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({
	activated = false,
	query = "",
	selectedIndex = 1,
	autocompleteType = "none",
	results = {}
}, {
	[require(Actions.AutocompleteDropdownActivated).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { activated = p2.activated })
	end,
	[require(Actions.AutocompleteDropdownResultsChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			selectedIndex = 1,
			results = p2.results,
			query = p2.query or ""
		})
	end,
	[require(Actions.AutocompleteDropdownSelectionChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { selectedIndex = p2.selectedIndex })
	end,
	[require(Actions.AutocompleteDropdownTypeChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return if p2.autocompleteType == p1.autocompleteType then p1 else Dictionary.join(p1, {
			activated = false,
			query = "",
			selectedIndex = 1,
			autocompleteType = p2.autocompleteType,
			results = {}
		})
	end,
	[require(Actions.AutocompleteDropdownDeactivated).name] = function(p1, _)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			autocompleteType = "none",
			activated = false,
			query = "",
			selectedIndex = 1,
			results = {}
		})
	end
})