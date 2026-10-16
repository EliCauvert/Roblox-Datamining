local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local List = require(Parent.llama).List
local Actions = ExpChatShared.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.PlayerAdded).name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: Dictionary (copy), List (copy)
		local Lowered = string.lower(p2.displayName)
		
		return Dictionary.join(p1, { [Lowered] = List.append(p1[Lowered] or {}, p2.userId) })
	end,
	[require(Actions.PlayerRemoved).name] = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: Dictionary (copy), List (copy)
		return Dictionary.map(p1, function(p3) --[[ Line: 24 ]]
			-- upvalues: List (upval), p2 (copy)
			return List.removeValue(p3, p2.userId)
		end)
	end
})