return function(List, Callback)
	local t = {}
	
	for i, value in List do
		local CallbackResult, CallbackResult2 = Callback(value, i)
		local CallbackResult1 = if CallbackResult2 == nil then i else CallbackResult2
		
		if CallbackResult ~= nil then
			t[CallbackResult1] = CallbackResult
		end
	end
	return t
end