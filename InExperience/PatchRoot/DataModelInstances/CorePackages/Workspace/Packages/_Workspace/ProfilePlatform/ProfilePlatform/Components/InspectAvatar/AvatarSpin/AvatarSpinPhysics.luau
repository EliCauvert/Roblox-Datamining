local TweenService = game:GetService("TweenService")
local AvatarSpinPhysicsModule = { SNAP_TOLERANCE_DEGREES = 0.5 }
AvatarSpinPhysicsModule.__index = AvatarSpinPhysicsModule

function AvatarSpinPhysicsModule.normalizeAngle(p1: number): number
	return p1 % 360
end

function AvatarSpinPhysicsModule.shortestDelta(p1, p2): number
	return (p2 - p1 + 180) % 360 - 180
end

function AvatarSpinPhysicsModule.new(p1)
	-- upvalues: AvatarSpinPhysicsModule (copy)
	return (setmetatable({
		velocity = 0,
		isDragging = false,
		mode = "idle",
		_target = 0,
		_tween = nil,
		_lastX = 0,
		angle = if p1 and p1.angle then p1.angle else 0,
		snap = not p1 or p1.snap == nil or p1.snap,
		degreesPerPixel = if p1 and p1.degreesPerPixel then p1.degreesPerPixel else 0.5,
		_samples = {}
	}, AvatarSpinPhysicsModule))
end

function AvatarSpinPhysicsModule:dragStart(_lastX, Time)
	self.isDragging = true
	self.mode = "idle"
	self._tween = nil
	self.velocity = 0
	self._lastX = _lastX
	self._samples = { { time = Time, angle = self.angle } }
end

function AvatarSpinPhysicsModule:dragMove(_lastX, Time)
	if not self.isDragging then return end
	self.angle += (_lastX - self._lastX) * self.degreesPerPixel
	self._lastX = _lastX
	table.insert(self._samples, { time = Time, angle = self.angle })
	while #self._samples > 2 and Time - self._samples[1].time > 0.1 do
		table.remove(self._samples, 1)
	end
end

function AvatarSpinPhysicsModule:dragEnd(p1)
	if not self.isDragging then return end
	self.isDragging = false
	local v1 = 1
	
	for i = #self._samples, 2, -1 do
		if self._samples[i].time - self._samples[i - 1].time <= 0.05 then
			continue
		end
		v1 = i
		break
	end
	local Sample = self._samples[v1]
	local Sample1 = self._samples[#self._samples]
	self:release((math.clamp(if Sample and Sample1 and Sample1.time - Sample.time > 0.008 and p1 - Sample1.time < 0.08 then (Sample1.angle - Sample.angle) / (Sample1.time - Sample.time) else 0, -1440, 1440)))
end

function AvatarSpinPhysicsModule:release(Value: number)
	self.velocity = Value
	
	if self.snap then
		local NewAngle = self.angle + Value / 4
		local ScaledRounded = math.round(NewAngle / 90) * 90
		
		if math.abs(NewAngle - ScaledRounded) <= 30 then
			self.mode = "spring"
			self._target = ScaledRounded
			
			return
		end
	end
	self.mode = if math.abs(Value) > 1 then "inertia" else "idle"
end

function AvatarSpinPhysicsModule:tweenBy(p2, p3: number)
	self.isDragging = false
	self.velocity = 0
	self.mode = "tween"
	self._tween = {
		elapsed = 0,
		from = self.angle,
		to = self.angle + p2,
		duration = math.max(p3, 0.001)
	}
end

function AvatarSpinPhysicsModule:update(p2: number): boolean
	-- upvalues: TweenService (copy)
	if self.isDragging or self.mode == "idle" then
		return false
	end
	local Smallest = math.min(p2, 0.1)
	local Angle = self.angle
	
	if self.mode == "inertia" then
		local Exponential = math.exp(Smallest * -4)
		self.angle += self.velocity * (1 - Exponential) / 4
		self.velocity *= Exponential
		
		if math.abs(self.velocity) < 6 then
			self.velocity = 0
			self.mode = "idle"
		end
	elseif self.mode == "spring" then
		local Smallest1: number = Smallest
		while Smallest1 > 0.000001 do
			local Smallest2 = math.min(Smallest1, 0.004166666666666667)
			self.velocity += (-90 * (self.angle - self._target) - 18.973665961010276 * self.velocity) * Smallest2
			self.angle += self.velocity * Smallest2
			Smallest1 -= Smallest2
		end
		if math.abs(self.angle - self._target) < 0.05 and math.abs(self.velocity) < 0.5 then
			self.angle = self._target
			self.velocity = 0
			self.mode = "idle"
		end
	elseif self.mode == "tween" then
		local Tween = self._tween
		Tween.elapsed += Smallest
		local ClampedValue = math.clamp(Tween.elapsed / Tween.duration, 0, 1)
		local Angle1 = self.angle
		self.angle = Tween.from + (Tween.to - Tween.from) * TweenService:GetValue(ClampedValue, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
		self.velocity = if Smallest > 0 then (self.angle - Angle1) / Smallest else 0
		
		if ClampedValue >= 1 then
			self.angle = Tween.to
			self.velocity = 0
			self.mode = "idle"
			self._tween = nil
		end
	end
	return self.angle ~= Angle
end

function AvatarSpinPhysicsModule:isSettled(): boolean
	return not self.isDragging and self.mode == "idle"
end

return AvatarSpinPhysicsModule