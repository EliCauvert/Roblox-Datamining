return {
	positionHasKeyframes = function(p1)
		local position = p1:FindFirstChild("Position")
		
		if not position or not position:IsA("Vector3Curve") then
			return false
		end
		for i, v in { "X", "Y", "Z" } do
			local var1 = position:FindFirstChild(v)
			
			if var1 and var1:IsA("FloatCurve") and #var1:GetKeys() > 0 then
				return true
			end
		end
		return false
	end,
	translationExceedsThreshold = function(p2, p3)
		local position = p2:FindFirstChild("Position")
		
		if not position or not position:IsA("Vector3Curve") then
			return false, 0
		end
		local vector3 = Vector3.new(unpack(position:GetValueAtTime(0)))
		local t = {}
		
		for i, v in { "X", "Y", "Z" } do
			local var2 = position:FindFirstChild(v)
			
			if var2 and var2:IsA("FloatCurve") then
				for i_1, v_1 in var2:GetKeys() do
					table.insert(t, v_1.Time)
				end
			end
		end
		local var3 = 0
		
		for i_1, v_1 in t do
			local magnitude = (Vector3.new(unpack(position:GetValueAtTime(v_1))) - vector3).Magnitude
			
			if var3 < magnitude then
				var3 = magnitude
			end
		end
		return p3 < var3, var3
	end
}