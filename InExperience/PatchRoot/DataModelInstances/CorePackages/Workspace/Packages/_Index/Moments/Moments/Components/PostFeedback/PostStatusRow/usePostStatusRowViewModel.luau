local Moments = script:FindFirstAncestor("Moments")
local _ = require(script.Parent.PostStatusRowView)
local UsePendingMomentRecordModule = require(Moments.Components.PostFeedback.usePendingMomentRecord)
local UsePostingProgressModule = require(Moments.Components.PostFeedback.usePostingProgress)
local UsePostFeedbackStringsModule = require(Moments.Components.PostFeedback.usePostFeedbackStrings)

return function(Frame: Frame)
	-- upvalues: UsePendingMomentRecordModule (copy), UsePostFeedbackStringsModule (copy), UsePostingProgressModule (copy)
	local UsePendingMomentRecordModuleResult = UsePendingMomentRecordModule(Frame.momentId)
	local Status = if UsePendingMomentRecordModuleResult == nil then nil else UsePendingMomentRecordModuleResult.status or "Posting"
	local UsePostFeedbackStringsModuleResult = UsePostFeedbackStringsModule()
	local UsePostingProgressModuleResult = UsePostingProgressModule(if UsePendingMomentRecordModuleResult == nil then nil else UsePendingMomentRecordModuleResult.startedAtClock)
	
	return if Status == "Moderated" then {
		variant = "moderated",
		title = UsePostFeedbackStringsModuleResult.moderatedTitle,
		body = UsePostFeedbackStringsModuleResult.moderatedBody,
		LayoutOrder = Frame.LayoutOrder
	} elseif Status == "Posting" then {
		variant = "posting",
		title = UsePostFeedbackStringsModuleResult.postingTitle,
		body = UsePostFeedbackStringsModuleResult.postingBody,
		progress = UsePostingProgressModuleResult,
		LayoutOrder = Frame.LayoutOrder
	} else nil
end