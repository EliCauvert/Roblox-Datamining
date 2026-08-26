return function(p1)
	local var1 = typeof(p1)
	
	if var1 == "Rect" then
		return p1
	elseif var1 == "Instance" then
		return Rect.new(p1.AbsolutePosition, p1.AbsolutePosition + p1.AbsoluteSize)
	end
end