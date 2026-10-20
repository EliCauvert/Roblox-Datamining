return function(Text: string)
	local SAZaZ09S = Text:gmatch("%s*([A-Za-z0-9_-]+)='([^']*)'%s*")
	local t = {}
	
	for i, value in Text:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]*)\"%s*") do
		t[i] = value or ""
	end
	for i1, sAZaZ09 in SAZaZ09S do
		t[i1] = sAZaZ09 or ""
	end
	return t
end