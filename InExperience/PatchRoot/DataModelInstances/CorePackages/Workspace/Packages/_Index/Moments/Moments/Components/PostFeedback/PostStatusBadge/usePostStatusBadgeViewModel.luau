local Moments = script:FindFirstAncestor("Moments")
local _ = require(script.Parent.PostStatusBadgeView)
local UsePendingMomentRecordModule = require(Moments.Components.PostFeedback.usePendingMomentRecord)
local UsePostFeedbackStringsModule = require(Moments.Components.PostFeedback.usePostFeedbackStrings)

return function(p1)
	-- upvalues: UsePendingMomentRecordModule (copy), UsePostFeedbackStringsModule (copy)
	local UsePendingMomentRecordModuleResult = UsePendingMomentRecordModule(p1.momentId)
	local Status = if UsePendingMomentRecordModuleResult == nil then nil else UsePendingMomentRecordModuleResult.status or "Posting"
	local UsePostFeedbackStringsModuleResult = UsePostFeedbackStringsModule()
	
	return if Status == "Moderated" then {
		label = UsePostFeedbackStringsModuleResult.moderatedBadge,
		ZIndex = p1.ZIndex
	} elseif Status == "Posting" then {
		label = UsePostFeedbackStringsModuleResult.postingBadge,
		ZIndex = p1.ZIndex
	} else nil
end