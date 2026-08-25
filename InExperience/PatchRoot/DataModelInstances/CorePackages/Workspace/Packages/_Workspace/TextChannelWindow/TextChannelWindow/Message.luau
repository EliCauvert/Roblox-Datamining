local parent = script.Parent.Parent
local fFlagExpChatPresetBoltInMessageLayout = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPresetBoltInMessageLayout
local _ = { Pending = "pending", Failed = "failed" }
local httpService = game:GetService("HttpService")
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local getTextAndTranslationModule = require(script.Parent.getTextAndTranslation)

local function createUserMessage(p0)
	return {
		messageType = "user",
		messageId = p0.messageId,
		senderUserId = p0.senderUserId,
		content = p0.content,
		prefixText = p0.prefixText,
		timestamp = p0.timestamp,
		isOutgoing = p0.isOutgoing,
		status = p0.status,
		wasRewritten = p0.wasRewritten,
		originalText = p0.originalText,
		textChatMessageInstance = p0.textChatMessageInstance,
		presetId = p0.presetId
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
	createSystemMessageFromTextChatMessage = function(p3)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref)
		return {
			messageType = "system-roblox",
			messageId = p3.MessageId,
			content = if getFFlagExpChatProtectedChatInternalAPIs() then p3.TextInternal else p3.Text,
			timestamp = p3.Timestamp,
			textChatMessageInstance = p3
		}
	end,
	createUserMessage = createUserMessage,
	createUserMessageFromTextChatMessage = function(p4, p5)
		-- upvalues: createUserMessage (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), getTextAndTranslationModule (ref), fFlagExpChatPresetBoltInMessageLayout (ref)
		local textSource = p4.TextSource
		
		return createUserMessage({
			status = nil,
			messageId = p4.MessageId,
			senderUserId = tostring(textSource.UserId),
			prefixText = if getFFlagExpChatProtectedChatInternalAPIs() then p4.PrefixTextInternal else p4.PrefixText,
			content = getTextAndTranslationModule(p4),
			wasRewritten = if p4.WasRewritten then true else nil,
			originalText = if p4.WasRewritten then p4.OriginalText else nil,
			timestamp = p4.Timestamp,
			isOutgoing = tostring(textSource.UserId) == p5,
			textChatMessageInstance = p4,
			presetId = if fFlagExpChatPresetBoltInMessageLayout and game:GetEngineFeature("TextChatPresetsEnabled") then p4.PresetId else nil
		})
	end
}