local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseEventCallbackFunction = require(Parent.ReactUtils).useEventCallback
local FIntMomentsCommentMaxLengthModule = require(Moments.Flags.FIntMomentsCommentMaxLength)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local GetCommentsListCoordinatorModule = require(Moments.Components.Comments.List.getCommentsListCoordinator)
local _ = require(script.Parent.CommentsComposerView)
local NormalizeCommentTextModule = require(script.Parent.normalizeCommentText)
local TruncateToMaxLengthModule = require(script.Parent.truncateToMaxLength)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
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
local config1 = {
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

local function _(p1) --[[ Line: 54 | Named "getSubmissionErrorMessageName" ]]
	-- upvalues: config1 (copy)
	return config1[p1] or "submissionFailed"
end

local _ = function(p1): boolean --[[ Line: 58 | Named "isBlank" ]]
	-- upvalues: NormalizeCommentTextModule (copy)
	return NormalizeCommentTextModule(p1) == ""
end

return function(p1) --[[ Line: 62 | Named "useCommentsComposerViewModel" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), config (copy), GetCommentCollectionStoreModule (copy), SignalsReactModule (copy), GetCommentsListCoordinatorModule (copy), config1 (copy), NormalizeCommentTextModule (copy), FIntMomentsCommentMaxLengthModule (copy), TruncateToMaxLengthModule (copy), UseEventCallbackFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 67 ]]
		-- upvalues: UseStateResult2 (copy), UseBindingResult2 (copy)
		UseStateResult2(p2)
		UseBindingResult2(p2)
	end, { UseBindingResult2 })
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local CommentCollectionStoreModule = GetCommentCollectionStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 74 ]]
		-- upvalues: CommentCollectionStoreModule (copy), p1 (copy)
		return CommentCollectionStoreModule.getState(p1.feedItemId)
	end, { CommentCollectionStoreModule, p1.feedItemId })))
	local CommentsListCoordinatorModule = GetCommentsListCoordinatorModule(false)
	local SubmissionError = UseSignalStateResult.submissionError
	local IsUnixTimestampMillisBelow = DateTime.now().UnixTimestampMillis < SignalsReactModule.useSignalState(CommentsListCoordinatorModule.getPostCooldownUntilMs)
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: SubmissionError (copy), UseResult (copy), UseStateResult2_1 (copy), config1 (upval), CommentCollectionStoreModule (copy), p1 (copy)
		if SubmissionError ~= nil then
			UseResult(SubmissionError.text)
			UseStateResult2_1(config1[SubmissionError.errorCode] or "submissionFailed")
			CommentCollectionStoreModule.clearSubmissionError(p1.feedItemId)
			
			return
		end
	end, {
		CommentCollectionStoreModule,
		p1.feedItemId,
		UseResult,
		if SubmissionError == nil then nil else SubmissionError.errorCode,
		if SubmissionError == nil then nil else SubmissionError.text
	})
	local HasPendingSubmission = UseSignalStateResult.pendingSubmission ~= nil
	local Inverted: boolean = if not HasPendingSubmission then not IsUnixTimestampMillisBelow and not (NormalizeCommentTextModule(UseStateResult) == "") else not IsUnixTimestampMillisBelow and not HasPendingSubmission
	local RateLimited = if IsUnixTimestampMillisBelow and UseStateResult1 == nil then "rateLimited" else UseStateResult1
	
	return {
		text = UseBindingResult,
		isInputDisabled = HasPendingSubmission,
		isSubmitEnabled = Inverted,
		errorMessage = if RateLimited == nil then nil else UseLocalizationResult[RateLimited],
		onTextChanged = ReactModule.useCallback(function(p2) --[[ Line: 106 ]]
			-- upvalues: UseResult (copy), FIntMomentsCommentMaxLengthModule (upval), TruncateToMaxLengthModule (upval), UseStateResult2_1 (copy)
			UseResult(if FIntMomentsCommentMaxLengthModule > 0 then TruncateToMaxLengthModule(p2, FIntMomentsCommentMaxLengthModule) else p2)
			UseStateResult2_1(nil)
		end, { UseResult }),
		onSubmit = UseEventCallbackFunction(function() --[[ Line: 113 ]]
			-- upvalues: Inverted (ref), CommentsListCoordinatorModule (copy), p1 (copy), NormalizeCommentTextModule (upval), UseStateResult (copy), UseResult (copy), UseStateResult2_1 (copy)
			if not Inverted then return end
			if CommentsListCoordinatorModule.submitComment(p1.feedItemId, p1.sessionId, NormalizeCommentTextModule(UseStateResult)) then
				UseResult("")
				UseStateResult2_1(nil)
			end
		end)
	}
end