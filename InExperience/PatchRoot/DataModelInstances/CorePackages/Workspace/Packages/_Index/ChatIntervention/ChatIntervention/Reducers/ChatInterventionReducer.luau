local ChatIntervention = script:FindFirstAncestor("ChatIntervention")
local Parent = ChatIntervention.Parent
local Actions = ChatIntervention.Actions
local Dictionary = require(Parent.llama).Dictionary

return require(Parent.Rodux).createReducer({
	isShowChatFeedbackModal = false,
	isShowChatFeedbackPill = false,
	isShowChatNudgeModal = false,
	isShowChatTimeoutModal = false
}, {
	[require(Actions.UpdateShowChatFeedbackModalAction).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.set(p1, "isShowChatFeedbackModal", p2.isShow)
	end,
	[require(Actions.UpdateShowChatFeedbackPillAction).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.set(p1, "isShowChatFeedbackPill", p2.isShow)
	end,
	[require(Actions.UpdateShowChatNudgeModalAction).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.set(p1, "isShowChatNudgeModal", p2.isShow)
	end,
	[require(Actions.UpdateShowChatTimeoutModalAction).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.set(p1, "isShowChatTimeoutModal", p2.isShow)
	end
})