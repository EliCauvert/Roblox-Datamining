local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local FFlagInlineSurveyEnhancements = require(Parent.SharedFlags).FFlagInlineSurveyEnhancements
local InlineSurveyHelpersModule = require(OnPlatformSurveys.Utils.inlineSurveyHelpers)
local PhaseModule = require(OnPlatformSurveys.Enums.Phase)
local QuestionRenderersModule = require(OnPlatformSurveys.Components.Questions.questionRenderers)
local _ = require(OnPlatformSurveys.Hooks.inlineSurveyReducer)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)

local function LoadingBody(p1)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Size600 = p1.tokens.Size.Size_600
	
	return ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
		Line1 = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			radius = Radius.Medium,
			Size = UDim2.new(1, 0, 0, Size600)
		}),
		Line2 = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			radius = Radius.Medium,
			Size = UDim2.new(1, 0, 0, Size600)
		}),
		Line3 = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			radius = Radius.Medium,
			Size = UDim2.new(0.6, 0, 0, Size600)
		})
	})
end

local function QuestionBody(p1)
	-- upvalues: QuestionRenderersModule (copy), PhaseModule (copy), ReactModule (copy), View (copy), Text (copy)
	local Question = p1.state.questions[p1.state.index]
	
	return ReactModule.createElement(View, { tag = "col gap-xlarge size-full-0 auto-y" }, {
		Title = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = Question.title
		}),
		Input = QuestionRenderersModule.renderQuestion({
			layoutOrder = 2,
			question = Question,
			answer = p1.state.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.state.phase == PhaseModule.Submitting
		})
	})
end

return {
	getSlots = function(State, p1, Tokens, p2)
		-- upvalues: PhaseModule (copy), ReactModule (copy), Text (copy), ButtonVariant (copy), LoadingBody (copy), QuestionBody (copy), FFlagInlineSurveyEnhancements (copy), InlineSurveyHelpersModule (copy)
		if State.phase == PhaseModule.Invite then
			return {
				headerTitle = p1.surveyTitle,
				body = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p1.inviteBody
				}),
				primaryAction = {
					text = p1.inviteAccept,
					variant = ButtonVariant.Emphasis,
					onActivated = p2.onAccept
				}
			}
		elseif State.phase == PhaseModule.Loading then
			return {
				headerTitle = nil,
				primaryAction = nil,
				body = ReactModule.createElement(LoadingBody, { tokens = Tokens })
			}
		elseif State.phase == PhaseModule.Error then
			return {
				headerTitle = nil,
				body = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = p1.errorText
				}),
				primaryAction = {
					text = p1.retry,
					variant = ButtonVariant.Standard,
					onActivated = p2.onRetry
				}
			}
		elseif State.phase == PhaseModule.Completed then
			return {
				body = nil,
				headerTitle = p1.completedTitle,
				primaryAction = {
					text = p1.done,
					variant = ButtonVariant.Emphasis,
					onActivated = p2.onDismiss
				}
			}
		elseif State.phase ~= PhaseModule.Started and State.phase ~= PhaseModule.Submitting or State.questions[State.index] == nil then
			return { headerTitle = nil, body = nil, primaryAction = nil }
		else
			local IsPhaseMatch = State.phase == PhaseModule.Submitting
			local Element = ReactModule.createElement(QuestionBody, { state = State, onAnswerChanged = p2.onAnswerChanged })
			
			if FFlagInlineSurveyEnhancements then
				local IsLastQuestion = InlineSurveyHelpersModule.isLastQuestion(State.questions, State.index, State.answer)
				
				return {
					headerTitle = p1.surveyTitle,
					body = Element,
					primaryAction = {
						text = if IsLastQuestion then p1.send else p1.next,
						variant = ButtonVariant.Emphasis,
						onActivated = p2.onSubmit,
						isLoading = IsPhaseMatch,
						isDisabled = IsPhaseMatch or not InlineSurveyHelpersModule.canAdvance(State.questions, State.index, State.answersByQuestionId, State.answer)
					}
				}
			else
				local MergeCurrentAnswerIntoBatchResult = InlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(State.answersByQuestionId, State.questions[State.index], State.answer)
				
				return {
					headerTitle = p1.surveyTitle,
					body = Element,
					primaryAction = {
						text = p1.send,
						variant = ButtonVariant.Emphasis,
						onActivated = p2.onSubmit,
						isLoading = IsPhaseMatch,
						isDisabled = IsPhaseMatch or not InlineSurveyHelpersModule.canSubmitAll(State.questions, MergeCurrentAnswerIntoBatchResult)
					}
				}
			end
		end
	end
}