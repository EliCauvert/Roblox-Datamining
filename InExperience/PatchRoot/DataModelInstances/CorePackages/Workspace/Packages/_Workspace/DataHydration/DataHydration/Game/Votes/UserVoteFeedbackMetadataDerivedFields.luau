local Parent = script:FindFirstAncestor("DataHydration").Parent
local _ = require(Parent.Signals)
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local _ = require(script.Parent.UserVoteFeedbackMetadataStoreTypes)

return {
	calculateDerivedField = function(p1, p2, _) --[[ Line: 13 ]]
		-- upvalues: GetFFlagEdpPlayerFeedbackEnabledFunction (copy)
		return if p1 == "isHidden" then not GetFFlagEdpPlayerFeedbackEnabledFunction() or not p2 or not p2.canSubmitReview else nil
	end
}