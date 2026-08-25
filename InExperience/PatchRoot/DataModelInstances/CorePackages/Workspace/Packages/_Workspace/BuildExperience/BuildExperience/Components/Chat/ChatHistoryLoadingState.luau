local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge",
		testId = "ChatHistoryLoadingState",
		Size = UDim2.fromScale(1, 1)
	}, {
		UserMessage = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill" }),
			Bubble = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				testId = "ChatHistoryLoadingState.UserMessage",
				Size = UDim2.new(0.68, 0, 0, var2.Size.Size_1200),
				radius = radius.Large
			})
		}),
		AgentResponse = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y"
		}, {
			Line1 = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				testId = "ChatHistoryLoadingState.AgentLine1",
				Size = UDim2.new(0.92, 0, 0, var2.Size.Size_300),
				radius = radius.Small
			}),
			Line2 = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				testId = "ChatHistoryLoadingState.AgentLine2",
				Size = UDim2.new(0.78, 0, 0, var2.Size.Size_300),
				radius = radius.Small
			}),
			Line3 = reactModule.createElement(skeleton, {
				LayoutOrder = 3,
				testId = "ChatHistoryLoadingState.AgentLine3",
				Size = UDim2.new(0.54, 0, 0, var2.Size.Size_300),
				radius = radius.Small
			})
		}),
		PlaytestCard = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			testId = "ChatHistoryLoadingState.PlaytestCard",
			Size = UDim2.new(1, 0, 0, var2.Size.Size_2400 + var2.Size.Size_800),
			radius = radius.Medium
		})
	})
end