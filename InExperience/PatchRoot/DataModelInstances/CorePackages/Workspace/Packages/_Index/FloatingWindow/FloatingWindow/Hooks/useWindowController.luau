local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local BehaviorsModule = require(Parent.Behaviors)
local _ = require(Parent.Corner)
local GeometryModule = require(Parent.Geometry)
local _ = require(Parent.Types)
local _UDim2 = UDim2.fromScale(0.5, 0.5)
local config = { dampingRatio = 1, frequency = 4 }

local function toVector2(Vector): Vector2
	return Vector2.new(Vector.x, Vector.y)
end

return function(p1)
	-- upvalues: BehaviorsModule (copy), ReactModule (copy), toVector2 (copy), ReactOtterModule (copy), config (copy), GeometryModule (copy), _UDim2 (copy)
	local Behavior = p1.behavior or BehaviorsModule.Contained
	local DragThreshold = p1.dragThreshold or 25
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Idle = ReactModule.useRef("Idle")
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult6 (copy)
		UseRefResult6.current = false
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseMotorResult = ReactOtterModule.useMotor({ x = 0, y = 0 }, ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy), toVector2 (upval)
		UseBindingResult2(toVector2(p2))
	end, {}), UseResult)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy)
		return UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	end, { UseBindingResult })
	local UseResult1 = ReactModule.useCallback(function(Vector)
		-- upvalues: UseBindingResult2 (copy), UseMotorResult (copy), ReactOtterModule (upval)
		UseBindingResult2(Vector)
		UseMotorResult({
			x = ReactOtterModule.instant(Vector.X),
			y = ReactOtterModule.instant(Vector.Y)
		})
	end, {})
	local UseResult11 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult5 (copy), UseResult1 (copy)
		UseRefResult5.current = p2.corner
		UseResult1(p2.center)
	end, { UseResult1 })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult5 (copy), UseRefResult6 (copy), UseMotorResult (copy), ReactOtterModule (upval), config (upval)
		UseRefResult5.current = p2.corner
		UseRefResult6.current = true
		UseMotorResult({
			x = ReactOtterModule.spring(p2.center.X, config),
			y = ReactOtterModule.spring(p2.center.Y, config)
		})
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Corner)
		-- upvalues: GeometryModule (upval), UseRefResult (copy), UseRefResult1 (copy)
		return {
			center = GeometryModule.cornerTarget(UseRefResult.current.AbsoluteSize, UseRefResult1.current.AbsoluteSize, Corner),
			corner = Corner
		}
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: BehaviorsModule (upval), GeometryModule (upval), UseRefResult4 (copy), UseRefResult (copy), UseRefResult1 (copy), UseResult3 (copy), UseRefResult5 (copy)
		return {
			[BehaviorsModule.Contained] = {
				rest = function(_)
					-- upvalues: GeometryModule (upval), UseRefResult4 (upval), UseRefResult (upval), UseRefResult1 (upval)
					return {
						center = GeometryModule.clampCenter(UseRefResult4.current, UseRefResult.current.AbsoluteSize, UseRefResult1.current.AbsoluteSize)
					}
				end
			},
			[BehaviorsModule.CornerDock] = {
				release = function(p2)
					-- upvalues: UseResult3 (upval), GeometryModule (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult5 (upval)
					return UseResult3(GeometryModule.fixedAxisCorner(p2, UseRefResult.current.AbsoluteSize, UseRefResult1.current.AbsoluteSize, UseRefResult5.current))
				end,
				rest = function(p2)
					-- upvalues: UseResult3 (upval), UseRefResult5 (upval), GeometryModule (upval), UseRefResult (upval)
					return UseResult3(UseRefResult5.current or GeometryModule.nearestCorner(p2, UseRefResult.current.AbsoluteSize))
				end
			}
		}
	end, { UseResult3 })
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult1 (copy), Behavior (copy)
		return UseMemoResult1[Behavior].rest(p2)
	end, { Behavior, UseMemoResult1 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), GeometryModule (upval), UseRefResult4 (copy), p1 (copy), _UDim2 (upval), UseResult11 (copy), UseResult4 (copy), UseStateResult2 (copy), Idle (copy), UseBindingResult (copy), UseRefResult6 (copy), UseResult2 (copy)
		local AbsoluteSize = UseRefResult.current.AbsoluteSize
		local AbsoluteSize1 = UseRefResult1.current.AbsoluteSize
		
		if not GeometryModule.hasPositiveSize(AbsoluteSize) or not GeometryModule.hasPositiveSize(AbsoluteSize1) then return end
		if UseRefResult4.current == nil then
			local ResolveCenterResult = GeometryModule.resolveCenter(p1.initialCenter or _UDim2, AbsoluteSize)
			UseRefResult4.current = ResolveCenterResult
			UseResult11(UseResult4(ResolveCenterResult))
			UseStateResult2(true)
			
			return
		end
		if Idle.current ~= "Idle" then return end
		local UseResultResult = UseResult4(UseBindingResult:getValue())
		
		if UseRefResult6.current then
			UseResult2(UseResultResult)
			
			return
		else
			UseResult11(UseResultResult)
		end
	end, { UseResult2, UseResult11, p1.initialCenter, UseResult4 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult5 (copy)
		UseResult5()
	end, { Behavior, UseResult5 })
	local UseResult6 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseRefResult2 (copy), Idle (copy), DragThreshold (copy), UseRefResult3 (copy), UseRefResult4 (copy), GeometryModule (upval), UseRefResult (copy), UseRefResult1 (copy), UseResult1 (copy)
		local Direction = p2 - UseRefResult2.current
		local Magnitude: number = Direction.Magnitude
		
		if Idle.current == "Pressed" and Magnitude <= DragThreshold then
			return nil
		else
			Idle.current = "Dragging"
			local Largest = math.max(Magnitude - DragThreshold, 0)
			local NewCurrent = UseRefResult3.current + (if Magnitude > 0 then Direction.Unit * Largest else Vector2.zero)
			UseRefResult4.current = NewCurrent
			local ClampCenterResult = GeometryModule.clampCenter(NewCurrent, UseRefResult.current.AbsoluteSize, UseRefResult1.current.AbsoluteSize)
			UseResult1(ClampCenterResult)
			
			return ClampCenterResult
		end
	end, { DragThreshold, UseResult1 })
	local UseResult7 = ReactModule.useCallback(function(_, Current)
		-- upvalues: UseRefResult6 (copy), UseBindingResult (copy), UseResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), Idle (copy)
		UseRefResult6.current = false
		local Value = UseBindingResult:getValue()
		UseResult1(Value)
		UseRefResult2.current = Current
		UseRefResult3.current = Value
		Idle.current = "Pressed"
	end, { UseResult1 })
	local UseResult8 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseResult6 (copy), Idle (copy), UseMemoResult1 (copy), Behavior (copy), UseResult2 (copy), UseRefResult3 (copy), p1 (copy)
		local UseResultResult = UseResult6(nil, p2)
		Idle.current = "Idle"
		local UseMemoResultEntry = UseMemoResult1[Behavior]
		
		if UseResultResult == nil then
			UseResult2(UseMemoResultEntry.rest(UseRefResult3.current))
			
			if p1.onActivated ~= nil then
				p1.onActivated()
				
				return
			end
		elseif UseMemoResultEntry.release ~= nil then
			UseResult2(UseMemoResultEntry.release(UseResultResult))
		end
	end, {
		UseResult2,
		Behavior,
		UseMemoResult1,
		UseResult6,
		p1.onActivated
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), Idle (copy), UseResult5 (copy)
		if p1.draggable == false then
			Idle.current = "Idle"
			UseResult5()
			
			return
		end
	end, { p1.draggable, UseResult5 })
	local UseRefResult7 = ReactModule.useRef(p1.dragInputTarget)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult7 (copy), p1 (copy), Idle (copy), UseResult5 (copy)
		if UseRefResult7.current == p1.dragInputTarget then return end
		UseRefResult7.current = p1.dragInputTarget
		
		if Idle.current ~= "Idle" then
			Idle.current = "Idle"
			UseResult5()
			
			return
		end
	end, { p1.dragInputTarget, UseResult5 })
	
	return {
		boundsRef = UseRefResult,
		initialized = UseStateResult,
		onDragContinue = UseResult6,
		onDragEnd = UseResult8,
		onDragStart = UseResult7,
		position = UseMemoResult,
		refit = UseResult5,
		windowRef = UseRefResult1
	}
end