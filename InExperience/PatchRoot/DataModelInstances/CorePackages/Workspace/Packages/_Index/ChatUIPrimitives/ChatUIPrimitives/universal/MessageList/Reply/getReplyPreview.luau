local _ = require(script.Parent.Parent.projectMessageEnvelope)

local function _(p1)
	local RepliesTo = p1.repliesTo
	
	return if RepliesTo == nil then nil else RepliesTo[1]
end

return {
	getReplyText = function(p1)
		local RepliesTo = p1.repliesTo
		local RepliesToEntry = if RepliesTo == nil then nil else RepliesTo[1]
		local Preview = if RepliesToEntry == nil then nil else RepliesToEntry.preview
		
		return if Preview == nil or Preview.fallbackText == "" then nil else Preview.fallbackText
	end,
	getReplyLabel = function(p1)
		local RepliesTo = p1.repliesTo
		local RepliesToEntry = if RepliesTo == nil then nil else RepliesTo[1]
		
		if RepliesToEntry ~= nil then
			local RepliesTo1 = p1.repliesTo
			local RepliesToEntry1 = if RepliesTo1 == nil then nil else RepliesTo1[1]
			local Preview = if RepliesToEntry1 == nil then nil else RepliesToEntry1.preview
			
			if (if Preview == nil or Preview.fallbackText == "" then nil else Preview.fallbackText) ~= nil then
				local Label = RepliesToEntry.label
				
				return if Label == nil or Label == "" then nil else Label
			end
		end
		return nil
	end
}