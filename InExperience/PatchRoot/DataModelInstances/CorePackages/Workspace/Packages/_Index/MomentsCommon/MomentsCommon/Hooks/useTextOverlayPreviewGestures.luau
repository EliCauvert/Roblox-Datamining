local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local textOverlayPreviewGestureUtilsModule = require(momentsCommon.Utils.TextOverlayPreviewGestureUtils)
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef

local function _(p1, p2)
	return math.max(0.3, p1 * (if p2 >= 1 then (p2 - 1) ^ 1.5 + 1 else 1 - (1 - p2) ^ 1.5))
end

local _ = function(p1, p2)
	-- upvalues: textOverlayPreviewGestureUtilsModule (ref)
	return if p2 == nil then false else textOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(p1, p2.AbsolutePosition, p2.AbsoluteSize)
end

return function(value)
	-- upvalues: userInputService (ref), guiService (ref), responsiveModule (ref), useRef (ref), useCallback (ref), useEffect (ref), textOverlayPreviewGestureUtilsModule (ref)
	local userInputService_1 = value.userInputService or userInputService
	local guiService_1 = value.guiService or guiService
	local var1 = responsiveModule.useDeviceInsets()
	local var2 = useRef(value.scale)
	var2.current = value.scale
	local var3 = useRef(value.rotation)
	var3.current = value.rotation
	local var4 = useRef(value.onScaleChanged)
	var4.current = value.onScaleChanged
	local var5 = useRef(value.onRotationChanged)
	var5.current = value.onRotationChanged
	local var6 = useRef(1)
	local var7 = useRef(0)
	local var8 = useRef(0)
	local var9 = useRef(0)
	local var10 = useRef(false)
	local var11 = useRef(false)
	local var12 = useCallback(function()
		-- upvalues: guiService_1 (ref), var1 (ref)
		return guiService_1:GetGuiInset() + Vector2.new(var1.left, var1.top)
	end, { var1, guiService_1 })
	local var13 = useCallback(function()
		-- upvalues: value (ref)
		local var14 = if value.containerRef then value.containerRef.current else nil
		
		return if var14 == nil then nil else var14.AbsolutePosition + var14.AbsoluteSize / 2
	end, { value.containerRef })
	local var14 = value.enabled and (value.selected == true and value.preferredInput == responsiveModule.Input.Touch)
	local var15 = value.enabled and (value.selected == true and value.preferredInput == responsiveModule.Input.Pointer)
	useEffect(function()
		-- upvalues: var14 (ref), value (ref), userInputService_1 (ref), var4 (ref), var10 (ref), textOverlayPreviewGestureUtilsModule (copy), var6 (ref), var2 (ref), var5 (ref), var11 (ref), var8 (ref), var3 (ref), var9 (ref)
		if var14 then
			local function _()
				-- upvalues: value (copy)
				return if value.containerRef then value.containerRef.current else nil
			end
			
			local touchPinchConnection = userInputService_1.TouchPinch:Connect(function(...)
				-- upvalues: var4 (copy), var10 (copy), value (copy), textOverlayPreviewGestureUtilsModule (copy), var6 (copy), var2 (copy)
				local var16, var17, _, var18 = ...
				local current = var4.current
				
				if var18 == Enum.UserInputState.Begin then
					var10.current = false
					
					if current ~= nil then
						local var19 = if value.containerRef then value.containerRef.current else nil
						
						if if var19 == nil then false else textOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(var16, var19.AbsolutePosition, var19.AbsoluteSize) then
							var6.current = var2.current
							var10.current = true
							
							return
						end
					end
					return
				elseif var18 == Enum.UserInputState.Change then
					if #var16 < 2 then
						var10.current = false
						
						return
					elseif var10.current and current then
						current(math.max(0.3, var6.current * (if var17 >= 1 then (var17 - 1) ^ 1.5 + 1 else 1 - (1 - var17) ^ 1.5)))
						
						return
					end
				else
					var10.current = false
				end
			end)
			local touchRotateConnection = userInputService_1.TouchRotate:Connect(function(...)
				-- upvalues: var5 (copy), textOverlayPreviewGestureUtilsModule (copy), var11 (copy), value (copy), var8 (copy), var3 (copy), var9 (copy)
				local var16, _, _, var17 = ...
				local current = var5.current
				local touchLineAngleDegrees = textOverlayPreviewGestureUtilsModule.getTouchLineAngleDegrees(var16)
				
				if var17 == Enum.UserInputState.Begin then
					var11.current = false
					
					if current ~= nil and touchLineAngleDegrees ~= nil then
						local var18 = if value.containerRef then value.containerRef.current else nil
						
						if if var18 == nil then false else textOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(var16, var18.AbsolutePosition, var18.AbsoluteSize) then
							var8.current = var3.current
							var9.current = touchLineAngleDegrees
							var11.current = true
							
							return
						end
					end
					return
				elseif var17 == Enum.UserInputState.Change then
					if touchLineAngleDegrees == nil then
						var11.current = false
						
						return
					elseif var11.current and current then
						var8.current += textOverlayPreviewGestureUtilsModule.getTouchRotationStepDegrees(var9.current, touchLineAngleDegrees)
						var9.current = touchLineAngleDegrees
						current(var8.current)
						
						return
					end
				else
					var11.current = false
				end
			end)
			
			return function()
				-- upvalues: touchPinchConnection (ref), touchRotateConnection (ref), var10 (copy), var11 (copy)
				touchPinchConnection:Disconnect()
				touchRotateConnection:Disconnect()
				var10.current = false
				var11.current = false
			end
		end
		return nil
	end, { var14, value.containerRef, userInputService_1 })
	local var16 = useRef(nil)
	local var17 = useRef(false)
	local var18 = useRef(1)
	local var19 = useRef(0)
	local var20 = useRef(nil)
	local var21 = useRef(nil)
	local var22 = useCallback(function()
		-- upvalues: var16 (ref), var17 (ref), var20 (ref), var21 (ref)
		var16.current = nil
		var17.current = false
		
		if var20.current then
			var20.current:Disconnect()
			var20.current = nil
		end
		if var21.current then
			var21.current:Disconnect()
			var21.current = nil
		end
	end, {})
	local var23 = useCallback(function(p1)
		-- upvalues: var15 (ref), var22 (ref), var16 (ref), var17 (ref), var6 (ref), var2 (ref), var7 (ref), var3 (ref), var20 (ref), userInputService_1 (ref), var13 (ref), var12 (ref), var18 (ref), var19 (ref), var4 (ref), var5 (ref), var21 (ref)
		if var15 then
			var22()
			var16.current = p1
			var17.current = true
			var6.current = var2.current
			var7.current = var3.current
			var20.current = userInputService_1.InputChanged:Connect(function(_)
				-- upvalues: var16 (copy), var13 (copy), userInputService_1 (copy), var12 (copy), var17 (copy), var18 (copy), var19 (copy), var4 (copy), var6 (copy), var5 (copy), var7 (copy)
				if var16.current == nil then return end
				local var24 = var13()
				
				if var24 == nil then return end
				local var25 = userInputService_1:GetMouseLocation() - var12()
				
				if var17.current then
					var18.current = math.max((var25 - var24).Magnitude, 1)
					var19.current = math.atan2(var25.Y - var24.Y, var25.X - var24.X)
					var17.current = false
					
					return
				elseif var16.current == "resize" then
					local current = var4.current
					
					if current then
						local var26 = (var25 - var24).Magnitude / var18.current
						current(math.max(0.3, var6.current * (if var26 >= 1 then (var26 - 1) ^ 1.5 + 1 else 1 - (1 - var26) ^ 1.5)))
						
						return
					end
				else
					local current = var5.current
					
					if current then
						current(var7.current + math.deg(math.atan2(var25.Y - var24.Y, var25.X - var24.X) - var19.current))
					end
				end
			end)
			var21.current = userInputService_1.InputEnded:Connect(function()
				-- upvalues: userInputService_1 (copy), var22 (copy)
				if #userInputService_1:GetMouseButtonsPressed() == 0 then
					var22()
				end
			end)
			
			return
		end
	end, {
		var15,
		var13,
		var12,
		var22,
		userInputService_1
	})
	useEffect(function()
		-- upvalues: var15 (ref), var22 (ref)
		if not var15 then
			var22()
		end
		return function()
			-- upvalues: var22 (copy)
			var22()
		end
	end, { var15, var22 })
	
	return {
		onResizeHandleInputBegan = useCallback(function(_)
			-- upvalues: var23 (ref)
			var23("resize")
		end, { var23 }),
		onRotateHandleInputBegan = useCallback(function(_)
			-- upvalues: var23 (ref)
			var23("rotate")
		end, { var23 })
	}
end