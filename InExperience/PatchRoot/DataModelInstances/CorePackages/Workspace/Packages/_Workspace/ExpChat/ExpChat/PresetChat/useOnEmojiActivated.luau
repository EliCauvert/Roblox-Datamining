local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local FFlagExpChatPresetTrayDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local EmojiUnicodeToIdModule = require(ExpChat.PresetChat.emojiUnicodeToId)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatBlockExpressionTrayFromRBXWhisperModule = require(ExpChat.Flags.FFlagExpChatBlockExpressionTrayFromRBXWhisper)
local UseOnEmojiActivated = ExpChatSharedModule.Logger:new("ExpChat/PresetChat/useOnEmojiActivated")

local function _()
	-- upvalues: TextChatService (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	return if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
end

return function(p1)
	-- upvalues: UseStoreFunction (copy), SignalsReactModule (copy), GetMessagesStoreModule (copy), ReactModule (copy), FFlagExpChatPresetTrayDismissAnalyticsModule (copy), GetPresetChatStoreModule (copy), EmojiUnicodeToIdModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), SelectSelectedTabNameModule (copy), UseOnEmojiActivated (copy), FFlagExpChatBlockExpressionTrayFromRBXWhisperModule (copy), TextChatService (copy)
	local UseStoreResult = UseStoreFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetMessagesStoreModule(false).getCanLocalUserChat)
	local TextChannel = p1.textChannel
	local OnSendChatFunction = p1.onSendChat
	local OnSendGlobalChatFunction = p1.onSendGlobalChat
	local ClosePresetTrayFunction = p1.closePresetTray
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (upval), GetPresetChatStoreModule (upval), EmojiUnicodeToIdModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), SelectSelectedTabNameModule (upval), UseStoreResult (copy), UseSignalStateResult (copy), UseOnEmojiActivated (upval), OnSendGlobalChatFunction (copy), OnSendChatFunction (copy), FFlagExpChatBlockExpressionTrayFromRBXWhisperModule (upval), TextChannel (copy), TextChatService (upval), ClosePresetTrayFunction (copy)
		if FFlagExpChatPresetTrayDismissAnalyticsModule then
			local PresetChatStoreModule = GetPresetChatStoreModule(false)
			
			if PresetChatStoreModule.getIsTrayOpen(false) then
				PresetChatStoreModule.incrementPresetClickCount(EmojiUnicodeToIdModule(p2))
			end
		end
		local IsRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and SelectSelectedTabNameModule(UseStoreResult:getState()) == "RBXGlobal"
		
		if UseSignalStateResult then
			if IsRBXGlobal and OnSendGlobalChatFunction then
				OnSendGlobalChatFunction(p2)
			elseif OnSendChatFunction then
				if FFlagExpChatBlockExpressionTrayFromRBXWhisperModule and TextChannel and string.find(TextChannel.Name, "^RBXWhisper") then
					local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
					local RBXGeneral1 = if RBXGeneral and RBXGeneral:IsA("TextChannel") then RBXGeneral else nil
					
					if RBXGeneral1 then
						OnSendChatFunction(p2, nil, nil, RBXGeneral1)
					else
						UseOnEmojiActivated:warning("Emoji activated on a whisper channel but there is no RBXGeneral; skipping send.")
					end
				else
					OnSendChatFunction(p2)
				end
			else
				UseOnEmojiActivated:warning("Emoji activated but no chat send callback was provided; skipping send.")
			end
		else
			UseOnEmojiActivated:debug("Emoji activated but the local user can't chat; skipping send.")
		end
		ClosePresetTrayFunction()
	end, {
		UseStoreResult, UseSignalStateResult,
		FFlagExpChatBlockExpressionTrayFromRBXWhisperModule and TextChannel or false,
		OnSendChatFunction or false, OnSendGlobalChatFunction or false,
		ClosePresetTrayFunction
	})
end