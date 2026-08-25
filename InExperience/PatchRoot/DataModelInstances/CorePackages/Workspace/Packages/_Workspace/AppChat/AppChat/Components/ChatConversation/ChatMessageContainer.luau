local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local avatarCircle = require(appChat.SocialLibraries).Components.AvatarCircle
local roactFitComponents = require(parent.LuaSocialLibrariesDeps).RoactFitComponents
local withStyle = require(parent.UIBlox).Style.withStyle
local loggerModule = require(script.Parent.Logger)
local noticeTextModule = require(script.Parent.NoticeText)
local systemMessageModule = require(script.Parent.SystemMessage)
local chatMessageContainer = roactModule.PureComponent:extend("ChatMessageContainer")
chatMessageContainer.defaultProps = {
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
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function()
		-- upvalues: loggerModule (ref)
		loggerModule:warning("renderMessage was not passed to ChatMessage")
	end
}

function chatMessageContainer.init(p0)
	function p0.onAvatarActivated()
		-- upvalues: p0 (ref)
		if p0.props.viewProfileOnAvatarPressed then
			p0.props.openViewProfile(p0.props.senderUserId)
		end
	end
end

function chatMessageContainer.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), roactFitComponents (ref), systemMessageModule (ref), avatarCircle (ref), noticeTextModule (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), roactFitComponents (copy), systemMessageModule (copy), avatarCircle (copy), noticeTextModule (copy)
		local imageLabel
		local var6 = if not p1.props.showDateTime then (if p1.props.isNewSender then 10 else 2) + p1.props.messageTypePaddingOffset else 0
		local var7 = if p1.props.displayName == "" then p1.props.unknownUserText else p1.props.displayName
		local var8 = if p1.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right
		local moderated = p1.props.moderated or p1.props.filteredForReceivers
		local createElement = roactModule.createElement
		local fitFrameVertical = roactFitComponents.FitFrameVertical
		local t = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var8,
			width = UDim.new(1, 0)
		}
		local t_1 = {
			DateTime = p1.props.showDateTime and roactModule.createElement(systemMessageModule, {
				LayoutOrder = 1,
				maxWidth = 1000,
				Text = p1.props.sent:GetLongRelativeTime()
			})
		}
		local createElement_1 = roactModule.createElement
		local fitFrameVertical_1 = roactFitComponents.FitFrameVertical
		local t_2 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = var8,
			margin = {
				right = 0,
				bottom = 0,
				top = var6,
				left = if p1.props.thumbnail then 8 else 44
			},
			width = UDim.new(1, 0)
		}
		local t_3 = {
			Avatar = p1.props.thumbnail and (roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(0, 36, 0, 36)
			}, {
				AvatarCircle = roactModule.createElement(avatarCircle, {
					circleColor3 = p1.props.BackgroundColor3 or p2.Theme.BackgroundDefault.Color,
					circleInteriorBackgroundColor3 = p1.props.BackgroundColor3 or p2.Theme.BackgroundDefault.Color,
					onActivated = p1.onAvatarActivated,
					thumbnails = { p1.props.thumbnail }
				})
			}) or nil)
		}
		local createElement_2 = roactModule.createElement
		local fitFrameVertical_2 = roactFitComponents.FitFrameVertical
		local t_4 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var8,
			margin = {
				top = 0,
				right = 0,
				bottom = 0,
				left = if p1.props.isIncoming then 5 else 0
			},
			width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
		}
		local t_5 = {
			DisplayNameContainer = p1.props.displayName and roactModule.createElement(roactFitComponents.FitFrameVertical, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				margin = { top = 0, left = 6, right = 0, bottom = 0 },
				width = UDim.new(0, p1.props.messageMaxWidth - 6)
			}, {
				DisplayName = roactModule.createElement(roactFitComponents.FitTextLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Font = p2.Font.Footer.Font,
					maximumWidth = p1.props.messageMaxWidth - 6,
					Size = UDim2.new(1, 0, 1, 0),
					Text = var7,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					width = roactFitComponents.FitTextLabel.Width.FitToText
				})
			})
		}
		local createElement_3 = roactModule.createElement
		local fitFrameVertical_3 = roactFitComponents.FitFrameVertical
		local t_6 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = var8,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = UDim.new(0, 10),
			width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
		}
		local t_7 = {}
		
		if not p1.props.failed then
			imageLabel = p1.props.moderated and roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png",
				ImageColor3 = p2.Theme.Alert.Color,
				ImageTransparency = p2.Theme.Alert.Transparency,
				LayoutOrder = if p1.props.isIncoming then 2 else 1,
				Size = UDim2.new(0, 18, 0, 18)
			})
		end
		t_7.AlertIcon = imageLabel
		t_7.Message = p1.props.renderMessage({ LayoutOrder = if p1.props.isIncoming then 1 else 2 })
		t_5.MessageWithAlertIcon = createElement_3(fitFrameVertical_3, t_6, t_7)
		t_3.MessageWithDisplayName = createElement_2(fitFrameVertical_2, t_4, t_5)
		t_1.MessageWithAvatar = createElement_1(fitFrameVertical_1, t_2, t_3)
		t_1.Notice = moderated and roactModule.createElement(noticeTextModule, {
			LayoutOrder = 3,
			Font = p1.props.Font,
			HorizontalAlignment = var8,
			Text = if p1.props.moderated then p1.props.messageModeratedNoticeText else p1.props.messageDefaultNoticeText,
			TextColor3 = if p1.props.moderated then p2.Theme.Alert.Color else p2.Theme.UIDefault.Color,
			TextTransparency = if p1.props.moderated then p2.Theme.Alert.Transparency else p2.Theme.UIDefault.Transparency,
			TextXAlignment = if p1.props.isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
			margin = {
				top = 0,
				bottom = 0,
				left = if p1.props.isIncoming then 54 else 0,
				right = if not p1.props.isIncoming then 10 else 0
			},
			maxWidth = p1.props.parentWidth,
			width = UDim.new(1, if p1.props.isIncoming then -44 else 0)
		})
		t_1.debug = p1.props.debugElement or nil
		
		return createElement(fitFrameVertical, t, t_1)
	end)
end

return chatMessageContainer