local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local SendButton = RoactModule.PureComponent:extend("SendButton")
SendButton.defaultProps = {
	sendText = "Send",
	sentText = "Sent!",
	sendingText = "Sending..",
	failedText = "Failed",
	sentStatus = nil,
	isLoading = false,
	onActivated = function()
		-- upvalues: PromiseModule (copy)
		return PromiseModule.resolve()
	end
}

function SendButton.render(p1)
	-- upvalues: UIBloxModule (copy), Text (copy), RoactModule (copy), Skeleton (copy), Radius (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), Text (upval), RoactModule (upval), Skeleton (upval), Radius (upval)
		local SentText = if p1.props.sentStatus == "sent" then p1.props.sentText elseif p1.props.sentStatus == "sending" then p1.props.sendingText elseif p1.props.sentStatus == "failed" then p1.props.failedText else p1.props.sendText
		local BodyFont = p2.Font.Body.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local TextWidth: number = Text.GetTextWidth(SentText, BodyFont, ScaledBaseSize)
		local Frame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			inactiveButton = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				TextSize = ScaledBaseSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				Font = BodyFont,
				TextXAlignment = Enum.TextXAlignment.Right,
				Text = SentText
			})
		})
		local Frame1 = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			activeButton = RoactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				ImageColor3 = p2.Theme.SecondaryDefault.Color,
				ImageTransparency = p2.Theme.SecondaryDefault.Transparency,
				Image = "rbxasset:///textures/ui/LuaDiscussions/buttonStroke.png",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 8, 8),
				Size = UDim2.new(1, 0, 1, 0),
				[RoactModule.Event.Activated] = p1.props.onActivated
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				interior = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
					Size = UDim2.new(1, -2, 1, -2)
				}, {
					layout = RoactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					Label = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, TextWidth, 0, ScaledBaseSize),
						Text = SentText,
						Font = BodyFont,
						TextSize = ScaledBaseSize,
						TextColor3 = p2.Theme.SecondaryContent.Color,
						TextTransparency = p2.Theme.SecondaryContent.Transparency
					})
				})
			})
		})
		
		return if p1.props.isLoading then RoactModule.createElement(Skeleton, {
			Size = UDim2.new(0, TextWidth + 14, 0, 32),
			radius = Radius.Small
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, TextWidth + 14, 0, 32)
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			element = p1.props.sentStatus and Frame or Frame1
		}) or RoactModule.createElement(Skeleton, {
			Size = UDim2.new(0, TextWidth + 14, 0, 32),
			radius = Radius.Small
		})
	end)
end

return SendButton