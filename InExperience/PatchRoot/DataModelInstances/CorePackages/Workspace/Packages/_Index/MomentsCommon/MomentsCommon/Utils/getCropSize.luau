return function(Vector, Vector1): UDim2 --[[ Line: 1 | Named "getCropSize" ]]
	if Vector.X == 0 or Vector.Y == 0 or Vector1.X == 0 or Vector1.Y == 0 then
		return UDim2.fromScale(1, 1)
	else
		local XRatio = Vector.X / Vector.Y
		local XRatio1 = Vector1.X / Vector1.Y
		
		return if XRatio1 < XRatio then UDim2.fromScale(1, XRatio / XRatio1) else UDim2.fromScale(XRatio1 / XRatio, 1)
	end
end