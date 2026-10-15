return function(p1, p2)
	local t = {}
	
	if p2 <= 0 then
		return t
	end
	for i, v in p1 do
		local textChannel = v.TextChannel
		
		if textChannel then
			t[textChannel.Name] = v
		end
	end
	return t
end