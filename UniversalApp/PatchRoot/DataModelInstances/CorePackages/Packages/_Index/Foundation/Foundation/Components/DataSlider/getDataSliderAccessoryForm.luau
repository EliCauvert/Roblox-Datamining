local function getTrackWidth(p1, p2)
	if not p1.isSides then
		return p1.width
	end
	local Width = p1.width
	
	for _, accessory in p1.accessories do
		local P1 = accessory.hasIcon and (p2 or not accessory.hasText)
		local IconWidth = if P1 then p1.iconWidth else accessory.textWidth
		
		if IconWidth == nil then
			return nil
		end
		Width -= IconWidth + p1.gap
	end
	return Width
end

return function(p3): string
	-- upvalues: getTrackWidth (copy)
	local TrackWidth = getTrackWidth(p3, false)
	
	if TrackWidth == nil or p3.textMinTrackWidth <= TrackWidth then
		return "Text"
	else
		local TrackWidth1 = getTrackWidth(p3, true)
		
		return if TrackWidth1 and p3.accessoryMinTrackWidth <= TrackWidth1 then "Icon" else "Hidden"
	end
end