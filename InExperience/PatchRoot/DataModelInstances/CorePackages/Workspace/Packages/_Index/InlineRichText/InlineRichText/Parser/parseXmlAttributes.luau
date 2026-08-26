return function(p1)
	local var1 = p1:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]*)\"%s*")
	local var2 = p1:gmatch("%s*([A-Za-z0-9_-]+)='([^']*)'%s*")
	local t = {}
	
	for i, v in var1 do
		t[i] = v or ""
	end
	for i_1, v_1 in var2 do
		t[i_1] = v_1 or ""
	end
	return t
end