local constantsModule = require(script.Parent.Parent.Constants)

return function(p0) --[[ line: 18 | named "computeOrbitHeadCFrame" ]]
	-- upvalues: constantsModule (ref)
	local var1 = p0.character:FindFirstChild(p0.focusPartName or constantsModule.DefaultFocusPartName)
	
	if not var1 or not var1:IsA("BasePart") then
		return nil
	end
	local baseDistance = p0.baseDistance or constantsModule.DefaultOrbitBaseDistance
	local fieldOfViewDeg = p0.fieldOfViewDeg or constantsModule.DefaultOrbitFieldOfViewDeg
	local layout = p0.layout
	local position = var1.Position
	local fieldOfViewForDistanceScaleDeg = p0.fieldOfViewForDistanceScaleDeg or fieldOfViewDeg
	local var5 = baseDistance * p0.distanceScale * (if fieldOfViewForDistanceScaleDeg > 0 and fieldOfViewDeg > 0 and fieldOfViewForDistanceScaleDeg ~= fieldOfViewDeg then math.tan(math.rad(fieldOfViewForDistanceScaleDeg * 0.5)) / math.tan(math.rad(fieldOfViewDeg * 0.5)) else 1)
	
	return CFrame.lookAt((CFrame.new(position) * CFrame.Angles(0, math.rad(p0.yRotDeg), 0) * CFrame.new(0, 0.05, -var5)).Position, position + Vector3.new(0, -((0.5 - (layout.cutoutTopOffset + layout.cutoutDiameter * 0.5) / math.max(layout.viewportHeight, 1)) * var5 * math.tan(math.rad(fieldOfViewDeg * 0.5)) * 2), 0))
end