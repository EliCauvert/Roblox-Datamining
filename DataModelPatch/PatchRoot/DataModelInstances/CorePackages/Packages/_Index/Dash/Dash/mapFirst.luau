return function(List, Callback)
	local CallbackResult = nil
	for i, value in ipairs(List) do
		CallbackResult = Callback(value, i)
		
		if CallbackResult ~= nil then
			return CallbackResult
		end
	end
	return nil
end