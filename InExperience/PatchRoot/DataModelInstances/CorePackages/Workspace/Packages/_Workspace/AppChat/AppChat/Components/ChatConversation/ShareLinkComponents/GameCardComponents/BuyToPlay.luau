local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local constantsModule = require(appChat.Constants)
local playButtonModule = require(script.Parent.PlayButton)
local fitFrameVerticalModule = require(appChat.Components.ChatConversation.AssetCardComponents.FitFrameVertical)
local buyToPlay = roactModule.PureComponent:extend("BuyToPlay")
buyToPlay.defaultProps = { text = "Buy to play!", gamePrice = 100 }

function buyToPlay.render(p0)
	-- upvalues: UIBloxModule (ref), roactModule (ref), fitFrameVerticalModule (ref), constantsModule (ref), playButtonModule (ref)
	return UIBloxModule.Style.withStyle(function(p1)
		-- upvalues: roactModule (copy), fitFrameVerticalModule (copy), constantsModule (copy), p0 (ref), playButtonModule (copy)
		return roactModule.createElement(fitFrameVerticalModule, {
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 6)
		}, {
			gamePriceFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 16)
			}, {
				layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 4)
				}),
				robuxIcon = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, 16, 1, 0),
					Image = constantsModule.SmallRobuxIcon,
					ImageColor3 = p1.Theme.ContextualPrimaryDefault.Color
				}),
				priceLabel = roactModule.createElement("TextLabel", {
					TextSize = 16,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -16, 1, 0),
					Text = p0.props.gamePrice,
					TextColor3 = p1.Theme.ContextualPrimaryDefault.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = Enum.Font.Gotham
				})
			}),
			playButton = roactModule.createElement(playButtonModule, {
				LayoutOrder = 2,
				placeId = p0.placeId,
				text = p0.props.text
			})
		})
	end)
end

return buyToPlay