return function(p1)
	if not p1 or type(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		if type(i) == "string" and (type(v) == "string" or type(v) == "number" or type(v) == "boolean") then
			t[i] = tostring(v)
		end
	end
	return if next(t) then t else nil
end