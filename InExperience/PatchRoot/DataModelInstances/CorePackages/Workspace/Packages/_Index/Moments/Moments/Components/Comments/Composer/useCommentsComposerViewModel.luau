local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useEventCallback = require(parent.ReactUtils).useEventCallback
local fIntMomentsCommentMaxLengthModule = require(moments.Flags.FIntMomentsCommentMaxLength)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentsListCoordinatorModule = require(moments.Components.Comments.List.getCommentsListCoordinator)
local _ = require(script.Parent.CommentsComposerView)
local normalizeCommentTextModule = require(script.Parent.normalizeCommentText)
local truncateToMaxLengthModule = require(script.Parent.truncateToMaxLength)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	textFilterRejected = "Feature.Moments.Label.CommentRejectedByFilter",
	rateLimited = "Feature.Moments.Label.CommentRateLimited",
	submissionFailed = "Feature.Moments.Label.CommentPostFailed",
	outcomeUnknown = "Feature.Moments.Label.CommentPostOutcomeUnknown",
	commentsDisabled = "Feature.Moments.Label.CommentsTurnedOff",
	writeNotAllowed = "Feature.Moments.Label.CommentNotAllowed",
	momentUnavailable = "Feature.Moments.Label.MomentNoLongerAvailable",
	signInRequired = "Feature.Moments.Label.CommentSignInRequired",
	commentsOff = "Feature.Moments.Label.CommentingUnavailable"
}
local t_1 = {
	TextFilterRejected = "textFilterRejected",
	RateLimited = "rateLimited",
	CommentsDisabledByCreator = "commentsDisabled",
	ViewerNotEligibleToWrite = "writeNotAllowed",
	ViewerNotEligibleToRead = "momentUnavailable",
	MomentUnavailable = "momentUnavailable",
	AuthenticationRequired = "signInRequired",
	CommentsEndpointDisabled = "commentsOff",
	CommentsEndpointNotImplemented = "commentsOff",
	SubmissionOutcomeUnknown = "outcomeUnknown"
}

local function _(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1] or "submissionFailed"
end

local _ = function(p1)
	-- upvalues: normalizeCommentTextModule (ref)
	return normalizeCommentTextModule(p1) == ""
end

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), t (ref), getCommentCollectionStoreModule (ref), signalsReactModule (ref), getCommentsListCoordinatorModule (ref), t_1 (ref), normalizeCommentTextModule (ref), fIntMomentsCommentMaxLengthModule (ref), truncateToMaxLengthModule (ref), useEventCallback (ref)
	local var1, var2 = reactModule.useState("")
	local var3, var4 = reactModule.useBinding("")
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (ref)
		var2(p2)
		var4(p2)
	end, { var4 })
	local var6 = useLocalization(t)
	local var7, var8 = reactModule.useState(nil)
	local var9 = getCommentCollectionStoreModule(false)
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var9 (ref), p1 (ref)
		return var9.getState(p1.feedItemId)
	end, { var9, p1.feedItemId }))
	local var11 = getCommentsListCoordinatorModule(false)
	local submissionError = var10.submissionError
	local var12 = DateTime.now().UnixTimestampMillis < signalsReactModule.useSignalState(var11.getPostCooldownUntilMs)
	reactModule.useEffect(function()
		-- upvalues: submissionError (ref), var5 (ref), var8 (ref), t_1 (copy), var9 (ref), p1 (ref)
		if submissionError == nil then
			return
		end
		var5(submissionError.text)
		var8(t_1[submissionError.errorCode] or "submissionFailed")
		var9.clearSubmissionError(p1.feedItemId)
	end, {
		var9,
		p1.feedItemId,
		var5,
		if submissionError ~= nil then nil else submissionError.errorCode,
		if submissionError ~= nil then nil else submissionError.text
	})
	local var13 = var10.pendingSubmission ~= nil
	local var14 = if var12 then false else not var13 and not (normalizeCommentTextModule(var1) == "")
	local var15 = if var12 and var7 == nil then "rateLimited" else var7
	
	return {
		text = var3,
		isInputDisabled = var13,
		isSubmitEnabled = var14,
		errorMessage = if var15 ~= nil then nil else var6[var15],
		onTextChanged = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), fIntMomentsCommentMaxLengthModule (copy), truncateToMaxLengthModule (copy), var8 (ref)
			var5(if fIntMomentsCommentMaxLengthModule > 0 then truncateToMaxLengthModule(p2, fIntMomentsCommentMaxLengthModule) else p2)
			var8(nil)
		end, { var5 }),
		onSubmit = useEventCallback(function()
			-- upvalues: var14 (write), var11 (ref), p1 (ref), normalizeCommentTextModule (copy), var1 (ref), var5 (ref), var8 (ref)
			if not var14 then return end
			if var11.submitComment(p1.feedItemId, p1.sessionId, normalizeCommentTextModule(var1)) then
				var5("")
				var8(nil)
			end
		end)
	}
end