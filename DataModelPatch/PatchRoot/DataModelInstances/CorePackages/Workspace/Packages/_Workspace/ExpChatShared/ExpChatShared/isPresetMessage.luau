return function(p1): boolean
	if p1 == nil then
		return false
	else
		local PresetId = p1.presetId
		
		return PresetId ~= nil and PresetId ~= ""
	end
end