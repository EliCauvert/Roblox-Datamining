return function(List, Callback) --[[ Line: 12 | Named "mapFirst" ]]
	local CallbackResult = nil
	for i, value in ipairs(List) do
		CallbackResult = Callback(value, i)
		
		if CallbackResult ~= nil then
			return CallbackResult
		end
	end
	return nil
end