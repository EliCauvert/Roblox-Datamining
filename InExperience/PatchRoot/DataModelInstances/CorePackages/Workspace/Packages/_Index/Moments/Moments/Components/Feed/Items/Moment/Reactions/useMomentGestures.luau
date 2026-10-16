local Parent = script:FindFirstAncestor("Moments").Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function _(Input): boolean --[[ Line: 72 | Named "isActivationInput" ]]
	return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
end

local _ = function(p1, p2, p3): boolean --[[ Line: 77 | Named "withinDistance" ]]
	return (p1 - p2).Magnitude <= p3
end

local _ = function(Frame: Frame, Vector): boolean --[[ Line: 81 | Named "containsPoint" ]]
	local AbsolutePosition = Frame.AbsolutePosition
	local NewAbsolutePosition = AbsolutePosition + Frame.AbsoluteSize
	
	return AbsolutePosition.X <= Vector.X and (Vector.X <= NewAbsolutePosition.X and AbsolutePosition.Y <= Vector.Y) and Vector.Y <= NewAbsolutePosition.Y
end

return function(p1, Current, p2, p3) --[[ Line: 87 | Named "useMomentGestures" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy), UseEventConnectionFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local Callback = p2 or os.clock
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(false)
	local UseRefResult12 = ReactModule.useRef(false)
	local MovementThreshold = if p3 == nil or p3.movementThreshold == nil then 50 else p3.movementThreshold
	local LongPressThreshold = if p3 == nil or p3.longPressThreshold == nil then 0.5 else p3.longPressThreshold
	local ScrollingFrameRef = if p3 == nil then nil else p3.scrollingFrameRef
	local CancellationSignal = if p3 == nil then nil else p3.cancellationSignal
	local IsCancelWhenInactive: boolean = p3 ~= nil and p3.cancelWhenInactive == true
	local IsCancelOnUserScroll: boolean = p3 ~= nil and p3.cancelOnUserScroll == true
	local UseResult = ReactModule.useCallback(function() --[[ Line: 126 ]]
		-- upvalues: UseRefResult9 (copy), UseRefResult1 (copy)
		if not UseRefResult9.current then return end
		UseRefResult9.current = false
		local OnLongPressCancelFunction: () -> () = UseRefResult1.current.onLongPressCancel
		
		if OnLongPressCancelFunction then
			OnLongPressCancelFunction()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 137 ]]
		-- upvalues: UseResult (copy), UseRefResult7 (copy), UseRefResult10 (copy), UseRefResult11 (copy), UseRefResult12 (copy), UseRefResult8 (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult6 (copy)
		UseResult()
		UseRefResult7.current = nil
		UseRefResult10.current = nil
		UseRefResult11.current = false
		UseRefResult12.current = false
		UseRefResult8.current = false
		UseRefResult4.current = 0
		
		if UseRefResult5.current then
			task.cancel(UseRefResult5.current)
			UseRefResult5.current = nil
		end
		if UseRefResult6.current then
			task.cancel(UseRefResult6.current)
			UseRefResult6.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Input) --[[ Line: 155 ]]
		-- upvalues: p1 (copy), UseRefResult7 (copy), UseRefResult8 (copy), UseRefResult11 (copy), UseRefResult12 (copy), Callback (copy), UseRefResult10 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult5 (copy), UseResult (copy), UseRefResult9 (copy), UseRefResult1 (copy), LongPressThreshold (copy)
		if not p1 or Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		UseRefResult7.current = Input
		UseRefResult8.current = false
		UseRefResult11.current = false
		UseRefResult12.current = false
		local CallbackResult = Callback()
		local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
		UseRefResult10.current = _Vector2
		local IsMagnitudeBelow = (_Vector2 - UseRefResult3.current).Magnitude <= 50
		
		if CallbackResult - UseRefResult2.current <= 0.25 and IsMagnitudeBelow then
			UseRefResult4.current += 1
		else
			UseRefResult4.current = 1
		end
		UseRefResult2.current = CallbackResult
		UseRefResult3.current = _Vector2
		
		if UseRefResult4.current >= 2 and UseRefResult6.current then
			task.cancel(UseRefResult6.current)
			UseRefResult6.current = nil
		end
		if UseRefResult5.current then
			task.cancel(UseRefResult5.current)
		end
		UseResult()
		UseRefResult9.current = true
		local OnLongPressStartFunction: () -> () = UseRefResult1.current.onLongPressStart
		
		if OnLongPressStartFunction then
			OnLongPressStartFunction()
		end
		UseRefResult5.current = task.delay(LongPressThreshold, function() --[[ Line: 196 ]]
			-- upvalues: p1 (upval), UseRefResult7 (upval), Input (copy), UseRefResult8 (upval), UseRefResult9 (upval), UseRefResult1 (upval)
			if not p1 then return end
			if UseRefResult7.current == Input and not UseRefResult8.current then
				UseRefResult8.current = true
				UseRefResult9.current = false
				local OnLongPressFunction: () -> () = UseRefResult1.current.onLongPress
				
				if OnLongPressFunction then
					OnLongPressFunction()
				end
			end
		end)
	end, { p1, Callback, LongPressThreshold, UseResult })
	local UseResult3 = ReactModule.useCallback(function(Input) --[[ Line: 214 ]]
		-- upvalues: UseRefResult7 (copy), UseRefResult10 (copy), ScrollingFrameRef (copy), IsCancelOnUserScroll (copy), UserInputService (upval), UseRefResult5 (copy), UseRefResult1 (copy), UseRefResult12 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseResult1 (copy), p1 (copy), UseRefResult11 (copy), MovementThreshold (copy), UseResult (copy)
		local Current = UseRefResult7.current
		local Current1 = UseRefResult10.current
		local Current2 = if ScrollingFrameRef == nil then nil else ScrollingFrameRef.current
		
		if IsCancelOnUserScroll and Current2 ~= nil then
			local UserInputType = Input.UserInputType
			local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
			local IsInputMatch: boolean = UserInputType == Enum.UserInputType.Touch and Input == Current
			local IsUserInputTypeMatch: boolean = UserInputType == Enum.UserInputType.MouseMovement and (Current ~= nil and Current.UserInputType == Enum.UserInputType.MouseButton1)
			local Inverted: boolean = Current ~= nil and (Current1 ~= nil and (if IsInputMatch then not ((_Vector2 - Current1).Magnitude <= 2) else IsUserInputTypeMatch and not ((_Vector2 - Current1).Magnitude <= 2)))
			local IsYBelow = false
			
			if UserInputType == Enum.UserInputType.MouseWheel then
				local MouseLocation = UserInputService:GetMouseLocation()
				local AbsolutePosition = Current2.AbsolutePosition
				local NewAbsolutePosition = AbsolutePosition + Current2.AbsoluteSize
				IsYBelow = AbsolutePosition.X <= MouseLocation.X and (MouseLocation.X <= NewAbsolutePosition.X and AbsolutePosition.Y <= MouseLocation.Y) and MouseLocation.Y <= NewAbsolutePosition.Y
			end
			local HasOnLongPress: boolean = UseRefResult5.current ~= nil and UseRefResult1.current.onLongPress ~= nil
			
			if Inverted and HasOnLongPress and (_Vector2 - Current1).Magnitude <= 10 then
				UseRefResult12.current = true
				UseRefResult4.current = 0
				
				if UseRefResult6.current then
					task.cancel(UseRefResult6.current)
					UseRefResult6.current = nil
				end
			elseif Inverted or IsYBelow then
				UseResult1()
				
				return
			end
		end
		if not p1 or Current == nil then return end
		if Input.UserInputType == Enum.UserInputType.Touch and Input ~= Current then return end
		if Current1 ~= nil and not UseRefResult11.current and MovementThreshold < (Vector2.new(Input.Position.X, Input.Position.Y) - Current1).Magnitude then
			UseRefResult11.current = true
			
			if UseRefResult5.current then
				task.cancel(UseRefResult5.current)
				UseRefResult5.current = nil
			end
			UseResult()
		end
	end, {
		p1, MovementThreshold, ScrollingFrameRef, IsCancelOnUserScroll, UseResult1,
		UseResult
	})
	UseEventConnectionFunction(UserInputService.InputChanged, UseResult3, { UseResult3 })
	local UseResult4 = ReactModule.useCallback(function(Input) --[[ Line: 282 ]]
		-- upvalues: UseRefResult7 (copy), UseRefResult5 (copy), UseResult (copy), UseRefResult8 (copy), UseRefResult11 (copy), UseRefResult12 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult6 (copy)
		if UseRefResult7.current ~= Input then return end
		UseRefResult7.current = nil
		
		if UseRefResult5.current then
			task.cancel(UseRefResult5.current)
			UseRefResult5.current = nil
		end
		UseResult()
		
		if UseRefResult8.current or UseRefResult11.current or UseRefResult12.current or Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		local OnTapFunction: (any, any) -> () = UseRefResult1.current.onTap
		
		if OnTapFunction then
			OnTapFunction(UseRefResult3.current, UseRefResult4.current)
		end
		if UseRefResult4.current >= 2 then
			if UseRefResult6.current then
				task.cancel(UseRefResult6.current)
				UseRefResult6.current = nil
			end
			UseRefResult4.current = 0
			local OnDoubleTapFunction: (any) -> () = UseRefResult1.current.onDoubleTap
			
			if OnDoubleTapFunction then
				OnDoubleTapFunction(UseRefResult3.current)
				
				return
			end
		else
			if UseRefResult6.current then
				task.cancel(UseRefResult6.current)
			end
			local Current = UseRefResult3.current
			UseRefResult6.current = task.delay(0.25, function() --[[ Line: 329 ]]
				-- upvalues: UseRefResult6 (upval), UseRefResult4 (upval), UseRefResult1 (upval), Current (copy)
				UseRefResult6.current = nil
				
				if UseRefResult4.current == 1 then
					local OnSingleTapConfirmedFunction: (any) -> () = UseRefResult1.current.onSingleTapConfirmed
					
					if OnSingleTapConfirmedFunction then
						OnSingleTapConfirmedFunction(Current)
					end
				end
				UseRefResult4.current = 0
			end)
		end
	end, { UseResult })
	UseEventConnectionFunction(UserInputService.InputEnded, UseResult4, { UseResult4 })
	ReactModule.useEffect(function() --[[ Line: 344 ]]
		-- upvalues: CancellationSignal (copy), UseResult1 (copy)
		if CancellationSignal == nil then return end
		local Connection = CancellationSignal:Connect(UseResult1)
		
		return function() --[[ Line: 349 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { CancellationSignal, UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 354 ]]
		-- upvalues: IsCancelWhenInactive (copy), p1 (copy), UseResult1 (copy)
		if IsCancelWhenInactive and not p1 then
			UseResult1()
		end
	end, { p1, IsCancelWhenInactive, UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 360 ]]
		-- upvalues: UseRefResult (copy), UseResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local InputBeganConnection = Current.InputBegan:Connect(UseResult2)
		
		return function() --[[ Line: 366 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseResult2 })
	ReactModule.useEffect(function() --[[ Line: 371 ]]
		-- upvalues: UseRefResult9 (copy), UseResult1 (copy)
		return function() --[[ Line: 372 ]]
			-- upvalues: UseRefResult9 (upval), UseResult1 (upval)
			UseRefResult9.current = false
			UseResult1()
		end
	end, { UseResult1 })
	
	return {
		ref = UseRefResult,
		onInputBegan = UseResult2,
		onInputChanged = UseResult3,
		onInputEnded = UseResult4
	}
end