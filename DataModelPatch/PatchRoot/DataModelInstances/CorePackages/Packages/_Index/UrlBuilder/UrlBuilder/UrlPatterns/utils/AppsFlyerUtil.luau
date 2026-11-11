local AppsFlyerUtil = {
	replaceNewlines = function(Text: string, p1)
		local P1 = p1 or " "
		
		return Text:gsub("\r\n", P1):gsub("\r", P1):gsub("\n", P1)
	end,
	truncateLength = function(Text: string, p1)
		local P3 = p1 or 140
		
		if Text:len() <= P3 then
			return Text
		end
		local Text1 = ""
		local Length: number = ("..."):len()
		
		for i, value in utf8.graphemes(Text) do
			local Segment = Text:sub(i, value)
			
			if P3 < Text1:len() + Segment:len() + Length then break end
			Text1 ..= Segment
		end
		local SS, SS2 = Text1:gsub("%s+%S-$", "...", 1)
		
		return if SS2 > 0 then SS else Text1 .. "..."
	end
}

function AppsFlyerUtil.sanitizeDescription(p2)
	-- upvalues: AppsFlyerUtil (copy)
	return (AppsFlyerUtil.truncateLength((AppsFlyerUtil.replaceNewlines(p2))))
end

return AppsFlyerUtil