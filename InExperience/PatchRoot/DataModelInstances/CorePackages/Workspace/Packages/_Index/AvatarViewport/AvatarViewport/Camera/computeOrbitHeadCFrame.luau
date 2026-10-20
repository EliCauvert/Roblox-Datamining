local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1): CFrame?
	-- upvalues: ConstantsModule (copy)
	local Child = p1.character:FindFirstChild(p1.focusPartName or ConstantsModule.DefaultFocusPartName)
	
	if Child and Child:IsA("BasePart") then
		local FieldOfViewDeg = p1.fieldOfViewDeg or ConstantsModule.DefaultOrbitFieldOfViewDeg
		local Layout = p1.layout
		local Position = Child.Position
		local FieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg or FieldOfViewDeg
		local ScaledDistanceScale = (p1.baseDistance or ConstantsModule.DefaultOrbitBaseDistance) * p1.distanceScale * (if FieldOfViewForDistanceScaleDeg > 0 and FieldOfViewDeg > 0 and FieldOfViewForDistanceScaleDeg ~= FieldOfViewDeg then math.tan((math.rad(FieldOfViewForDistanceScaleDeg * 0.5))) / math.tan((math.rad(FieldOfViewDeg * 0.5))) else 1)
		
		return CFrame.lookAt((CFrame.new(Position) * CFrame.Angles(0, math.rad(p1.yRotDeg), 0) * CFrame.new(0, 0.05, -ScaledDistanceScale)).Position, Position + Vector3.new(0, -((0.5 - (Layout.cutoutTopOffset + Layout.cutoutDiameter * 0.5) / math.max(Layout.viewportHeight, 1)) * ScaledDistanceScale * math.tan((math.rad(FieldOfViewDeg * 0.5))) * 2), 0))
	else
		return nil
	end
end