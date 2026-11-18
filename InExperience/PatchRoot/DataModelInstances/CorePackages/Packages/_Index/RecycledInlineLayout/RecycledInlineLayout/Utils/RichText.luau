local Escape = require(script:FindFirstAncestor("RecycledInlineLayout").Parent.MarkdownCore).Utils.Escape

local function openTag(p1): string
	local Attributes = p1.attributes
	
	if Attributes == nil or next(Attributes) == nil then
		return `<{p1.name}>`
	end
	local List = {}
	
	for attribute in Attributes do
		table.insert(List, attribute)
	end
	table.sort(List)
	local List1 = { p1.name }
	
	for _, value in List do
		local Text: string = Attributes[value]
		local v1: string = if string.find(Text, "\"", 1, true) then "'" else "\""
		table.insert(List1, `{value}={v1}{Text}{v1}`)
	end
	return `<{table.concat(List1, " ")}>`
end

return {
	format = function(p2, List)
		-- upvalues: Escape (copy), openTag (copy)
		if List == nil or #List == 0 then
			return p2
		end
		local EscapeRichFormattingResult = Escape.escapeRichFormatting(p2)
		
		for _, value in List do
			EscapeRichFormattingResult = `{openTag(value)}{EscapeRichFormattingResult}</{value.name}>`
		end
		return EscapeRichFormattingResult
	end,
	hasTags = function(p3): boolean
		return p3 ~= nil and #p3 > 0
	end,
	escape = function(p3)
		-- upvalues: Escape (copy)
		return Escape.escapeRichFormatting(p3)
	end,
	openTag = openTag
}