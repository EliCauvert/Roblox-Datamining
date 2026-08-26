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

local function _()
	-- upvalues: userInputService (ref)
	local focusedTextBox = userInputService:GetFocusedTextBox()
	
	if focusedTextBox ~= nil then
		focusedTextBox:ReleaseFocus()
	end
end

return function(p1)
	-- upvalues: reactModule (ref), inlineSurveyReducerModule (ref), inlineSurveyApiModule (ref), inlineSurveyHelpersModule (ref), fFlagInlineSurveyBranching (ref), httpService (ref), fFlagInlineSurveyEnhancements (ref), userInputService (ref), phaseModule (ref), fFlagInlineSurveyPartialResponse (ref)
	local networkImpl = p1.networkImpl
	local eventType = p1.eventType
	local var1, var2 = reactModule.useReducer(inlineSurveyReducerModule.reducer, p1.hasInvite == true, inlineSurveyReducerModule.getInitialState)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(var1)
	var5.current = var1
	local var6 = reactModule.useRef(p1.onClose)
	var6.current = p1.onClose
	local var7 = reactModule.useRef(p1.onComplete)
	var7.current = p1.onComplete
	local var8 = reactModule.useRef(p1.onEligible)
	var8.current = p1.onEligible
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), var9 (ref), var2 (ref), inlineSurveyApiModule (copy), networkImpl (ref), eventType (ref)
		local var11 = var3.current + 1
		var3.current = var11
		var4.current = false
		var9.current = false
		var2({ type = "fetchRequested" })
		inlineSurveyApiModule.fetchInlineSurvey(networkImpl, eventType):andThen(function(p2)
			-- upvalues: var3 (copy), var11 (ref), var2 (copy)
			if var3.current == var11 then
				var2({ type = "questionsReceived", response = p2 })
				
				return
			end
		end):catch(function(p2)
			-- upvalues: var3 (copy), var11 (ref), var2 (copy)
			if var3.current == var11 then
				warn("Inline survey fetch failed:", p2)
				var2({ type = "fetchFailed" })
				
				return
			end
		end)
	end, { networkImpl, eventType })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var4 (ref), inlineSurveyHelpersModule (copy), fFlagInlineSurveyBranching (copy), httpService (copy), var2 (ref), var3 (ref), inlineSurveyApiModule (copy), networkImpl (ref)
		local current = var5.current
		
		if var4.current then return end
		local index = current.questions[current.index]
		local surveyId = current.surveyId
		
		if index == nil or surveyId == nil then return end
		local var12 = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(current.answersByQuestionId, index, current.answer)
		local var13 = if fFlagInlineSurveyBranching then inlineSurveyHelpersModule.getVisitedQuestions(current.questions, var12) else current.questions
		
		if not inlineSurveyHelpersModule.canSubmitAll(var13, var12) then return end
		local idempotencyKey = current.idempotencyKey or httpService:GenerateGUID(false)
		local var14 = inlineSurveyHelpersModule.buildSubmitPayload(surveyId, var13, var12, idempotencyKey)
		
		if #var14.answers == 0 then
			var2({ type = "submitSucceeded" })
			
			return
		end
		local var15 = var3.current + 1
		var3.current = var15
		var4.current = true
		var2({ type = "submitStarted", idempotencyKey = idempotencyKey })
		inlineSurveyApiModule.submitSurveyResponse(networkImpl, var14):andThen(function(_)
			-- upvalues: var3 (copy), var15 (ref), var4 (copy), var2 (copy)
			if var3.current == var15 then
				var4.current = false
				var2({ type = "submitSucceeded" })
				
				return
			end
		end):catch(function(p2)
			-- upvalues: var3 (copy), var15 (ref), var4 (copy), var2 (copy)
			if var3.current == var15 then
				var4.current = false
				warn("Inline survey submit failed:", p2)
				var2({ type = "submitFailed" })
				
				return
			end
		end)
	end, { networkImpl })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var4 (ref), fFlagInlineSurveyEnhancements (copy), var11 (ref), inlineSurveyHelpersModule (copy), userInputService (copy), var2 (ref)
		local current = var5.current
		
		if current.questions[current.index] == nil or var4.current then return end
		if not fFlagInlineSurveyEnhancements then
			var11()
			
			return
		elseif not inlineSurveyHelpersModule.canAdvance(current.questions, current.index, current.answersByQuestionId, current.answer) then return end
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if focusedTextBox ~= nil then
			focusedTextBox:ReleaseFocus()
		end
		if inlineSurveyHelpersModule.isLastQuestion(current.questions, current.index, current.answer) then
			var11()
			
			return
		end
		var2({ type = "next" })
	end, { var11 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var11 (ref), var10 (ref)
		if var5.current.errorType == "submit" then
			var11()
			
			return
		end
		var10()
	end, { var11, var10 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2({ type = "setAnswer", answer = p2 })
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var5 (ref), phaseModule (copy), httpService (copy), inlineSurveyHelpersModule (copy), inlineSurveyApiModule (copy), networkImpl (ref)
		if var4.current then return end
		local current = var5.current
		local surveyId = current.surveyId
		
		if surveyId == nil or current.phase == phaseModule.Completed then return end
		local var16 = inlineSurveyHelpersModule.buildSubmitPayload(surveyId, current.questions, current.answersByQuestionId, current.idempotencyKey or httpService:GenerateGUID(false), { finished = false })
		
		if #var16.answers == 0 then
			return
		end
		inlineSurveyApiModule.submitSurveyResponse(networkImpl, var16):catch(function(p2)
			warn("Inline survey partial submit failed:", p2)
		end)
	end, { networkImpl })
	local var16 = reactModule.useCallback(function()
		-- upvalues: fFlagInlineSurveyEnhancements (copy), userInputService (copy), fFlagInlineSurveyPartialResponse (copy), var15 (ref), var3 (ref), var4 (ref), var2 (ref)
		if fFlagInlineSurveyEnhancements then
			local focusedTextBox = userInputService:GetFocusedTextBox()
			
			if focusedTextBox ~= nil then
				focusedTextBox:ReleaseFocus()
			end
		end
		if fFlagInlineSurveyPartialResponse then
			var15()
		end
		var3.current += 1
		var4.current = false
		var2({ type = "dismissed" })
	end, if fFlagInlineSurveyPartialResponse then { var15 } else {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2({ type = "inviteAccepted" })
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), var2 (ref)
		var3.current += 1
		var4.current = false
		var2({ type = "inviteDeclined" })
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var3 (ref)
		var10()
		
		return function()
			-- upvalues: var3 (copy)
			var3.current += 1
		end
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), phaseModule (copy), var7 (ref), var6 (ref), var9 (ref), var8 (ref)
		if var1.phase == phaseModule.Completed and var7.current then
			var7.current()
			
			return
		elseif var1.phase == phaseModule.Closed and var6.current then
			var6.current()
			
			return
		elseif (var1.phase == phaseModule.Started or var1.phase == phaseModule.Invite) and (not var9.current and var8.current) then
			var9.current = true
			var8.current()
		end
	end, { var1.phase })
	
	return {
		state = var1,
		setAnswer = var14,
		submit = var12,
		retry = var13,
		dismiss = var16,
		acceptInvite = var17,
		declineInvite = var18
	}
end