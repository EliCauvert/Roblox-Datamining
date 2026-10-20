local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local List = require(Parent.llama).List
local ChatBubbleModule = require(ExpChat.BubbleChat.ChatBubble)
local GlobalFlagsModule = require(ExpChat.GlobalFlags)
local BubbleChatList = RoactModule.PureComponent:extend("BubbleChatList")
local GetFFlagChatTranslationUIEnabledBubbleChatModule = require(ExpChat.Flags.getFFlagChatTranslationUIEnabledBubbleChat)
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local FFlagExpChatPresetChatEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled

function BubbleChatList.getDerivedStateFromProps(p1, p2)
	-- upvalues: List (copy), GetFFlagChatTranslationUIEnabledBubbleChatModule (copy), FFlagExpChatPresetChatEnabled (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy)
	local List1 = {}
	
	if p2.bubbles then
		for _, bubble in ipairs(p2.bubbles) do
			if not List.findWhere(p1.messages, function(p3, _): boolean
				-- upvalues: bubble (copy)
				return p3.messageId == bubble.messageId
			end) then
				table.insert(List1, { fadingOut = true, messageId = bubble.messageId })
			end
		end
	end
	for _, message in ipairs(p1.messages) do
		table.insert(List1, {
			fadingOut = false,
			messageId = message.messageId,
			text = message.text,
			translation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then message.translation else nil,
			useTranslation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then message.useTranslation else nil,
			timestamp = tonumber(tostring(message.timestamp):sub(-9)) or message.timestamp,
			bubbleChatMessageProperties = message.bubbleChatMessageProperties,
			presetId = if FFlagExpChatPresetChatEnabled then message.presetId else nil,
			textChatMessageInstance = if GetFFlagExpChatUseUpdatedMessageRenderedModule() then message.textChatMessageInstance else nil
		})
	end
	return { bubbles = List1 }
end

function BubbleChatList.init(p3, p4)
	-- upvalues: List (copy)
	p3.state = {}
	
	if (not p4.messages or #p4.messages == 0) and p4.onLastBubbleFadeOut then
		p4.onLastBubbleFadeOut()
	end
	function p3.onBubbleFadeOut(MessageId)
		-- upvalues: List (upval), p3 (copy)
		local FilterResult = List.filter(p3.state.bubbles, function(p5): boolean
			-- upvalues: MessageId (copy)
			return p5.messageId ~= MessageId
		end)
		
		if #FilterResult == 0 and p3.props.onLastBubbleFadeOut then
			p3.props.onLastBubbleFadeOut()
			
			return
		else
			p3:setState({ bubbles = FilterResult })
		end
	end
end

function BubbleChatList.render(p3)
	-- upvalues: RoactModule (copy), GlobalFlagsModule (copy), ChatBubbleModule (copy), GetFFlagChatTranslationUIEnabledBubbleChatModule (copy), FFlagExpChatPresetChatEnabled (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy)
	local ChatSettings = p3.props.chatSettings
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, ChatSettings.BubblesSpacing)
		}),
		CaretPadding = p3.props.chatSettings.TailVisible and (if GlobalFlagsModule.AvatarChatEnabled then p3.props.showCaret and RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) }) else RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) }))
	}
	
	for i, bubble in ipairs(p3.state.bubbles) do
		local IsMostRecent = i == #p3.state.bubbles
		local RenderFirstInsert = IsMostRecent and p3.props.renderFirstInsert or nil
		local InsertSize = p3.props.insertSize
		local Text = bubble.text
		local Translation = bubble.translation
		
		if bubble.bubbleChatMessageProperties then
			local BubbleChatMessageProperties = bubble.bubbleChatMessageProperties
			
			if BubbleChatMessageProperties:IsA("TextChatMessageProperties") then
				if BubbleChatMessageProperties.Text ~= "" then
					Text = BubbleChatMessageProperties.Text
				end
				if BubbleChatMessageProperties.Translation ~= "" then
					Translation = BubbleChatMessageProperties.Translation
				end
			end
		end
		config["Bubble" .. bubble.messageId] = RoactModule.createElement(ChatBubbleModule, {
			messageId = bubble.messageId,
			text = Text or "",
			translation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then Translation else nil,
			useTranslation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then bubble.useTranslation else nil,
			timestamp = bubble.timestamp or 0,
			isMostRecent = IsMostRecent,
			theme = p3.props.theme,
			fadingOut = bubble.fadingOut,
			onFadeOut = p3.onBubbleFadeOut,
			chatSettings = ChatSettings,
			renderInsert = RenderFirstInsert,
			insertSize = InsertSize,
			showCaret = p3.props.showCaret,
			clientSettings = p3.props.clientSettings,
			bubbleChatMessageProperties = bubble.bubbleChatMessageProperties,
			presetId = if FFlagExpChatPresetChatEnabled then bubble.presetId else nil,
			isTextChatServiceOn = p3.props.isTextChatServiceOn,
			textChatMessageInstance = if GetFFlagExpChatUseUpdatedMessageRenderedModule() then bubble.textChatMessageInstance else nil
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p3.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, config)
end

return BubbleChatList