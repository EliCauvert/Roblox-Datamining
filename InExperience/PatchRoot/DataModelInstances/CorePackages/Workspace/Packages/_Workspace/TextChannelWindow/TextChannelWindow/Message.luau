local parent = script.Parent.Parent
local _ = require(parent.ChatUIPrimitives)
local _ = { Pending = "pending", Failed = "failed" }
local httpService = game:GetService("HttpService")
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local getTextAndTranslationModule = require(script.Parent.getTextAndTranslation)

local function createUserMessage(p1)
	return {
		messageType = "user",
		messageId = p1.messageId,
		senderUserId = p1.senderUserId,
		content = p1.content,
		prefixText = p1.prefixText,
		timestamp = p1.timestamp,
		isOutgoing = p1.isOutgoing,
		status = p1.status,
		wasRewritten = p1.wasRewritten,
		originalText = p1.originalText,
		translation = p1.translation,
		textChatMessageInstance = p1.textChatMessageInstance,
		presetId = p1.presetId
	}
end

return {
	createSystemMessage = function(p1, p2)
		-- upvalues: httpService (ref)
		return {
			messageType = "system-roblox",
			messageId = p2 or httpService:GenerateGUID(false),
			content = p1,
			timestamp = DateTime.now()
		}
	end,
	createExperienceSystemMessage = function(p1, p2, p3)
		-- upvalues: httpService (ref)
		return {
			messageType = "system-experience",
			messageId = p2 or httpService:GenerateGUID(false),
			content = p1,
			iconName = p3,
			timestamp = DateTime.now()
		}
	end,
	createSystemMessageFromTextChatMessage = function(p1)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref)
		return {
			messageType = "system-roblox",
			messageId = p1.MessageId,
			content = if getFFlagExpChatProtectedChatInternalAPIs() then p1.TextInternal else p1.Text,
			timestamp = p1.Timestamp,
			textChatMessageInstance = p1
		}
	end,
	createUserMessage = createUserMessage,
	createUserMessageFromTextChatMessage = function(p1, p2)
		-- upvalues: getTextAndTranslationModule (ref), createUserMessage (ref), getFFlagExpChatProtectedChatInternalAPIs (ref)
		local textSource = p1.TextSource
		local var1, var2 = getTextAndTranslationModule(p1)
		
		return createUserMessage({
			status = nil,
			messageId = p1.MessageId,
			senderUserId = tostring(textSource.UserId),
			prefixText = if getFFlagExpChatProtectedChatInternalAPIs() then p1.PrefixTextInternal else p1.PrefixText,
			content = var1,
			translation = var2,
			wasRewritten = if p1.WasRewritten then true else nil,
			originalText = if p1.WasRewritten then p1.OriginalText else nil,
			timestamp = p1.Timestamp,
			isOutgoing = tostring(textSource.UserId) == p2,
			textChatMessageInstance = p1,
			presetId = if game:GetEngineFeature("TextChatPresetsEnabled") then p1.PresetId else nil
		})
	end
}