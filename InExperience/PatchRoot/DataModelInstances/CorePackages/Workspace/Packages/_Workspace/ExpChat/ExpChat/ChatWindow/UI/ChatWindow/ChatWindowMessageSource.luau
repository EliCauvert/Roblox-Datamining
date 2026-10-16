local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary
local UseStableSignalFunction = require(Parent.ChatUIPrimitives).Hooks.useStableSignal
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local ChatWindowModule = require(script.Parent.ChatWindow)
local CreateMessageChildrenModule = require(script.Parent.createMessageChildren)
local UseV2MessagePoolModule = require(ExpChat.ChatWindow.UI.BottomLockedScrollViewV3.useV2MessagePool)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatRewriteInlineModule = require(ExpChat.Flags.FFlagExpChatRewriteInline)
local GetFFlagChatWindowUseCallbackOptimizationsModule = require(ExpChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDisableNameTapActionInGlobalChatModule = require(ExpChat.Flags.FFlagExpChatDisableNameTapActionInGlobalChat)
local IsGlobalChatMessageModule = require(ExpChat.isGlobalChatMessage)

return function(p1) --[[ Line: 67 | Named "ChatWindowMessageSource" ]]
	-- upvalues: UseStableSignalFunction (copy), ReactModule (copy), FFlagExpChatDisableNameTapActionInGlobalChatModule (copy), IsGlobalChatMessageModule (copy), GetFFlagChatWindowUseCallbackOptimizationsModule (copy), GetMessagesStoreModule (copy), FFlagExpChatEnableV2ChatWindowModule (copy), UseV2MessagePoolModule (copy), FFlagExpChatRewriteInlineModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), CreateMessageChildrenModule (copy), ChatWindowModule (copy), Dictionary (copy)
	local UseStableSignalResult, UseStableSignalResult2 = UseStableSignalFunction({})
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 72 ]]
		-- upvalues: FFlagExpChatDisableNameTapActionInGlobalChatModule (upval), IsGlobalChatMessageModule (upval), p1 (copy)
		if FFlagExpChatDisableNameTapActionInGlobalChatModule and IsGlobalChatMessageModule(p2) then return end
		p1.resetTargetChannel()
		local Number: number? = tonumber(p2.userId)
		
		if Number then
			p1.activateWhisperMode(Number)
		end
	end, if GetFFlagChatWindowUseCallbackOptimizationsModule() then { p1.resetTargetChannel, p1.activateWhisperMode } else nil)
	local MessagesStoreModule = GetMessagesStoreModule(false)
	local UseBindingResult = ReactModule.useBinding(0)
	local TextTransparency = p1.textTransparency or UseBindingResult
	local Children = if FFlagExpChatEnableV2ChatWindowModule then UseV2MessagePoolModule({
		enabled = true,
		visible = p1.visible,
		messagesStore = MessagesStoreModule,
		textTransparency = TextTransparency,
		chatWindowSettings = p1.chatWindowSettings or {},
		isSpatialUIEnabled = p1.isSpatialUIEnabled or false,
		onTextMessageLabelButtonActivated = UseResult,
		targetTextChannel = p1.targetTextChannel,
		isChannelBarVisible = p1.isChannelBarVisible,
		showTranslationButton = p1.showTranslationButton or false,
		chatWindowTransparencyBindable = if FFlagExpChatRewriteInlineModule then p1.transparencyValue else nil,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() then p1.selectedChannelName else nil
	}).children else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 113 ]]
		-- upvalues: FFlagExpChatEnableV2ChatWindowModule (upval), CreateMessageChildrenModule (upval), p1 (copy), TextTransparency (copy), UseResult (copy)
		return if FFlagExpChatEnableV2ChatWindowModule then nil else CreateMessageChildrenModule({
			messages = p1.messages or {},
			verifiedUserIds = p1.verifiedUserIds or {},
			textTransparency = TextTransparency,
			transparencyValue = p1.transparencyValue,
			chatWindowSettings = p1.chatWindowSettings,
			showTranslationButton = p1.showTranslationButton or false,
			isSpatialUIEnabled = p1.isSpatialUIEnabled,
			onTextMessageLabelButtonActivated = UseResult
		})
	end, {
		p1.messages, p1.verifiedUserIds, TextTransparency, p1.transparencyValue,
		p1.chatWindowSettings, p1.showTranslationButton, p1.isSpatialUIEnabled,
		UseResult
	})
	local Children1 = if FFlagExpChatEnableV2ChatWindowModule then Children else UseMemoResult
	
	if UseRefResult.current ~= Children1 then
		UseStableSignalResult2(Children1 or {})
		UseRefResult.current = Children1
	end
	return ReactModule.createElement(ChatWindowModule, Dictionary.join(p1, { messageComponentsSignal = UseStableSignalResult }))
end