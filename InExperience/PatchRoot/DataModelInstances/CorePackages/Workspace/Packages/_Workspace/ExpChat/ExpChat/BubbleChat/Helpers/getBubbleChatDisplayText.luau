local ExpChat = script:FindFirstAncestor("ExpChat")
local GetMessageTextModule = require(ExpChat.ChatWindow.Helpers.getMessageText)
local GetFFlagChatTranslationUIEnabledBubbleChatModule = require(ExpChat.Flags.getFFlagChatTranslationUIEnabledBubbleChat)
local ApplyBubbleChatMessagePropertiesTextModule = require(script.Parent.applyBubbleChatMessagePropertiesText)

return function(p1) --[[ Line: 20 | Named "getBubbleChatDisplayText" ]]
	-- upvalues: ApplyBubbleChatMessagePropertiesTextModule (copy), GetFFlagChatTranslationUIEnabledBubbleChatModule (copy), GetMessageTextModule (copy)
	local ApplyBubbleChatMessagePropertiesTextModuleResult, ApplyBubbleChatMessagePropertiesTextModuleResult2 = ApplyBubbleChatMessagePropertiesTextModule(p1.text, p1.translation, p1.bubbleChatMessageProperties)
	
	return GetMessageTextModule(GetFFlagChatTranslationUIEnabledBubbleChatModule() and p1.useTranslation, ApplyBubbleChatMessagePropertiesTextModuleResult2, ApplyBubbleChatMessagePropertiesTextModuleResult)
end