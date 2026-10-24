local _ = require(script.Parent.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)
local EmojiContentModelModule = require(script.Parent.Parent.ContentKinds.Emoji.EmojiContentModel)

local function _(p1)
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy), EmojiContentModelModule (copy)
	local FromDraftResult = PlainTextContentModelModule.fromDraft(p1)
	
	if FromDraftResult ~= nil then
		return FromDraftResult
	end
	local FromDraftResult1 = PresetContentModelModule.fromDraft(p1)
	
	if FromDraftResult1 == nil then
		local FromDraftResult2 = EmojiContentModelModule.fromDraft(p1)
		
		return if FromDraftResult2 == nil then nil else FromDraftResult2
	else
		return FromDraftResult1
	end
end

return function(p1)
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy), EmojiContentModelModule (copy)
	local Payload = p1.payload
	
	if Payload.kind == "message" then
		local Message = Payload.message
		
		return {
			deliveryState = nil,
			id = p1.stableId,
			sourceMessageId = Message.id,
			sentAtUnixMilliseconds = Message.sentAtUnixMilliseconds,
			author = Message.author,
			contents = Message.contents,
			repliesTo = Message.repliesTo
		}
	end
	local Payload1 = p1.payload
	local Contents = {}
	
	for _, content in Payload1.draft.contents do
		local FromDraftResult = PlainTextContentModelModule.fromDraft(content)
		local FromDraftResult1 = nil
		
		if FromDraftResult == nil then
			local FromDraftResult2 = PresetContentModelModule.fromDraft(content)
			
			if FromDraftResult2 == nil then
				local FromDraftResult3 = EmojiContentModelModule.fromDraft(content)
				FromDraftResult1 = if FromDraftResult3 == nil then nil else FromDraftResult3
			else
				FromDraftResult1 = FromDraftResult2
			end
		else
			FromDraftResult1 = FromDraftResult
		end
		if FromDraftResult1 ~= nil then
			table.insert(Contents, FromDraftResult1)
		end
	end
	return {
		sourceMessageId = nil,
		repliesTo = nil,
		id = p1.stableId,
		sentAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
		author = Payload1.author,
		contents = Contents,
		deliveryState = p1.delivery.state
	}
end