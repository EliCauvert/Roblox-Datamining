local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local GetFFlagAXFixItemViewportErrorsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXFixItemViewportErrors)
local ItemViewportIdleRotationSpeed = game:DefineFastInt("ItemViewportIdleRotationSpeed", 30)
local ItemViewportSwipeRotationSpeed: number = game:DefineFastInt("ItemViewportSwipeRotationSpeed", 1000)
local ItemViewportMaxZoom: number = game:DefineFastInt("ItemViewportMaxZoom", 5000)
local _Vector2 = Vector2.new(game:DefineFastInt("ItemViewportInitialAngleX", -45), (game:DefineFastInt("ItemViewportInitialAngleY", 20)))
local ItemViewportSwipeRotationSpeedRatio = ItemViewportSwipeRotationSpeed / 1000
local ItemViewportSwipeRotationSpeedRatio1 = ItemViewportSwipeRotationSpeed / 1000
local ItemViewportSwipeRotationSpeedRatio2 = ItemViewportSwipeRotationSpeed / 1000
local MinValue = 1 / (math.max(ItemViewportMaxZoom, 1) / 1000)
local MaxValue = ItemViewportMaxZoom / 1000
local ItemViewportMouseWheelZoomRatioRatio = game:DefineFastInt("ItemViewportMouseWheelZoomRatio", 1100) / 1000

local function _(Vector, p1: number): Vector2
	-- upvalues: ItemViewportSwipeRotationSpeedRatio (copy), ItemViewportSwipeRotationSpeedRatio1 (copy)
	return Vector2.new(-Vector.X * ItemViewportSwipeRotationSpeedRatio, (math.clamp(Vector.Y * ItemViewportSwipeRotationSpeedRatio1, -90 - p1, 90 - p1)))
end

return function(p1)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), ItemViewportIdleRotationSpeed (copy), _Vector2 (copy), HttpService (copy), RunService (copy), ItemViewportSwipeRotationSpeedRatio2 (copy), ItemViewportSwipeRotationSpeedRatio (copy), ItemViewportSwipeRotationSpeedRatio1 (copy), MinValue (copy), MaxValue (copy), GetFFlagAXFixItemViewportErrorsModule (copy), ItemViewportMouseWheelZoomRatioRatio (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef((Vector3.new()))
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(ItemViewportIdleRotationSpeed)
	local UseRefResult4 = ReactModule.useRef(_Vector2)
	local UseRefResult5 = ReactModule.useRef(Vector2.new())
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(1)
	local UseRefResult8 = ReactModule.useRef(1)
	local UseRefResult9 = ReactModule.useRef(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(CFrame.new())
	local SetParentScrollingEnabledFunction = p1.setParentScrollingEnabled
	ReactModule.useEffect(function()
		-- upvalues: HttpService (upval), UseRefResult6 (copy), RunService (upval), UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ItemViewportSwipeRotationSpeedRatio2 (upval), UseRefResult1 (copy), UseAnimatedBindingResult (copy), UseRefResult4 (copy), UseRefResult5 (copy), p1 (copy), UseRefResult7 (copy), UseRefResult8 (copy), UseBindingResult2 (copy)
		local NewValue = 0
		local Text = "ItemVewportSpin_" .. HttpService:GenerateGUID(false)
		local Current = UseRefResult6.current
		RunService:BindToRenderStep(Text, Enum.RenderPriority.Camera.Value + 1, function(DeltaTime)
			-- upvalues: UseRefResult (upval), UseRefResult6 (upval), Current (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ItemViewportSwipeRotationSpeedRatio2 (upval), UseRefResult1 (upval), NewValue (ref), UseAnimatedBindingResult (upval), UseRefResult4 (upval), UseRefResult5 (upval), p1 (upval), UseRefResult7 (upval), UseRefResult8 (upval), UseBindingResult2 (upval)
			if UseRefResult.current then
				UseAnimatedBindingResult2(ReactOtterModule.instant(-(if UseRefResult6.current and Current then (UseRefResult6.current - Current) / DeltaTime else Vector2.new(0, 0)).X * ItemViewportSwipeRotationSpeedRatio2))
			elseif not UseRefResult1.current then
				NewValue += DeltaTime * UseAnimatedBindingResult:getValue()
			end
			Current = UseRefResult6.current
			local CF = CFrame.Angles(0, math.rad(NewValue) + math.rad(UseRefResult4.current.X) + math.rad(UseRefResult5.current.X), 0) * CFrame.Angles(math.rad(UseRefResult4.current.Y) + math.rad(UseRefResult5.current.Y), 0, 0)
			UseBindingResult2(CFrame.lookAt(CF.LookVector * (p1.defaultCameraDistanceRef.current / (UseRefResult7.current * UseRefResult8.current)), vector.create(0, 0, 0), CF.UpVector))
		end)
		
		return function()
			-- upvalues: RunService (upval), Text (copy)
			RunService:UnbindFromRenderStep(Text)
		end
	end, {
		UseAnimatedBindingResult2,
		p1.defaultCameraDistanceRef,
		UseBindingResult2
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), ItemViewportSwipeRotationSpeedRatio (upval), ItemViewportSwipeRotationSpeedRatio1 (upval), UseRefResult (copy), UseRefResult6 (copy), UseRefResult5 (copy), SetParentScrollingEnabledFunction (copy), UseRefResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ItemViewportIdleRotationSpeed (upval)
		local Vector = p2 - UseRefResult3.current
		local Y: number = UseRefResult4.current.Y
		UseRefResult4.current += Vector2.new(-Vector.X * ItemViewportSwipeRotationSpeedRatio, (math.clamp(Vector.Y * ItemViewportSwipeRotationSpeedRatio1, -90 - Y, 90 - Y)))
		UseRefResult.current = false
		UseRefResult6.current = nil
		UseRefResult5.current = Vector2.new()
		
		if SetParentScrollingEnabledFunction and not UseRefResult2.current then
			SetParentScrollingEnabledFunction(true)
		end
		UseAnimatedBindingResult2((ReactOtterModule.spring(ItemViewportIdleRotationSpeed, { frequency = 1 })))
	end, {
		SetParentScrollingEnabledFunction,
		UseAnimatedBindingResult2
	})
	
	return {
		onInputBegan = ReactModule.useCallback(function(_, Input)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult6 (copy), SetParentScrollingEnabledFunction (copy)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and not UseRefResult.current and not UseRefResult1.current then
				UseRefResult.current = true
				UseRefResult3.current = Input.Position
				UseRefResult6.current = Input.Position
				
				if SetParentScrollingEnabledFunction then
					SetParentScrollingEnabledFunction(false)
				end
			end
		end, { SetParentScrollingEnabledFunction }),
		onInputChanged = ReactModule.useCallback(function(Input)
			-- upvalues: UseRefResult (copy), UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult4 (copy), ItemViewportSwipeRotationSpeedRatio (upval), ItemViewportSwipeRotationSpeedRatio1 (upval), UseRefResult6 (copy)
			local IsUserInputTypeMatch: boolean = Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
			
			if UseRefResult.current and IsUserInputTypeMatch then
				local PositionDelta = Input.Position - UseRefResult3.current
				local Y: number = UseRefResult4.current.Y
				UseRefResult5.current = Vector2.new(-PositionDelta.X * ItemViewportSwipeRotationSpeedRatio, (math.clamp(PositionDelta.Y * ItemViewportSwipeRotationSpeedRatio1, -90 - Y, 90 - Y)))
				UseRefResult6.current = Input.Position
			end
		end, {}),
		onInputEnded = ReactModule.useCallback(function(Input)
			-- upvalues: UseRefResult (copy), UseResult (copy)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and UseRefResult.current then
				UseResult(Input.Position)
			end
		end, { UseResult }),
		onTouchPinch = ReactModule.useCallback(function(Entry, _, _, UserInputState)
			-- upvalues: UseRefResult9 (copy), UseRefResult1 (copy), UseRefResult (copy), UseResult (copy), UseRefResult6 (copy), UseRefResult3 (copy), UseRefResult7 (copy), MinValue (upval), MaxValue (upval), GetFFlagAXFixItemViewportErrorsModule (upval), UseRefResult8 (copy)
			if #Entry < 2 then return end
			local Distance = (Entry[1] - Entry[2]).Magnitude
			local Value = Distance / UseRefResult9.current
			
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult1.current = true
				UseRefResult9.current = Distance
				
				if UseRefResult.current then
					UseResult(UseRefResult6.current or UseRefResult3.current)
					
					return
				end
			elseif UserInputState == Enum.UserInputState.Change then
				local Current = UseRefResult7.current
				local Smallest = math.min(MinValue / Current, MaxValue / Current)
				local Largest = math.max(MinValue / Current, MaxValue / Current)
				
				if GetFFlagAXFixItemViewportErrorsModule() then
					pcall(function()
						-- upvalues: UseRefResult8 (upval), Value (copy), Smallest (copy), Largest (copy)
						UseRefResult8.current = math.clamp(Value, Smallest, Largest)
					end)
					
					return
				else
					UseRefResult8.current = math.clamp(Value, Smallest, Largest)
					
					return
				end
			elseif UserInputState == Enum.UserInputState.End then
				UseRefResult1.current = false
				UseRefResult8.current = 1
				UseRefResult7.current = math.clamp(UseRefResult7.current * Value, MinValue, MaxValue)
			end
		end, { UseResult }),
		onMouseWheelForward = ReactModule.useCallback(function()
			-- upvalues: UseRefResult7 (copy), ItemViewportMouseWheelZoomRatioRatio (upval), MinValue (upval), MaxValue (upval)
			UseRefResult7.current = math.clamp(UseRefResult7.current * ItemViewportMouseWheelZoomRatioRatio, MinValue, MaxValue)
		end, {}),
		onMouseWheelBackward = ReactModule.useCallback(function()
			-- upvalues: UseRefResult7 (copy), ItemViewportMouseWheelZoomRatioRatio (upval), MinValue (upval), MaxValue (upval)
			UseRefResult7.current = math.clamp(UseRefResult7.current / ItemViewportMouseWheelZoomRatioRatio, MinValue, MaxValue)
		end, {}),
		onMouseEnter = ReactModule.useCallback(function()
			-- upvalues: UseRefResult2 (copy), SetParentScrollingEnabledFunction (copy)
			UseRefResult2.current = true
			
			if SetParentScrollingEnabledFunction then
				SetParentScrollingEnabledFunction(false)
			end
		end, { SetParentScrollingEnabledFunction }),
		onMouseLeave = ReactModule.useCallback(function()
			-- upvalues: UseRefResult2 (copy), UseRefResult (copy), SetParentScrollingEnabledFunction (copy)
			UseRefResult2.current = false
			
			if not UseRefResult.current and SetParentScrollingEnabledFunction then
				SetParentScrollingEnabledFunction(true)
			end
		end, { SetParentScrollingEnabledFunction }),
		cameraCFrame = UseBindingResult
	}
end