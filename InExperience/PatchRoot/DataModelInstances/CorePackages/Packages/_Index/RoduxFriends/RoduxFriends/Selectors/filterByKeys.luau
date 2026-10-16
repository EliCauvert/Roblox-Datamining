return function(List, p1) --[[ Line: 1 ]]
	local t = {}
	
	for _, value in pairs(List) do
		local Text = tostring(value)
		local v1 = p1[Text]
		
		if v1 then
			t[Text] = v1
		end
	end
	return t
end