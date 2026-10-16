local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local TextOverlayPreviewGestureUtilsModule = require(MomentsCommon.Utils.TextOverlayPreviewGestureUtils)
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef

local function _(p1, p2: number): number --[[ Line: 46 | Named "shapeScale" ]]
	return (math.max(0.3, p1 * (if p2 >= 1 then (p2 - 1) ^ 1.5 + 1 else 1 - (1 - p2) ^ 1.5)))
end

local _ = function(p1, Frame: Frame) --[[ Line: 51 | Named "touchesStartOnOverlay" ]]
	-- upvalues: TextOverlayPreviewGestureUtilsModule (copy)
	return Frame ~= nil and TextOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(p1, Frame.AbsolutePosition, Frame.AbsoluteSize)
end

return function(p1) --[[ Line: 84 | Named "useTextOverlayPreviewGestures" ]]
	-- upvalues: UserInputService (copy), GuiService (copy), ResponsiveModule (copy), UseRefFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy), TextOverlayPreviewGestureUtilsModule (copy)
	local UserInputService1 = p1.userInputService or UserInputService
	local GuiService1 = p1.guiService or GuiService
	local UseDeviceInsetsResult = ResponsiveModule.useDeviceInsets()
	local UseRefResult = UseRefFunction(p1.scale)
	UseRefResult.current = p1.scale
	local UseRefResult1 = UseRefFunction(p1.rotation)
	UseRefResult1.current = p1.rotation
	local UseRefResult2 = UseRefFunction(p1.onScaleChanged)
	UseRefResult2.current = p1.onScaleChanged
	local UseRefResult3 = UseRefFunction(p1.onRotationChanged)
	UseRefResult3.current = p1.onRotationChanged
	local UseRefResult4 = UseRefFunction(1)
	local UseRefResult5 = UseRefFunction(0)
	local UseRefResult6 = UseRefFunction(0)
	local UseRefResult7 = UseRefFunction(0)
	local UseRefResult8 = UseRefFunction(false)
	local UseRefResult9 = UseRefFunction(false)
	local UseCallbackResult = UseCallbackFunction(function(): Vector2 --[[ Line: 110 ]]
		-- upvalues: GuiService1 (copy), UseDeviceInsetsResult (copy)
		return GuiService1:GetGuiInset() + Vector2.new(UseDeviceInsetsResult.left, UseDeviceInsetsResult.top)
	end, { UseDeviceInsetsResult, GuiService1 })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 115 ]]
		-- upvalues: p1 (copy)
		local Current = if p1.containerRef then p1.containerRef.current else nil
		
		return if Current == nil then nil else Current.AbsolutePosition + Current.AbsoluteSize / 2
	end, { p1.containerRef })
	local IsPreferredInputMatch: boolean = p1.enabled and (p1.selected == true and p1.preferredInput == ResponsiveModule.Input.Touch)
	local IsPreferredInputMatch1: boolean = p1.enabled and (p1.selected == true and p1.preferredInput == ResponsiveModule.Input.Pointer)
	UseEffectFunction(function() --[[ Line: 127 ]]
		-- upvalues: IsPreferredInputMatch (copy), p1 (copy), UserInputService1 (copy), UseRefResult2 (copy), UseRefResult8 (copy), TextOverlayPreviewGestureUtilsModule (upval), UseRefResult4 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult9 (copy), UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult7 (copy)
		if IsPreferredInputMatch then
			local function _() --[[ Line: 132 | Named "overlayContainer" ]]
				-- upvalues: p1 (upval)
				return if p1.containerRef then p1.containerRef.current else nil
			end
			
			local TouchPinchConnection = UserInputService1.TouchPinch:Connect(function(...) --[[ Line: 136 ]]
				-- upvalues: UseRefResult2 (upval), UseRefResult8 (upval), p1 (upval), TextOverlayPreviewGestureUtilsModule (upval), UseRefResult4 (upval), UseRefResult (upval)
				local v1, v2, _, UserInputState = ...
				local CurrentFunction: (any) -> () = UseRefResult2.current
				
				if UserInputState == Enum.UserInputState.Begin then
					UseRefResult8.current = false
					
					if CurrentFunction ~= nil then
						local Current = if p1.containerRef then p1.containerRef.current else nil
						
						if Current ~= nil and TextOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(v1, Current.AbsolutePosition, Current.AbsoluteSize) then
							UseRefResult4.current = UseRefResult.current
							UseRefResult8.current = true
							
							return
						end
					end
					return
				elseif UserInputState ~= Enum.UserInputState.Change then
					UseRefResult8.current = false
				elseif #v1 < 2 then
					UseRefResult8.current = false
					
					return
				else
					if UseRefResult8.current and CurrentFunction then
						CurrentFunction((math.max(0.3, UseRefResult4.current * (if v2 >= 1 then (v2 - 1) ^ 1.5 + 1 else 1 - (1 - v2) ^ 1.5))))
						
						return
					end
				end
			end)
			local TouchRotateConnection = UserInputService1.TouchRotate:Connect(function(...) --[[ Line: 157 ]]
				-- upvalues: UseRefResult3 (upval), TextOverlayPreviewGestureUtilsModule (upval), UseRefResult9 (upval), p1 (upval), UseRefResult6 (upval), UseRefResult1 (upval), UseRefResult7 (upval)
				local v1, _, _, UserInputState = ...
				local CurrentFunction: (any) -> () = UseRefResult3.current
				local TouchLineAngleDegrees = TextOverlayPreviewGestureUtilsModule.getTouchLineAngleDegrees(v1)
				
				if UserInputState == Enum.UserInputState.Begin then
					UseRefResult9.current = false
					
					if CurrentFunction ~= nil and TouchLineAngleDegrees ~= nil then
						local Current = if p1.containerRef then p1.containerRef.current else nil
						
						if Current ~= nil and TextOverlayPreviewGestureUtilsModule.touchGestureStartsOnOverlay(v1, Current.AbsolutePosition, Current.AbsoluteSize) then
							UseRefResult6.current = UseRefResult1.current
							UseRefResult7.current = TouchLineAngleDegrees
							UseRefResult9.current = true
							
							return
						end
					end
					return
				elseif UserInputState ~= Enum.UserInputState.Change then
					UseRefResult9.current = false
				elseif TouchLineAngleDegrees == nil then
					UseRefResult9.current = false
					
					return
				else
					if UseRefResult9.current and CurrentFunction then
						UseRefResult6.current += TextOverlayPreviewGestureUtilsModule.getTouchRotationStepDegrees(UseRefResult7.current, TouchLineAngleDegrees)
						UseRefResult7.current = TouchLineAngleDegrees
						CurrentFunction(UseRefResult6.current)
						
						return
					end
				end
			end)
			
			return function() --[[ Line: 191 ]]
				-- upvalues: TouchPinchConnection (copy), TouchRotateConnection (copy), UseRefResult8 (upval), UseRefResult9 (upval)
				TouchPinchConnection:Disconnect()
				TouchRotateConnection:Disconnect()
				UseRefResult8.current = false
				UseRefResult9.current = false
			end
		else
			return nil
		end
	end, {
		IsPreferredInputMatch,
		p1.containerRef,
		UserInputService1
	})
	local UseRefResult10 = UseRefFunction(nil)
	local UseRefResult11 = UseRefFunction(false)
	local UseRefResult12 = UseRefFunction(1)
	local UseRefResult13 = UseRefFunction(0)
	local UseRefResult14 = UseRefFunction(nil)
	local UseRefResult15 = UseRefFunction(nil)
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 207 ]]
		-- upvalues: UseRefResult10 (copy), UseRefResult11 (copy), UseRefResult14 (copy), UseRefResult15 (copy)
		UseRefResult10.current = nil
		UseRefResult11.current = false
		
		if UseRefResult14.current then
			UseRefResult14.current:Disconnect()
			UseRefResult14.current = nil
		end
		if UseRefResult15.current then
			UseRefResult15.current:Disconnect()
			UseRefResult15.current = nil
		end
	end, {})
	local UseCallbackResult3 = UseCallbackFunction(function(Current) --[[ Line: 220 ]]
		-- upvalues: IsPreferredInputMatch1 (copy), UseCallbackResult2 (copy), UseRefResult10 (copy), UseRefResult11 (copy), UseRefResult4 (copy), UseRefResult (copy), UseRefResult5 (copy), UseRefResult1 (copy), UseRefResult14 (copy), UserInputService1 (copy), UseCallbackResult1 (copy), UseCallbackResult (copy), UseRefResult12 (copy), UseRefResult13 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult15 (copy)
		if IsPreferredInputMatch1 then
			UseCallbackResult2()
			UseRefResult10.current = Current
			UseRefResult11.current = true
			UseRefResult4.current = UseRefResult.current
			UseRefResult5.current = UseRefResult1.current
			UseRefResult14.current = UserInputService1.InputChanged:Connect(function(_) --[[ Line: 230 ]]
				-- upvalues: UseRefResult10 (upval), UseCallbackResult1 (upval), UserInputService1 (upval), UseCallbackResult (upval), UseRefResult11 (upval), UseRefResult12 (upval), UseRefResult13 (upval), UseRefResult2 (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseRefResult5 (upval)
				if UseRefResult10.current == nil then return end
				local UseCallbackResultResult = UseCallbackResult1()
				
				if UseCallbackResultResult == nil then return end
				local MouseLocationDelta = UserInputService1:GetMouseLocation() - UseCallbackResult()
				
				if UseRefResult11.current then
					UseRefResult12.current = math.max((MouseLocationDelta - UseCallbackResultResult).Magnitude, 1)
					UseRefResult13.current = math.atan2(MouseLocationDelta.Y - UseCallbackResultResult.Y, MouseLocationDelta.X - UseCallbackResultResult.X)
					UseRefResult11.current = false
					
					return
				end
				if UseRefResult10.current == "resize" then
					local CurrentFunction: (any) -> () = UseRefResult2.current
					
					if CurrentFunction then
						local MagnitudeRatio = (MouseLocationDelta - UseCallbackResultResult).Magnitude / UseRefResult12.current
						CurrentFunction((math.max(0.3, UseRefResult4.current * (if MagnitudeRatio >= 1 then (MagnitudeRatio - 1) ^ 1.5 + 1 else 1 - (1 - MagnitudeRatio) ^ 1.5))))
						
						return
					end
				else
					local CurrentFunction1: (any) -> () = UseRefResult3.current
					
					if CurrentFunction1 then
						CurrentFunction1(UseRefResult5.current + math.deg(math.atan2(MouseLocationDelta.Y - UseCallbackResultResult.Y, MouseLocationDelta.X - UseCallbackResultResult.X) - UseRefResult13.current))
					end
				end
			end)
			UseRefResult15.current = UserInputService1.InputEnded:Connect(function() --[[ Line: 264 ]]
				-- upvalues: UserInputService1 (upval), UseCallbackResult2 (upval)
				if #UserInputService1:GetMouseButtonsPressed() == 0 then
					UseCallbackResult2()
				end
			end)
			
			return
		end
	end, {
		IsPreferredInputMatch1,
		UseCallbackResult1,
		UseCallbackResult,
		UseCallbackResult2,
		UserInputService1
	})
	UseEffectFunction(function() --[[ Line: 272 ]]
		-- upvalues: IsPreferredInputMatch1 (copy), UseCallbackResult2 (copy)
		if not IsPreferredInputMatch1 then
			UseCallbackResult2()
		end
		return function() --[[ Line: 276 ]]
			-- upvalues: UseCallbackResult2 (upval)
			UseCallbackResult2()
		end
	end, { IsPreferredInputMatch1, UseCallbackResult2 })
	
	return {
		onResizeHandleInputBegan = UseCallbackFunction(function(_) --[[ Line: 281 ]]
			-- upvalues: UseCallbackResult3 (copy)
			UseCallbackResult3("resize")
		end, { UseCallbackResult3 }),
		onRotateHandleInputBegan = UseCallbackFunction(function(_) --[[ Line: 284 ]]
			-- upvalues: UseCallbackResult3 (copy)
			UseCallbackResult3("rotate")
		end, { UseCallbackResult3 })
	}
end