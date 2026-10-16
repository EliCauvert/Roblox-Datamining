return function(List, Callback) --[[ Line: 14 | Named "mapOne" ]]
	local CallbackResult = nil
	for i, value in List do
		CallbackResult = if Callback then Callback(value, i) else value
		
		if CallbackResult ~= nil then
			return CallbackResult
		end
	end
	return nil
end