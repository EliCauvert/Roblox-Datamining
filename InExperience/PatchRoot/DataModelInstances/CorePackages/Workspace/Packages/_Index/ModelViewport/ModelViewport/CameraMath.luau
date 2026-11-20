local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local CameraMathModule = {
	getPartsBounds = function(List)
		local MinResult = nil
		local MaxResult = nil
		
		for _, value in List do
			local _CFrame = value.CFrame
			local SizeRatio = value.Size / 2
			local NewAbsResult = (_CFrame.XVector * SizeRatio.X):Abs() + (_CFrame.YVector * SizeRatio.Y):Abs() + (_CFrame.ZVector * SizeRatio.Z):Abs()
			local PositionDelta = _CFrame.Position - NewAbsResult
			local NewPosition = _CFrame.Position + NewAbsResult
			
			if MinResult then
				MinResult = MinResult:Min(PositionDelta)
			else
				MinResult = PositionDelta
			end
			if MaxResult then
				MaxResult = MaxResult:Max(NewPosition)
			else
				MaxResult = NewPosition
			end
		end
		return if MinResult and MaxResult then {
			cframe = CFrame.new((MinResult + MaxResult) / 2),
			size = MaxResult - MinResult
		} else nil
	end,
	getBoundsRadius = function(p1: number, Padding)
		return (p1 / 2).Magnitude * Padding
	end,
	getFitDistance = function(Radius, Degrees: number, AspectRatio)
		local RadiansRatio = math.rad(Degrees) / 2
		
		return Radius / math.sin((math.min(RadiansRatio, (math.atan(math.tan(RadiansRatio) * AspectRatio)))))
	end,
	wrapDeg = function(YawDegDelta: number): number
		local YawDegDeltaRemainder = YawDegDelta % 360
		
		if YawDegDeltaRemainder > 180 then
			YawDegDeltaRemainder -= 360
		end
		return YawDegDeltaRemainder
	end
}

function CameraMathModule.clampYawDeg(Value: number, p1)
	-- upvalues: CameraMathModule (copy)
	return if p1 then math.clamp(Value, p1.min, p1.max) else CameraMathModule.wrapDeg(Value)
end

function CameraMathModule.clampPitchDeg(Value: number, p1): number
	-- upvalues: ConstantsModule (copy)
	local PitchHardLimitDeg: number = ConstantsModule.PitchHardLimitDeg
	
	return (math.clamp(if p1 then math.clamp(Value, p1.min, p1.max) else Value, -PitchHardLimitDeg, PitchHardLimitDeg))
end

function CameraMathModule.clampPan(Direction, p1, p2)
	local v1 = p1 * p2
	
	return if Direction.Magnitude <= v1 then Direction elseif v1 <= 0 then Vector2.zero else Direction.Unit * v1
end

function CameraMathModule.applyZoomSteps(p1, p2)
	-- upvalues: ConstantsModule (copy)
	return p1 * ConstantsModule.ZoomBasePerStep ^ -p2
end

function CameraMathModule.getStudsPerPixel(p1, Degrees: number, p2, p3)
	-- upvalues: CameraMathModule (copy)
	return 2 * (CameraMathModule.getFitDistance(p1.radius, Degrees, p2) * p1.zoomScale) * math.tan(math.rad(Degrees) / 2) / p3
end

function CameraMathModule.getCameraCFrame(p1, FieldOfViewDeg, AspectRatio): CFrame
	-- upvalues: CameraMathModule (copy)
	return CFrame.new(p1.target) * CFrame.Angles(0, math.rad(p1.yawDeg) + 3.141592653589793, 0) * CFrame.Angles(math.rad(-p1.pitchDeg), 0, 0) * CFrame.new(p1.pan.X, p1.pan.Y, CameraMathModule.getFitDistance(p1.radius, FieldOfViewDeg, AspectRatio) * p1.zoomScale)
end

function CameraMathModule.lerpState(p1, p2, Alpha, p3)
	-- upvalues: CameraMathModule (copy)
	local YawDegDelta = p2.yawDeg - p1.yawDeg
	
	if p3 then
		YawDegDelta = CameraMathModule.wrapDeg(YawDegDelta)
	end
	local NewYawDeg = p1.yawDeg + YawDegDelta * Alpha
	
	return {
		target = p1.target:Lerp(p2.target, Alpha),
		radius = p1.radius + (p2.radius - p1.radius) * Alpha,
		yawDeg = if p3 then CameraMathModule.wrapDeg(NewYawDeg) else NewYawDeg,
		pitchDeg = p1.pitchDeg + (p2.pitchDeg - p1.pitchDeg) * Alpha,
		zoomScale = p1.zoomScale + (p2.zoomScale - p1.zoomScale) * Alpha,
		pan = p1.pan:Lerp(p2.pan, Alpha)
	}
end

function CameraMathModule.fitCameraToBounds(p1, p2, p3)
	-- upvalues: ConstantsModule (copy), CameraMathModule (copy)
	local FieldOfViewDeg = p3 and p3.fieldOfViewDeg or ConstantsModule.DefaultFieldOfViewDeg
	local AspectRatio = p3 and p3.aspectRatio or 1
	local config = {
		zoomScale = 1,
		target = p1.Position,
		radius = CameraMathModule.getBoundsRadius(p2, p3 and p3.padding or ConstantsModule.DefaultPadding),
		yawDeg = p3 and p3.yawDeg or 0,
		pitchDeg = p3 and p3.pitchDeg or 0,
		pan = Vector2.zero
	}
	
	return CameraMathModule.getCameraCFrame(config, FieldOfViewDeg, AspectRatio), (CameraMathModule.getFitDistance(config.radius, FieldOfViewDeg, AspectRatio))
end

return CameraMathModule