local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)
local MessageDraftModelModule = require(script.Parent.MessageDraftModel)
local _ = require(script.Parent.Types)

local function _(p1)
	return if p1.altText == nil then if p1.kind == "plain-text" and p1.text ~= "" then p1.text else nil elseif p1.altText == "" then nil else p1.altText
end

return function(p1)
	-- upvalues: MessageDraftModelModule (copy)
	if p1.kind == "preset" then
		local PresetId = p1.presetId
		local Text = p1.text
		
		return if PresetId == "" or Text == nil or Text == "" then nil else MessageDraftModelModule.fromPreset(PresetId, Text)
	end
	if p1.kind == "emoji" then
		local Unicode = p1.unicode
		
		if p1.emojiId ~= "" and Unicode ~= nil and Unicode ~= "" then
			return MessageDraftModelModule.fromEmoji(p1.emojiId, Unicode)
		end
	end
	local Text = if p1.altText == nil then if p1.kind == "plain-text" and p1.text ~= "" then p1.text else nil elseif p1.altText == "" then nil else p1.altText
	
	return if Text == nil then nil else MessageDraftModelModule.fromPlainText(Text)
end