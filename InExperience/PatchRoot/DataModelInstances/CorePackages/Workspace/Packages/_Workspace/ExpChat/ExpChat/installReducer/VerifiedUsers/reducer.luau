local parent = script:FindFirstAncestor("ExpChat").Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = require(parent.ExpChatShared).Actions

return roduxModule.createReducer({}, {
	[actions.PlayerAdded.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return if p2.hasVerifiedBadge then dictionary.join(p1, { [p2.userId] = p2.hasVerifiedBadge }) else p1
	end,
	[actions.PlayerRemoved.name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return if p1[p2.userId] == nil then p1 else dictionary.removeKey(p1, p2.userId)
	end
})