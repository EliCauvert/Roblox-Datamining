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

local function LoadingBody(p0) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local size600 = p0.tokens.Size.Size_600
	
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

local function QuestionBody(p1) --[[ line: 83 ]]
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
	getSlots = function(p2, p3, p4, p5) --[[ line: 105 ]]
		-- upvalues: phaseModule (ref), reactModule (ref), text (ref), buttonVariant (ref), LoadingBody (ref), QuestionBody (ref), fFlagInlineSurveyEnhancements (ref), inlineSurveyHelpersModule (ref)
		if p2.phase == phaseModule.Invite then
			return {
				headerTitle = p3.surveyTitle,
				body = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = p3.inviteBody
				}),
				primaryAction = {
					text = p3.inviteAccept,
					variant = buttonVariant.Emphasis,
					onActivated = p5.onAccept
				}
			}
		elseif p2.phase == phaseModule.Loading then
			return {
				headerTitle = nil,
				primaryAction = nil,
				body = reactModule.createElement(LoadingBody, { tokens = p4 })
			}
		elseif p2.phase == phaseModule.Error then
			return {
				headerTitle = nil,
				body = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = p3.errorText
				}),
				primaryAction = {
					text = p3.retry,
					variant = buttonVariant.Standard,
					onActivated = p5.onRetry
				}
			}
		elseif p2.phase == phaseModule.Completed then
			return {
				body = nil,
				headerTitle = p3.completedTitle,
				primaryAction = {
					text = p3.done,
					variant = buttonVariant.Emphasis,
					onActivated = p5.onDismiss
				}
			}
		elseif p2.phase ~= phaseModule.Started and p2.phase ~= phaseModule.Submitting or p2.questions[p2.index] == nil then
			return { headerTitle = nil, body = nil, primaryAction = nil }
		end
		local var8 = p2.phase == phaseModule.Submitting
		local var9 = reactModule.createElement(QuestionBody, { state = p2, onAnswerChanged = p5.onAnswerChanged })
		
		return if fFlagInlineSurveyEnhancements then {
			headerTitle = p3.surveyTitle,
			body = var9,
			primaryAction = {
				text = if inlineSurveyHelpersModule.isLastQuestion(p2.questions, p2.index, p2.answer) then p3.send else p3.next,
				variant = buttonVariant.Emphasis,
				onActivated = p5.onSubmit,
				isLoading = var8,
				isDisabled = var8 or not inlineSurveyHelpersModule.canAdvance(p2.questions, p2.index, p2.answersByQuestionId, p2.answer)
			}
		} else {
			headerTitle = p3.surveyTitle,
			body = var9,
			primaryAction = {
				text = p3.send,
				variant = buttonVariant.Emphasis,
				onActivated = p5.onSubmit,
				isLoading = var8,
				isDisabled = var8 or not inlineSurveyHelpersModule.canSubmitAll(p2.questions, inlineSurveyHelpersModule.mergeCurrentAnswerIntoBatch(p2.answersByQuestionId, p2.questions[p2.index], p2.answer))
			}
		}
	end
}