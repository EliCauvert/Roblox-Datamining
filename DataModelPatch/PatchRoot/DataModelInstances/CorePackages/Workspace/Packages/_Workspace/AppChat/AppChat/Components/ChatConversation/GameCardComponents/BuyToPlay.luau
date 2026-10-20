local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ConstantsModule = require(AppChat.Constants)
local PlayButtonModule = require(script.Parent.PlayButton)
local FitFrameVerticalModule = require(AppChat.Components.ChatConversation.AssetCardComponents.FitFrameVertical)
local BuyToPlay = RoactModule.PureComponent:extend("BuyToPlay")
BuyToPlay.defaultProps = { text = "Buy to play!", gamePrice = 100 }

function BuyToPlay.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), FitFrameVerticalModule (copy), ConstantsModule (copy), PlayButtonModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), FitFrameVerticalModule (upval), ConstantsModule (upval), p1 (copy), PlayButtonModule (upval)
		return RoactModule.createElement(FitFrameVerticalModule, {
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 6)
		}, {
			gamePriceFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 16)
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 4)
				}),
				robuxIcon = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, 16, 1, 0),
					Image = ConstantsModule.SmallRobuxIcon,
					ImageColor3 = p2.Theme.ContextualPrimaryDefault.Color
				}),
				priceLabel = RoactModule.createElement("TextLabel", {
					TextSize = 16,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -16, 1, 0),
					Text = p1.props.gamePrice,
					TextColor3 = p2.Theme.ContextualPrimaryDefault.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = Enum.Font.Gotham
				})
			}),
			playButton = RoactModule.createElement(PlayButtonModule, {
				LayoutOrder = 2,
				placeId = p1.placeId,
				text = p1.props.text
			})
		})
	end)
end

return BuyToPlay