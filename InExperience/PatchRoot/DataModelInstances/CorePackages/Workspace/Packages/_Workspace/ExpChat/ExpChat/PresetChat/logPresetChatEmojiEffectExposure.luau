local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local ExpChatPresetChatEmojiEffectExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local IsMessageForOpenChannelModule = require(ExpChat.isMessageForOpenChannel)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local GetMessageSettingsModule = require(ExpChat.ChatWindow.Helpers.getMessageSettings)
local GetMessageTextModule = require(ExpChat.ChatWindow.Helpers.getMessageText)
local _ = require(ExpChat.BubbleChat.Helpers.getBubbleChatDisplayText)
local IsBorderlessBubbleChatMessageModule = require(ExpChat.BubbleChat.Helpers.isBorderlessBubbleChatMessage)
local MessageEffectModule = require(ExpChat.MessageEffects.MessageEffect)
local GetMessageEffectsModule = require(ExpChat.MessageEffects.getMessageEffects)

local function isShownInChatWindow(p1) --[[ Line: 39 ]]
	-- upvalues: ExpChatSharedModule (copy), SelectSelectedTabNameModule (copy), FriendsChatTabNameModule (copy), IsMessageForOpenChannelModule (copy)
	local Store = ExpChatSharedModule.context.store
	
	if Store == nil then
		return false
	else
		local State = Store:getState()
		
		return if State.ChatVisibility.isChatWindowEnabled.value then SelectSelectedTabNameModule(State) ~= FriendsChatTabNameModule and IsMessageForOpenChannelModule(State, { TextChannel = p1.textChannel }, p1.channelNameOverride) else false
	end
end

local function _(p1): boolean --[[ Line: 56 | Named "isChatWindowEnlargeMessage" ]]
	-- upvalues: GetMessageSettingsModule (copy), GetMessageTextModule (copy), GetMessageEffectsModule (copy), MessageEffectModule (copy)
	local MessageSettingsModule = GetMessageSettingsModule(p1)
	
	return table.find(GetMessageEffectsModule((GetMessageTextModule(MessageSettingsModule.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text))), MessageEffectModule.ChatWindowEnlarge) ~= nil
end

return function(p1) --[[ Line: 62 | Named "logPresetChatEmojiEffectExposure" ]]
	-- upvalues: IsUserChatEnabledModule (copy), GetChatStatusStoreModule (copy), isShownInChatWindow (copy), GetMessageSettingsModule (copy), GetMessageTextModule (copy), GetMessageEffectsModule (copy), MessageEffectModule (copy), IsBorderlessBubbleChatMessageModule (copy), ExpChatPresetChatEmojiEffectExperimentation (copy)
	if not IsUserChatEnabledModule(GetChatStatusStoreModule(false).getChatStatus(false)) then return end
	repeat
		if p1.isVisibleInChatWindow and isShownInChatWindow(p1) then
			local MessageSettingsModule = GetMessageSettingsModule(p1)
			
			if table.find(GetMessageEffectsModule((GetMessageTextModule(MessageSettingsModule.useTranslation, MessageSettingsModule.translation, MessageSettingsModule.text))), MessageEffectModule.ChatWindowEnlarge) ~= nil then
				ExpChatPresetChatEmojiEffectExperimentation.logExposure()
			end
		end
		if not p1.isVisibleInBubbleChat or not IsBorderlessBubbleChatMessageModule(p1) then break end
	until true
end