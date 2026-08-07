return function(value) --[[ line: 5 | named "isPresetMessage" ]]
	if value == nil then
		return false
	end
	local presetId = value.presetId
	
	return presetId ~= nil and presetId ~= ""
end