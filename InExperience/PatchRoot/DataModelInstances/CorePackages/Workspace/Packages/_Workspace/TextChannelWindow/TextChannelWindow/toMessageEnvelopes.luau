local Parent = script.Parent.Parent
local MessageDraftModelModule = require(Parent.ChatUIPrimitives.MessageDraftModel)
local MessageEnvelopeModelModule = require(Parent.ChatUIPrimitives.MessageEnvelopeModel)
local PlainTextContentModelModule = require(Parent.ChatUIPrimitives.PlainTextContentModel)
local PresetContentModelModule = require(Parent.ChatUIPrimitives.PresetContentModel)
local SystemContentModelModule = require(Parent.ChatUIPrimitives.SystemContentModel)
local _ = require(Parent.ChatUIPrimitives)
local _ = require(script.Parent.Message)
local StripRichTextModule = require(script.Parent.stripRichText)
local UnescapeRichTextModule = require(script.Parent.unescapeRichText)

local function _(p1)
	-- upvalues: StripRichTextModule (copy)
	if p1.senderUserId == nil then
		return nil
	else
		local PrefixText = p1.prefixText
		local Replaced: string = if PrefixText == nil then "" else string.gsub(string.gsub(StripRichTextModule(PrefixText), "^%s+", ""), "[%s:]+$", "")
		
		return if Replaced == "" then nil else { userId = p1.senderUserId, displayName = Replaced }
	end
end

local _ = function(p1): boolean
	return p1.presetId ~= nil and p1.presetId ~= ""
end

local function plainTextContentOf(p1)
	-- upvalues: PlainTextContentModelModule (copy), UnescapeRichTextModule (copy)
	local FromTextResult = PlainTextContentModelModule.fromText(UnescapeRichTextModule(p1.content))
	local PlainText = FromTextResult.plainText
	local Translation = p1.translation
	
	if Translation ~= nil then
		PlainText.translatedText = { text = UnescapeRichTextModule(Translation) }
	end
	if p1.wasRewritten then
		PlainText.wasRewritten = true
		local OriginalText = p1.originalText
		
		if OriginalText ~= nil then
			PlainText.originalText = { text = UnescapeRichTextModule(OriginalText) }
		end
	end
	return FromTextResult
end

local _ = function(p1)
	-- upvalues: MessageDraftModelModule (copy), UnescapeRichTextModule (copy)
	local IsNotPresetIdMatch: boolean = p1.presetId ~= nil and p1.presetId ~= ""
	
	return if IsNotPresetIdMatch then MessageDraftModelModule.fromPreset(p1.presetId, UnescapeRichTextModule(p1.content)) else MessageDraftModelModule.fromPlainText(UnescapeRichTextModule(p1.content))
end

local function toEnvelope(p1, SentAtUnixMilliseconds)
	-- upvalues: SystemContentModelModule (copy), MessageEnvelopeModelModule (copy), StripRichTextModule (copy), MessageDraftModelModule (copy), UnescapeRichTextModule (copy), PresetContentModelModule (copy), plainTextContentOf (copy)
	if p1.messageType ~= "user" then
		return MessageEnvelopeModelModule.incoming({
			author = nil,
			id = p1.messageId,
			sentAtUnixMilliseconds = SentAtUnixMilliseconds,
			contents = {
				if p1.textChatMessageInstance == nil then SystemContentModelModule.fromSystem(p1.content, p1.iconName) else SystemContentModelModule.fromRichText(p1.content, p1.iconName)
			}
		})
	end
	local Author = nil
	if p1.senderUserId == nil then
		Author = nil
	else
		local PrefixText = p1.prefixText
		local Replaced: string = if PrefixText == nil then "" else string.gsub(string.gsub(StripRichTextModule(PrefixText), "^%s+", ""), "[%s:]+$", "")
		Author = if Replaced == "" then nil else { userId = p1.senderUserId, displayName = Replaced }
	end
	if p1.status == nil then
		local Contents = {
			if IsNotPresetIdMatch then PresetContentModelModule.fromPreset(p1.presetId, UnescapeRichTextModule(p1.content)) else plainTextContentOf(p1)
		}
		local IsNotPresetIdMatch: boolean = p1.presetId ~= nil and p1.presetId ~= ""
		
		return MessageEnvelopeModelModule.incoming({
			id = p1.messageId,
			sentAtUnixMilliseconds = SentAtUnixMilliseconds,
			author = Author,
			contents = Contents
		})
	else
		local IsNotPresetIdMatch: boolean = p1.presetId ~= nil and p1.presetId ~= ""
		local SendingResult = MessageEnvelopeModelModule.sending(p1.messageId, if IsNotPresetIdMatch then MessageDraftModelModule.fromPreset(p1.presetId, UnescapeRichTextModule(p1.content)) else MessageDraftModelModule.fromPlainText(UnescapeRichTextModule(p1.content)), Author, SentAtUnixMilliseconds)
		
		return if p1.status == "failed" then MessageEnvelopeModelModule.failed(SendingResult, SentAtUnixMilliseconds) else SendingResult
	end
end

local _ = function(p2)
	return if p2.direction == "incoming" then p2.payload.message.sentAtUnixMilliseconds else p2.delivery.attemptedAtUnixMilliseconds
end

local function createProjector()
	-- upvalues: toEnvelope (copy)
	local t = {}
	setmetatable(t, { __mode = "k" })
	
	return function(List)
		-- upvalues: t (copy), toEnvelope (upval)
		local Buffer = table.create(#List)
		local v1 = -1e999
		
		for i, value in List do
			local Largest = math.max(value.timestamp.UnixTimestampMillis, v1 + 1)
			v1 = Largest
			local Entry = t[value]
			
			if Entry == nil or (if Entry.direction == "incoming" then Entry.payload.message.sentAtUnixMilliseconds else Entry.delivery.attemptedAtUnixMilliseconds) ~= Largest then
				Entry = toEnvelope(value, Largest)
				t[value] = Entry
			end
			Buffer[i] = Entry
		end
		return Buffer
	end
end

return {
	createProjector = createProjector,
	toMessageEnvelopes = function(p2)
		-- upvalues: createProjector (copy)
		return createProjector()(p2)
	end,
	displayNameFromPrefix = function(p2): string
		-- upvalues: StripRichTextModule (copy)
		return if p2 == nil then "" else string.gsub(string.gsub(StripRichTextModule(p2), "^%s+", ""), "[%s:]+$", "")
	end
}