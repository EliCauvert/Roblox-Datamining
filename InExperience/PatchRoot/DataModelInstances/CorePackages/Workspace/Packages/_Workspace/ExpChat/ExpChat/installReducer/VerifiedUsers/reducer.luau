local Parent = script:FindFirstAncestor("ExpChat").Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = require(Parent.ExpChatShared).Actions

return require(Parent.Rodux).createReducer({}, {
	[Actions.PlayerAdded.name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: Dictionary (copy)
		return if p2.hasVerifiedBadge then Dictionary.join(p1, { [p2.userId] = p2.hasVerifiedBadge }) else p1
	end,
	[Actions.PlayerRemoved.name] = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: Dictionary (copy)
		return if p1[p2.userId] == nil then p1 else Dictionary.removeKey(p1, p2.userId)
	end
})