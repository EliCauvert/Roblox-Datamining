local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagInlineSurveyEnhancements = SharedFlagsModule.FFlagInlineSurveyEnhancements
local FFlagInlineSurveyBranching = SharedFlagsModule.FFlagInlineSurveyBranching
local FFlagInlineSurveyPartialResponse = SharedFlagsModule.FFlagInlineSurveyPartialResponse
local InlineSurveyHelpersModule = require(OnPlatformSurveys.Utils.inlineSurveyHelpers)
local InlineSurveyApiModule = require(OnPlatformSurveys.Api.inlineSurveyApi)
local PhaseModule = require(OnPlatformSurveys.Enums.Phase)
local InlineSurveyReducerModule = require(OnPlatformSurveys.Hooks.inlineSurveyReducer)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)

local function _() --[[ Line: 46 | Named "releaseKeyboardFocus" ]]
	-- upvalues: UserInputService (copy)
	local FocusedTextBox = UserInputService:GetFocusedTextBox()
	
	if FocusedTextBox ~= nil then
		FocusedTextBox:ReleaseFocus()
	end
end

return function(p1) --[[ Line: 53 | Named "useInlineSurveyFlow" ]]
	-- upvalues: ReactModule (copy), InlineSurveyReducerModule (copy), InlineSurveyApiModule (copy), InlineSurveyHelpersModule (copy), FFlagInlineSurveyBranching (copy), HttpService (copy), FFlagInlineSurveyEnhancements (copy), UserInputService (copy), PhaseModule (copy), FFlagInlineSurveyPartialResponse (copy)
	local NetworkImpl = p1.networkImpl
	local EventType = p1.eventType
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(InlineSurveyReducerModule.reducer, p1.hasInvite == true, InlineSurveyReducerModule.getInitialState)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(UseReducerResult)
	UseRefResult2.current = UseReducerResult
	local UseRefResult3 = ReactModule.useRef(p1.onClose)
	UseRefResult3.current = p1.onClose
	local UseRefResult4 = ReactModule.useRef(p1.onComplete)
	UseRefResult4.current = p1.onComplete
	local UseRefResult5 = ReactModule.useRef(p1.onEligible)
	UseRefResult5.current = p1.onEligible
	local UseRefResult6 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 75 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult6 (copy), UseReducerResult2 (copy), InlineSurveyApiModule (upval), NetworkImpl (copy), EventType (copy)
		local NewCurrent = UseRefResult.current + 1
		UseRefResult.current = NewCurrent
		UseRefResult1.current = false
		UseRefResult6.current = false
		UseReducerResult2({ type = "fetchRequested" })
		InlineSurveyApiModule.fetchInlineSurvey(NetworkImpl, EventType):andThen(function(Result) --[[ Line: 82 ]]
			-- upvalues: UseRefResult (upval), NewCurrent (copy), UseReducerResult2 (upval)
			if UseRefResult.current == NewCurrent then
				UseReducerResult2({ type = "questionsReceived", response = Result })
				
				return
			end
		end):catch(function(Err) --[[ Line: 88 ]]
			-- upvalues: UseRefResult (upval), NewCurrent (copy), UseReducerResult2 (upval)
			if UseRefResult.current == NewCurrent then
				warn("Inline survey fetch failed:", Err)
				UseReducerResult2({ type = "fetchFailed" })
				
				return
			end
		end)
	end, { NetworkImpl, EventType })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 97 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), InlineSurveyHelpersModule (upval), FFlagInlineSurveyBranching (upval), HttpService (upval), UseReducerResult2 (copy), UseRefResult (copy), InlineSurveyApiModule (upval), NetworkImpl (copy)
		local Current = UseRefResult2.current
		
		if UseRefResult1.current then return end
		local Question = Current.questions[Current.index]
		local SurveyId = Current.surveyId
		
		if Question == nil or SurveyId == nil then return end
		local MergeCurrentAnswerIntoBatchResult = InlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(Current.answersByQuestionId, Question, Current.answer)
		local VisitedQuestions = if FFlagInlineSurveyBranching then InlineSurveyHelpersModule.getVisitedQuestions(Current.questions, MergeCurrentAnswerIntoBatchResult) else Current.questions
		
		if not InlineSurveyHelpersModule.canSubmitAll(VisitedQuestions, MergeCurrentAnswerIntoBatchResult) then return end
		local IdempotencyKey = Current.idempotencyKey or HttpService:GenerateGUID(false)
		local SubmitPayload = InlineSurveyHelpersModule.buildSubmitPayload(SurveyId, VisitedQuestions, MergeCurrentAnswerIntoBatchResult, IdempotencyKey)
		
		if #SubmitPayload.answers == 0 then
			UseReducerResult2({ type = "submitSucceeded" })
			
			return
		else
			local NewCurrent = UseRefResult.current + 1
			UseRefResult.current = NewCurrent
			UseRefResult1.current = true
			UseReducerResult2({ type = "submitStarted", idempotencyKey = IdempotencyKey })
			InlineSurveyApiModule.submitSurveyResponse(NetworkImpl, SubmitPayload):andThen(function(_) --[[ Line: 131 ]]
				-- upvalues: UseRefResult (upval), NewCurrent (copy), UseRefResult1 (upval), UseReducerResult2 (upval)
				if UseRefResult.current == NewCurrent then
					UseRefResult1.current = false
					UseReducerResult2({ type = "submitSucceeded" })
					
					return
				end
			end):catch(function(Err) --[[ Line: 138 ]]
				-- upvalues: UseRefResult (upval), NewCurrent (copy), UseRefResult1 (upval), UseReducerResult2 (upval)
				if UseRefResult.current == NewCurrent then
					UseRefResult1.current = false
					warn("Inline survey submit failed:", Err)
					UseReducerResult2({ type = "submitFailed" })
					
					return
				end
			end)
		end
	end, { NetworkImpl })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 149 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), FFlagInlineSurveyEnhancements (upval), UseResult1 (copy), InlineSurveyHelpersModule (upval), UserInputService (upval), UseReducerResult2 (copy)
		local Current = UseRefResult2.current
		
		if Current.questions[Current.index] == nil or UseRefResult1.current then return end
		if not FFlagInlineSurveyEnhancements then
			UseResult1()
			
			return
		end
		if not InlineSurveyHelpersModule.canAdvance(Current.questions, Current.index, Current.answersByQuestionId, Current.answer) then return end
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox ~= nil then
			FocusedTextBox:ReleaseFocus()
		end
		if InlineSurveyHelpersModule.isLastQuestion(Current.questions, Current.index, Current.answer) then
			UseResult1()
			
			return
		else
			UseReducerResult2({ type = "next" })
		end
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 174 ]]
		-- upvalues: UseRefResult2 (copy), UseResult1 (copy), UseResult (copy)
		if UseRefResult2.current.errorType == "submit" then
			UseResult1()
			
			return
		else
			UseResult()
		end
	end, { UseResult1, UseResult })
	local UseResult4 = ReactModule.useCallback(function(Answer) --[[ Line: 182 ]]
		-- upvalues: UseReducerResult2 (copy)
		UseReducerResult2({ type = "setAnswer", answer = Answer })
	end, {})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 187 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), PhaseModule (upval), HttpService (upval), InlineSurveyHelpersModule (upval), InlineSurveyApiModule (upval), NetworkImpl (copy)
		if UseRefResult1.current then return end
		local Current = UseRefResult2.current
		local SurveyId = Current.surveyId
		
		if SurveyId == nil or Current.phase == PhaseModule.Completed then return end
		local SubmitPayload = InlineSurveyHelpersModule.buildSubmitPayload(SurveyId, Current.questions, Current.answersByQuestionId, Current.idempotencyKey or HttpService:GenerateGUID(false), { finished = false })
		
		if #SubmitPayload.answers ~= 0 then
			InlineSurveyApiModule.submitSurveyResponse(NetworkImpl, SubmitPayload):catch(function(Err) --[[ Line: 207 ]]
				warn("Inline survey partial submit failed:", Err)
			end)
			
			return
		end
	end, { NetworkImpl })
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 212 ]]
		-- upvalues: FFlagInlineSurveyEnhancements (upval), UserInputService (upval), FFlagInlineSurveyPartialResponse (upval), UseResult5 (copy), UseRefResult (copy), UseRefResult1 (copy), UseReducerResult2 (copy)
		if FFlagInlineSurveyEnhancements then
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if FocusedTextBox ~= nil then
				FocusedTextBox:ReleaseFocus()
			end
		end
		if FFlagInlineSurveyPartialResponse then
			UseResult5()
		end
		UseRefResult.current += 1
		UseRefResult1.current = false
		UseReducerResult2({ type = "dismissed" })
	end, if FFlagInlineSurveyPartialResponse then { UseResult5 } else {})
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 224 ]]
		-- upvalues: UseReducerResult2 (copy)
		UseReducerResult2({ type = "inviteAccepted" })
	end, {})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 228 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseReducerResult2 (copy)
		UseRefResult.current += 1
		UseRefResult1.current = false
		UseReducerResult2({ type = "inviteDeclined" })
	end, {})
	ReactModule.useEffect(function() --[[ Line: 235 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy)
		UseResult()
		
		return function() --[[ Line: 237 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current += 1
		end
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 242 ]]
		-- upvalues: UseReducerResult (copy), PhaseModule (upval), UseRefResult4 (copy), UseRefResult3 (copy), UseRefResult6 (copy), UseRefResult5 (copy)
		if UseReducerResult.phase == PhaseModule.Completed and UseRefResult4.current then
			UseRefResult4.current()
			
			return
		end
		if UseReducerResult.phase == PhaseModule.Closed and UseRefResult3.current then
			UseRefResult3.current()
			
			return
		end
		if (UseReducerResult.phase == PhaseModule.Started or UseReducerResult.phase == PhaseModule.Invite) and not UseRefResult6.current and UseRefResult5.current then
			UseRefResult6.current = true
			UseRefResult5.current()
		end
	end, { UseReducerResult.phase })
	
	return {
		state = UseReducerResult,
		setAnswer = UseResult4,
		submit = UseResult2,
		retry = UseResult3,
		dismiss = UseResult6,
		acceptInvite = UseResult7,
		declineInvite = UseResult8
	}
end