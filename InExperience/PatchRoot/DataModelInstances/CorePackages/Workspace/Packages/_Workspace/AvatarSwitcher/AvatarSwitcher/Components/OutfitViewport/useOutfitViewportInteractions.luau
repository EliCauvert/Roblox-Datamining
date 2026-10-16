local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)

local function _(p1) --[[ Line: 21 | Named "swipeDistanceToRotationAngle" ]]
	return -p1.X * 1
end

return function(p1) --[[ Line: 30 | Named "useOutfitViewportInteractions" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), HttpService (copy), RunService (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef((Vector3.new()))
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(CFrame.new())
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: HttpService (upval), UseRefResult4 (copy), RunService (upval), UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), p1 (copy), UseBindingResult2 (copy)
		local NewValue = 0
		local Text = "OutfitVewportSpin_" .. HttpService:GenerateGUID(false)
		local Current = UseRefResult4.current
		RunService:BindToRenderStep(Text, Enum.RenderPriority.Camera.Value + 1, function(DeltaTime) --[[ Line: 45 ]]
			-- upvalues: UseRefResult (upval), UseRefResult4 (upval), Current (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), NewValue (ref), UseAnimatedBindingResult (upval), UseRefResult2 (upval), UseRefResult3 (upval), p1 (upval), UseBindingResult2 (upval)
			if UseRefResult.current then
				UseAnimatedBindingResult2(ReactOtterModule.instant(-(if UseRefResult4.current and Current then (UseRefResult4.current - Current) / DeltaTime else Vector2.new(0, 0)).X * 1))
			else
				NewValue += DeltaTime * UseAnimatedBindingResult:getValue()
			end
			Current = UseRefResult4.current
			local _CFrame = CFrame.Angles(0, math.rad(NewValue) + math.rad(UseRefResult2.current) + math.rad(UseRefResult3.current), 0)
			UseBindingResult2(CFrame.lookAt(_CFrame.LookVector * p1.defaultCameraDistanceRef.current, vector.create(0, 0, 0), _CFrame.UpVector))
		end)
		
		return function() --[[ Line: 68 ]]
			-- upvalues: RunService (upval), Text (copy)
			RunService:UnbindFromRenderStep(Text)
		end
	end, {
		UseAnimatedBindingResult2,
		p1.defaultCameraDistanceRef,
		UseBindingResult2
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 73 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		UseRefResult2.current += -(p2 - UseRefResult1.current).X * 1
		UseRefResult.current = false
		UseRefResult4.current = nil
		UseRefResult3.current = 0
		
		if p1.onInteractionChanged then
			p1.onInteractionChanged(false)
		end
		UseAnimatedBindingResult2((ReactOtterModule.spring(0, { frequency = 1 })))
	end, { p1.onInteractionChanged, UseAnimatedBindingResult2 })
	
	return {
		onInputBegan = ReactModule.useCallback(function(_, Input) --[[ Line: 86 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult4 (copy), p1 (copy)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and not UseRefResult.current then
				UseRefResult.current = true
				UseRefResult1.current = Input.Position
				UseRefResult4.current = Input.Position
				
				if p1.onInteractionChanged then
					p1.onInteractionChanged(true)
				end
			end
		end, { p1.onInteractionChanged }),
		onInputChanged = ReactModule.useCallback(function(Input) --[[ Line: 100 ]]
			-- upvalues: UseRefResult (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseRefResult4 (copy)
			local IsUserInputTypeMatch: boolean = Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
			
			if UseRefResult.current and IsUserInputTypeMatch then
				UseRefResult3.current = -(Input.Position - UseRefResult1.current).X * 1
				UseRefResult4.current = Input.Position
			end
		end, {}),
		onInputEnded = ReactModule.useCallback(function(Input) --[[ Line: 109 ]]
			-- upvalues: UseRefResult (copy), UseResult (copy)
			if (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and UseRefResult.current then
				UseResult(Input.Position)
			end
		end, { UseResult }),
		cameraCFrame = UseBindingResult
	}
end