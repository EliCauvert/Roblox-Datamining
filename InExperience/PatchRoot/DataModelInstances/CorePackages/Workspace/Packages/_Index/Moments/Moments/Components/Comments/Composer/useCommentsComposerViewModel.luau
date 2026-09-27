local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useEventCallback = require(parent.ReactUtils).useEventCallback
local fIntMomentsCommentMaxLengthModule = require(moments.Flags.FIntMomentsCommentMaxLength)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsListCoordinatorModule = require(moments.Components.Comments.List.getCommentsListCoordinator)
local _ = require(script.Parent.CommentsComposerView)
local normalizeCommentTextModule = require(script.Parent.normalizeCommentText)
local truncateToMaxLengthModule = require(script.Parent.truncateToMaxLength)
local t = {
	TextFilterRejected = "Your comment was not posted. Please revise it and try again.",
	RateLimited = "You are commenting too quickly. Please try again later.",
	InvalidRequest = "Your comment couldn't be posted. Please try again.",
	CommentsDisabledByCreator = "Comments are turned off for this Moment.",
	ViewerNotEligibleToWrite = "You can't comment on this Moment.",
	ViewerNotEligibleToRead = "This Moment is no longer available.",
	MomentUnavailable = "This Moment is no longer available.",
	AuthenticationRequired = "Please sign in again to comment.",
	CommentsEndpointDisabled = "Commenting isn't available right now. Please try again later.",
	CommentsEndpointNotImplemented = "Commenting isn't available right now. Please try again later.",
	SubmissionOutcomeUnknown = "We couldn't confirm your last comment posted. Check the comments before sending again."
}

local function _(p1)
	-- upvalues: t (ref)
	return t[p1] or "Your comment could not be posted. Please try again."
end

local _ = function(p1)
	-- upvalues: normalizeCommentTextModule (ref)
	return normalizeCommentTextModule(p1) == ""
end

return function(p1)
	-- upvalues: reactModule (ref), getCommentCollectionStoreModule (ref), signalsReactModule (ref), getCommentsListCoordinatorModule (ref), t (ref), normalizeCommentTextModule (ref), fIntMomentsCommentMaxLengthModule (ref), truncateToMaxLengthModule (ref), useEventCallback (ref)
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useBinding("")
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (ref)
		var2(p2)
		var4(p2)
	end, { var4 })
	local var6, var7 = reactModule.useState(nil)
	local var8 = getCommentCollectionStoreModule(false)
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var8 (ref), p1 (ref)
		return var8.getState(p1.feedItemId)
	end, { var8, p1.feedItemId }))
	local var10 = getCommentsListCoordinatorModule(false)
	local submissionError = var9.submissionError
	local var11 = DateTime.now().UnixTimestampMillis < signalsReactModule.useSignalState(var10.getPostCooldownUntilMs)
	reactModule.useEffect(function()
		-- upvalues: submissionError (ref), var5 (ref), var7 (ref), t (copy), var8 (ref), p1 (ref)
		if submissionError == nil then
			return
		end
		var5(submissionError.text)
		var7(t[submissionError.errorCode] or "Your comment could not be posted. Please try again.")
		var8.clearSubmissionError(p1.feedItemId)
	end, {
		var8,
		p1.feedItemId,
		var5,
		if submissionError ~= nil then nil else submissionError.errorCode,
		if submissionError ~= nil then nil else submissionError.text
	})
	local var12 = var9.pendingSubmission ~= nil
	local var13 = if var11 then false else not var12 and not (normalizeCommentTextModule(var1) == "")
	
	return {
		text = var3,
		isInputDisabled = var12,
		isSubmitEnabled = var13,
		errorMessage = if var11 and var6 == nil then "You are commenting too quickly. Please try again later." else var6,
		onTextChanged = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), fIntMomentsCommentMaxLengthModule (copy), truncateToMaxLengthModule (copy), var7 (ref)
			var5(if fIntMomentsCommentMaxLengthModule > 0 then truncateToMaxLengthModule(p2, fIntMomentsCommentMaxLengthModule) else p2)
			var7(nil)
		end, { var5 }),
		onSubmit = useEventCallback(function()
			-- upvalues: var13 (write), var10 (ref), p1 (ref), normalizeCommentTextModule (copy), var1 (ref), var5 (ref), var7 (ref)
			if not var13 then return end
			if var10.submitComment(p1.feedItemId, p1.sessionId, normalizeCommentTextModule(var1)) then
				var5("")
				var7(nil)
			end
		end)
	}
end