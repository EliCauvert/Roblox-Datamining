local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local fFlagExpChatPresetTrayDismissAnalyticsModule = require(expChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local emojiUnicodeToIdModule = require(expChat.PresetChat.emojiUnicodeToId)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatBlockExpressionTrayFromRBXWhisperModule = require(expChat.Flags.FFlagExpChatBlockExpressionTrayFromRBXWhisper)
local useOnEmojiActivated = expChatSharedModule.Logger:new("ExpChat/PresetChat/useOnEmojiActivated")

local function _()
	-- upvalues: textChatService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(p1)
	-- upvalues: useStore (ref), signalsReactModule (ref), getMessagesStoreModule (ref), reactModule (ref), fFlagExpChatPresetTrayDismissAnalyticsModule (ref), getPresetChatStoreModule (ref), emojiUnicodeToIdModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), selectSelectedTabNameModule (ref), useOnEmojiActivated (ref), fFlagExpChatBlockExpressionTrayFromRBXWhisperModule (ref), textChatService (ref)
	local var1 = useStore()
	local var2 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	local textChannel = p1.textChannel
	local onSendChat = p1.onSendChat
	local onSendGlobalChat = p1.onSendGlobalChat
	local closePresetTray = p1.closePresetTray
	
	return reactModule.useCallback(function(p2)
		-- upvalues: fFlagExpChatPresetTrayDismissAnalyticsModule (copy), getPresetChatStoreModule (copy), emojiUnicodeToIdModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), selectSelectedTabNameModule (copy), var1 (ref), var2 (ref), useOnEmojiActivated (copy), onSendGlobalChat (ref), onSendChat (ref), fFlagExpChatBlockExpressionTrayFromRBXWhisperModule (copy), textChannel (ref), textChatService (copy), closePresetTray (ref)
		if fFlagExpChatPresetTrayDismissAnalyticsModule then
			local var3 = getPresetChatStoreModule(false)
			
			if var3.getIsTrayOpen(false) then
				var3.incrementPresetClickCount(emojiUnicodeToIdModule(p2))
			end
		end
		local var4 = getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(var1:getState()) == "RBXGlobal"
		
		if not var2 then
			useOnEmojiActivated:debug("Emoji activated but the local user can't chat; skipping send.")
		elseif var4 and onSendGlobalChat then
			onSendGlobalChat(p2)
		elseif not onSendChat then
			useOnEmojiActivated:warning("Emoji activated but no chat send callback was provided; skipping send.")
		elseif fFlagExpChatBlockExpressionTrayFromRBXWhisperModule and textChannel and string.find(textChannel.Name, "^RBXWhisper") then
			local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
			local var5 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
			
			if var5 then
				onSendChat(p2, nil, nil, var5)
			else
				useOnEmojiActivated:warning("Emoji activated on a whisper channel but there is no RBXGeneral; skipping send.")
			end
		else
			onSendChat(p2)
		end
		closePresetTray()
	end, {
		var1, var2,
		if fFlagExpChatBlockExpressionTrayFromRBXWhisperModule then textChannel or false else false,
		onSendChat or false, onSendGlobalChat or false, closePresetTray
	})
end