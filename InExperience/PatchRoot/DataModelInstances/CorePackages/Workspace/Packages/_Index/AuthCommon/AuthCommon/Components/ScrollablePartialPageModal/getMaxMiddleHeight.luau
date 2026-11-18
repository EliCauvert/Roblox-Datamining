local function _(p1)
	if p1 == nil or p1.buttons == nil then
		return 0
	else
		local CountButtons = #p1.buttons
		
		return if CountButtons == 0 then 0 else CountButtons * (p1.buttonHeight or 36) + (CountButtons - 1) * (p1.marginBetween or 12)
	end
end

return {
	SCROLL_GAP = 12,
	getMaxMiddleHeight = function(p1, p2): number
		local ButtonStackProps = p1.buttonStackProps
		local v1 = nil
		
		if ButtonStackProps == nil or ButtonStackProps.buttons == nil then
			v1 = 0
		else
			local CountButtons = #ButtonStackProps.buttons
			v1 = if CountButtons == 0 then 0 else CountButtons * (ButtonStackProps.buttonHeight or 36) + (CountButtons - 1) * (ButtonStackProps.marginBetween or 12)
		end
		return (math.max((p2 or p1.screenSize.Y) - (v1 + 72 + 24 + 12), 48))
	end
}