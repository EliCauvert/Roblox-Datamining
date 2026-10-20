local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local AvatarCircle = require(AppChat.SocialLibraries).Components.AvatarCircle
local RoactFitComponents = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local LoggerModule = require(script.Parent.Logger)
local NoticeTextModule = require(script.Parent.NoticeText)
local SystemMessageModule = require(script.Parent.SystemMessage)
local ChatMessageContainer = RoactModule.PureComponent:extend("ChatMessageContainer")
ChatMessageContainer.defaultProps = {
	BackgroundColor3 = nil,
	BackgroundTransparency = nil,
	debugElement = nil,
	displayName = nil,
	failed = false,
	filteredForReceivers = false,
	isIncoming = false,
	isNewSender = false,
	parentWidth = 0,
	messageTypePaddingOffset = 0,
	moderated = false,
	messageMaxWidth = 0,
	senderUserId = nil,
	thumbnail = nil,
	viewProfileOnAvatarPressed = true,
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	unknownUserText = "PLACEHOLDER unknown user",
	Font = Enum.Font.Gotham,
	openViewProfile = function()
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function()
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("renderMessage was not passed to ChatMessage")
	end
}

function ChatMessageContainer.init(p1)
	function p1.onAvatarActivated()
		-- upvalues: p1 (copy)
		if p1.props.viewProfileOnAvatarPressed then
			p1.props.openViewProfile(p1.props.senderUserId)
		end
	end
end

function ChatMessageContainer.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), RoactFitComponents (copy), SystemMessageModule (copy), AvatarCircle (copy), NoticeTextModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), RoactFitComponents (upval), SystemMessageModule (upval), AvatarCircle (upval), NoticeTextModule (upval)
		local UnknownUserText = p1.props.displayName == "" and p1.props.unknownUserText or p1.props.displayName
		local Left = p1.props.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right
		
		return RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Left,
			width = UDim.new(1, 0)
		}, {
			DateTime = p1.props.showDateTime and RoactModule.createElement(SystemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = p1.props.sent:GetLongRelativeTime()
			}),
			MessageWithAvatar = RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Left,
				margin = {
					right = 0,
					bottom = 0,
					top = if p1.props.showDateTime then 0 else (if p1.props.isNewSender then 10 else 2) + p1.props.messageTypePaddingOffset,
					left = if p1.props.thumbnail then 8 else 44
				},
				width = UDim.new(1, 0)
			}, {
				Avatar = p1.props.thumbnail and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 36, 0, 36)
				}, {
					AvatarCircle = RoactModule.createElement(AvatarCircle, {
						circleColor3 = p1.props.BackgroundColor3 or p2.Theme.BackgroundDefault.Color,
						circleInteriorBackgroundColor3 = p1.props.BackgroundColor3 or p2.Theme.BackgroundDefault.Color,
						onActivated = p1.onAvatarActivated,
						thumbnails = { p1.props.thumbnail }
					})
				}) or nil,
				MessageWithDisplayName = RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Left,
					margin = {
						top = 0,
						right = 0,
						bottom = 0,
						left = if p1.props.isIncoming then 5 else 0
					},
					width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
				}, {
					DisplayNameContainer = p1.props.displayName and RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						margin = { top = 0, left = 6, right = 0, bottom = 0 },
						width = UDim.new(0, p1.props.messageMaxWidth - 6)
					}, {
						DisplayName = RoactModule.createElement(RoactFitComponents.FitTextLabel, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Font = p2.Font.Footer.Font,
							maximumWidth = p1.props.messageMaxWidth - 6,
							Size = UDim2.new(1, 0, 1, 0),
							Text = UnknownUserText,
							TextColor3 = p2.Theme.TextDefault.Color,
							TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
							TextTransparency = p2.Theme.TextDefault.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							width = RoactFitComponents.FitTextLabel.Width.FitToText
						})
					}),
					MessageWithAlertIcon = RoactModule.createElement(RoactFitComponents.FitFrameVertical, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 10),
						width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
					}, {
						AlertIcon = if p1.props.failed then RoactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png",
							ImageColor3 = p2.Theme.Alert.Color,
							ImageTransparency = p2.Theme.Alert.Transparency,
							LayoutOrder = if p1.props.isIncoming then 2 else 1,
							Size = UDim2.new(0, 18, 0, 18)
						}) else p1.props.moderated and RoactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png",
							ImageColor3 = p2.Theme.Alert.Color,
							ImageTransparency = p2.Theme.Alert.Transparency,
							LayoutOrder = if p1.props.isIncoming then 2 else 1,
							Size = UDim2.new(0, 18, 0, 18)
						}),
						Message = p1.props.renderMessage({ LayoutOrder = if p1.props.isIncoming then 1 else 2 })
					})
				})
			}),
			Notice = (p1.props.moderated or p1.props.filteredForReceivers) and RoactModule.createElement(NoticeTextModule, {
				LayoutOrder = 3,
				Font = p1.props.Font,
				HorizontalAlignment = Left,
				Text = p1.props.moderated and p1.props.messageModeratedNoticeText or p1.props.messageDefaultNoticeText,
				TextColor3 = p1.props.moderated and p2.Theme.Alert.Color or p2.Theme.UIDefault.Color,
				TextTransparency = p1.props.moderated and p2.Theme.Alert.Transparency or p2.Theme.UIDefault.Transparency,
				TextXAlignment = p1.props.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right,
				margin = {
					top = 0,
					bottom = 0,
					left = if p1.props.isIncoming then 54 else 0,
					right = if p1.props.isIncoming then 0 else 10
				},
				maxWidth = p1.props.parentWidth,
				width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
			}),
			debug = p1.props.debugElement or nil
		})
	end)
end

return ChatMessageContainer