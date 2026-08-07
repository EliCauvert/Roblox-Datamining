local parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(parent.Signals)
local getFFlagEdpPlayerFeedbackEnabled = require(parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local _ = require(script.Parent.UserVoteFeedbackMetadataStoreTypes)

return {
	calculateDerivedField = function(p0, p1, _) --[[ line: 13 ]]
		-- upvalues: getFFlagEdpPlayerFeedbackEnabled (ref)
		return if p0 == "isHidden" then getFFlagEdpPlayerFeedbackEnabled() and p1 and p1.canSubmitReview else nil
	end
}