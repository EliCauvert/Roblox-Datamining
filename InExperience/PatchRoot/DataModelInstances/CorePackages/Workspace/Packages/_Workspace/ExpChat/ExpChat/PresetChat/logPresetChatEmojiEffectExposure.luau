local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local expChatPresetChatEmojiEffectExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local isMessageForOpenChannelModule = require(expChat.isMessageForOpenChannel)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local getMessageSettingsModule = require(expChat.ChatWindow.Helpers.getMessageSettings)
local getMessageTextModule = require(expChat.ChatWindow.Helpers.getMessageText)
local _ = require(expChat.BubbleChat.Helpers.getBubbleChatDisplayText)
local isBorderlessBubbleChatMessageModule = require(expChat.BubbleChat.Helpers.isBorderlessBubbleChatMessage)
local messageEffectModule = require(expChat.MessageEffects.MessageEffect)
local getMessageEffectsModule = require(expChat.MessageEffects.getMessageEffects)

local function isShownInChatWindow(p1)
	-- upvalues: expChatSharedModule (ref), selectSelectedTabNameModule (ref), friendsChatTabNameModule (ref), isMessageForOpenChannelModule (ref)
	local store = expChatSharedModule.context.store
	
	if store == nil then
		return false
	end
	local state = store:getState()
	
	return if state.ChatVisibility.isChatWindowEnabled.value then if selectSelectedTabNameModule(state) == friendsChatTabNameModule then false else isMessageForOpenChannelModule(state, { TextChannel = p1.textChannel }, p1.channelNameOverride) else false
end

local function _(p1)
	-- upvalues: getMessageSettingsModule (ref), getMessageTextModule (ref), getMessageEffectsModule (ref), messageEffectModule (ref)
	local var1 = getMessageSettingsModule(p1)
	
	return table.find(getMessageEffectsModule(getMessageTextModule(var1.useTranslation, var1.translation, var1.text)), messageEffectModule.ChatWindowEnlarge) ~= nil
end

return function(value)
	-- upvalues: isUserChatEnabledModule (ref), getChatStatusStoreModule (ref), isShownInChatWindow (ref), getMessageSettingsModule (ref), getMessageTextModule (ref), getMessageEffectsModule (ref), messageEffectModule (ref), isBorderlessBubbleChatMessageModule (ref), expChatPresetChatEmojiEffectExperimentation (ref)
	if not isUserChatEnabledModule(getChatStatusStoreModule(false).getChatStatus(false)) then return end
	if value.isVisibleInChatWindow and isShownInChatWindow(value) then
		local var1 = getMessageSettingsModule(value)
		
		if table.find(getMessageEffectsModule(getMessageTextModule(var1.useTranslation, var1.translation, var1.text)), messageEffectModule.ChatWindowEnlarge) == nil then
			if value.isVisibleInBubbleChat and isBorderlessBubbleChatMessageModule(value) then
				expChatPresetChatEmojiEffectExperimentation.logExposure()
			end
		end
	end
end