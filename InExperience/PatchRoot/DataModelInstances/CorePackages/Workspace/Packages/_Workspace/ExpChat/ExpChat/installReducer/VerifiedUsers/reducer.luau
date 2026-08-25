local parent = script:FindFirstAncestor("ExpChat").Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = require(parent.ExpChatShared).Actions

return roduxModule.createReducer({}, {
	[actions.PlayerAdded.name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return if p1.hasVerifiedBadge then dictionary.join(p0, { [p1.userId] = p1.hasVerifiedBadge }) else p0
	end,
	[actions.PlayerRemoved.name] = function(p2, p3)
		-- upvalues: dictionary (ref)
		return if p2[p3.userId] == nil then p2 else dictionary.removeKey(p2, p3.userId)
	end
})