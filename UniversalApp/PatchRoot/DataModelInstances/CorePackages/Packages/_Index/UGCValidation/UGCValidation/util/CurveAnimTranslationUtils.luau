return {
	positionHasKeyframes = function(Object): boolean --[[ Line: 3 ]]
		local Position = Object:FindFirstChild("Position")
		
		if not Position or not Position:IsA("Vector3Curve") then
			return false
		end
		for _, ChildName in { "X", "Y", "Z" } do
			local Child = Position:FindFirstChild(ChildName)
			
			if Child and Child:IsA("FloatCurve") and #Child:GetKeys() > 0 then
				return true
			end
		end
		return false
	end,
	translationExceedsThreshold = function(Object, p1) --[[ Line: 17 ]]
		local Position = Object:FindFirstChild("Position")
		
		if not Position or not Position:IsA("Vector3Curve") then
			return false, 0
		end
		local _Vector3 = Vector3.new(unpack(Position:GetValueAtTime(0)))
		local Times = {}
		
		for _, ChildName in { "X", "Y", "Z" } do
			local Child = Position:FindFirstChild(ChildName)
			
			if Child and Child:IsA("FloatCurve") then
				for _, key in Child:GetKeys() do
					table.insert(Times, key.Time)
				end
			end
		end
		local v1 = 0
		
		for _, time in Times do
			local Distance = (Vector3.new(unpack(Position:GetValueAtTime(time))) - _Vector3).Magnitude
			
			if v1 < Distance then
				v1 = Distance
			end
		end
		return p1 < v1, v1
	end
}