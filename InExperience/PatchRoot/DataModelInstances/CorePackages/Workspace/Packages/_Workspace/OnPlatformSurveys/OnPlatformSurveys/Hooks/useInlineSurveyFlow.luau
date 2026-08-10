local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagInlineSurveyEnhancements = sharedFlagsModule.FFlagInlineSurveyEnhancements
local fFlagInlineSurveyBranching = sharedFlagsModule.FFlagInlineSurveyBranching
local fFlagInlineSurveyPartialResponse = sharedFlagsModule.FFlagInlineSurveyPartialResponse
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local inlineSurveyApiModule = require(onPlatformSurveys.Api.inlineSurveyApi)
local phaseModule = require(onPlatformSurveys.Enums.Phase)
local inlineSurveyReducerModule = require(onPlatformSurveys.Hooks.inlineSurveyReducer)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

local function _() --[[ line: 46 | named "releaseKeyboardFocus" ]]
	-- upvalues: userInputService (ref)
	local focusedTextBox = userInputService:GetFocusedTextBox()
	
	if focusedTextBox ~= nil then
		focusedTextBox:ReleaseFocus()
	end
end

return function(p0) --[[ line: 53 | named "useInlineSurveyFlow" ]]
	-- upvalues: reactModule (ref), inlineSurveyReducerModule (ref), inlineSurveyApiModule (ref), inlineSurveyHelpersModule (ref), fFlagInlineSurveyBranching (ref), httpService (ref), fFlagInlineSurveyEnhancements (ref), userInputService (ref), phaseModule (ref), fFlagInlineSurveyPartialResponse (ref)
	local networkImpl = p0.networkImpl
	local eventType = p0.eventType
	local var10, var11 = reactModule.useReducer(inlineSurveyReducerModule.reducer, p0.hasInvite == true, inlineSurveyReducerModule.getInitialState)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(var10)
	var14.current = var10
	local var15 = reactModule.useRef(p0.onClose)
	var15.current = p0.onClose
	local var16 = reactModule.useRef(p0.onComplete)
	var16.current = p0.onComplete
	local var17 = reactModule.useRef(p0.onEligible)
	var17.current = p0.onEligible
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var12 (ref), var13 (ref), var18 (ref), var11 (ref), inlineSurveyApiModule (copy), networkImpl (ref), eventType (ref)
		local var28 = var12.current + 1
		var12.current = var28
		var13.current = false
		var18.current = false
		var11({ type = "fetchRequested" })
		inlineSurveyApiModule.fetchInlineSurvey(networkImpl, eventType):andThen(function(p2) --[[ line: 82 ]]
			-- upvalues: var12 (copy), var28 (ref), var11 (copy)
			if var12.current == var28 then
				var11({ type = "questionsReceived", response = p2 })
				
				return
			end
		end):catch(function(p1) --[[ line: 88 ]]
			-- upvalues: var12 (copy), var28 (ref), var11 (copy)
			if var12.current == var28 then
				warn("Inline survey fetch failed:", p1)
				var11({ type = "fetchFailed" })
				
				return
			end
		end)
	end, { networkImpl, eventType })
	local var20 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: var14 (ref), var13 (ref), inlineSurveyHelpersModule (copy), fFlagInlineSurveyBranching (copy), httpService (copy), var11 (ref), var12 (ref), inlineSurveyApiModule (copy), networkImpl (ref)
		local current = var14.current
		
		if var13.current then return end
		local index = current.questions[current.index]
		local surveyId = current.surveyId
		
		if index == nil or surveyId == nil then return end
		local var29 = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(current.answersByQuestionId, index, current.answer)
		local var30 = if fFlagInlineSurveyBranching then inlineSurveyHelpersModule.getVisitedQuestions(current.questions, var29) else current.questions
		
		if not inlineSurveyHelpersModule.canSubmitAll(var30, var29) then return end
		local idempotencyKey = current.idempotencyKey or httpService:GenerateGUID(false)
		local var32 = inlineSurveyHelpersModule.buildSubmitPayload(surveyId, var30, var29, idempotencyKey)
		
		if #var32.answers == 0 then
			var11({ type = "submitSucceeded" })
			
			return
		end
		local var33 = var12.current + 1
		var12.current = var33
		var13.current = true
		var11({ type = "submitStarted", idempotencyKey = idempotencyKey })
		inlineSurveyApiModule.submitSurveyResponse(networkImpl, var32):andThen(function(_) --[[ line: 131 ]]
			-- upvalues: var12 (copy), var33 (ref), var13 (copy), var11 (copy)
			if var12.current == var33 then
				var13.current = false
				var11({ type = "submitSucceeded" })
				
				return
			end
		end):catch(function(p3) --[[ line: 138 ]]
			-- upvalues: var12 (copy), var33 (ref), var13 (copy), var11 (copy)
			if var12.current == var33 then
				var13.current = false
				warn("Inline survey submit failed:", p3)
				var11({ type = "submitFailed" })
				
				return
			end
		end)
	end, { networkImpl })
	local var21 = reactModule.useCallback(function() --[[ line: 149 ]]
		-- upvalues: var14 (ref), var13 (ref), fFlagInlineSurveyEnhancements (copy), var20 (ref), inlineSurveyHelpersModule (copy), userInputService (copy), var11 (ref)
		local current = var14.current
		
		if current.questions[current.index] == nil or var13.current then return end
		if not fFlagInlineSurveyEnhancements then
			var20()
			
			return
		elseif not inlineSurveyHelpersModule.canAdvance(current.questions, current.index, current.answersByQuestionId, current.answer) then return end
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if focusedTextBox ~= nil then
			focusedTextBox:ReleaseFocus()
		end
		if inlineSurveyHelpersModule.isLastQuestion(current.questions, current.index, current.answer) then
			var20()
			
			return
		end
		var11({ type = "next" })
	end, { var20 })
	local var22 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: var14 (ref), var20 (ref), var19 (ref)
		if var14.current.errorType == "submit" then
			var20()
			
			return
		end
		var19()
	end, { var20, var19 })
	local var23 = reactModule.useCallback(function(p4) --[[ line: 182 ]]
		-- upvalues: var11 (ref)
		var11({ type = "setAnswer", answer = p4 })
	end, {})
	local var24 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: var13 (ref), var14 (ref), phaseModule (copy), httpService (copy), inlineSurveyHelpersModule (copy), inlineSurveyApiModule (copy), networkImpl (ref)
		if var13.current then return end
		local current = var14.current
		local surveyId = current.surveyId
		
		if surveyId == nil or current.phase == phaseModule.Completed then return end
		local var35 = inlineSurveyHelpersModule.buildSubmitPayload(surveyId, current.questions, current.answersByQuestionId, current.idempotencyKey or httpService:GenerateGUID(false), { finished = false })
		
		if #var35.answers == 0 then
			return
		end
		inlineSurveyApiModule.submitSurveyResponse(networkImpl, var35):catch(function(p5) --[[ line: 207 ]]
			warn("Inline survey partial submit failed:", p5)
		end)
	end, { networkImpl })
	local var25 = reactModule.useCallback(function() --[[ line: 212 ]]
		-- upvalues: fFlagInlineSurveyEnhancements (copy), userInputService (copy), fFlagInlineSurveyPartialResponse (copy), var24 (ref), var12 (ref), var13 (ref), var11 (ref)
		if fFlagInlineSurveyEnhancements then
			local focusedTextBox = userInputService:GetFocusedTextBox()
			
			if focusedTextBox ~= nil then
				focusedTextBox:ReleaseFocus()
			end
		end
		if fFlagInlineSurveyPartialResponse then
			var24()
		end
		var12.current += 1
		var13.current = false
		var11({ type = "dismissed" })
	end, if fFlagInlineSurveyPartialResponse then { var24 } else {})
	local var26 = reactModule.useCallback(function() --[[ line: 224 ]]
		-- upvalues: var11 (ref)
		var11({ type = "inviteAccepted" })
	end, {})
	local var27 = reactModule.useCallback(function() --[[ line: 228 ]]
		-- upvalues: var12 (ref), var13 (ref), var11 (ref)
		var12.current += 1
		var13.current = false
		var11({ type = "inviteDeclined" })
	end, {})
	reactModule.useEffect(function() --[[ line: 235 ]]
		-- upvalues: var19 (ref), var12 (ref)
		var19()
		
		return function() --[[ line: 237 ]]
			-- upvalues: var12 (copy)
			var12.current += 1
		end
	end, { var19 })
	reactModule.useEffect(function() --[[ line: 242 ]]
		-- upvalues: var10 (ref), phaseModule (copy), var16 (ref), var15 (ref), var18 (ref), var17 (ref)
		if var10.phase == phaseModule.Completed and var16.current then
			var16.current()
			
			return
		elseif var10.phase == phaseModule.Closed and var15.current then
			var15.current()
			
			return
		elseif (var10.phase == phaseModule.Started or var10.phase == phaseModule.Invite) and (not var18.current and var17.current) then
			var18.current = true
			var17.current()
		end
	end, { var10.phase })
	
	return {
		state = var10,
		setAnswer = var23,
		submit = var21,
		retry = var22,
		dismiss = var25,
		acceptInvite = var26,
		declineInvite = var27
	}
end