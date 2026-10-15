local expChat = script:FindFirstAncestor("ExpChat")
local getMessageTextModule = require(expChat.ChatWindow.Helpers.getMessageText)
local getFFlagChatTranslationUIEnabledBubbleChatModule = require(expChat.Flags.getFFlagChatTranslationUIEnabledBubbleChat)
local applyBubbleChatMessagePropertiesTextModule = require(script.Parent.applyBubbleChatMessagePropertiesText)

return function(p1)
	-- upvalues: applyBubbleChatMessagePropertiesTextModule (ref), getFFlagChatTranslationUIEnabledBubbleChatModule (ref), getMessageTextModule (ref)
	local var1, var2 = applyBubbleChatMessagePropertiesTextModule(p1.text, p1.translation, p1.bubbleChatMessageProperties)
	
	return getMessageTextModule(getFFlagChatTranslationUIEnabledBubbleChatModule() and p1.useTranslation, var2, var1)
end