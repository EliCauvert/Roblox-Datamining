local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local Text = require(Parent.AppCommonLib).Text
local AppFonts = require(Parent.Style).AppFonts
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local ChatDisabledIndicator = RoactModule.PureComponent:extend("ChatDisabledIndicator")
ChatDisabledIndicator.defaultProps = {
	LayoutOrder = 1,
	chatEnabled = false,
	chatDisabledText = "TRANSLATED To chat with your friends, turn on chat in your Privacy Settings.",
	privacyButtonText = "TRANSLATED Privacy Settings",
	privacyButtonEnabled = true,
	navigateToPrivacy = function() end
}

function ChatDisabledIndicator.render(p1)
	-- upvalues: WithStyleFunction (copy), Text (copy), AppFonts (copy), RoactModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: Text (upval), p1 (copy), AppFonts (upval), RoactModule (upval)
		local ScaledRelativeSize = p2.Font.SubHeader1.RelativeSize * p2.Font.BaseSize
		local TextWidth: number = Text.GetTextWidth(p1.props.privacyButtonText, AppFonts.default:getDefault(), ScaledRelativeSize)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			IndicatorInner = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 160),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				UIList = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Imagelabel = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
					Size = UDim2.new(0, 72, 0, 72)
				}),
				DisabledMessage = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = AppFonts.default:getDefault(),
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					TextSize = p2.Font.SubHeader1.RelativeSize * p2.Font.BaseSize,
					Size = UDim2.new(0.8, 0, 0.5, 0),
					Text = p1.props.chatDisabledText
				}),
				PrivacySettings = not p1.props.chatEnabled and (p1.props.privacyButtonEnabled and RoactModule.createElement("ImageButton", {
					AutoButtonColor = false,
					Size = UDim2.new(0, TextWidth + 6, 0, 36),
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					BorderSizePixel = 0,
					ScaleType = "Slice",
					SliceCenter = Rect.new(3, 3, 4, 4),
					Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
					ImageColor3 = Color3.fromRGB(0, 176, 111),
					[RoactModule.Event.Activated] = p1.props.navigateToPrivacy
				}, {
					Textlabel = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Font = AppFonts.default:getDefault(),
						TextSize = ScaledRelativeSize,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						Text = p1.props.privacyButtonText,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				}))
			})
		})
	end)
end

return ChatDisabledIndicator