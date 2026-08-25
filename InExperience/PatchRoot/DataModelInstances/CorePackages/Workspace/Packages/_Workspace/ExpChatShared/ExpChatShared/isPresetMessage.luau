return function(value)
	if value == nil then
		return false
	end
	local presetId = value.presetId
	
	return presetId ~= nil and presetId ~= ""
end