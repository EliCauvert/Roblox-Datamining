return function(List)
	if not List or type(List) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, value in List do
		if type(i) == "string" and (type(value) == "string" or type(value) == "number" or type(value) == "boolean") then
			t[i] = tostring(value)
		end
	end
	return if next(t) then t else nil
end