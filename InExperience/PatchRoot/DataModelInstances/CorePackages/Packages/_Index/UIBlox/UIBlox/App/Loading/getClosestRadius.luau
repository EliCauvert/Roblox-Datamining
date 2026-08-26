local radius = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.Radius

return function(p1, p2)
	-- upvalues: radius (ref)
	if not p2 or p2 == UDim.new(0, 0) then
		return radius.None
	elseif p2.Scale >= 0.5 then
		return radius.Circle
	end
	local var1 = nil
	local var2 = 1e999
	
	for i, v in {
		[radius.None] = 0,
		[radius.XSmall] = 2,
		[radius.Small] = p1.Small,
		[radius.Medium] = p1.Medium,
		[radius.Large] = p1.XLarge,
		[radius.Circle] = p1.Circle
	} do
		local absValue = math.abs(p2.Offset - v)
		
		if absValue < var2 then
			var2 = absValue
			var1 = i
		end
	end
	return var1
end