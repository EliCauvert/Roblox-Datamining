local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local DashModule = require(Parent.Dash)
local FFlagInlineSurveyBranching = require(Parent.SharedFlags).FFlagInlineSurveyBranching
local InlineSurveyHelpersModule = require(OnPlatformSurveys.Utils.inlineSurveyHelpers)
local PhaseModule = require(OnPlatformSurveys.Enums.Phase)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local Answer = {}

local function getInitialState(Enabled)
	-- upvalues: PhaseModule (copy), Answer (copy)
	return {
		index = 1,
		surveyId = nil,
		idempotencyKey = nil,
		errorType = nil,
		phase = PhaseModule.Loading,
		hasInvite = Enabled == true,
		questions = {},
		answersByQuestionId = {},
		answer = Answer
	}
end

local function closedState(HasInvite)
	-- upvalues: DashModule (copy), getInitialState (copy), PhaseModule (copy)
	return DashModule.join(getInitialState(HasInvite), { phase = PhaseModule.Closed })
end

return {
	getInitialState = getInitialState,
	reducer = function(InitialState, InitialState1)
		-- upvalues: getInitialState (copy), closedState (copy), DashModule (copy), PhaseModule (copy), InlineSurveyHelpersModule (copy), FFlagInlineSurveyBranching (copy), Answer (copy)
		if InitialState1.type == "fetchRequested" then
			return (getInitialState(InitialState.hasInvite))
		elseif InitialState1.type ~= "questionsReceived" then
			return if InitialState1.type == "fetchFailed" then DashModule.join(InitialState, { errorType = "fetch", phase = PhaseModule.Error }) elseif InitialState1.type == "setAnswer" then DashModule.join(InitialState, { answer = InitialState1.answer }) elseif InitialState1.type == "next" then DashModule.join(InitialState, {
				index = FFlagInlineSurveyBranching and InlineSurveyHelpersModule.resolveNextIndex(InitialState.questions, InitialState.index, InitialState.answer) or InitialState.index + 1,
				answersByQuestionId = InlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(InitialState.answersByQuestionId, InitialState.questions[InitialState.index], InitialState.answer),
				answer = Answer,
				errorType = DashModule.None
			}) elseif InitialState1.type == "submitStarted" then DashModule.join(InitialState, {
				phase = PhaseModule.Submitting,
				answersByQuestionId = InlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(InitialState.answersByQuestionId, InitialState.questions[InitialState.index], InitialState.answer),
				idempotencyKey = InitialState1.idempotencyKey,
				errorType = DashModule.None
			}) elseif InitialState1.type == "submitSucceeded" then DashModule.join(InitialState, {
				phase = PhaseModule.Completed,
				errorType = DashModule.None
			}) elseif InitialState1.type == "submitFailed" then DashModule.join(InitialState, { errorType = "submit", phase = PhaseModule.Error }) elseif InitialState1.type == "inviteAccepted" then DashModule.join(InitialState, { phase = PhaseModule.Started }) elseif InitialState1.type == "inviteDeclined" then closedState(InitialState.hasInvite) elseif InitialState1.type == "dismissed" then closedState(InitialState.hasInvite) else InitialState
		else
			local Response = InitialState1.response
			
			if Response == nil or Response.shouldPromptSurvey ~= true then
				return closedState(InitialState.hasInvite)
			else
				local Questions = Response.questions
				
				return if Questions == nil or #Questions == 0 then closedState(InitialState.hasInvite) else DashModule.join(getInitialState(InitialState.hasInvite), {
					phase = if InitialState.hasInvite then PhaseModule.Invite else PhaseModule.Started,
					questions = Questions,
					surveyId = Response.surveyId
				})
			end
		end
	end
}