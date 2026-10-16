local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local List = require(Parent.llama).List
local ChatBubbleModule = require(ExpChat.BubbleChat.ChatBubble)
local BorderlessBubbleChatModule = require(ExpChat.BubbleChat.BorderlessBubbleChat)
local IsBorderlessBubbleChatMessageModule = require(ExpChat.BubbleChat.Helpers.isBorderlessBubbleChatMessage)
local GetBubbleChatDisplayTextModule = require(ExpChat.BubbleChat.Helpers.getBubbleChatDisplayText)
local GetBubbleChatStartTimeMillisModule = require(ExpChat.BubbleChat.Helpers.getBubbleChatStartTimeMillis)
local ApplyBubbleChatMessagePropertiesTextModule = require(ExpChat.BubbleChat.Helpers.applyBubbleChatMessagePropertiesText)
local GlobalFlagsModule = require(ExpChat.GlobalFlags)
local BubbleChatList = RoactModule.PureComponent:extend("BubbleChatList")
local GetFFlagChatTranslationUIEnabledBubbleChatModule = require(ExpChat.Flags.getFFlagChatTranslationUIEnabledBubbleChat)
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local FFlagExpChatPresetChatEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local IsBorderlessBubbleChatEnabledModule = require(ExpChat.isBorderlessBubbleChatEnabled)

function BubbleChatList.getDerivedStateFromProps(p1, p2) --[[ Line: 25 ]]
	-- upvalues: IsBorderlessBubbleChatEnabledModule (copy), List (copy), IsBorderlessBubbleChatMessageModule (copy), GetFFlagChatTranslationUIEnabledBubbleChatModule (copy), FFlagExpChatPresetChatEnabled (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy), GetBubbleChatDisplayTextModule (copy), GetBubbleChatStartTimeMillisModule (copy)
	local List1 = {}
	local Message = if IsBorderlessBubbleChatEnabledModule() then p1.messages[#p1.messages] else nil
	
	if p2.bubbles then
		for _, bubble in ipairs(p2.bubbles) do
			if not List.findWhere(p1.messages, function(p3, _): boolean --[[ Line: 33 ]]
				-- upvalues: bubble (copy)
				return p3.messageId == bubble.messageId
			end) and (not IsBorderlessBubbleChatEnabledModule() or (Message == nil or not bubble.isBorderless and not IsBorderlessBubbleChatMessageModule(Message))) then
				table.insert(List1, {
					fadingOut = true,
					messageId = bubble.messageId,
					isBorderless = if IsBorderlessBubbleChatEnabledModule() then bubble.isBorderless else nil,
					borderlessText = if IsBorderlessBubbleChatEnabledModule() and bubble.isBorderless then bubble.borderlessText else nil,
					borderlessReceivedAtMillis = if IsBorderlessBubbleChatEnabledModule() and bubble.isBorderless then bubble.borderlessReceivedAtMillis else nil
				})
			end
		end
	end
	for _, message in ipairs(p1.messages) do
		local IsBorderlessBubbleChatMessageModule1 = if IsBorderlessBubbleChatEnabledModule() then IsBorderlessBubbleChatMessageModule(message) else nil
		table.insert(List1, {
			fadingOut = false,
			messageId = message.messageId,
			text = message.text,
			translation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then message.translation else nil,
			useTranslation = if GetFFlagChatTranslationUIEnabledBubbleChatModule() then message.useTranslation else nil,
			timestamp = tonumber(tostring(message.timestamp):sub(-9)) or message.timestamp,
			bubbleChatMessageProperties = message.bubbleChatMessageProperties,
			presetId = if FFlagExpChatPresetChatEnabled then message.presetId else nil,
			textChatMessageInstance = if GetFFlagExpChatUseUpdatedMessageRenderedModule() then message.textChatMessageInstance else nil,
			isBorderless = IsBorderlessBubbleChatMessageModule1,
			borderlessText = if IsBorderlessBubbleChatMessageModule1 then GetBubbleChatDisplayTextModule(message) else nil,
			borderlessReceivedAtMillis = if IsBorderlessBubbleChatMessageModule1 then GetBubbleChatStartTimeMillisModule(message) else nil
		})
	end
	return { bubbles = List1 }
end

function BubbleChatList.init(p3, p4) --[[ Line: 88 ]]
	-- upvalues: List (copy)
	p3.state = {}
	
	if (not p4.messages or #p4.messages == 0) and p4.onLastBubbleFadeOut then
		p4.onLastBubbleFadeOut()
	end
	function p3.onBubbleFadeOut(MessageId) --[[ Line: 97 ]]
		-- upvalues: List (upval), p3 (copy)
		local FilterResult = List.filter(p3.state.bubbles, function(p5): boolean --[[ Line: 98 ]]
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

function BubbleChatList.render(p3) --[[ Line: 113 ]]
	-- upvalues: RoactModule (copy), GlobalFlagsModule (copy), IsBorderlessBubbleChatEnabledModule (copy), ApplyBubbleChatMessagePropertiesTextModule (copy), BorderlessBubbleChatModule (copy), ChatBubbleModule (copy), GetFFlagChatTranslationUIEnabledBubbleChatModule (copy), FFlagExpChatPresetChatEnabled (copy), GetFFlagExpChatUseUpdatedMessageRenderedModule (copy)
	local ChatSettings = p3.props.chatSettings
	local Elements = {
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
		
		if IsBorderlessBubbleChatEnabledModule() then
			Text, Translation = ApplyBubbleChatMessagePropertiesTextModule(Text, Translation, bubble.bubbleChatMessageProperties)
		elseif bubble.bubbleChatMessageProperties then
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
		if IsBorderlessBubbleChatEnabledModule() and bubble.isBorderless then
			Elements["Bubble" .. bubble.messageId] = RoactModule.createElement(BorderlessBubbleChatModule, {
				messageId = bubble.messageId,
				text = bubble.borderlessText or "",
				timestamp = bubble.timestamp or 0,
				receivedAtMillis = bubble.borderlessReceivedAtMillis,
				isDistant = p3.props.isDistant,
				distanceTransparency = p3.props.borderlessDistanceTransparency,
				fadingOut = bubble.fadingOut,
				onFadeOut = p3.onBubbleFadeOut,
				chatSettings = ChatSettings,
				textChatMessageInstance = bubble.textChatMessageInstance
			})
		else
			Elements["Bubble" .. bubble.messageId] = RoactModule.createElement(ChatBubbleModule, {
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
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p3.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, Elements)
end

return BubbleChatList