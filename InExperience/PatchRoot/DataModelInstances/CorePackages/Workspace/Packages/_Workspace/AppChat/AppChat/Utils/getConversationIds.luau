return function(List) --[[ Line: 2 | Named "getConversationIds" ]]
	local t = {}
	
	for i, value in List do
		t[i] = tostring(value.id)
	end
	return t
end