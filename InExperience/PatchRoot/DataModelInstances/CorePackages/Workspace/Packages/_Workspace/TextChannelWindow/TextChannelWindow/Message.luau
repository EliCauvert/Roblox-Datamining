local Parent = script.Parent.Parent
local _ = require(Parent.ChatUIPrimitives)
local HttpService = game:GetService("HttpService")
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetTextAndTranslationModule = require(script.Parent.getTextAndTranslation)

local function createUserMessage(UserMessage) --[[ Line: 88 ]]
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
		originalText = UserMessage.originalText,
		translation = UserMessage.translation,
		textChatMessageInstance = UserMessage.textChatMessageInstance,
		presetId = UserMessage.presetId
	}
end

return {
	createSystemMessage = function(Content, p1) --[[ Line: 38 ]]
		-- upvalues: HttpService (copy)
		return {
			messageType = "system-roblox",
			messageId = p1 or HttpService:GenerateGUID(false),
			content = Content,
			timestamp = DateTime.now()
		}
	end,
	createExperienceSystemMessage = function(Content, p1, IconName) --[[ Line: 47 ]]
		-- upvalues: HttpService (copy)
		return {
			messageType = "system-experience",
			messageId = p1 or HttpService:GenerateGUID(false),
			content = Content,
			iconName = IconName,
			timestamp = DateTime.now()
		}
	end,
	createSystemMessageFromTextChatMessage = function(TextChatMessageInstance) --[[ Line: 63 ]]
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
		return {
			messageType = "system-roblox",
			messageId = TextChatMessageInstance.MessageId,
			content = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessageInstance.TextInternal else TextChatMessageInstance.Text,
			timestamp = TextChatMessageInstance.Timestamp,
			textChatMessageInstance = TextChatMessageInstance
		}
	end,
	createUserMessage = createUserMessage,
	createUserMessageFromTextChatMessage = function(TextChatMessageInstance, p1) --[[ Line: 106 ]]
		-- upvalues: GetTextAndTranslationModule (copy), createUserMessage (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
		local TextSource = TextChatMessageInstance.TextSource
		local TextAndTranslationModule, TextAndTranslationModule2 = GetTextAndTranslationModule(TextChatMessageInstance)
		
		return (createUserMessage({
			status = nil,
			messageId = TextChatMessageInstance.MessageId,
			senderUserId = tostring(TextSource.UserId),
			prefixText = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessageInstance.PrefixTextInternal else TextChatMessageInstance.PrefixText,
			content = TextAndTranslationModule,
			translation = TextAndTranslationModule2,
			wasRewritten = if TextChatMessageInstance.WasRewritten then true else nil,
			originalText = if TextChatMessageInstance.WasRewritten then TextChatMessageInstance.OriginalText else nil,
			timestamp = TextChatMessageInstance.Timestamp,
			isOutgoing = tostring(TextSource.UserId) == p1,
			textChatMessageInstance = TextChatMessageInstance,
			presetId = if game:GetEngineFeature("TextChatPresetsEnabled") then TextChatMessageInstance.PresetId else nil
		}))
	end
}