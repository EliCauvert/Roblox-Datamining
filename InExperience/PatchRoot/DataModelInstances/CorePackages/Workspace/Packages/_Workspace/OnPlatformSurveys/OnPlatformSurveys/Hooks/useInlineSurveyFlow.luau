local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local httpService = game:GetService("HttpService")
local reactModule = require(onPlatformSurveys.Parent.React)
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local inlineSurveyApiModule = require(onPlatformSurveys.Api.inlineSurveyApi)
local inlineSurveyReducerModule = require(onPlatformSurveys.Hooks.inlineSurveyReducer)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

return function(p0) --[[ line: 35 | named "useInlineSurveyFlow" ]]
	-- upvalues: reactModule (ref), inlineSurveyReducerModule (ref), inlineSurveyApiModule (ref), inlineSurveyHelpersModule (ref), httpService (ref)
	local networkImpl = p0.networkImpl
	local eventType = p0.eventType
	local var6, var7 = reactModule.useReducer(inlineSurveyReducerModule.reducer, inlineSurveyReducerModule.getInitialState())
	local var8 = reactModule.useRef(0)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(var6)
	var10.current = var6
	local var11 = reactModule.useRef(p0.onClose)
	var11.current = p0.onClose
	local var12 = reactModule.useRef(p0.onComplete)
	var12.current = p0.onComplete
	local var13 = reactModule.useRef(p0.onEligible)
	var13.current = p0.onEligible
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useCallback(function() --[[ line: 57 ]]
		-- upvalues: var8 (ref), var9 (ref), var14 (ref), var7 (ref), inlineSurveyApiModule (copy), networkImpl (ref), eventType (ref)
		local var20 = var8.current + 1
		var8.current = var20
		var9.current = false
		var14.current = false
		var7({ type = "fetchRequested" })
		inlineSurveyApiModule.fetchInlineSurvey(networkImpl, eventType):andThen(function(p2) --[[ line: 64 ]]
			-- upvalues: var8 (copy), var20 (ref), var7 (copy)
			if var8.current == var20 then
				var7({ type = "questionsReceived", response = p2 })
				
				return
			end
		end):catch(function(p1) --[[ line: 70 ]]
			-- upvalues: var8 (copy), var20 (ref), var7 (copy)
			if var8.current == var20 then
				warn("Inline survey fetch failed:", p1)
				var7({ type = "fetchFailed" })
				
				return
			end
		end)
	end, { networkImpl, eventType })
	local var16 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: var10 (ref), var9 (ref), inlineSurveyHelpersModule (copy), httpService (copy), var7 (ref), var8 (ref), inlineSurveyApiModule (copy), networkImpl (ref)
		local current = var10.current
		
		if var9.current then return end
		local index = current.questions[current.index]
		local surveyId = current.surveyId
		
		if index == nil or surveyId == nil then return end
		local var21 = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(current.answersByQuestionId, index, current.answer)
		
		if not inlineSurveyHelpersModule.canSubmitAll(current.questions, var21) then return end
		local idempotencyKey = current.idempotencyKey or httpService:GenerateGUID(false)
		local var23 = inlineSurveyHelpersModule.buildSubmitPayload(surveyId, current.questions, var21, idempotencyKey)
		
		if #var23.answers == 0 then
			var7({ type = "submitSucceeded" })
			
			return
		end
		local var24 = var8.current + 1
		var8.current = var24
		var9.current = true
		var7({ type = "submitStarted", idempotencyKey = idempotencyKey })
		inlineSurveyApiModule.submitSurveyResponse(networkImpl, var23):andThen(function(_) --[[ line: 109 ]]
			-- upvalues: var8 (copy), var24 (ref), var9 (copy), var7 (copy)
			if var8.current == var24 then
				var9.current = false
				var7({ type = "submitSucceeded" })
				
				return
			end
		end):catch(function(p3) --[[ line: 116 ]]
			-- upvalues: var8 (copy), var24 (ref), var9 (copy), var7 (copy)
			if var8.current == var24 then
				var9.current = false
				warn("Inline survey submit failed:", p3)
				var7({ type = "submitFailed" })
				
				return
			end
		end)
	end, { networkImpl })
	local var17 = reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: var10 (ref), var16 (ref), var15 (ref)
		if var10.current.errorType == "submit" then
			var16()
			
			return
		end
		var15()
	end, { var16, var15 })
	local var18 = reactModule.useCallback(function(p4) --[[ line: 134 ]]
		-- upvalues: var7 (ref)
		var7({ type = "setAnswer", answer = p4 })
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: var8 (ref), var9 (ref), var7 (ref)
		var8.current += 1
		var9.current = false
		var7({ type = "dismissed" })
	end, {})
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var15 (ref), var8 (ref)
		var15()
		
		return function() --[[ line: 147 ]]
			-- upvalues: var8 (copy)
			var8.current += 1
		end
	end, { var15 })
	reactModule.useEffect(function() --[[ line: 152 ]]
		-- upvalues: var6 (ref), var12 (ref), var11 (ref), var14 (ref), var13 (ref)
		if var6.phase == "completed" and var12.current then
			var12.current()
			
			return
		elseif var6.phase == "closed" and var11.current then
			var11.current()
			
			return
		elseif var6.phase == "started" and not var14.current and var13.current then
			var14.current = true
			var13.current()
		end
	end, { var6.phase })
	
	return {
		state = var6,
		setAnswer = var18,
		submit = var16,
		retry = var17,
		dismiss = var19
	}
end