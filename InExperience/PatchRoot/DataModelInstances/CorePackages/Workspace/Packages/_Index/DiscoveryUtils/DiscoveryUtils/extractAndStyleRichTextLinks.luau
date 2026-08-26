return function(p1)
	if p1 == nil then
		return {}, ""
	end
	local t = {}
	
	return t, string.gsub(p1, "<a%s+href=\"([^\"]+)\">([^<]*)</a>", function(p2, p3)
		-- upvalues: t (ref)
		table.insert(t, p2)
		
		return `<u><b>{p3}</b></u>`
	end)
end