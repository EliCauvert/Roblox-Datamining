local parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(parent.Signals)
local getFFlagEdpPlayerFeedbackEnabled = require(parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local _ = require(script.Parent.UserVoteFeedbackMetadataStoreTypes)

return {
	calculateDerivedField = function(p1, p2, _)
		-- upvalues: getFFlagEdpPlayerFeedbackEnabled (ref)
		return if p1 == "isHidden" then getFFlagEdpPlayerFeedbackEnabled() and p2 and p2.canSubmitReview else nil
	end
}