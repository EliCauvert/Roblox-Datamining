return function(p0) --[[ line: 1 | named "parseXmlAttributes" ]]
	local var0 = p0:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]*)\"%s*")
	local var1 = p0:gmatch("%s*([A-Za-z0-9_-]+)='([^']*)'%s*")
	local t = {}
	
	for i, v in var0 do
		t[i] = v or ""
	end
	for i_1, v_1 in var1 do
		t[i_1] = v_1 or ""
	end
	return t
end