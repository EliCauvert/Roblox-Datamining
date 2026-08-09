local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local actionCompletedRowModule = require(buildExperience.Components.ChatSheet.ActionCompletedRow)
local view = foundationModule.View
local agentTurnFeedbackModule = require(script.Parent.AgentTurnFeedback)
local playtestCompletedCardModule = require(script.Parent.PlaytestCompletedCard)

return function(p0) --[[ line: 26 | named "ChatInlineTurnFooter" ]]
	-- upvalues: reactModule (ref), playtestCompletedCardModule (ref), actionCompletedRowModule (ref), view (ref), agentTurnFeedbackModule (ref)
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xsmall size-full-0 auto-y"
		}, {
			Footer = if p0.inlineKind == "playtestCard" and p0.onPlaytest then reactModule.createElement(playtestCompletedCardModule, {
				LayoutOrder = 1,
				stepCount = p0.stepCount,
				onPlaytest = p0.onPlaytest,
				isLoading = p0.isPlaytestLoading
			}) else reactModule.createElement(actionCompletedRowModule, { LayoutOrder = 1, count = p0.stepCount }),
			Feedback = reactModule.createElement(agentTurnFeedbackModule, {
				LayoutOrder = 2,
				testId = "ChatInlineTurnFooter.UserFeedback",
				turnFeedbackIds = p0.turnFeedbackIds
			})
		})
	})
end