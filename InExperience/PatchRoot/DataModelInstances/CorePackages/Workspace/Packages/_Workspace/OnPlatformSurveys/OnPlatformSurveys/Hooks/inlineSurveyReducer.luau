local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local dashModule = require(parent.Dash)
local fFlagInlineSurveyBranching = require(parent.SharedFlags).FFlagInlineSurveyBranching
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local phaseModule = require(onPlatformSurveys.Enums.Phase)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}

local function getInitialState(p1)
	-- upvalues: phaseModule (ref), t (ref)
	return {
		index = 1,
		surveyId = nil,
		idempotencyKey = nil,
		errorType = nil,
		phase = phaseModule.Loading,
		hasInvite = p1 == true,
		questions = {},
		answersByQuestionId = {},
		answer = t
	}
end

local function closedState(p1)
	-- upvalues: dashModule (ref), getInitialState (ref), phaseModule (ref)
	return dashModule.join(getInitialState(p1), { phase = phaseModule.Closed })
end

return {
	getInitialState = getInitialState,
	reducer = function(p1, p2)
		-- upvalues: getInitialState (ref), closedState (ref), dashModule (ref), phaseModule (ref), inlineSurveyHelpersModule (ref), fFlagInlineSurveyBranching (ref), t (ref)
		if p2.type == "fetchRequested" then
			return getInitialState(p1.hasInvite)
		elseif p2.type == "questionsReceived" then
			local response = p2.response
			
			if response == nil or response.shouldPromptSurvey ~= true then
				return closedState(p1.hasInvite)
			end
			local questions = response.questions
			
			return if questions == nil or #questions == 0 then closedState(p1.hasInvite) else dashModule.join(getInitialState(p1.hasInvite), {
				phase = if p1.hasInvite then phaseModule.Invite else phaseModule.Started,
				questions = questions,
				surveyId = response.surveyId
			})
		else
			return if p2.type == "fetchFailed" then dashModule.join(p1, { errorType = "fetch", phase = phaseModule.Error }) elseif p2.type == "setAnswer" then dashModule.join(p1, { answer = p2.answer }) elseif p2.type == "next" then dashModule.join(p1, {
				index = if fFlagInlineSurveyBranching then inlineSurveyHelpersModule.resolveNextIndex(p1.questions, p1.index, p1.answer) or p1.index + 1 else p1.index + 1,
				answersByQuestionId = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p1.answersByQuestionId, p1.questions[p1.index], p1.answer),
				answer = t,
				errorType = dashModule.None
			}) elseif p2.type == "submitStarted" then dashModule.join(p1, {
				phase = phaseModule.Submitting,
				answersByQuestionId = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p1.answersByQuestionId, p1.questions[p1.index], p1.answer),
				idempotencyKey = p2.idempotencyKey,
				errorType = dashModule.None
			}) elseif p2.type == "submitSucceeded" then dashModule.join(p1, {
				phase = phaseModule.Completed,
				errorType = dashModule.None
			}) elseif p2.type == "submitFailed" then dashModule.join(p1, { errorType = "submit", phase = phaseModule.Error }) elseif p2.type == "inviteAccepted" then dashModule.join(p1, { phase = phaseModule.Started }) elseif p2.type == "inviteDeclined" then closedState(p1.hasInvite) elseif p2.type == "dismissed" then closedState(p1.hasInvite) else p1
		end
	end
}