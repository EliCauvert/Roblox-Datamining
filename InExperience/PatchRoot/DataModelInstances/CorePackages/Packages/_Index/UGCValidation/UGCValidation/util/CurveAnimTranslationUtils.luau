return {
	positionHasKeyframes = function(p0) --[[ line: 3 ]]
		local position = p0:FindFirstChild("Position")
		
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
	translationExceedsThreshold = function(p1, p2) --[[ line: 17 ]]
		local position = p1:FindFirstChild("Position")
		
		if not position or not position:IsA("Vector3Curve") then
			return false, 0
		end
		local vector3 = Vector3.new(unpack(position:GetValueAtTime(0)))
		local t = {}
		
		for i, v in { "X", "Y", "Z" } do
			local var6 = position:FindFirstChild(v)
			
			if var6 and var6:IsA("FloatCurve") then
				for i_1, v_1 in var6:GetKeys() do
					table.insert(t, v_1.Time)
				end
			end
		end
		local var5 = 0
		
		for i_1, v_1 in t do
			local magnitude = (Vector3.new(unpack(position:GetValueAtTime(v_1))) - vector3).Magnitude
			
			if var5 < magnitude then
				var5 = magnitude
			end
		end
		return p2 < var5, var5
	end
}