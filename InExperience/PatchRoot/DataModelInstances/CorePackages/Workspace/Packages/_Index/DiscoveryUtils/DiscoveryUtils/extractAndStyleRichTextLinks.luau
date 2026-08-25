return function(p0)
	if p0 == nil then
		return {}, ""
	end
	local t = {}
	
	return t, string.gsub(p0, "<a%s+href=\"([^\"]+)\">([^<]*)</a>", function(p1, p2)
		-- upvalues: t (ref)
		table.insert(t, p1)
		
		return `<u><b>{p2}</b></u>`
	end)
end