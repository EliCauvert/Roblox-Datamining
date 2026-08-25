local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local text = require(parent.AppCommonLib).Text
local appFonts = require(parent.Style).AppFonts
local withStyle = require(parent.UIBlox).Style.withStyle
local chatDisabledIndicator = roactModule.PureComponent:extend("ChatDisabledIndicator")
chatDisabledIndicator.defaultProps = {
	LayoutOrder = 1,
	chatEnabled = false,
	chatDisabledText = "TRANSLATED To chat with your friends, turn on chat in your Privacy Settings.",
	privacyButtonText = "TRANSLATED Privacy Settings",
	privacyButtonEnabled = true,
	navigateToPrivacy = function() end
}

function chatDisabledIndicator.render(p0)
	-- upvalues: withStyle (ref), text (ref), appFonts (ref), roactModule (ref)
	return withStyle(function(p1)
		-- upvalues: text (copy), p0 (ref), appFonts (copy), roactModule (copy)
		local var2 = p1.Font.SubHeader1.RelativeSize * p1.Font.BaseSize
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p0.props.LayoutOrder
		}, {
			IndicatorInner = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 160),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				UIList = roactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Imagelabel = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
					Size = UDim2.new(0, 72, 0, 72)
				}),
				DisabledMessage = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = appFonts.default:getDefault(),
					TextColor3 = p1.Theme.TextDefault.Color,
					TextTransparency = p1.Theme.TextDefault.Transparency,
					TextSize = p1.Font.SubHeader1.RelativeSize * p1.Font.BaseSize,
					Size = UDim2.new(0.8, 0, 0.5, 0),
					Text = p0.props.chatDisabledText
				}),
				PrivacySettings = not p0.props.chatEnabled and (p0.props.privacyButtonEnabled and roactModule.createElement("ImageButton", {
					AutoButtonColor = false,
					Size = UDim2.new(0, text.GetTextWidth(p0.props.privacyButtonText, appFonts.default:getDefault(), var2) + 6, 0, 36),
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					BorderSizePixel = 0,
					ScaleType = "Slice",
					SliceCenter = Rect.new(3, 3, 4, 4),
					Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
					ImageColor3 = Color3.fromRGB(0, 176, 111),
					[roactModule.Event.Activated] = p0.props.navigateToPrivacy
				}, {
					Textlabel = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Font = appFonts.default:getDefault(),
						TextSize = var2,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						Text = p0.props.privacyButtonText,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				}))
			})
		})
	end)
end

return chatDisabledIndicator