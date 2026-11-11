local Parent = script.Parent.Parent
local _ = require(Parent.ChatUIPrimitives)
local HttpService = game:GetService("HttpService")
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetTextAndTranslationModule = require(script.Parent.getTextAndTranslation)

local function createUserMessage(UserMessage)
	return {
		messageType = "user",
		messageId = UserMessage.messageId,
		senderUserId = UserMessage.senderUserId,
		content = UserMessage.content,
		prefixText = UserMessage.prefixText,
		timestamp = UserMessage.timestamp,
		isOutgoing = UserMessage.isOutgoing,
		status = UserMessage.status,
		wasRewritten = UserMessage.wasRewritten,
		originalText = UserMessage.originalText
	}
end

return {
	createSystemMessage = function(Content, p1)
		-- upvalues: HttpService (copy)
		return {
			messageType = "system-roblox",
			messageId = p1 or HttpService:GenerateGUID(false),
			content = Content,
			timestamp = DateTime.now()
		}
	end,
	createSystemMessageFromTextChatMessage = function(TextChatMessage)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
		return {
			messageType = "system-roblox",
			messageId = TextChatMessage.MessageId,
			content = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text,
			timestamp = TextChatMessage.Timestamp
		}
	end,
	createUserMessage = createUserMessage,
	createUserMessageFromTextChatMessage = function(TextChatMessage, p1)
		-- upvalues: createUserMessage (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), GetTextAndTranslationModule (copy)
		local TextSource = TextChatMessage.TextSource
		
		return (createUserMessage({
			status = nil,
			messageId = TextChatMessage.MessageId,
			senderUserId = tostring(TextSource.UserId),
			prefixText = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText,
			content = GetTextAndTranslationModule(TextChatMessage),
			wasRewritten = if TextChatMessage.WasRewritten then true else nil,
			originalText = if TextChatMessage.WasRewritten then TextChatMessage.OriginalText else nil,
			timestamp = TextChatMessage.Timestamp,
			isOutgoing = tostring(TextSource.UserId) == p1
		}))
	end
}