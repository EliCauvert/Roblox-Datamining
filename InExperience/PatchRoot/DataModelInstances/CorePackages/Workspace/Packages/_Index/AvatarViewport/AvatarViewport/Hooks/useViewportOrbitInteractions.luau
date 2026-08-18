local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local cameraMathModule = require(avatarViewport.CameraMath)
local getFIntAvatarViewportDegreesPerPixelModule = require(avatarViewport.Flags.GetFIntAvatarViewportDegreesPerPixel)
local _ = require(avatarViewport.Types)
local viewportInputTypesModule = require(avatarViewport.ViewportInputTypes)
local viewportUserInputSubscriptionsModule = require(avatarViewport.ViewportUserInputSubscriptions)

return function(p0) --[[ line: 36 | named "useViewportOrbitInteractions" ]]
	-- upvalues: getFIntAvatarViewportDegreesPerPixelModule (ref), cameraMathModule (ref), reactModule (ref), viewportUserInputSubscriptionsModule (ref), viewportInputTypesModule (ref)
	local var6 = p0.enabled == nil or p0.enabled
	local degreesPerPixel = p0.degreesPerPixel or getFIntAvatarViewportDegreesPerPixelModule()
	local pinchDeltaToZoomDelta = p0.pinchDeltaToZoomDelta or cameraMathModule.PINCH_DELTA_TO_ZOOM_DELTA
	local var9 = cameraMathModule.clampYRotDeg(p0.initialYRotDeg or 0)
	local var10, var11 = reactModule.useState(var9)
	local var12 = reactModule.useRef(var9)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(0)
	local var17 = reactModule.useRef({})
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(1)
	local var20 = reactModule.useRef(p0.distanceScale)
	local var21 = reactModule.useRef(p0.onYRotDegChanged)
	local var22 = reactModule.useRef(p0.onDistanceScaleChanged)
	local var23 = reactModule.useRef(p0.onCameraUpdateRequested)
	var21.current = p0.onYRotDegChanged
	var22.current = p0.onDistanceScaleChanged
	var23.current = p0.onCameraUpdateRequested
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var20 (ref), cameraMathModule (copy), p0 (ref)
		var20.current = cameraMathModule.clampDistanceScale(p0.distanceScale)
	end, { p0.distanceScale })
	local var24 = reactModule.useCallback(function(p1, p2) --[[ line: 68 ]]
		-- upvalues: var12 (ref), var11 (ref), var21 (ref), var23 (ref)
		var12.current = p1
		
		if p2 and p2.syncReactState then
			var11(p1)
		end
		if p2 and p2.notifyParent == true and var21.current then
			var21.current(p1)
		end
		if var23.current then
			var23.current()
		end
	end, {})
	local var25 = reactModule.useRef(var9)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var12 (ref), var25 (ref), var11 (ref), var21 (ref)
		local current = var12.current
		
		if current == var25.current then return end
		var25.current = current
		var11(current)
		
		if var21.current then
			var21.current(current)
		end
	end, {})
	var26.current = var27
	local var28 = reactModule.useCallback(function(p3) --[[ line: 100 ]]
		-- upvalues: cameraMathModule (copy), p0 (ref), var25 (ref), var24 (ref)
		local var32 = cameraMathModule.clampYRotDeg(p3 or (p0.initialYRotDeg or 0))
		var25.current = var32
		var24(var32, { syncReactState = true })
	end, { var24, p0.initialYRotDeg })
	local var29 = reactModule.useCallback(function(p4) --[[ line: 106 ]]
		-- upvalues: cameraMathModule (copy), var20 (ref), var22 (ref), var23 (ref)
		local var33 = cameraMathModule.adjustDistanceScaleByZoomGesture(var20.current, p4)
		
		if var33 == var20.current then return end
		var20.current = var33
		
		if var22.current then
			var22.current(var33)
		end
		if var23.current then
			var23.current()
		end
	end, {})
	local var30 = reactModule.useCallback(function(p5) --[[ line: 121 ]]
		-- upvalues: var16 (ref), var13 (ref), var6 (ref), var15 (ref), cameraMathModule (copy), var12 (ref), degreesPerPixel (ref), var24 (ref)
		if var16.current > 1 or not var13.current or not var6 then return end
		local current = var15.current
		
		if current then
			local var34 = p5.Position.X - current.X
			var15.current = p5.Position
			var24(cameraMathModule.clampYRotDeg(var12.current - var34 * degreesPerPixel), { syncReactState = false, notifyParent = false })
			
			return
		end
		var15.current = p5.Position
	end, { var6, degreesPerPixel, var24 })
	local var31 = reactModule.useCallback(function(p6) --[[ line: 140 ]]
		-- upvalues: var6 (ref), cameraMathModule (copy), var12 (ref), var24 (ref)
		if var6 then
			var24(cameraMathModule.clampYRotDeg(var12.current + p6), { syncReactState = false, notifyParent = false })
			
			return
		end
	end, { var6, var24 })
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: var13 (ref), var28 (ref), var9 (ref)
		if var13.current then
			return
		end
		var28(var9)
	end, { var9, var28 })
	reactModule.useEffect(function() --[[ line: 155 ]]
		-- upvalues: viewportUserInputSubscriptionsModule (copy), var14 (ref), viewportInputTypesModule (copy), var30 (ref), var13 (ref), var16 (ref), var18 (ref), var15 (ref), var26 (ref), var17 (ref)
		local var35 = viewportUserInputSubscriptionsModule.connectInputChanged(function(p7) --[[ line: 156 ]]
			-- upvalues: var14 (copy), viewportInputTypesModule (copy), var30 (copy), var13 (copy), var16 (copy), var18 (copy)
			if var14.current then
				if viewportInputTypesModule.isMouseMovement(p7) then
					var30(p7)
				end
				return
			elseif var13.current and var16.current == 1 and (viewportInputTypesModule.isTouch(p7) and p7 == var18.current) then
				var30(p7)
			end
		end)
		local var36 = viewportUserInputSubscriptionsModule.connectInputEnded(function(p8) --[[ line: 176 ]]
			-- upvalues: viewportInputTypesModule (copy), var14 (copy), var13 (copy), var15 (copy), var26 (copy), var17 (copy), var16 (copy), var18 (copy)
			if viewportInputTypesModule.isPrimaryPointerEnded(p8) then
				if not var14.current then return end
				var14.current = false
				var13.current = false
				var15.current = nil
				
				if var26.current then
					var26.current()
				end
				return
			elseif viewportInputTypesModule.isTouch(p8) then
				if not var17.current[p8] then return end
				var17.current[p8] = nil
				var16.current = math.max(0, var16.current - 1)
				
				if var16.current == 0 then
					var13.current = false
					var18.current = nil
					var15.current = nil
					
					if var26.current then
						var26.current()
						
						return
					end
				elseif var16.current > 1 then
					var13.current = false
					var18.current = nil
					var15.current = nil
				end
			end
		end)
		
		return function() --[[ line: 211 ]]
			-- upvalues: var35 (ref), var36 (ref), var14 (copy), var13 (copy), var15 (copy), var16 (copy), var17 (copy), var18 (copy)
			var35:Disconnect()
			var36:Disconnect()
			var14.current = false
			var13.current = false
			var15.current = nil
			var16.current = 0
			table.clear(var17.current)
			var18.current = nil
		end
	end, { var30 })
	
	return {
		yRotDeg = var10,
		yRotDegRef = var12,
		distanceScaleRef = var20,
		resetYaw = var28,
		commitYaw = var27,
		applyYawDelta = var31,
		applyZoomGesture = var29,
		inputHandlers = {
			onInputBegan = reactModule.useCallback(function(_, p9) --[[ line: 250 ]]
				-- upvalues: var6 (ref), viewportInputTypesModule (copy), var14 (ref), var13 (ref), var15 (ref), var17 (ref), var16 (ref), var18 (ref)
				if not var6 then return end
				if viewportInputTypesModule.isPrimaryPointerBegan(p9) then
					var14.current = true
					var13.current = true
					var15.current = p9.Position
					
					return
				elseif not viewportInputTypesModule.isTouch(p9) then return end
				var17.current[p9] = true
				var16.current += 1
				
				if var16.current > 1 then
					var13.current = false
					var18.current = nil
					var15.current = nil
					
					return
				end
				var13.current = true
				var18.current = p9
				var15.current = p9.Position
			end, { var6 }),
			onInputChanged = reactModule.useCallback(function(_, p10) --[[ line: 281 ]]
				-- upvalues: viewportInputTypesModule (copy), var29 (ref), var14 (ref), var13 (ref), var16 (ref), var30 (ref)
				if viewportInputTypesModule.isMouseWheel(p10) then
					var29(p10.Position.Z)
					
					return
				elseif var14.current then return end
				if var13.current and var16.current >= 1 and viewportInputTypesModule.isTouch(p10) then
					return
				end
				var30(p10)
			end, { var30, var29 }),
			onInputEnded = reactModule.useCallback(function(_, p11) --[[ line: 301 ]]
				-- upvalues: viewportInputTypesModule (copy), var14 (ref), var13 (ref), var15 (ref), var26 (ref)
				if viewportInputTypesModule.isPrimaryPointerEnded(p11) then
					var14.current = false
					var13.current = false
					var15.current = nil
					
					if var26.current then
						var26.current()
					end
				end
			end, {}),
			onTouchPinch = reactModule.useCallback(function(_, p12, _, _, p13) --[[ line: 224 ]]
				-- upvalues: var6 (ref), var19 (ref), var13 (ref), var18 (ref), var15 (ref), var29 (ref), pinchDeltaToZoomDelta (ref)
				if not var6 or #p12 < 2 then return end
				if p13 == Enum.UserInputState.Begin then
					var19.current = (p12[1] - p12[2]).Magnitude
					var13.current = false
					var18.current = nil
					var15.current = nil
					
					return
				end
				local magnitude = (p12[1] - p12[2]).Magnitude
				local var37 = magnitude - var19.current
				var19.current = magnitude
				var29(var37 * pinchDeltaToZoomDelta)
			end, { var6, var29, pinchDeltaToZoomDelta })
		}
	}
end