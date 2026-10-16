local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.AddReverseNudgeToxicUser).name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, { [p2.toxicUserId] = p2.reverseNudgeType })
	end,
	[require(Actions.RemoveReverseNudgeToxicUser).name] = function(p1, p2) --[[ Line: 20 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.toxicUserId)
	end
})