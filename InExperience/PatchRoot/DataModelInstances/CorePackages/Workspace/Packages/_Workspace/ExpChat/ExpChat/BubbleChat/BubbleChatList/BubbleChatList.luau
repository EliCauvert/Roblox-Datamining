local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local chatBubbleModule = require(expChat.BubbleChat.ChatBubble)
local globalFlagsModule = require(expChat.GlobalFlags)
local bubbleChatList = roactModule.PureComponent:extend("BubbleChatList")
local getFFlagChatTranslationUIEnabledBubbleChatModule = require(expChat.Flags.getFFlagChatTranslationUIEnabledBubbleChat)
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(expChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled

function bubbleChatList.getDerivedStateFromProps(p0, p1)
	-- upvalues: list (ref), getFFlagChatTranslationUIEnabledBubbleChatModule (ref), fFlagExpChatPresetChatEnabled (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref)
	local t = {}
	
	if p1.bubbles then
		for i, v in ipairs(p1.bubbles) do
			if not list.findWhere(p0.messages, function(p2, _)
				-- upvalues: v (ref)
				return p2.messageId == v.messageId
			end) then
				table.insert(t, { fadingOut = true, messageId = v.messageId })
			end
		end
	end
	for i, v in ipairs(p0.messages) do
		table.insert(t, {
			fadingOut = false,
			messageId = v.messageId,
			text = v.text,
			translation = if getFFlagChatTranslationUIEnabledBubbleChatModule() then v.translation else nil,
			useTranslation = if getFFlagChatTranslationUIEnabledBubbleChatModule() then v.useTranslation else nil,
			timestamp = tonumber(tostring(v.timestamp):sub(-9)) or v.timestamp,
			bubbleChatMessageProperties = v.bubbleChatMessageProperties,
			presetId = if fFlagExpChatPresetChatEnabled then v.presetId else nil,
			textChatMessageInstance = if getFFlagExpChatUseUpdatedMessageRenderedModule() then v.textChatMessageInstance else nil
		})
	end
	return { bubbles = t }
end

function bubbleChatList.init(p3, p4)
	-- upvalues: list (ref)
	p3.state = {}
	
	if (not p4.messages or #p4.messages == 0) and p4.onLastBubbleFadeOut then
		p4.onLastBubbleFadeOut()
	end
	function p3.onBubbleFadeOut(p5)
		-- upvalues: list (copy), p3 (ref)
		local var9 = list.filter(p3.state.bubbles, function(p6)
			-- upvalues: p5 (ref)
			return p6.messageId ~= p5
		end)
		
		if #var9 == 0 and p3.props.onLastBubbleFadeOut then
			p3.props.onLastBubbleFadeOut()
			
			return
		end
		p3:setState({ bubbles = var9 })
	end
end

function bubbleChatList.render(p7)
	-- upvalues: roactModule (ref), globalFlagsModule (ref), chatBubbleModule (ref), getFFlagChatTranslationUIEnabledBubbleChatModule (ref), fFlagExpChatPresetChatEnabled (ref), getFFlagExpChatUseUpdatedMessageRenderedModule (ref)
	local t = {}
	local chatSettings = p7.props.chatSettings
	t.Layout = roactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, chatSettings.BubblesSpacing)
	})
	t.CaretPadding = p7.props.chatSettings.TailVisible and (globalFlagsModule.AvatarChatEnabled and (p7.props.showCaret and roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 8) })))
	
	for i, v in ipairs(p7.state.bubbles) do
		local var11 = i == #p7.state.bubbles
		local var12 = if var11 then p7.props.renderFirstInsert else nil
		local insertSize = p7.props.insertSize
		local text = v.text
		local translation = v.translation
		
		if v.bubbleChatMessageProperties then
			local bubbleChatMessageProperties = v.bubbleChatMessageProperties
			
			if bubbleChatMessageProperties:IsA("TextChatMessageProperties") then
				if bubbleChatMessageProperties.Text ~= "" then
					text = bubbleChatMessageProperties.Text
				end
				if bubbleChatMessageProperties.Translation ~= "" then
					translation = bubbleChatMessageProperties.Translation
				end
			end
		end
		t["Bubble" .. v.messageId] = roactModule.createElement(chatBubbleModule, {
			messageId = v.messageId,
			text = text or "",
			translation = if getFFlagChatTranslationUIEnabledBubbleChatModule() then translation else nil,
			useTranslation = if getFFlagChatTranslationUIEnabledBubbleChatModule() then v.useTranslation else nil,
			timestamp = v.timestamp or 0,
			isMostRecent = var11,
			theme = p7.props.theme,
			fadingOut = v.fadingOut,
			onFadeOut = p7.onBubbleFadeOut,
			chatSettings = chatSettings,
			renderInsert = var12,
			insertSize = insertSize,
			showCaret = p7.props.showCaret,
			clientSettings = p7.props.clientSettings,
			bubbleChatMessageProperties = v.bubbleChatMessageProperties,
			presetId = if fFlagExpChatPresetChatEnabled then v.presetId else nil,
			isTextChatServiceOn = p7.props.isTextChatServiceOn,
			textChatMessageInstance = if getFFlagExpChatUseUpdatedMessageRenderedModule() then v.textChatMessageInstance else nil
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = p7.props.isVisible,
		Size = UDim2.fromScale(1, 1)
	}, t)
end

return bubbleChatList