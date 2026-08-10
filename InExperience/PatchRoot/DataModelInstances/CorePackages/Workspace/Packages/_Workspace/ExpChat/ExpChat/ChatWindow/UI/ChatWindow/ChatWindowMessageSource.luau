local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local useStableSignal = require(parent.ChatUIPrimitives).Hooks.useStableSignal
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local chatWindowModule = require(script.Parent.ChatWindow)
local createMessageChildrenModule = require(script.Parent.createMessageChildren)
local useV2MessagePoolModule = require(expChat.ChatWindow.UI.BottomLockedScrollViewV3.useV2MessagePool)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatRewriteInlineModule = require(expChat.Flags.FFlagExpChatRewriteInline)
local getFFlagChatWindowUseCallbackOptimizationsModule = require(expChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs

return function(p0) --[[ line: 64 | named "ChatWindowMessageSource" ]]
	-- upvalues: useStableSignal (ref), reactModule (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), getMessagesStoreModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), useV2MessagePoolModule (ref), fFlagExpChatRewriteInlineModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), createMessageChildrenModule (ref), chatWindowModule (ref), dictionary (ref)
	local var10, var11 = useStableSignal({})
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function(p1) --[[ line: 69 ]]
		-- upvalues: p0 (ref)
		p0.resetTargetChannel()
		local var16 = tonumber(p1.userId)
		
		if var16 then
			p0.activateWhisperMode(var16)
		end
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { p0.resetTargetChannel, p0.activateWhisperMode } else nil)
	local textTransparency = p0.textTransparency or reactModule.useBinding(0)
	local var15 = if fFlagExpChatEnableV2ChatWindowModule then if fFlagExpChatEnableV2ChatWindowModule then useV2MessagePoolModule({
		enabled = true,
		visible = p0.visible,
		messagesStore = getMessagesStoreModule(false),
		textTransparency = textTransparency,
		chatWindowSettings = p0.chatWindowSettings or {},
		isSpatialUIEnabled = p0.isSpatialUIEnabled or false,
		onTextMessageLabelButtonActivated = var13,
		targetTextChannel = p0.targetTextChannel,
		isChannelBarVisible = p0.isChannelBarVisible,
		showTranslationButton = p0.showTranslationButton or false,
		chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then p0.transparencyValue else nil,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p0.selectedChannelName else nil
	}).children else nil else reactModule.useMemo(function() --[[ line: 106 ]]
		-- upvalues: fFlagExpChatEnableV2ChatWindowModule (copy), createMessageChildrenModule (copy), p0 (ref), textTransparency (ref), var13 (ref)
		return if fFlagExpChatEnableV2ChatWindowModule then nil else createMessageChildrenModule({
			messages = p0.messages or {},
			verifiedUserIds = p0.verifiedUserIds or {},
			textTransparency = textTransparency,
			transparencyValue = p0.transparencyValue,
			chatWindowSettings = p0.chatWindowSettings,
			showTranslationButton = p0.showTranslationButton or false,
			isSpatialUIEnabled = p0.isSpatialUIEnabled,
			onTextMessageLabelButtonActivated = var13
		})
	end, {
		p0.messages, p0.verifiedUserIds, textTransparency, p0.transparencyValue,
		p0.chatWindowSettings, p0.showTranslationButton, p0.isSpatialUIEnabled, var13
	})
	
	if var12.current ~= var15 then
		var11(var15 or {})
		var12.current = var15
	end
	return reactModule.createElement(chatWindowModule, dictionary.join(p0, { messageComponentsSignal = var10 }))
end