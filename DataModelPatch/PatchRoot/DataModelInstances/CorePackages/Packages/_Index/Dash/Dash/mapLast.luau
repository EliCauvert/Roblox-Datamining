return function(p1, Callback)
	local CallbackResult = nil
	for i = #p1, 1, -1 do
		CallbackResult = Callback(p1[i], i)
		
		if CallbackResult ~= nil then
			return CallbackResult
		end
	end
	return nil
end