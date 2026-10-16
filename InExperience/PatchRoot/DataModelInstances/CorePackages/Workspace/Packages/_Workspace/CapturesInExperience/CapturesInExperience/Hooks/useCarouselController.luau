local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local UserInputService = game:GetService("UserInputService")
local OtterModule = require(Parent1.Otter)
local ReactModule = require(Parent1.React)
local SocialCommonModule = require(Parent1.SocialCommon)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseBindingFunction = ReactModule.useBinding
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseIsHoveredFunction = SocialCommonModule.Hooks.useIsHovered
local UseIsTouchDownFunction = SocialCommonModule.Hooks.useIsTouchDown
local UseLastInputFunction = require(Parent1.Responsive).useLastInput
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetClosestItemToCenterModule = require(Parent.Utils.getClosestItemToCenter)
local FFlagUseMediaPlayerInCarousel = require(Parent1.SharedFlags).FFlagUseMediaPlayerInCarousel
local config = { dampingRatio = 1, frequency = 4 }

local function _(p1, p2, p3): boolean --[[ Line: 75 | Named "isWithinEpsilon" ]]
	return math.abs(p1 - p2) < p3
end

local function createController(CarouselRef, UseRefResult, Callback) --[[ Line: 79 ]]
	-- upvalues: OtterModule (copy), config (copy), UserGameSettings (copy), GetClosestItemToCenterModule (copy), RunService (copy)
	local RenderSteppedConnection = nil
	local Flag = false
	local SingleMotor = nil
	local IsNavigationLocked = false
	local ScaledX = 0
	local Flag1 = false
	
	local function resetMotor(X, p1, p2) --[[ Line: 111 ]]
		-- upvalues: SingleMotor (ref), OtterModule (upval), Flag (ref), ScaledX (ref), CarouselRef (copy)
		if SingleMotor then
			SingleMotor:destroy()
			SingleMotor = nil
		end
		local SingleMotor1 = OtterModule.createSingleMotor(X)
		SingleMotor = SingleMotor1
		SingleMotor1:onStep(function(p3) --[[ Line: 123 ]]
			-- upvalues: SingleMotor (upval), SingleMotor1 (copy), Flag (upval), ScaledX (upval), p1 (copy), X (copy), CarouselRef (upval)
			if SingleMotor ~= SingleMotor1 then
				SingleMotor1:destroy()
				
				return
			end
			if Flag then
				SingleMotor1:destroy()
				SingleMotor = nil
				
				return
			end
			local IsMagnitudeBelow = math.abs(p3 - ScaledX) < 0.5
			local X = if IsMagnitudeBelow then ScaledX else p3
			
			if p1 and p1(X, X) then return end
			if CarouselRef.current then
				CarouselRef.current.CanvasPosition = Vector2.new(X, 0)
			end
		end)
		
		if p2 then
			SingleMotor1:onComplete(p2)
		end
		SingleMotor1:start()
	end
	
	local function setGoal(Vector, p1: number, p2) --[[ Line: 156 ]]
		-- upvalues: SingleMotor (ref), ScaledX (ref), OtterModule (upval), config (upval)
		if not SingleMotor then return end
		assert(SingleMotor ~= nil, "setGoal called before resetMotor")
		ScaledX = Vector.X * (p1 - 1)
		
		if p2 then
			SingleMotor:setGoal(OtterModule.instant(ScaledX))
			
			return
		else
			SingleMotor:setGoal(OtterModule.spring(ScaledX, config))
		end
	end
	
	local config1 = {
		carouselRef = CarouselRef,
		getWasTouched = function() --[[ Line: 91 ]]
			-- upvalues: Flag1 (ref)
			return Flag1
		end,
		getIsNavigationLocked = function() --[[ Line: 100 ]]
			-- upvalues: IsNavigationLocked (ref)
			return IsNavigationLocked
		end,
		handleDeleteTransition = function(Callback1, Callback2, Vector, p1, p2, Callback) --[[ Line: 171 ]]
			-- upvalues: CarouselRef (copy), UseRefResult (copy), Flag (ref), Flag1 (ref), IsNavigationLocked (ref), resetMotor (copy), setGoal (copy), UserGameSettings (upval), OtterModule (upval), SingleMotor (ref), ScaledX (ref)
			local Current = CarouselRef.current
			local Current1 = UseRefResult.current
			
			if not Current or not Current1 then return end
			assert(Current ~= nil, "carousel should exist")
			assert(Current1 ~= nil, "selectedItem should exist")
			local ScrollingEnabled = Current.ScrollingEnabled
			Current.ScrollingEnabled = false
			Flag = false
			Flag1 = false
			IsNavigationLocked = true
			
			local function handleDeleteNextImageMovement() --[[ Line: 194 ]]
				-- upvalues: Vector (copy), Current1 (copy), p1 (copy), resetMotor (upval), Current (copy), Callback (copy), Callback1 (copy), IsNavigationLocked (upval), ScrollingEnabled (copy), setGoal (upval), p2 (copy), UserGameSettings (upval)
				resetMotor(Current.CanvasPosition.X, function(p3, p4): boolean --[[ Line: 195 | Named "onStep" ]]
					-- upvalues: Vector (upval), Current1 (upval), p1 (upval)
					Current1.Size = UDim2.fromOffset(math.round(Vector.X - math.abs(p3 - p4)), Vector.Y)
					
					return p1 == 1
				end, function() --[[ Line: 205 ]]
					-- upvalues: Callback (upval), Current1 (upval), Callback1 (upval), IsNavigationLocked (upval), Current (upval), ScrollingEnabled (upval)
					Callback()
					Current1.Visible = false
					Callback1(1)
					IsNavigationLocked = false
					Current.ScrollingEnabled = ScrollingEnabled
				end)
				setGoal(Vector, p1 - 1, p2 or UserGameSettings.ReducedMotion)
			end
			
			local function handleDeleteImagesFadeIn() --[[ Line: 216 ]]
				-- upvalues: Callback2 (copy), p1 (copy), resetMotor (upval), Current (copy), Callback (copy), Current1 (copy), OtterModule (upval), Callback1 (copy), IsNavigationLocked (upval), ScrollingEnabled (copy), Vector (copy), SingleMotor (upval), ScaledX (upval)
				if not Callback2 then return end
				assert(Callback2 ~= nil, "setPostDeletionItemBinding should exist")
				resetMotor(Current.CanvasPosition.X, function(_, _): boolean --[[ Line: 221 ]]
					-- upvalues: p1 (upval)
					return p1 == 1
				end, function() --[[ Line: 225 ]]
					-- upvalues: Callback (upval), Current1 (upval), OtterModule (upval), Callback1 (upval), Callback2 (upval), IsNavigationLocked (upval), Current (upval), ScrollingEnabled (upval)
					Callback()
					Current1.Visible = false
					local SingleMotor = OtterModule.createSingleMotor(0)
					SingleMotor:onStep(function(p3) --[[ Line: 229 ]]
						-- upvalues: Callback1 (upval), Callback2 (upval)
						Callback1(p3)
						Callback2(1)
					end)
					SingleMotor:onComplete(function() --[[ Line: 233 ]]
						-- upvalues: IsNavigationLocked (upval), Current (upval), ScrollingEnabled (upval)
						IsNavigationLocked = false
						Current.ScrollingEnabled = ScrollingEnabled
					end)
					SingleMotor:setGoal(OtterModule.spring(1, { frequency = 2 }))
				end)
				local v1 = p1 - 1
				
				if SingleMotor then
					assert(SingleMotor ~= nil, "setGoal called before resetMotor")
					ScaledX = Vector.X * (v1 - 1)
					SingleMotor:setGoal(OtterModule.instant(ScaledX))
					
					return
				end
			end
			
			local function handleDeleteNextImageFadeOut() --[[ Line: 243 ]]
				-- upvalues: Callback2 (copy), OtterModule (upval), handleDeleteImagesFadeIn (copy)
				if Callback2 then
					assert(Callback2 ~= nil, "setPostDeletionItemBinding should exist")
					local SingleMotor = OtterModule.createSingleMotor(1)
					SingleMotor:onStep(Callback2)
					SingleMotor:onComplete(handleDeleteImagesFadeIn)
					SingleMotor:setGoal(OtterModule.spring(0, { frequency = 6 }))
					
					return
				end
			end
			
			local SingleMotor1 = OtterModule.createSingleMotor(1)
			SingleMotor1:onStep(Callback1)
			local Frequency = nil
			
			if UserGameSettings.ReducedMotion then
				Frequency = 6
				SingleMotor1:onComplete(handleDeleteNextImageFadeOut)
			else
				Frequency = 4
				SingleMotor1:onComplete(handleDeleteNextImageMovement)
			end
			SingleMotor1:setGoal(OtterModule.spring(0, { frequency = Frequency }))
		end,
		handleInertialMove = function(Vector, p1: number) --[[ Line: 267 ]]
			-- upvalues: CarouselRef (copy), Flag (ref), GetClosestItemToCenterModule (upval), SingleMotor (ref), OtterModule (upval), ScaledX (ref), config (upval), RenderSteppedConnection (ref), RunService (upval), Callback (copy)
			local Negated = nil
			local Current = CarouselRef.current
			
			if Flag or not Current then return end
			assert(Current ~= nil, "carousel should not be nil")
			Negated = -Current:GetSampledInertialVelocity().X
			Current:ClearInertialScrolling()
			local ClosestItemToCenterModule, ClosestItemToCenterModule2 = GetClosestItemToCenterModule(Vector, Current)
			
			if math.abs(Negated) < 60 and ClosestItemToCenterModule == p1 then
				if ClosestItemToCenterModule2 > 0.5 then
					local X = Current.CanvasPosition.X
					
					if SingleMotor then
						SingleMotor:destroy()
						SingleMotor = nil
					end
					local SingleMotor1 = OtterModule.createSingleMotor(X)
					SingleMotor = SingleMotor1
					local v1 = nil
					SingleMotor1:onStep(function(p2) --[[ Line: 123 ]]
						-- upvalues: SingleMotor (upval), SingleMotor1 (copy), Flag (upval), ScaledX (upval), v1 (copy), X (copy), CarouselRef (upval)
						if SingleMotor ~= SingleMotor1 then
							SingleMotor1:destroy()
							
							return
						end
						if Flag then
							SingleMotor1:destroy()
							SingleMotor = nil
							
							return
						end
						local IsMagnitudeBelow = math.abs(p2 - ScaledX) < 0.5
						local X = if IsMagnitudeBelow then ScaledX else p2
						
						if v1 and v1(X, X) then return end
						if CarouselRef.current then
							CarouselRef.current.CanvasPosition = Vector2.new(X, 0)
						end
					end)
					SingleMotor1:start()
					
					if SingleMotor then
						assert(SingleMotor ~= nil, "setGoal called before resetMotor")
						ScaledX = Vector.X * (p1 - 1)
						SingleMotor:setGoal(OtterModule.spring(ScaledX, config))
					end
				end
				return
			else
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				RenderSteppedConnection = RunService.RenderStepped:Connect(function(DeltaTime: number) --[[ Line: 297 ]]
					-- upvalues: CarouselRef (upval), Flag (upval), RenderSteppedConnection (upval), GetClosestItemToCenterModule (upval), Vector (copy), Negated (ref), p1 (copy), SingleMotor (upval), OtterModule (upval), ScaledX (upval), config (upval), Callback (upval)
					local Current = CarouselRef.current
					
					if not Current or Flag then
						assert(RenderSteppedConnection ~= nil, "handleInertialMoveConn should exist")
						RenderSteppedConnection:Disconnect()
						RenderSteppedConnection = nil
						
						return
					end
					assert(Current ~= nil, "carousel should not be nil")
					local ClosestItemToCenterModule, ClosestItemToCenterModule2 = GetClosestItemToCenterModule(Vector, Current)
					
					if math.abs(Negated) >= 60 then
						Current.CanvasPosition += Vector2.new(Negated * DeltaTime, 0)
						local Largest = math.max(ClosestItemToCenterModule2 / (Vector.X / 2) * 1.25, 0.85)
						Negated *= (if math.abs(Negated) < 120 then 0.7 else Largest * 0.95) ^ (DeltaTime / 0.016666666666666666)
						
						return
					end
					assert(RenderSteppedConnection ~= nil, "handleInertialMoveConn should exist")
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
					
					if ClosestItemToCenterModule ~= p1 then
						Callback(ClosestItemToCenterModule)
						
						return
					end
					local X = Current.CanvasPosition.X
					
					if SingleMotor then
						SingleMotor:destroy()
						SingleMotor = nil
					end
					local SingleMotor1 = OtterModule.createSingleMotor(X)
					SingleMotor = SingleMotor1
					local Callback1 = nil
					SingleMotor1:onStep(function(p2) --[[ Line: 123 ]]
						-- upvalues: SingleMotor (upval), SingleMotor1 (copy), Flag (upval), ScaledX (upval), Callback1 (copy), X (copy), CarouselRef (upval)
						if SingleMotor ~= SingleMotor1 then
							SingleMotor1:destroy()
							
							return
						end
						if Flag then
							SingleMotor1:destroy()
							SingleMotor = nil
							
							return
						end
						local IsMagnitudeBelow = math.abs(p2 - ScaledX) < 0.5
						local X = if IsMagnitudeBelow then ScaledX else p2
						
						if Callback1 and Callback1(X, X) then return end
						if CarouselRef.current then
							CarouselRef.current.CanvasPosition = Vector2.new(X, 0)
						end
					end)
					SingleMotor1:start()
					
					if SingleMotor then
						assert(SingleMotor ~= nil, "setGoal called before resetMotor")
						ScaledX = Vector.X * (p1 - 1)
						SingleMotor:setGoal(OtterModule.spring(ScaledX, config))
						
						return
					end
				end)
			end
		end,
		onInputBegan = function(_, Input) --[[ Line: 343 ]]
			-- upvalues: IsNavigationLocked (ref), Flag (ref), Flag1 (ref)
			if IsNavigationLocked then return end
			if Input.UserInputType == Enum.UserInputType.Touch then
				Flag = true
				Flag1 = true
			end
		end,
		resetMotor = resetMotor,
		resetTouchState = function() --[[ Line: 95 ]]
			-- upvalues: Flag (ref), Flag1 (ref)
			Flag = false
			Flag1 = false
		end,
		setGoal = setGoal,
		setIsNavigationLocked = function(Enabled) --[[ Line: 104 ]]
			-- upvalues: Flag (ref), Flag1 (ref), IsNavigationLocked (ref)
			if Enabled == true then
				Flag = false
				Flag1 = false
			end
			IsNavigationLocked = Enabled
		end
	}
	config1.resetMotor(0)
	
	return config1
end

return function(p1, p2, Callback) --[[ Line: 372 ]]
	-- upvalues: UseAnalyticsModule (copy), UseBindingFunction (copy), ReactModule (copy), UseIsHoveredFunction (copy), UseIsTouchDownFunction (copy), UseLastInputFunction (copy), createController (copy), UserGameSettings (copy), UseEffectOnceFunction (copy), GetClosestItemToCenterModule (copy), UseEventConnectionFunction (copy), UserInputService (copy), ContextActionService (copy), EventNamesModule (copy), FFlagUseMediaPlayerInCarousel (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(1)
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction(1)
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsHoveredResult, UseIsHoveredResult2, UseIsHoveredResult3 = UseIsHoveredFunction()
	local UseIsTouchDownResult = UseIsTouchDownFunction()
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLastInputResult = UseLastInputFunction()
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = createController(UseRefResult, UseRefResult1, Callback)
	end
	local Current = UseRefResult2.current
	assert(Current ~= nil, "carouselController should exist")
	ReactModule.useEffect(function() --[[ Line: 392 ]]
		-- upvalues: UseRefResult (copy), UserGameSettings (upval), Current (copy), p1 (copy), p2 (copy)
		local Current1 = UseRefResult.current
		
		if Current1 then
			assert(Current1 ~= nil, "carousel should exist")
			local v1: boolean = if UserGameSettings.ReducedMotion then true else false
			Current.resetMotor(Current1.CanvasPosition.X)
			Current.setGoal(p1, p2, v1)
			
			return
		end
	end, { p2 })
	UseEffectOnceFunction(function() --[[ Line: 410 ]]
		-- upvalues: Current (copy), p1 (copy), p2 (copy)
		Current.setGoal(p1, p2, true)
	end, p2 ~= nil)
	ReactModule.useEffect(function() --[[ Line: 416 ]]
		-- upvalues: Current (copy), p1 (copy), p2 (copy)
		Current.setGoal(p1, p2, true)
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 421 ]]
		-- upvalues: UseIsTouchDownResult (copy), Current (copy), p1 (copy), p2 (copy)
		if not UseIsTouchDownResult and Current.getWasTouched() then
			Current.resetTouchState()
			Current.handleInertialMove(p1, p2)
		end
	end, { UseIsTouchDownResult })
	UseEventConnectionFunction(UserInputService.PointerAction, (ReactModule.useCallback(function(p3: number) --[[ Line: 428 ]]
		-- upvalues: UseRefResult (copy), Current (copy), GetClosestItemToCenterModule (upval), p1 (copy), UseIsHoveredResult (copy), Callback (copy)
		local Current1 = UseRefResult.current
		
		if not Current1 then return end
		assert(Current1 ~= nil, "carousel should exist")
		
		if Current.getIsNavigationLocked() then return end
		local ClosestItemToCenterModule: number = GetClosestItemToCenterModule(p1, Current1)
		
		if UseIsHoveredResult and p3 > 0 then
			Callback(ClosestItemToCenterModule - 1)
			
			return
		end
		if UseIsHoveredResult and p3 < 0 then
			Callback(ClosestItemToCenterModule + 1)
		end
	end, { UseIsHoveredResult, p1 })))
	UseEventConnectionFunction(UserInputService.TouchSwipe, (ReactModule.useCallback(function(SwipeDirection) --[[ Line: 449 ]]
		-- upvalues: UserGameSettings (upval), UseRefResult (copy), Current (copy), GetClosestItemToCenterModule (upval), p1 (copy), Callback (copy)
		if not UserGameSettings.ReducedMotion then return end
		local Current1 = UseRefResult.current
		
		if not Current1 then return end
		assert(Current1 ~= nil, "carousel should exist")
		
		if Current.getIsNavigationLocked() then return end
		local ClosestItemToCenterModule: number = GetClosestItemToCenterModule(p1, Current1)
		
		if SwipeDirection == Enum.SwipeDirection.Left then
			Callback(ClosestItemToCenterModule + 1)
			
			return
		end
		if SwipeDirection == Enum.SwipeDirection.Right then
			Callback(ClosestItemToCenterModule - 1)
		end
	end, {})))
	ReactModule.useEffect(function() --[[ Line: 473 ]]
		-- upvalues: ContextActionService (upval), UseRefResult (copy), Current (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), GetClosestItemToCenterModule (upval), p1 (copy), Callback (copy)
		ContextActionService:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, UserInputState, Input) --[[ Line: 474 ]]
			-- upvalues: UseRefResult (upval), Current (upval), UseAnalyticsModuleResult (upval), EventNamesModule (upval), GetClosestItemToCenterModule (upval), p1 (upval), Callback (upval)
			local Current1 = UseRefResult.current
			
			if not Current1 then return end
			assert(Current1 ~= nil, "carousel should exist")
			
			if Current.getIsNavigationLocked() then return end
			if UserInputState == Enum.UserInputState.End then
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselNavigatedByKeyboard)
				local ClosestItemToCenterModule: number = GetClosestItemToCenterModule(p1, Current1)
				
				if Input.KeyCode == Enum.KeyCode.Left then
					Callback(ClosestItemToCenterModule - 1)
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.Right then
					Callback(ClosestItemToCenterModule + 1)
				end
			end
		end, false, Enum.KeyCode.Left, Enum.KeyCode.Right)
		
		return function() --[[ Line: 496 ]]
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("CapturesCarouselNavigateShortcutAction")
		end
	end, {})
	
	return {
		carouselInputBegan = ReactModule.useCallback(function(p3, Input) --[[ Line: 501 ]]
			-- upvalues: Current (copy), UserGameSettings (upval), UseIsHoveredResult2 (copy)
			if Current.getIsNavigationLocked() then return end
			if UserGameSettings.ReducedMotion then
				UseIsHoveredResult2(p3, Input)
				
				return
			else
				Current.onInputBegan(p3, Input)
				UseIsHoveredResult2(p3, Input)
			end
		end, { Current.onInputBegan, UseIsHoveredResult2 }),
		carouselInputEnded = ReactModule.useCallback(function(p3, Input) --[[ Line: 515 ]]
			-- upvalues: FFlagUseMediaPlayerInCarousel (upval), UseLastInputResult (copy), Current (copy), UseIsHoveredResult3 (copy)
			if FFlagUseMediaPlayerInCarousel and UseLastInputResult == "Touch" and not Current.getWasTouched() then
				Current.onInputBegan(p3, Input)
			end
			UseIsHoveredResult3(p3, Input)
		end, { UseIsHoveredResult3 }),
		carouselRef = UseRefResult,
		deleteSelectedItem = ReactModule.useCallback(function(p3) --[[ Line: 522 ]]
			-- upvalues: Current (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), p1 (copy), p2 (copy)
			Current.handleDeleteTransition(UseBindingResult2, UseBindingResult2_1, p1, p2, false, p3)
		end, { p1, p2, UseBindingResult2 }),
		postDeletionItemBinding = UseBindingResult1,
		selectedItemFadeOutBinding = UseBindingResult,
		selectedItemRef = UseRefResult1,
		setIsNavigationLocked = Current.setIsNavigationLocked
	}
end