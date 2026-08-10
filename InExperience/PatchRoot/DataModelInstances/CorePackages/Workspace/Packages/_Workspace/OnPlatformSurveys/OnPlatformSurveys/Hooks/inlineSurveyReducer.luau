local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local dashModule = require(parent.Dash)
local fFlagInlineSurveyBranching = require(parent.SharedFlags).FFlagInlineSurveyBranching
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local phaseModule = require(onPlatformSurveys.Enums.Phase)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local t = {}

local function getInitialState(p0) --[[ line: 51 ]]
	-- upvalues: phaseModule (ref), t (ref)
	return {
		index = 1,
		surveyId = nil,
		idempotencyKey = nil,
		errorType = nil,
		phase = phaseModule.Loading,
		hasInvite = p0 == true,
		questions = {},
		answersByQuestionId = {},
		answer = t
	}
end

local function closedState(p1) --[[ line: 65 ]]
	-- upvalues: dashModule (ref), getInitialState (ref), phaseModule (ref)
	return dashModule.join(getInitialState(p1), { phase = phaseModule.Closed })
end

return {
	getInitialState = getInitialState,
	reducer = function(p2, p3) --[[ line: 69 ]]
		-- upvalues: getInitialState (ref), closedState (ref), dashModule (ref), phaseModule (ref), inlineSurveyHelpersModule (ref), fFlagInlineSurveyBranching (ref), t (ref)
		if p3.type == "fetchRequested" then
			return getInitialState(p2.hasInvite)
		elseif p3.type == "questionsReceived" then
			local response = p3.response
			
			if response == nil or response.shouldPromptSurvey ~= true then
				return closedState(p2.hasInvite)
			end
			local questions = response.questions
			
			return if questions == nil or #questions == 0 then closedState(p2.hasInvite) else dashModule.join(getInitialState(p2.hasInvite), {
				phase = if p2.hasInvite then phaseModule.Invite else phaseModule.Started,
				questions = questions,
				surveyId = response.surveyId
			})
		else
			return if p3.type == "fetchFailed" then dashModule.join(p2, { errorType = "fetch", phase = phaseModule.Error }) elseif p3.type == "setAnswer" then dashModule.join(p2, { answer = p3.answer }) elseif p3.type == "next" then dashModule.join(p2, {
				index = if fFlagInlineSurveyBranching then inlineSurveyHelpersModule.resolveNextIndex(p2.questions, p2.index, p2.answer) or p2.index + 1 else p2.index + 1,
				answersByQuestionId = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p2.answersByQuestionId, p2.questions[p2.index], p2.answer),
				answer = t,
				errorType = dashModule.None
			}) elseif p3.type == "submitStarted" then dashModule.join(p2, {
				phase = phaseModule.Submitting,
				answersByQuestionId = inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p2.answersByQuestionId, p2.questions[p2.index], p2.answer),
				idempotencyKey = p3.idempotencyKey,
				errorType = dashModule.None
			}) elseif p3.type == "submitSucceeded" then dashModule.join(p2, {
				phase = phaseModule.Completed,
				errorType = dashModule.None
			}) elseif p3.type == "submitFailed" then dashModule.join(p2, { errorType = "submit", phase = phaseModule.Error }) elseif p3.type == "inviteAccepted" then dashModule.join(p2, { phase = phaseModule.Started }) elseif p3.type == "inviteDeclined" then closedState(p2.hasInvite) elseif p3.type == "dismissed" then closedState(p2.hasInvite) else p2
		end
	end
}