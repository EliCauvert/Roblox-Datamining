local chatIntervention = script:FindFirstAncestor("ChatIntervention")
local parent = chatIntervention.Parent
local roduxModule = require(parent.Rodux)
local actions = chatIntervention.Actions
local dictionary = require(parent.llama).Dictionary

return roduxModule.createReducer({
	isShowChatFeedbackModal = false,
	isShowChatFeedbackPill = false,
	isShowChatNudgeModal = false,
	isShowChatTimeoutModal = false
}, {
	[require(actions.UpdateShowChatFeedbackModalAction).name] = function(value, p0) --[[ line: 35 ]]
		-- upvalues: dictionary (ref)
		return dictionary.set(value, "isShowChatFeedbackModal", p0.isShow)
	end,
	[require(actions.UpdateShowChatFeedbackPillAction).name] = function(value, p1) --[[ line: 39 ]]
		-- upvalues: dictionary (ref)
		return dictionary.set(value, "isShowChatFeedbackPill", p1.isShow)
	end,
	[require(actions.UpdateShowChatNudgeModalAction).name] = function(value, p2) --[[ line: 31 ]]
		-- upvalues: dictionary (ref)
		return dictionary.set(value, "isShowChatNudgeModal", p2.isShow)
	end,
	[require(actions.UpdateShowChatTimeoutModalAction).name] = function(value, p3) --[[ line: 27 ]]
		-- upvalues: dictionary (ref)
		return dictionary.set(value, "isShowChatTimeoutModal", p3.isShow)
	end
})