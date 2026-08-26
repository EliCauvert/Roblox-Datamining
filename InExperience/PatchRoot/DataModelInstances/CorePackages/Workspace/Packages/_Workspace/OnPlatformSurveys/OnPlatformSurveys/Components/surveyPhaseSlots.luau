local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local fFlagInlineSurveyEnhancements = require(parent.SharedFlags).FFlagInlineSurveyEnhancements
local inlineSurveyHelpersModule = require(onPlatformSurveys.Utils.inlineSurveyHelpers)
local phaseModule = require(onPlatformSurveys.Enums.Phase)
local questionRenderersModule = require(onPlatformSurveys.Components.Questions.questionRenderers)
local _ = require(onPlatformSurveys.Hooks.inlineSurveyReducer)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

local function LoadingBody(p1)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local size600 = p1.tokens.Size.Size_600
	
	return reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
		Line1 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			radius = radius.Medium,
			Size = UDim2.new(1, 0, 0, size600)
		}),
		Line2 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.new(1, 0, 0, size600)
		}),
		Line3 = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			radius = radius.Medium,
			Size = UDim2.new(0.6, 0, 0, size600)
		})
	})
end

local function QuestionBody(p1)
	-- upvalues: questionRenderersModule (ref), phaseModule (ref), reactModule (ref), view (ref), text (ref)
	local index = p1.state.questions[p1.state.index]
	
	return reactModule.createElement(view, { tag = "col gap-xlarge size-full-0 auto-y" }, {
		Title = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 1,
			Text = index.title
		}),
		Input = questionRenderersModule.renderQuestion({
			layoutOrder = 2,
			question = index,
			answer = p1.state.answer,
			onAnswerChanged = p1.onAnswerChanged,
			isDisabled = p1.state.phase == phaseModule.Submitting
		})
	})
end

return {
	getSlots = function(p1, p2, p3, p4)
		-- upvalues: phaseModule (ref), reactModule (ref), text (ref), buttonVariant (ref), LoadingBody (ref), QuestionBody (ref), fFlagInlineSurveyEnhancements (ref), inlineSurveyHelpersModule (ref)
		if p1.phase == phaseModule.Invite then
			return {
				headerTitle = p2.surveyTitle,
				body = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p2.inviteBody
				}),
				primaryAction = {
					text = p2.inviteAccept,
					variant = buttonVariant.Emphasis,
					onActivated = p4.onAccept
				}
			}
		elseif p1.phase == phaseModule.Loading then
			return {
				headerTitle = nil,
				primaryAction = nil,
				body = reactModule.createElement(LoadingBody, { tokens = p3 })
			}
		elseif p1.phase == phaseModule.Error then
			return {
				headerTitle = nil,
				body = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = p2.errorText
				}),
				primaryAction = {
					text = p2.retry,
					variant = buttonVariant.Standard,
					onActivated = p4.onRetry
				}
			}
		elseif p1.phase == phaseModule.Completed then
			return {
				body = nil,
				headerTitle = p2.completedTitle,
				primaryAction = {
					text = p2.done,
					variant = buttonVariant.Emphasis,
					onActivated = p4.onDismiss
				}
			}
		elseif p1.phase ~= phaseModule.Started and p1.phase ~= phaseModule.Submitting or p1.questions[p1.index] == nil then
			return { headerTitle = nil, body = nil, primaryAction = nil }
		end
		local var1 = p1.phase == phaseModule.Submitting
		local var2 = reactModule.createElement(QuestionBody, { state = p1, onAnswerChanged = p4.onAnswerChanged })
		
		return if fFlagInlineSurveyEnhancements then {
			headerTitle = p2.surveyTitle,
			body = var2,
			primaryAction = {
				text = if inlineSurveyHelpersModule.isLastQuestion(p1.questions, p1.index, p1.answer) then p2.send else p2.next,
				variant = buttonVariant.Emphasis,
				onActivated = p4.onSubmit,
				isLoading = var1,
				isDisabled = var1 or not inlineSurveyHelpersModule.canAdvance(p1.questions, p1.index, p1.answersByQuestionId, p1.answer)
			}
		} else {
			headerTitle = p2.surveyTitle,
			body = var2,
			primaryAction = {
				text = p2.send,
				variant = buttonVariant.Emphasis,
				onActivated = p4.onSubmit,
				isLoading = var1,
				isDisabled = var1 or not inlineSurveyHelpersModule.canSubmitAll(p1.questions, inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p1.answersByQuestionId, p1.questions[p1.index], p1.answer))
			}
		}
	end
}