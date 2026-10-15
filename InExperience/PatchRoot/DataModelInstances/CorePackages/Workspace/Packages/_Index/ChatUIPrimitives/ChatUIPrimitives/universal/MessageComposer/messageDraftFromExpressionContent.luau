local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)
local messageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(script.Parent.Parent.Types)

local function _(p1)
	return if p1.altText == nil then if p1.kind == "plain-text" and p1.text ~= "" then p1.text else nil elseif p1.altText == "" then nil else p1.altText
end

return function(p1)
	-- upvalues: messageDraftModelModule (ref)
	local presetId
	if p1.kind == "preset" then
		presetId = p1.presetId
		local text = p1.text
		
		return if presetId == "" or text == nil or text == "" then nil else messageDraftModelModule.fromPreset(presetId, text)
	end
	presetId = if p1.altText ~= nil then if p1.kind == "plain-text" and p1.text ~= "" then p1.text else nil elseif p1.altText == "" then nil else p1.altText
	
	return if presetId == nil then nil else messageDraftModelModule.fromPlainText(presetId)
end