local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({ preferredTransparency = 1 }, {
	[require(Actions.ClientSettingsLoaded).name] = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, p2.value)
	end,
	[require(Actions.ClientSettingsChanged).name] = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [p2.property] = p2.value })
	end
})