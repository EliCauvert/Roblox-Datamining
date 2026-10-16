return function(List, p1: number) --[[ Line: 2 ]]
	local t = {}
	
	if p1 <= 0 then
		return t
	end
	for _, value in List do
		local TextChannel = value.TextChannel
		
		if TextChannel then
			t[TextChannel.Name] = value
		end
	end
	return t
end