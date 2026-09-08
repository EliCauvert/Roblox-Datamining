local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	local var1 = p1.character:FindFirstChild(p1.focusPartName or constantsModule.DefaultFocusPartName)
	
	if not var1 or not var1:IsA("BasePart") then
		return nil
	end
	local baseDistance = p1.baseDistance or constantsModule.DefaultOrbitBaseDistance
	local fieldOfViewDeg = p1.fieldOfViewDeg or constantsModule.DefaultOrbitFieldOfViewDeg
	local layout = p1.layout
	local position = var1.Position
	local fieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg or fieldOfViewDeg
	local var2 = baseDistance * p1.distanceScale * (if fieldOfViewForDistanceScaleDeg > 0 and fieldOfViewDeg > 0 and fieldOfViewForDistanceScaleDeg ~= fieldOfViewDeg then math.tan(math.rad(fieldOfViewForDistanceScaleDeg * 0.5)) / math.tan(math.rad(fieldOfViewDeg * 0.5)) else 1)
	
	return CFrame.lookAt((CFrame.new(position) * CFrame.Angles(0, math.rad(p1.yRotDeg), 0) * CFrame.new(0, 0.05, -var2)).Position, position + Vector3.new(0, -((0.5 - (layout.cutoutTopOffset + layout.cutoutDiameter * 0.5) / math.max(layout.viewportHeight, 1)) * var2 * math.tan(math.rad(fieldOfViewDeg * 0.5)) * 2), 0))
end