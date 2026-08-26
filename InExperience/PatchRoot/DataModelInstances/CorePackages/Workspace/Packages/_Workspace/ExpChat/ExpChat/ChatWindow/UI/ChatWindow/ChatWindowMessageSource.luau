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

return function(p1)
	-- upvalues: useStableSignal (ref), reactModule (ref), getFFlagChatWindowUseCallbackOptimizationsModule (ref), getMessagesStoreModule (ref), fFlagExpChatEnableV2ChatWindowModule (ref), useV2MessagePoolModule (ref), fFlagExpChatRewriteInlineModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), createMessageChildrenModule (ref), chatWindowModule (ref), dictionary (ref)
	local var1, var2 = useStableSignal({})
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		p1.resetTargetChannel()
		local var5 = tonumber(p2.userId)
		
		if var5 then
			p1.activateWhisperMode(var5)
		end
	end, if getFFlagChatWindowUseCallbackOptimizationsModule() then { p1.resetTargetChannel, p1.activateWhisperMode } else nil)
	local textTransparency = p1.textTransparency or reactModule.useBinding(0)
	local var5 = if fFlagExpChatEnableV2ChatWindowModule then if fFlagExpChatEnableV2ChatWindowModule then useV2MessagePoolModule({
		enabled = true,
		visible = p1.visible,
		messagesStore = getMessagesStoreModule(false),
		textTransparency = textTransparency,
		chatWindowSettings = p1.chatWindowSettings or {},
		isSpatialUIEnabled = p1.isSpatialUIEnabled or false,
		onTextMessageLabelButtonActivated = var4,
		targetTextChannel = p1.targetTextChannel,
		isChannelBarVisible = p1.isChannelBarVisible,
		showTranslationButton = p1.showTranslationButton or false,
		chatWindowTransparencyBindable = if fFlagExpChatRewriteInlineModule then p1.transparencyValue else nil,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p1.selectedChannelName else nil
	}).children else nil else reactModule.useMemo(function()
		-- upvalues: fFlagExpChatEnableV2ChatWindowModule (copy), createMessageChildrenModule (copy), p1 (ref), textTransparency (ref), var4 (ref)
		return if fFlagExpChatEnableV2ChatWindowModule then nil else createMessageChildrenModule({
			messages = p1.messages or {},
			verifiedUserIds = p1.verifiedUserIds or {},
			textTransparency = textTransparency,
			transparencyValue = p1.transparencyValue,
			chatWindowSettings = p1.chatWindowSettings,
			showTranslationButton = p1.showTranslationButton or false,
			isSpatialUIEnabled = p1.isSpatialUIEnabled,
			onTextMessageLabelButtonActivated = var4
		})
	end, {
		p1.messages, p1.verifiedUserIds, textTransparency, p1.transparencyValue,
		p1.chatWindowSettings, p1.showTranslationButton, p1.isSpatialUIEnabled, var4
	})
	
	if var3.current ~= var5 then
		var2(var5 or {})
		var3.current = var5
	end
	return reactModule.createElement(chatWindowModule, dictionary.join(p1, { messageComponentsSignal = var1 }))
end