local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local dashModule = require(onPlatformSurveys.Parent.Dash)
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}

local function getInitialState() --[[ line: 43 ]]
	-- upvalues: t (ref)
	return {
		phase = "loading",
		index = 1,
		surveyId = nil,
		idempotencyKey = nil,
		errorType = nil,
		questions = {},
		answersByQuestionId = {},
		answer = t
	}
end

local function closedState() --[[ line: 56 ]]
	-- upvalues: dashModule (ref), getInitialState (ref)
	return dashModule.join(getInitialState(), { phase = "closed" })
end

return {
	getInitialState = getInitialState,
	reducer = function(p0, p1) --[[ line: 60 ]]
		-- upvalues: getInitialState (ref), closedState (ref), dashModule (ref), inlineSurveyHelpersModule (ref)
		if p1.type == "fetchRequested" then
			return getInitialState()
		elseif p1.type == "questionsReceived" then
			local response = p1.response
			
			if response == nil or response.shouldPromptSurvey ~= true then
				return closedState()
			end
			local questions = response.questions
			
			return if questions == nil or #questions == 0 then closedState() else dashModule.join(getInitialState(), {
				phase = "started",
				questions = questions,
				surveyId = response.surveyId
			})
		else
			return if p1.type == "fetchFailed" then dashModule.join(p0, { phase = "error", errorType = "fetch" }) elseif p1.type == "setAnswer" then dashModule.join(p0, { answer = p1.answer }) elseif p1.type == "submitStarted" then dashModule.join(p0, {
				phase = "submitting",
				answersByQuestionId = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p0.answersByQuestionId, p0.questions[p0.index], p0.answer),
				idempotencyKey = p1.idempotencyKey,
				errorType = dashModule.None
			}) elseif p1.type == "submitSucceeded" then dashModule.join(p0, { phase = "completed", errorType = dashModule.None }) elseif p1.type == "submitFailed" then dashModule.join(p0, { phase = "error", errorType = "submit" }) elseif p1.type == "dismissed" then closedState() else p0
		end
	end
}