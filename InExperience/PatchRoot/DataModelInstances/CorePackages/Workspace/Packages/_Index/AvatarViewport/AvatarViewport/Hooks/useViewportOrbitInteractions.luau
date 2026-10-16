local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local CameraMathModule = require(AvatarViewport.CameraMath)
local GetFIntAvatarViewportDegreesPerPixelModule = require(AvatarViewport.Flags.GetFIntAvatarViewportDegreesPerPixel)
local _ = require(AvatarViewport.Types)
local ViewportInputTypesModule = require(AvatarViewport.ViewportInputTypes)
local ViewportUserInputSubscriptionsModule = require(AvatarViewport.ViewportUserInputSubscriptions)

return function(p1) --[[ Line: 36 | Named "useViewportOrbitInteractions" ]]
	-- upvalues: GetFIntAvatarViewportDegreesPerPixelModule (copy), CameraMathModule (copy), ReactModule (copy), ViewportUserInputSubscriptionsModule (copy), ViewportInputTypesModule (copy)
	local NoEnabled = p1.enabled == nil or p1.enabled
	local DegreesPerPixel = p1.degreesPerPixel or GetFIntAvatarViewportDegreesPerPixelModule()
	local PinchDeltaToZoomDelta = p1.pinchDeltaToZoomDelta or CameraMathModule.PINCH_DELTA_TO_ZOOM_DELTA
	local ClampYRotDegResult = CameraMathModule.clampYRotDeg(p1.initialYRotDeg or 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ClampYRotDegResult)
	local UseRefResult = ReactModule.useRef(ClampYRotDegResult)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef({})
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(1)
	local UseRefResult8 = ReactModule.useRef(p1.distanceScale)
	local UseRefResult9 = ReactModule.useRef(p1.onYRotDegChanged)
	local UseRefResult10 = ReactModule.useRef(p1.onDistanceScaleChanged)
	local UseRefResult11 = ReactModule.useRef(p1.onCameraUpdateRequested)
	UseRefResult9.current = p1.onYRotDegChanged
	UseRefResult10.current = p1.onDistanceScaleChanged
	UseRefResult11.current = p1.onCameraUpdateRequested
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseRefResult8 (copy), CameraMathModule (upval), p1 (copy)
		UseRefResult8.current = CameraMathModule.clampDistanceScale(p1.distanceScale)
	end, { p1.distanceScale })
	local UseResult = ReactModule.useCallback(function(Current, p2) --[[ Line: 68 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseRefResult9 (copy), UseRefResult11 (copy)
		UseRefResult.current = Current
		
		if p2 and p2.syncReactState then
			UseStateResult2(Current)
		end
		if p2 and p2.notifyParent == true and UseRefResult9.current then
			UseRefResult9.current(Current)
		end
		if UseRefResult11.current then
			UseRefResult11.current()
		end
	end, {})
	local UseRefResult12 = ReactModule.useRef(ClampYRotDegResult)
	local UseRefResult13 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 87 ]]
		-- upvalues: UseRefResult (copy), UseRefResult12 (copy), UseStateResult2 (copy), UseRefResult9 (copy)
		local Current = UseRefResult.current
		
		if Current == UseRefResult12.current then return end
		UseRefResult12.current = Current
		UseStateResult2(Current)
		
		if UseRefResult9.current then
			UseRefResult9.current(Current)
		end
	end, {})
	UseRefResult13.current = UseResult1
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 100 ]]
		-- upvalues: CameraMathModule (upval), p1 (copy), UseRefResult12 (copy), UseResult (copy)
		local ClampYRotDegResult = CameraMathModule.clampYRotDeg(p2 or (p1.initialYRotDeg or 0))
		UseRefResult12.current = ClampYRotDegResult
		UseResult(ClampYRotDegResult, { syncReactState = true })
	end, { UseResult, p1.initialYRotDeg })
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 106 ]]
		-- upvalues: CameraMathModule (upval), UseRefResult8 (copy), UseRefResult10 (copy), UseRefResult11 (copy)
		local AdjustDistanceScaleByZoomGestureResult = CameraMathModule.adjustDistanceScaleByZoomGesture(UseRefResult8.current, p2)
		
		if AdjustDistanceScaleByZoomGestureResult == UseRefResult8.current then return end
		UseRefResult8.current = AdjustDistanceScaleByZoomGestureResult
		
		if UseRefResult10.current then
			UseRefResult10.current(AdjustDistanceScaleByZoomGestureResult)
		end
		if UseRefResult11.current then
			UseRefResult11.current()
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function(p2) --[[ Line: 121 ]]
		-- upvalues: UseRefResult4 (copy), UseRefResult1 (copy), NoEnabled (copy), UseRefResult3 (copy), CameraMathModule (upval), UseRefResult (copy), DegreesPerPixel (copy), UseResult (copy)
		if UseRefResult4.current > 1 or not UseRefResult1.current or not NoEnabled then return end
		local Current = UseRefResult3.current
		
		if Current then
			local XDelta = p2.Position.X - Current.X
			UseRefResult3.current = p2.Position
			UseResult(CameraMathModule.clampYRotDeg(UseRefResult.current - XDelta * DegreesPerPixel), { syncReactState = false, notifyParent = false })
			
			return
		else
			UseRefResult3.current = p2.Position
		end
	end, { NoEnabled, DegreesPerPixel, UseResult })
	local UseResult5 = ReactModule.useCallback(function(p2) --[[ Line: 140 ]]
		-- upvalues: NoEnabled (copy), CameraMathModule (upval), UseRefResult (copy), UseResult (copy)
		if NoEnabled then
			UseResult(CameraMathModule.clampYRotDeg(UseRefResult.current + p2), { syncReactState = false, notifyParent = false })
			
			return
		end
	end, { NoEnabled, UseResult })
	ReactModule.useEffect(function() --[[ Line: 148 ]]
		-- upvalues: UseRefResult1 (copy), UseResult2 (copy), ClampYRotDegResult (copy)
		if not UseRefResult1.current then
			UseResult2(ClampYRotDegResult)
			
			return
		end
	end, { ClampYRotDegResult, UseResult2 })
	ReactModule.useEffect(function() --[[ Line: 155 ]]
		-- upvalues: ViewportUserInputSubscriptionsModule (upval), UseRefResult2 (copy), ViewportInputTypesModule (upval), UseResult4 (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult3 (copy), UseRefResult13 (copy), UseRefResult5 (copy)
		local ConnectInputChangedResult = ViewportUserInputSubscriptionsModule.connectInputChanged(function(Current) --[[ Line: 156 ]]
			-- upvalues: UseRefResult2 (upval), ViewportInputTypesModule (upval), UseResult4 (upval), UseRefResult1 (upval), UseRefResult4 (upval), UseRefResult6 (upval)
			if UseRefResult2.current then
				if ViewportInputTypesModule.isMouseMovement(Current) then
					UseResult4(Current)
				end
				return
			elseif UseRefResult1.current and UseRefResult4.current == 1 and ViewportInputTypesModule.isTouch(Current) and Current == UseRefResult6.current then
				UseResult4(Current)
			end
		end)
		local ConnectInputEndedResult = ViewportUserInputSubscriptionsModule.connectInputEnded(function(p2) --[[ Line: 176 ]]
			-- upvalues: ViewportInputTypesModule (upval), UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult13 (upval), UseRefResult5 (upval), UseRefResult4 (upval), UseRefResult6 (upval)
			if ViewportInputTypesModule.isPrimaryPointerEnded(p2) then
				if not UseRefResult2.current then return end
				UseRefResult2.current = false
				UseRefResult1.current = false
				UseRefResult3.current = nil
				
				if UseRefResult13.current then
					UseRefResult13.current()
				end
				return
			elseif ViewportInputTypesModule.isTouch(p2) then
				if not UseRefResult5.current[p2] then return end
				UseRefResult5.current[p2] = nil
				UseRefResult4.current = math.max(0, UseRefResult4.current - 1)
				
				if UseRefResult4.current == 0 then
					UseRefResult1.current = false
					UseRefResult6.current = nil
					UseRefResult3.current = nil
					
					if UseRefResult13.current then
						UseRefResult13.current()
						
						return
					end
				elseif UseRefResult4.current > 1 then
					UseRefResult1.current = false
					UseRefResult6.current = nil
					UseRefResult3.current = nil
				end
			end
		end)
		
		return function() --[[ Line: 211 ]]
			-- upvalues: ConnectInputChangedResult (copy), ConnectInputEndedResult (copy), UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult4 (upval), UseRefResult5 (upval), UseRefResult6 (upval)
			ConnectInputChangedResult:Disconnect()
			ConnectInputEndedResult:Disconnect()
			UseRefResult2.current = false
			UseRefResult1.current = false
			UseRefResult3.current = nil
			UseRefResult4.current = 0
			table.clear(UseRefResult5.current)
			UseRefResult6.current = nil
		end
	end, { UseResult4 })
	
	return {
		yRotDeg = UseStateResult,
		yRotDegRef = UseRefResult,
		distanceScaleRef = UseRefResult8,
		resetYaw = UseResult2,
		commitYaw = UseResult1,
		applyYawDelta = UseResult5,
		applyZoomGesture = UseResult3,
		inputHandlers = {
			onInputBegan = ReactModule.useCallback(function(_, Current) --[[ Line: 250 ]]
				-- upvalues: NoEnabled (copy), ViewportInputTypesModule (upval), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult6 (copy)
				if not NoEnabled then return end
				if ViewportInputTypesModule.isPrimaryPointerBegan(Current) then
					UseRefResult2.current = true
					UseRefResult1.current = true
					UseRefResult3.current = Current.Position
					
					return
				end
				if not ViewportInputTypesModule.isTouch(Current) then return end
				if UseRefResult5.current[Current] then return end
				UseRefResult5.current[Current] = true
				UseRefResult4.current += 1
				
				if UseRefResult4.current > 1 then
					UseRefResult1.current = false
					UseRefResult6.current = nil
					UseRefResult3.current = nil
					
					return
				else
					UseRefResult1.current = true
					UseRefResult6.current = Current
					UseRefResult3.current = Current.Position
				end
			end, { NoEnabled }),
			onInputChanged = ReactModule.useCallback(function(_, p2) --[[ Line: 288 ]]
				-- upvalues: ViewportInputTypesModule (upval), UseResult3 (copy), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseResult4 (copy)
				if ViewportInputTypesModule.isMouseWheel(p2) then
					UseResult3(p2.Position.Z)
					
					return
				end
				if UseRefResult2.current then return end
				if not UseRefResult1.current or UseRefResult4.current < 1 or not ViewportInputTypesModule.isTouch(p2) then
					UseResult4(p2)
					
					return
				end
			end, { UseResult4, UseResult3 }),
			onInputEnded = ReactModule.useCallback(function(_, p2) --[[ Line: 308 ]]
				-- upvalues: ViewportInputTypesModule (upval), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult13 (copy)
				if ViewportInputTypesModule.isPrimaryPointerEnded(p2) then
					UseRefResult2.current = false
					UseRefResult1.current = false
					UseRefResult3.current = nil
					
					if UseRefResult13.current then
						UseRefResult13.current()
					end
				end
			end, {}),
			onTouchPinch = ReactModule.useCallback(function(_, Entry, _, _, UserInputState) --[[ Line: 224 ]]
				-- upvalues: NoEnabled (copy), UseRefResult7 (copy), UseRefResult1 (copy), UseRefResult6 (copy), UseRefResult3 (copy), UseResult3 (copy), PinchDeltaToZoomDelta (copy)
				if not NoEnabled or #Entry < 2 then return end
				if UserInputState == Enum.UserInputState.Begin then
					UseRefResult7.current = (Entry[1] - Entry[2]).Magnitude
					UseRefResult1.current = false
					UseRefResult6.current = nil
					UseRefResult3.current = nil
					
					return
				else
					local Distance = (Entry[1] - Entry[2]).Magnitude
					UseRefResult7.current = Distance
					UseResult3((Distance - UseRefResult7.current) * PinchDeltaToZoomDelta)
				end
			end, { NoEnabled, UseResult3, PinchDeltaToZoomDelta })
		}
	}
end