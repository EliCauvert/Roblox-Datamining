return function(p1, Callback) --[[ Line: 7 | Named "filterMap" ]]
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		local CallbackResult = Callback(p1[i], i)
		
		if CallbackResult ~= nil then
			t[Count] = CallbackResult
			Count += 1
		end
	end
	return t
end