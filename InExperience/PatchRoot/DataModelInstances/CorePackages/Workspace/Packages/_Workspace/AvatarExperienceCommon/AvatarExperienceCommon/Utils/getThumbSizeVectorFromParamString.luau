return function(p0) --[[ line: 9 | named "getThumbSizeVectorFromParamString" ]]
	local parts = string.split(p0, "&")
	
	if #parts == 2 then
		local match = string.match(parts[1], "%d[%d.]*")
		local match_1 = string.match(parts[2], "%d[%d.]*")
		
		return if match and match_1 then Vector2.new(tonumber(match), tonumber(match_1)) else nil
	end
end