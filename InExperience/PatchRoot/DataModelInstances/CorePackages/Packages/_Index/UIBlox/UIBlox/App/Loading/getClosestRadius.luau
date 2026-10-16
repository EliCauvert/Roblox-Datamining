local Radius = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.Radius

return function(p1, p2) --[[ Line: 9 | Named "getClosestRadius" ]]
	-- upvalues: Radius (copy)
	if not p2 or p2 == UDim.new(0, 0) then
		return Radius.None
	end
	if p2.Scale >= 0.5 then
		return Radius.Circle
	end
	local v1 = nil
	local v2 = 1e999
	
	for i, value in {
		[Radius.None] = 0,
		[Radius.XSmall] = 2,
		[Radius.Small] = p1.Small,
		[Radius.Medium] = p1.Medium,
		[Radius.Large] = p1.XLarge,
		[Radius.Circle] = p1.Circle
	} do
		local Magnitude = math.abs(p2.Offset - value)
		
		if Magnitude < v2 then
			v2 = Magnitude
			v1 = i
		end
	end
	return v1
end