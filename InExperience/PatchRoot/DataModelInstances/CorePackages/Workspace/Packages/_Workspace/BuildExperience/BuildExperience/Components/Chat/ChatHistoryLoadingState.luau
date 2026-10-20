local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge",
		testId = "ChatHistoryLoadingState",
		Size = UDim2.fromScale(1, 1)
	}, {
		UserMessage = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Spacer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill" }),
			Bubble = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				testId = "ChatHistoryLoadingState.UserMessage",
				Size = UDim2.new(0.68, 0, 0, UseTokensResult.Size.Size_1200),
				radius = Radius.Large
			})
		}),
		AgentResponse = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y"
		}, {
			Line1 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				testId = "ChatHistoryLoadingState.AgentLine1",
				Size = UDim2.new(0.92, 0, 0, UseTokensResult.Size.Size_300),
				radius = Radius.Small
			}),
			Line2 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				testId = "ChatHistoryLoadingState.AgentLine2",
				Size = UDim2.new(0.78, 0, 0, UseTokensResult.Size.Size_300),
				radius = Radius.Small
			}),
			Line3 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 3,
				testId = "ChatHistoryLoadingState.AgentLine3",
				Size = UDim2.new(0.54, 0, 0, UseTokensResult.Size.Size_300),
				radius = Radius.Small
			})
		}),
		PlaytestCard = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			testId = "ChatHistoryLoadingState.PlaytestCard",
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2400 + UseTokensResult.Size.Size_800),
			radius = Radius.Medium
		})
	})
end