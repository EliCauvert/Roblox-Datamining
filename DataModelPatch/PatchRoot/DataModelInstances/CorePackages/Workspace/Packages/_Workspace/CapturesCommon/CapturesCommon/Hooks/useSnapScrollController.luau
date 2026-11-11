local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local NavigationTypeModule = require(Parent.Enums.NavigationType)
local IsPointWithinBoundsModule = require(Parent.Utils.isPointWithinBounds)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseMotorFunction = ReactOtterModule.useMotor
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState

return function(p1, p2: number, Current, MaxValue)
	-- upvalues: UseRefFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseMotorFunction (copy), ReactModule (copy), ReactOtterModule (copy), NavigationTypeModule (copy), UseEffectFunction (copy), UseEventConnectionFunction (copy), UserInputService (copy), IsPointWithinBoundsModule (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(p2)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(false)
	local UseRefResult3 = UseRefFunction(nil)
	local UseRefResult4 = UseRefFunction(nil)
	local UseRefResult5 = UseRefFunction(nil)
	local UseRefResult6 = UseRefFunction(nil)
	local UseRefResult7 = UseRefFunction(false)
	local UseMotorResult = UseMotorFunction((p2 - 1) * -Current.Y, UseCallbackFunction(function(YOffset)
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			UseRefResult1.current.Position = UDim2.new(0.5, 0, 0, YOffset)
			
			return
		end
	end, {}), (UseCallbackFunction(function()
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = false
	end, {})))
	local UseResult = ReactModule.useCallback(function(Value: number, p3)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), UseRefResult7 (copy), MaxValue (copy), Current (copy), UseMotorResult (copy), ReactOtterModule (upval), UseStateResult2 (copy)
		if not p1 or not UseRefResult1.current or not UseRefResult.current or UseRefResult2.current or UseRefResult7.current or MaxValue < 1 then return end
		assert(UseRefResult1.current ~= nil, "motionRef.current is nil")
		UseRefResult2.current = true
		local ClampedValue = math.clamp(Value, 1, MaxValue)
		local ScaledClampedValue = (ClampedValue - 1) * -Current.Y
		
		if p3 then
			UseMotorResult(ReactOtterModule.instant(ScaledClampedValue))
		else
			UseMotorResult(ReactOtterModule.spring(ScaledClampedValue, { frequency = 8 }))
		end
		UseStateResult2(ClampedValue)
	end, { p1, Current, MaxValue, UseMotorResult })
	local UseResult1 = ReactModule.useCallback(function(Next, p3)
		-- upvalues: NavigationTypeModule (upval), UseResult (copy), UseStateResult (copy)
		if Next == NavigationTypeModule.Previous then
			UseResult(UseStateResult - 1, p3)
			
			return
		end
		if Next == NavigationTypeModule.Next then
			UseResult(UseStateResult + 1, p3)
			
			return
		else
			UseResult(UseStateResult, p3)
		end
	end, { UseStateResult, UseResult })
	UseEffectFunction(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), Current (copy), UseRefResult2 (copy), UseResult1 (copy), NavigationTypeModule (upval)
		if UseRefResult1.current and UseRefResult3.current ~= Current then
			UseRefResult2.current = false
			UseResult1(NavigationTypeModule.Current, true)
			UseRefResult3.current = Current
			
			return
		end
	end, { Current, UseResult1 })
	UseEventConnectionFunction(UserInputService.TouchPinch, (ReactModule.useCallback(function(_, _, _, UserInputState, _)
		-- upvalues: UseResult1 (copy), NavigationTypeModule (upval), UseRefResult7 (copy), UseRefResult5 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			UseResult1(NavigationTypeModule.Current)
			UseRefResult7.current = true
			
			return
		end
		if UserInputState == Enum.UserInputState.End then
			UseRefResult7.current = false
			UseRefResult5.current = nil
		end
	end, { UseResult1 })))
	UseEventConnectionFunction(UserInputService.TouchStarted, (ReactModule.useCallback(function(Current)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult5 (copy), IsPointWithinBoundsModule (upval), UseRefResult4 (copy), UseRefResult6 (copy), UseMotorResult (copy), ReactOtterModule (upval)
		if not p1 or not UseRefResult1.current or not UseRefResult.current or UseRefResult5.current then return end
		if IsPointWithinBoundsModule(Vector2.new(Current.Position.X, Current.Position.Y), UseRefResult.current.AbsolutePosition, UseRefResult.current.AbsoluteSize) then
			UseRefResult4.current = UseRefResult1.current.Position.Y.Offset
			UseRefResult6.current = Current.Position.Y
			UseRefResult5.current = Current
			UseMotorResult(ReactOtterModule.instant(UseRefResult1.current.Position.Y.Offset))
			
			return
		end
	end, { p1, UseMotorResult })))
	UseEventConnectionFunction(UserInputService.TouchMoved, (ReactModule.useCallback(function(Current1)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult7 (copy), MaxValue (copy), Current (copy), UseMotorResult (copy), ReactOtterModule (upval)
		if p1 and UseRefResult1.current and UseRefResult.current and UseRefResult5.current == Current1 and UseRefResult4.current and UseRefResult6.current and not UseRefResult7.current then
			UseMotorResult(ReactOtterModule.instant((math.clamp(UseRefResult4.current + (Current1.Position.Y - UseRefResult6.current), (MaxValue - 1) * -Current.Y - 100, 100))))
			
			return
		end
	end, { p1, Current, MaxValue, UseMotorResult })))
	UseEventConnectionFunction(UserInputService.TouchSwipe, (ReactModule.useCallback(function(SwipeDirection)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult5 (copy), UseRefResult7 (copy), UseRefResult2 (copy), UseResult1 (copy), NavigationTypeModule (upval)
		if not p1 or not UseRefResult1.current or not UseRefResult.current or not UseRefResult5.current or UseRefResult7.current or UseRefResult2.current then return end
		if SwipeDirection == Enum.SwipeDirection.Up then
			UseResult1(NavigationTypeModule.Next)
			
			return
		end
		if SwipeDirection == Enum.SwipeDirection.Down then
			UseResult1(NavigationTypeModule.Previous)
			
			return
		else
			UseResult1(NavigationTypeModule.Current)
		end
	end, { p1, UseResult1 })))
	UseEventConnectionFunction(UserInputService.TouchEnded, (ReactModule.useCallback(function(Current1)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult2 (copy), Current (copy), UseResult1 (copy), NavigationTypeModule (upval)
		if not p1 or not UseRefResult1.current or not UseRefResult.current or UseRefResult5.current ~= Current1 or not UseRefResult4.current or UseRefResult2.current then return end
		local OffsetDelta = UseRefResult1.current.Position.Y.Offset - UseRefResult4.current
		
		if Current.Y * 0.25 < -OffsetDelta then
			UseResult1(NavigationTypeModule.Next)
		elseif Current.Y * 0.25 < OffsetDelta then
			UseResult1(NavigationTypeModule.Previous)
		else
			UseResult1(NavigationTypeModule.Current)
		end
		UseRefResult5.current = nil
		UseRefResult4.current = nil
	end, { p1, Current, UseResult1 })))
	UseEventConnectionFunction(UserInputService.PointerAction, (ReactModule.useCallback(function(p3: number, Vector)
		-- upvalues: p1 (copy), UseResult1 (copy), NavigationTypeModule (upval)
		if not p1 then return end
		if p3 < 0 or Vector.Y < -0.1 then
			UseResult1(NavigationTypeModule.Next)
			
			return
		end
		if p3 > 0 or Vector.Y > 0.1 then
			UseResult1(NavigationTypeModule.Previous)
		end
	end, { p1, UseResult1 })))
	
	return UseStateResult, UseRefResult, UseRefResult1, UseResult, UseResult1
end