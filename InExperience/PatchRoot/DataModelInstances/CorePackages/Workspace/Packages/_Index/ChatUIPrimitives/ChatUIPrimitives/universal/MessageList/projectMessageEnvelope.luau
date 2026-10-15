local _ = require(script.Parent.Parent.Types)
local plainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local presetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)

local function _(p1)
	-- upvalues: plainTextContentModelModule (ref), presetContentModelModule (ref)
	local var1 = plainTextContentModelModule.fromDraft(p1)
	
	return if var1 == nil then presetContentModelModule.fromDraft(p1) else var1
end

return function(p1)
	-- upvalues: plainTextContentModelModule (ref), presetContentModelModule (ref)
	local payload = p1.payload
	
	if payload.kind == "message" then
		local message = payload.message
		
		return {
			deliveryState = nil,
			id = p1.stableId,
			sourceMessageId = message.id,
			sentAtUnixMilliseconds = message.sentAtUnixMilliseconds,
			author = message.author,
			contents = message.contents,
			repliesTo = message.repliesTo
		}
	end
	local payload_1 = p1.payload
	local t = {}
	
	for i, v in payload_1.draft.contents do
		local var1 = plainTextContentModelModule.fromDraft(v)
		local var2 = if var1 ~= nil then presetContentModelModule.fromDraft(v) else var1
		
		if var2 ~= nil then
			table.insert(t, var2)
		end
	end
	return {
		sourceMessageId = nil,
		repliesTo = nil,
		id = p1.stableId,
		sentAtUnixMilliseconds = p1.delivery.attemptedAtUnixMilliseconds,
		author = payload_1.author,
		contents = t,
		deliveryState = p1.delivery.state
	}
end