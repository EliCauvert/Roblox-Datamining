return function(p1, p2)
	local var1 = p1:GetPropertyChangedSignal("IsReady"):Connect(function()
		-- upvalues: p1 (ref), p2 (ref)
		if not p1.IsReady then return end
		p1.TimePosition = p1.PlaybackRegion.Min
		
		if p2() then
			p1.PlaybackSpeed = 1
			
			if not p1.IsPlaying then
				p1:Play()
			end
		end
	end)
	
	if not p1.IsReady then
		return var1
	end
	p1.TimePosition = p1.PlaybackRegion.Min
	
	if p2() then
		p1.PlaybackSpeed = 1
		
		if not p1.IsPlaying then
			p1:Play()
		end
	end
	return var1
end