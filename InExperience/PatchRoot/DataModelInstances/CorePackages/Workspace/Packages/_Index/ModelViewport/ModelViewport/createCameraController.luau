local TweenService = game:GetService("TweenService")
local CameraMathModule = require(script.Parent.CameraMath)
local ConstantsModule = require(script.Parent.Constants)
local RotationModeModule = require(script.Parent.Enums.RotationMode)
local _ = require(script.Parent.Types)

local function _(From, From1): boolean
	return From.target == From1.target and (From.radius == From1.radius and (From.yawDeg == From1.yawDeg and (From.pitchDeg == From1.pitchDeg and From.zoomScale == From1.zoomScale))) and From.pan == From1.pan
end

return function(p1)
	-- upvalues: ConstantsModule (copy), RotationModeModule (copy), CameraMathModule (copy), TweenService (copy)
	local Framing = p1.framing
	local Interaction = p1.interaction
	local OnChangedFunction = p1.onChanged
	local Model = nil
	local v1 = nil
	local To = nil
	local Config = nil
	
	local function _(From, YawDeg)
		return {
			target = From.target,
			radius = From.radius,
			yawDeg = YawDeg,
			pitchDeg = From.pitchDeg,
			zoomScale = From.zoomScale,
			pan = From.pan
		}
	end
	
	local _ = function()
		-- upvalues: Interaction (ref), RotationModeModule (upval)
		return Interaction.rotation or RotationModeModule.Yaw
	end
	
	local _ = function(Value: number): number
		-- upvalues: Interaction (ref)
		local Zoom = Interaction.zoom
		
		return if Zoom then math.clamp(Value, Zoom.minScale, Zoom.maxScale) else 1
	end
	
	local _ = function(p2, p3)
		-- upvalues: Interaction (ref), CameraMathModule (upval)
		local Pan = Interaction.pan
		
		return if Pan then CameraMathModule.clampPan(p2, p3, Pan.maxOffsetScale) else Vector2.zero
	end
	
	local function clampState(From)
		-- upvalues: CameraMathModule (upval), Interaction (ref)
		local ZoomScale: number = From.zoomScale
		local Zoom = Interaction.zoom
		local ClampedValue: number = if Zoom then math.clamp(ZoomScale, Zoom.minScale, Zoom.maxScale) else 1
		local Pan = From.pan
		local Radius = From.radius
		local Pan1 = Interaction.pan
		
		return {
			target = From.target,
			radius = From.radius,
			yawDeg = CameraMathModule.clampYawDeg(From.yawDeg, Interaction.yawLimitsDeg),
			pitchDeg = CameraMathModule.clampPitchDeg(From.pitchDeg, Interaction.pitchLimitsDeg),
			zoomScale = ClampedValue,
			pan = if Pan1 then CameraMathModule.clampPan(Pan, Radius, Pan1.maxOffsetScale) else Vector2.zero
		}
	end
	
	local function resolveBounds()
		-- upvalues: v1 (ref), Framing (ref), ConstantsModule (upval), CameraMathModule (upval), Model (ref)
		local V9 = v1 or { kind = "model" }
		local Padding = Framing.padding or ConstantsModule.DefaultPadding
		
		if V9.kind == "parts" then
			return CameraMathModule.getPartsBounds(V9.parts), V9.padding or Padding
		elseif V9.kind == "box" then
			return { cframe = V9.cframe, size = V9.size }, V9.padding or Padding
		elseif Model then
			local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
			
			return { cframe = BoundingCFrame, size = BoundingSize }, Padding
		else
			return nil, Padding
		end
	end
	
	local function computeFocusedState(p2)
		-- upvalues: resolveBounds (copy), v1 (ref), To (ref), Framing (ref), clampState (copy), CameraMathModule (upval)
		local ResolveBoundsResult, ResolveBoundsResult2 = resolveBounds()
		
		if ResolveBoundsResult then
			local V9 = v1 or { kind = "model" }
			local YawDeg = if p2 and To then To.yawDeg else Framing.initialYawDeg or 0
			local PitchDeg = if p2 and To then To.pitchDeg else Framing.initialPitchDeg or 0
			
			return (clampState({
				zoomScale = 1,
				target = ResolveBoundsResult.cframe.Position,
				radius = CameraMathModule.getBoundsRadius(ResolveBoundsResult.size, ResolveBoundsResult2),
				yawDeg = V9.yawDeg or YawDeg,
				pitchDeg = V9.pitchDeg or PitchDeg,
				pan = Vector2.zero
			}))
		else
			return nil
		end
	end
	
	local function startTransition(To1, p2)
		-- upvalues: To (ref), Config (ref), OnChangedFunction (copy), Interaction (ref), CameraMathModule (upval), ConstantsModule (upval)
		local From = To
		
		if To1 == nil or From == nil or p2 == nil or p2.duration <= 0 then
			Config = nil
			To = To1
			OnChangedFunction()
			
			return
		else
			local NoYawLimitsDeg = Interaction.yawLimitsDeg == nil
			Config = {
				elapsed = 0,
				startAlpha = 0,
				startEased = 0,
				from = {
					target = From.target,
					radius = From.radius,
					yawDeg = To1.yawDeg - (if NoYawLimitsDeg then CameraMathModule.wrapDeg(To1.yawDeg - From.yawDeg) else To1.yawDeg - From.yawDeg),
					pitchDeg = From.pitchDeg,
					zoomScale = From.zoomScale,
					pan = From.pan
				},
				to = To1,
				duration = p2.duration,
				easingStyle = p2.easingStyle or ConstantsModule.DefaultTransitionEasingStyle,
				easingDirection = p2.easingDirection or ConstantsModule.DefaultTransitionEasingDirection,
				wrapYaw = NoYawLimitsDeg
			}
			OnChangedFunction()
		end
	end
	
	local _ = function()
		-- upvalues: Config (ref)
		Config = nil
	end
	
	local _ = function(p2, Alpha)
		-- upvalues: TweenService (upval)
		return TweenService:GetValue(Alpha, p2.easingStyle, p2.easingDirection)
	end
	
	local _ = function(p2, Alpha)
		-- upvalues: TweenService (upval)
		local v2 = 1 - p2.startEased
		
		if v2 >= 0.1 then
			return (TweenService:GetValue(Alpha, p2.easingStyle, p2.easingDirection) - p2.startEased) / v2
		else
			local v3 = 1 - (Alpha - p2.startAlpha) / (1 - p2.startAlpha)
			
			return 1 - v3 * v3
		end
	end
	
	local function getSteppedState(p2, ElapsedRatio)
		-- upvalues: CameraMathModule (upval), TweenService (upval), clampState (copy)
		local From = p2.from
		local To = p2.to
		local LerpStateFunction = CameraMathModule.lerpState
		local v2 = 1 - p2.startEased
		local ValueRatio = nil
		
		if v2 >= 0.1 then
			ValueRatio = (TweenService:GetValue(ElapsedRatio, p2.easingStyle, p2.easingDirection) - p2.startEased) / v2
		else
			local v3 = 1 - (ElapsedRatio - p2.startAlpha) / (1 - p2.startAlpha)
			ValueRatio = 1 - v3 * v3
		end
		local LerpStateResult = LerpStateFunction(From, To, ValueRatio, false)
		
		return (clampState({
			target = LerpStateResult.target,
			radius = math.max(LerpStateResult.radius, (math.min(From.radius, To.radius))),
			yawDeg = if p2.wrapYaw then CameraMathModule.wrapDeg(LerpStateResult.yawDeg) else LerpStateResult.yawDeg,
			pitchDeg = LerpStateResult.pitchDeg,
			zoomScale = LerpStateResult.zoomScale,
			pan = LerpStateResult.pan
		}))
	end
	
	local function retarget(p2, From)
		-- upvalues: To (ref), Interaction (ref), getSteppedState (copy), TweenService (upval), CameraMathModule (upval)
		local From1 = To
		local ElapsedRatio = p2.elapsed / p2.duration
		local To1 = p2.to
		local NoYawLimitsDeg = Interaction.yawLimitsDeg == nil
		p2.to = From
		
		if not From1 or ElapsedRatio >= 1 then return end
		if NoYawLimitsDeg == p2.wrapYaw and (From.target == To1.target and (From.radius == To1.radius and (From.yawDeg == To1.yawDeg and (From.pitchDeg == To1.pitchDeg and (From.zoomScale == To1.zoomScale and From.pan == To1.pan))))) then
			local SteppedState = getSteppedState(p2, ElapsedRatio)
			
			if SteppedState.target == From1.target and (SteppedState.radius == From1.radius and (SteppedState.yawDeg == From1.yawDeg and (SteppedState.pitchDeg == From1.pitchDeg and (SteppedState.zoomScale == From1.zoomScale and SteppedState.pan == From1.pan)))) then return end
		end
		local YawDegDelta = From.yawDeg - From1.yawDeg
		
		if NoYawLimitsDeg then
			local From2 = p2.from
			local YawDeg = From2.yawDeg
			local YawDegDelta1 = To1.yawDeg - From2.yawDeg
			local v2 = 1 - p2.startEased
			local ValueRatio = nil
			
			if v2 >= 0.1 then
				ValueRatio = (TweenService:GetValue(ElapsedRatio, p2.easingStyle, p2.easingDirection) - p2.startEased) / v2
			else
				local v3 = 1 - (ElapsedRatio - p2.startAlpha) / (1 - p2.startAlpha)
				ValueRatio = 1 - v3 * v3
			end
			local YawDegDelta2 = To1.yawDeg - (YawDeg + YawDegDelta1 * ValueRatio)
			YawDegDelta = YawDegDelta2 + CameraMathModule.wrapDeg(CameraMathModule.wrapDeg(YawDegDelta) - YawDegDelta2)
		end
		p2.from = {
			target = From1.target,
			radius = From1.radius,
			yawDeg = From.yawDeg - YawDegDelta,
			pitchDeg = From1.pitchDeg,
			zoomScale = From1.zoomScale,
			pan = From1.pan
		}
		p2.wrapYaw = NoYawLimitsDeg
		p2.startAlpha = ElapsedRatio
		p2.startEased = TweenService:GetValue(ElapsedRatio, p2.easingStyle, p2.easingDirection)
	end
	
	local function refit()
		-- upvalues: To (ref), resolveBounds (copy), Config (ref), retarget (copy), clampState (copy), CameraMathModule (upval), OnChangedFunction (copy), computeFocusedState (copy)
		local From = To
		local ResolveBoundsResult, ResolveBoundsResult2 = resolveBounds()
		local Config1 = Config
		
		if Config1 and ResolveBoundsResult then
			local To1 = Config1.to
			retarget(Config1, (clampState({
				target = ResolveBoundsResult.cframe.Position,
				radius = CameraMathModule.getBoundsRadius(ResolveBoundsResult.size, ResolveBoundsResult2),
				yawDeg = To1.yawDeg,
				pitchDeg = To1.pitchDeg,
				zoomScale = To1.zoomScale,
				pan = To1.pan
			})))
			OnChangedFunction()
			
			return
		else
			Config = nil
			To = if ResolveBoundsResult then if From then clampState({
				target = ResolveBoundsResult.cframe.Position,
				radius = CameraMathModule.getBoundsRadius(ResolveBoundsResult.size, ResolveBoundsResult2),
				yawDeg = From.yawDeg,
				pitchDeg = From.pitchDeg,
				zoomScale = From.zoomScale,
				pan = From.pan
			}) else computeFocusedState(false) else nil
			OnChangedFunction()
		end
	end
	
	return {
		setOptions = function(Value, Value1)
			-- upvalues: ConstantsModule (upval), Framing (ref), Interaction (ref), resolveBounds (copy), clampState (copy), CameraMathModule (upval), Config (ref), retarget (copy), To (ref), OnChangedFunction (copy)
			local v2 = (Value.padding or ConstantsModule.DefaultPadding) ~= (Framing.padding or ConstantsModule.DefaultPadding)
			Framing = Value
			Interaction = Value1
			local v3 = nil
			local DefaultPadding = ConstantsModule.DefaultPadding
			
			if v2 then
				v3, DefaultPadding = resolveBounds()
			end
			local function withOptions(To)
				-- upvalues: clampState (upval), v3 (ref), CameraMathModule (upval), DefaultPadding (ref)
				return (clampState({
					target = To.target,
					radius = if v3 then CameraMathModule.getBoundsRadius(v3.size, DefaultPadding) else To.radius,
					yawDeg = To.yawDeg,
					pitchDeg = To.pitchDeg,
					zoomScale = To.zoomScale,
					pan = To.pan
				}))
			end
			
			local Config1 = Config
			
			if Config1 then
				retarget(Config1, (withOptions(Config1.to)))
			elseif To then
				To = withOptions(To)
			end
			OnChangedFunction()
		end,
		setModel = function(Value, p2)
			-- upvalues: Model (ref), refit (copy)
			Model = Value
			
			if p2 then
				refit()
			end
		end,
		focusOn = function(p2, p3)
			-- upvalues: v1 (ref), startTransition (copy), computeFocusedState (copy)
			v1 = p2
			startTransition(computeFocusedState(true), p3)
		end,
		refit = refit,
		reset = function(p2)
			-- upvalues: startTransition (copy), computeFocusedState (copy)
			startTransition(computeFocusedState(false), p2)
		end,
		rotate = function(p2, p3)
			-- upvalues: To (ref), Interaction (ref), RotationModeModule (upval), Config (ref), clampState (copy), OnChangedFunction (copy)
			local From = To
			local Rotation = Interaction.rotation or RotationModeModule.Yaw
			
			if From and Rotation ~= RotationModeModule.None then
				Config = nil
				To = clampState({
					target = From.target,
					radius = From.radius,
					yawDeg = From.yawDeg + p2,
					pitchDeg = if Rotation == RotationModeModule.Gimbal then From.pitchDeg + p3 else From.pitchDeg,
					zoomScale = From.zoomScale,
					pan = From.pan
				})
				OnChangedFunction()
				
				return
			end
		end,
		zoomBySteps = function(p2)
			-- upvalues: To (ref), Interaction (ref), Config (ref), clampState (copy), CameraMathModule (upval), OnChangedFunction (copy)
			local From = To
			
			if From and Interaction.zoom then
				Config = nil
				To = clampState({
					target = From.target,
					radius = From.radius,
					yawDeg = From.yawDeg,
					pitchDeg = From.pitchDeg,
					zoomScale = CameraMathModule.applyZoomSteps(From.zoomScale, p2),
					pan = From.pan
				})
				OnChangedFunction()
				
				return
			end
		end,
		panByPixels = function(Vector, Vector1)
			-- upvalues: To (ref), Interaction (ref), Config (ref), CameraMathModule (upval), Framing (ref), ConstantsModule (upval), clampState (copy), OnChangedFunction (copy)
			local From = To
			
			if From and Interaction.pan and Vector1.X > 0 and Vector1.Y > 0 then
				Config = nil
				To = clampState({
					target = From.target,
					radius = From.radius,
					yawDeg = From.yawDeg,
					pitchDeg = From.pitchDeg,
					zoomScale = From.zoomScale,
					pan = From.pan + Vector2.new(-Vector.X, Vector.Y) * CameraMathModule.getStudsPerPixel(From, Framing.fieldOfViewDeg or ConstantsModule.DefaultFieldOfViewDeg, Vector1.X / Vector1.Y, Vector1.Y)
				})
				OnChangedFunction()
				
				return
			end
		end,
		step = function(p2)
			-- upvalues: Config (ref), To (ref), getSteppedState (copy), OnChangedFunction (copy)
			local Config1 = Config
			
			if not Config1 then return end
			Config1.elapsed += p2
			local Smallest = math.min(Config1.elapsed / Config1.duration, 1)
			To = getSteppedState(Config1, Smallest)
			
			if Smallest >= 1 then
				To = Config1.to
				Config = nil
			end
			OnChangedFunction()
		end,
		isTransitioning = function(): boolean
			-- upvalues: Config (ref)
			return Config ~= nil
		end,
		getState = function()
			-- upvalues: To (ref)
			return To
		end,
		getFieldOfViewDeg = function()
			-- upvalues: Framing (ref), ConstantsModule (upval)
			return Framing.fieldOfViewDeg or ConstantsModule.DefaultFieldOfViewDeg
		end,
		getCameraCFrame = function(To1)
			-- upvalues: To (ref), CameraMathModule (upval), Framing (ref), ConstantsModule (upval)
			return if To then CameraMathModule.getCameraCFrame(To, Framing.fieldOfViewDeg or ConstantsModule.DefaultFieldOfViewDeg, To1) else nil
		end
	}
end