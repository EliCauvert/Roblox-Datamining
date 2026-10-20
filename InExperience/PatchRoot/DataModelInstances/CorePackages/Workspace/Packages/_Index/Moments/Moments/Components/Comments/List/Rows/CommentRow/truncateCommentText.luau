local EscapeRichTextModule = require(script:FindFirstAncestor("Moments").Utils.escapeRichText)

return function(Text: string, Text1, p1, Callback): string?
	-- upvalues: EscapeRichTextModule (copy)
	if Callback(EscapeRichTextModule(Text)) <= p1 then
		return nil
	end
	local List = {}
	
	for _, value in utf8.graphemes(Text) do
		table.insert(List, value)
	end
	local function _(p2: number): string
		-- upvalues: Text (copy), List (copy), EscapeRichTextModule (upval), Text1 (copy)
		return EscapeRichTextModule((string.gsub(if p2 > 0 then string.sub(Text, 1, List[p2]) else "", "%s+$", ""))) .. Text1
	end
	
	local v1 = 0
	local v2 = #List - 1
	while v1 < v2 do
		local v3 = (v1 + v2 + 1) // 2
		
		if Callback(EscapeRichTextModule((string.gsub(if v3 > 0 then string.sub(Text, 1, List[v3]) else "", "%s+$", ""))) .. Text1) <= p1 then
			v1 = v3
		else
			v2 = v3 - 1
		end
	end
	return EscapeRichTextModule((string.gsub(if v1 > 0 then string.sub(Text, 1, List[v1]) else "", "%s+$", ""))) .. Text1
end