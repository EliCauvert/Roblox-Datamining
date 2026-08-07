return function(p0) --[[ line: 11 | named "toRect" ]]
	local var0 = typeof(p0)
	
	if var0 == "Rect" then
		return p0
	elseif var0 == "Instance" then
		return Rect.new(p0.AbsolutePosition, p0.AbsolutePosition + p0.AbsoluteSize)
	end
end