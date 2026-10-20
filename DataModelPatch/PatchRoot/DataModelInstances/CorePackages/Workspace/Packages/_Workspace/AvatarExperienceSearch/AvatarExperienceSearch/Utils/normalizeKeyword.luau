return function(Text: string, p1)
	local S = Text:gsub("￼", ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
	
	if p1 then
		S = S:lower()
	end
	return S
end