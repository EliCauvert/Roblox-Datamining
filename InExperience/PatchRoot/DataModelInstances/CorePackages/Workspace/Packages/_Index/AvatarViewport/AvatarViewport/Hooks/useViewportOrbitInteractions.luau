local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local cameraMathModule = require(avatarViewport.CameraMath)
local getFIntAvatarViewportDegreesPerPixelModule = require(avatarViewport.Flags.GetFIntAvatarViewportDegreesPerPixel)
local _ = require(avatarViewport.Types)
local viewportInputTypesModule = require(avatarViewport.ViewportInputTypes)
local viewportUserInputSubscriptionsModule = require(avatarViewport.ViewportUserInputSubscriptions)

return function(p1)
	-- upvalues: getFIntAvatarViewportDegreesPerPixelModule (ref), cameraMathModule (ref), reactModule (ref), viewportUserInputSubscriptionsModule (ref), viewportInputTypesModule (ref)
	local var1 = p1.enabled == nil or p1.enabled
	local degreesPerPixel = p1.degreesPerPixel or getFIntAvatarViewportDegreesPerPixelModule()
	local pinchDeltaToZoomDelta = p1.pinchDeltaToZoomDelta or cameraMathModule.PINCH_DELTA_TO_ZOOM_DELTA
	local var2 = cameraMathModule.clampYRotDeg(p1.initialYRotDeg or 0)
	local var3, var4 = reactModule.useState(var2)
	local var5 = reactModule.useRef(var2)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(1)
	local var13 = reactModule.useRef(p1.distanceScale)
	local var14 = reactModule.useRef(p1.onYRotDegChanged)
	local var15 = reactModule.useRef(p1.onDistanceScaleChanged)
	local var16 = reactModule.useRef(p1.onCameraUpdateRequested)
	var14.current = p1.onYRotDegChanged
	var15.current = p1.onDistanceScaleChanged
	var16.current = p1.onCameraUpdateRequested
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), cameraMathModule (copy), p1 (ref)
		var13.current = cameraMathModule.clampDistanceScale(p1.distanceScale)
	end, { p1.distanceScale })
	local var17 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var5 (ref), var4 (ref), var14 (ref), var16 (ref)
		var5.current = p2
		
		if p3 and p3.syncReactState then
			var4(p2)
		end
		if p3 and p3.notifyParent == true and var14.current then
			var14.current(p2)
		end
		if var16.current then
			var16.current()
		end
	end, {})
	local var18 = reactModule.useRef(var2)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var18 (ref), var4 (ref), var14 (ref)
		local current = var5.current
		
		if current == var18.current then return end
		var18.current = current
		var4(current)
		
		if var14.current then
			var14.current(current)
		end
	end, {})
	var19.current = var20
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: cameraMathModule (copy), p1 (ref), var18 (ref), var17 (ref)
		local var22 = cameraMathModule.clampYRotDeg(p2 or (p1.initialYRotDeg or 0))
		var18.current = var22
		var17(var22, { syncReactState = true })
	end, { var17, p1.initialYRotDeg })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: cameraMathModule (copy), var13 (ref), var15 (ref), var16 (ref)
		local var23 = cameraMathModule.adjustDistanceScaleByZoomGesture(var13.current, p2)
		
		if var23 == var13.current then return end
		var13.current = var23
		
		if var15.current then
			var15.current(var23)
		end
		if var16.current then
			var16.current()
		end
	end, {})
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var6 (ref), var1 (ref), var8 (ref), cameraMathModule (copy), var5 (ref), degreesPerPixel (ref), var17 (ref)
		if var9.current > 1 or not var6.current or not var1 then return end
		local current = var8.current
		
		if current then
			local var24 = p2.Position.X - current.X
			var8.current = p2.Position
			var17(cameraMathModule.clampYRotDeg(var5.current - var24 * degreesPerPixel), { syncReactState = false, notifyParent = false })
			
			return
		end
		var8.current = p2.Position
	end, { var1, degreesPerPixel, var17 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), cameraMathModule (copy), var5 (ref), var17 (ref)
		if var1 then
			var17(cameraMathModule.clampYRotDeg(var5.current + p2), { syncReactState = false, notifyParent = false })
			
			return
		end
	end, { var1, var17 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var21 (ref), var2 (ref)
		if var6.current then
			return
		end
		var21(var2)
	end, { var2, var21 })
	reactModule.useEffect(function()
		-- upvalues: viewportUserInputSubscriptionsModule (copy), var7 (ref), viewportInputTypesModule (copy), var23 (ref), var6 (ref), var9 (ref), var11 (ref), var8 (ref), var19 (ref), var10 (ref)
		local var25 = viewportUserInputSubscriptionsModule.connectInputChanged(function(p2)
			-- upvalues: var7 (copy), viewportInputTypesModule (copy), var23 (copy), var6 (copy), var9 (copy), var11 (copy)
			if var7.current then
				if viewportInputTypesModule.isMouseMovement(p2) then
					var23(p2)
				end
				return
			elseif var6.current and var9.current == 1 and (viewportInputTypesModule.isTouch(p2) and p2 == var11.current) then
				var23(p2)
			end
		end)
		local var26 = viewportUserInputSubscriptionsModule.connectInputEnded(function(p2)
			-- upvalues: viewportInputTypesModule (copy), var7 (copy), var6 (copy), var8 (copy), var19 (copy), var10 (copy), var9 (copy), var11 (copy)
			if viewportInputTypesModule.isPrimaryPointerEnded(p2) then
				if not var7.current then return end
				var7.current = false
				var6.current = false
				var8.current = nil
				
				if var19.current then
					var19.current()
				end
				return
			elseif viewportInputTypesModule.isTouch(p2) then
				if not var10.current[p2] then return end
				var10.current[p2] = nil
				var9.current = math.max(0, var9.current - 1)
				
				if var9.current == 0 then
					var6.current = false
					var11.current = nil
					var8.current = nil
					
					if var19.current then
						var19.current()
						
						return
					end
				elseif var9.current > 1 then
					var6.current = false
					var11.current = nil
					var8.current = nil
				end
			end
		end)
		
		return function()
			-- upvalues: var25 (ref), var26 (ref), var7 (copy), var6 (copy), var8 (copy), var9 (copy), var10 (copy), var11 (copy)
			var25:Disconnect()
			var26:Disconnect()
			var7.current = false
			var6.current = false
			var8.current = nil
			var9.current = 0
			table.clear(var10.current)
			var11.current = nil
		end
	end, { var23 })
	
	return {
		yRotDeg = var3,
		yRotDegRef = var5,
		distanceScaleRef = var13,
		resetYaw = var21,
		commitYaw = var20,
		applyYawDelta = var24,
		applyZoomGesture = var22,
		inputHandlers = {
			onInputBegan = reactModule.useCallback(function(_, p2)
				-- upvalues: var1 (ref), viewportInputTypesModule (copy), var7 (ref), var6 (ref), var8 (ref), var10 (ref), var9 (ref), var11 (ref)
				if not var1 then return end
				if viewportInputTypesModule.isPrimaryPointerBegan(p2) then
					var7.current = true
					var6.current = true
					var8.current = p2.Position
					
					return
				elseif not viewportInputTypesModule.isTouch(p2) then return end
				if var10.current[p2] then return end
				var10.current[p2] = true
				var9.current += 1
				
				if var9.current > 1 then
					var6.current = false
					var11.current = nil
					var8.current = nil
					
					return
				end
				var6.current = true
				var11.current = p2
				var8.current = p2.Position
			end, { var1 }),
			onInputChanged = reactModule.useCallback(function(_, p2)
				-- upvalues: viewportInputTypesModule (copy), var22 (ref), var7 (ref), var6 (ref), var9 (ref), var23 (ref)
				if viewportInputTypesModule.isMouseWheel(p2) then
					var22(p2.Position.Z)
					
					return
				elseif var7.current then return end
				if var6.current and var9.current >= 1 and viewportInputTypesModule.isTouch(p2) then
					return
				end
				var23(p2)
			end, { var23, var22 }),
			onInputEnded = reactModule.useCallback(function(_, p2)
				-- upvalues: viewportInputTypesModule (copy), var7 (ref), var6 (ref), var8 (ref), var19 (ref)
				if viewportInputTypesModule.isPrimaryPointerEnded(p2) then
					var7.current = false
					var6.current = false
					var8.current = nil
					
					if var19.current then
						var19.current()
					end
				end
			end, {}),
			onTouchPinch = reactModule.useCallback(function(_, p2, _, _, p3)
				-- upvalues: var1 (ref), var12 (ref), var6 (ref), var11 (ref), var8 (ref), var22 (ref), pinchDeltaToZoomDelta (ref)
				if not var1 or #p2 < 2 then return end
				if p3 == Enum.UserInputState.Begin then
					var12.current = (p2[1] - p2[2]).Magnitude
					var6.current = false
					var11.current = nil
					var8.current = nil
					
					return
				end
				local magnitude = (p2[1] - p2[2]).Magnitude
				local var25 = magnitude - var12.current
				var12.current = magnitude
				var22(var25 * pinchDeltaToZoomDelta)
			end, { var1, var22, pinchDeltaToZoomDelta })
		}
	}
end