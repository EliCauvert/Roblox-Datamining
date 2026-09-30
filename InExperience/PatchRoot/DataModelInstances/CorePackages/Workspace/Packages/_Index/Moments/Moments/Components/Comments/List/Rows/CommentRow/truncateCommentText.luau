local escapeRichTextModule = require(script:FindFirstAncestor("Moments").Utils.escapeRichText)

return function(p1, p2, p3, p4)
	-- upvalues: escapeRichTextModule (ref)
	if p4(escapeRichTextModule(p1)) <= p3 then
		return nil
	end
	local t = {}
	
	for i, v in utf8.graphemes(p1) do
		table.insert(t, v)
	end
	local function _(p5)
		-- upvalues: p1 (ref), t (ref), escapeRichTextModule (copy), p2 (ref)
		return escapeRichTextModule(string.gsub(if p5 > 0 then string.sub(p1, 1, t[p5]) else "", "%s+$", "")) .. p1
	end
	
	local var1 = 0
	local var2 = #t - 1
	while var1 < var2 do
		local var3 = (var1 + var2 + 1) // 2
		
		if p4(escapeRichTextModule(string.gsub(if var3 > 0 then string.sub(p1, 1, t[var3]) else "", "%s+$", "")) .. p1) <= p3 then
			var1 = var3
		else
			var2 = var3 - 1
		end
	end
	return escapeRichTextModule(string.gsub(if var1 > 0 then string.sub(p1, 1, t[var1]) else "", "%s+$", "")) .. p1
end