local _ = require(script.Parent.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)

local function _(p1) --[[ Line: 21 | Named "contentFromDraft" ]]
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy)
	local FromDraftResult = PlainTextContentModelModule.fromDraft(p1)
	
	return if FromDraftResult == nil then PresetContentModelModule.fromDraft(p1) else FromDraftResult
end

return function(p1) --[[ Line: 29 | Named "projectMessageEnvelope" ]]
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy)
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
		local FromDraftResult1 = if FromDraftResult == nil then PresetContentModelModule.fromDraft(content) else FromDraftResult
		
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