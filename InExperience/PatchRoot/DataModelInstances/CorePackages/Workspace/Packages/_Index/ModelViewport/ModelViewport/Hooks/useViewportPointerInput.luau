local ModelViewport = script:FindFirstAncestor("ModelViewport")
local ReactModule = require(ModelViewport.Parent.React)
local ConstantsModule = require(ModelViewport.Constants)
local MouseDragKindModule = require(ModelViewport.Enums.MouseDragKind)
local _ = require(ModelViewport.Types)
local ViewportInputTypesModule = require(ModelViewport.ViewportInputTypes)
local ViewportUserInputSubscriptionsModule = require(ModelViewport.ViewportUserInputSubscriptions)

return function(Current)
	-- upvalues: ReactModule (copy), ViewportInputTypesModule (copy), MouseDragKindModule (copy), ViewportUserInputSubscriptionsModule (copy), ConstantsModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseRefResult6 = ReactModule.useRef({})
	local UseRefResult7 = ReactModule.useRef({})
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(0)
	local UseRefResult11 = ReactModule.useRef(Vector2.zero)
	local UseRefResult12 = ReactModule.useRef(false)
	local UseRefResult13 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult12 (copy), UseRefResult (copy)
		if UseRefResult12.current then
			UseRefResult12.current = false
			UseRefResult.current.onEnded()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseRefResult4 (copy), UseRefResult (copy), UseRefResult12 (copy)
		local Current = UseRefResult4.current
		UseRefResult4.current = p2.Position
		
		if not Current then return end
		local Current1 = UseRefResult.current
		local _Vector2 = Vector2.new(p2.Position.X - Current.X, p2.Position.Y - Current.Y)
		
		if not Current1.enabled or _Vector2 == Vector2.zero then return end
		if p1 then
			if Current1.canPan then
				UseRefResult12.current = true
				Current1.onPan(_Vector2)
				
				return
			end
		elseif Current1.canRotate then
			UseRefResult12.current = true
			Current1.onRotate(_Vector2)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult8 (copy), UseRefResult4 (copy)
		UseRefResult3.current = false
		UseRefResult8.current = nil
		UseRefResult4.current = nil
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult4 (copy), UseResult (copy)
		UseRefResult1.current = nil
		UseRefResult2.current = nil
		UseRefResult4.current = nil
		UseResult()
	end, { UseResult })
	local UseResult4 = ReactModule.useCallback(function(Input): boolean
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		return UseRefResult1.current ~= nil and Input.UserInputType == UseRefResult2.current
	end, {})
	local UseResult5 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), ViewportInputTypesModule (upval), UseResult1 (copy), MouseDragKindModule (upval), UseRefResult3 (copy), UseRefResult5 (copy), UseRefResult8 (copy)
		local Current1 = UseRefResult1.current
		
		if Current1 then
			if ViewportInputTypesModule.isMouseMovement(Current) then
				UseResult1(Current1 == MouseDragKindModule.Pan, Current)
			end
			return
		elseif UseRefResult3.current and UseRefResult5.current == 1 and Current == UseRefResult8.current then
			UseResult1(false, Current)
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: ViewportUserInputSubscriptionsModule (upval), UseRefResult13 (copy), UseResult5 (copy)
		local ConnectInputChangedResult = ViewportUserInputSubscriptionsModule.connectInputChanged(function(p1)
			-- upvalues: UseRefResult13 (upval), UseResult5 (upval)
			UseRefResult13.current = true
			UseResult5(p1)
		end)
		
		return function()
			-- upvalues: ConnectInputChangedResult (copy)
			ConnectInputChangedResult:Disconnect()
		end
	end, { UseResult5 })
	ReactModule.useEffect(function()
		-- upvalues: ViewportUserInputSubscriptionsModule (upval), UseResult4 (copy), UseResult3 (copy), UseRefResult7 (copy), ViewportInputTypesModule (upval), UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult9 (copy), UseResult2 (copy), UseResult (copy), UseRefResult3 (copy), UseRefResult8 (copy), UseRefResult4 (copy)
		local ConnectInputEndedResult = ViewportUserInputSubscriptionsModule.connectInputEnded(function(p1)
			-- upvalues: UseResult4 (upval), UseResult3 (upval), UseRefResult7 (upval), ViewportInputTypesModule (upval), UseRefResult6 (upval), UseRefResult5 (upval), UseRefResult9 (upval), UseResult2 (upval), UseResult (upval), UseRefResult3 (upval), UseRefResult8 (upval), UseRefResult4 (upval)
			if UseResult4(p1) then
				UseResult3()
				
				return
			end
			if UseRefResult7.current[p1] then
				UseRefResult7.current[p1] = nil
				
				return
			end
			if not ViewportInputTypesModule.isTouch(p1) or not UseRefResult6.current[p1] then return end
			UseRefResult6.current[p1] = nil
			UseRefResult5.current = math.max(0, UseRefResult5.current - 1)
			
			if UseRefResult5.current == 0 then
				UseRefResult9.current = false
				UseResult2()
				UseResult()
				
				return
			end
			if UseRefResult5.current > 1 then
				UseResult2()
				
				return
			end
			local NextEntry = next(UseRefResult6.current)
			
			if NextEntry then
				UseRefResult3.current = true
				UseRefResult8.current = NextEntry
				UseRefResult4.current = NextEntry.Position
			end
		end)
		
		return function()
			-- upvalues: ConnectInputEndedResult (copy)
			ConnectInputEndedResult:Disconnect()
		end
	end, { UseResult3, UseResult4, UseResult2, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: ViewportUserInputSubscriptionsModule (upval), UseResult3 (copy), UseRefResult5 (copy), UseRefResult6 (copy), UseRefResult7 (copy), UseRefResult9 (copy), UseResult2 (copy), UseResult (copy)
		local ConnectWindowFocusReleasedResult = ViewportUserInputSubscriptionsModule.connectWindowFocusReleased(function()
			-- upvalues: UseResult3 (upval), UseRefResult5 (upval), UseRefResult6 (upval), UseRefResult7 (upval), UseRefResult9 (upval), UseResult2 (upval), UseResult (upval)
			UseResult3()
			UseRefResult5.current = 0
			table.clear(UseRefResult6.current)
			table.clear(UseRefResult7.current)
			UseRefResult9.current = false
			UseResult2()
			UseResult()
		end)
		
		return function()
			-- upvalues: ConnectWindowFocusReleasedResult (copy)
			ConnectWindowFocusReleasedResult:Disconnect()
		end
	end, { UseResult3, UseResult2, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult5 (copy), UseRefResult6 (copy), UseRefResult7 (copy), UseRefResult9 (copy), UseResult2 (copy), UseResult (copy)
		return function()
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult5 (upval), UseRefResult6 (upval), UseRefResult7 (upval), UseRefResult9 (upval), UseResult2 (upval), UseResult (upval)
			UseRefResult1.current = nil
			UseRefResult2.current = nil
			UseRefResult5.current = 0
			table.clear(UseRefResult6.current)
			table.clear(UseRefResult7.current)
			UseRefResult9.current = false
			UseResult2()
			UseResult()
		end
	end, { UseResult2, UseResult })
	local UseResult6 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult5 (copy), ViewportInputTypesModule (upval), MouseDragKindModule (upval), UseRefResult2 (copy), UseRefResult4 (copy), UseRefResult7 (copy), UseRefResult6 (copy), UseResult2 (copy), UseRefResult3 (copy), UseRefResult8 (copy)
		local Current = UseRefResult.current
		
		if not Current.enabled then return end
		local IsCurrentMatch: boolean = UseRefResult1.current == nil and UseRefResult5.current == 0
		
		if ViewportInputTypesModule.isPrimaryPointer(Input) then
			if Current.canRotate and IsCurrentMatch then
				UseRefResult1.current = MouseDragKindModule.Rotate
				UseRefResult2.current = Input.UserInputType
				UseRefResult4.current = Input.Position
			end
			return
		elseif ViewportInputTypesModule.isPanPointer(Input) then
			if Current.canPan and IsCurrentMatch then
				UseRefResult1.current = MouseDragKindModule.Pan
				UseRefResult2.current = Input.UserInputType
				UseRefResult4.current = Input.Position
			end
			return
		elseif not ViewportInputTypesModule.isTouch(Input) then return end
		if UseRefResult1.current then
			UseRefResult7.current[Input] = true
			
			return
		end
		if UseRefResult7.current[Input] or UseRefResult6.current[Input] then return end
		UseRefResult6.current[Input] = true
		UseRefResult5.current += 1
		
		if UseRefResult5.current > 1 then
			UseResult2()
			
			return
		else
			UseRefResult3.current = true
			UseRefResult8.current = Input
			UseRefResult4.current = Input.Position
		end
	end, { UseResult2 })
	local UseResult7 = ReactModule.useCallback(function(_, p1)
		-- upvalues: ViewportInputTypesModule (upval), UseResult5 (copy), UseRefResult (copy), UseRefResult12 (copy), UseRefResult1 (copy), UseRefResult5 (copy), UseResult (copy)
		if not ViewportInputTypesModule.isMouseWheel(p1) then
			UseResult5(p1)
			
			return
		end
		local Current = UseRefResult.current
		
		if Current.enabled and Current.canZoom then
			Current.onZoom(p1.Position.Z)
			UseRefResult12.current = true
			
			if UseRefResult1.current == nil and UseRefResult5.current == 0 then
				UseResult()
			end
		end
	end, { UseResult5, UseResult })
	local UseResult8 = ReactModule.useCallback(function(_, p1)
		-- upvalues: UseResult4 (copy), UseResult3 (copy), UseRefResult1 (copy), UseRefResult13 (copy), ViewportInputTypesModule (upval)
		if UseResult4(p1) then
			UseResult3()
			
			return
		end
		if UseRefResult1.current and not UseRefResult13.current and ViewportInputTypesModule.isMouseMovement(p1) then
			UseResult3()
		end
	end, { UseResult4, UseResult3 })
	local UseResult9 = ReactModule.useCallback(function(_, Entry, _, _, UserInputState)
		-- upvalues: UseRefResult (copy), UseRefResult9 (copy), UseRefResult1 (copy), UseRefResult5 (copy), UseRefResult7 (copy), UseRefResult10 (copy), UseRefResult11 (copy), UseResult2 (copy), UseRefResult12 (copy), ConstantsModule (upval)
		local Current = UseRefResult.current
		
		if not Current.enabled or #Entry < 2 then return end
		local Distance = (Entry[1] - Entry[2]).Magnitude
		local EntryRatio = (Entry[1] + Entry[2]) / 2
		
		if UserInputState == Enum.UserInputState.Begin then
			UseRefResult9.current = UseRefResult1.current == nil and UseRefResult5.current > 0 and next(UseRefResult7.current) == nil
			
			if UseRefResult9.current then
				UseRefResult10.current = Distance
				UseRefResult11.current = EntryRatio
				UseResult2()
				
				return
			end
			return
		else
			if not UseRefResult9.current then return end
			local DistanceDelta = Distance - UseRefResult10.current
			local EntryRatioDelta = EntryRatio - UseRefResult11.current
			UseRefResult10.current = Distance
			UseRefResult11.current = EntryRatio
			
			if Current.canZoom and DistanceDelta ~= 0 then
				UseRefResult12.current = true
				Current.onZoom(DistanceDelta / ConstantsModule.PinchPixelsPerZoomStep)
			end
			if Current.canPan and EntryRatioDelta ~= Vector2.zero then
				UseRefResult12.current = true
				Current.onPan(EntryRatioDelta)
			end
		end
	end, { UseResult2 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult6 (copy), UseResult7 (copy), UseResult8 (copy), UseResult9 (copy)
		return {
			onInputBegan = UseResult6,
			onInputChanged = UseResult7,
			onInputEnded = UseResult8,
			onTouchPinch = UseResult9
		}
	end, { UseResult6, UseResult7, UseResult8, UseResult9 })
end