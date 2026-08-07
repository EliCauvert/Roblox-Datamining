local parent = script.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local userInputService = game:GetService("UserInputService")
local otterModule = require(parent_1.Otter)
local reactModule = require(parent_1.React)
local reactUtilsModule = require(parent_1.ReactUtils)
local responsiveModule = require(parent_1.Responsive)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialCommonModule = require(parent_1.SocialCommon)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useBinding = reactModule.useBinding
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useEventConnection = reactUtilsModule.useEventConnection
local useIsHovered = socialCommonModule.Hooks.useIsHovered
local useIsTouchDown = socialCommonModule.Hooks.useIsTouchDown
local useLastInput = responsiveModule.useLastInput
local eventNamesModule = require(parent.Analytics.EventNames)
local getClosestItemToCenterModule = require(parent.Utils.getClosestItemToCenter)
local fFlagUseMediaPlayerInCarousel = require(parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel
local t = { dampingRatio = 1, frequency = 4 }

local function _(p0, p1, p2) --[[ line: 75 | named "isWithinEpsilon" ]]
	return math.abs(p0 - p1) < p2
end

local function createController(p3, p4, p5) --[[ line: 79 ]]
	-- upvalues: otterModule (ref), t (ref), userGameSettingsService (ref), getClosestItemToCenterModule (ref), runService (ref)
	local var15 = nil
	local var16 = false
	local var17 = nil
	local var18 = false
	local var19 = 0
	local var20 = false
	
	local function getWasTouched() --[[ line: 91 ]]
		-- upvalues: var20 (write)
		return var20
	end
	
	local function resetTouchState() --[[ line: 95 ]]
		-- upvalues: var16 (write), var20 (write)
		var16 = false
		var20 = false
	end
	
	local function getIsNavigationLocked() --[[ line: 100 ]]
		-- upvalues: var18 (write)
		return var18
	end
	
	local function setIsNavigationLocked(value) --[[ line: 104 ]]
		-- upvalues: var16 (write), var20 (write), var18 (write)
		if value == true then
			var16 = false
			var20 = false
		end
		var18 = value
	end
	
	local function resetMotor(value, p6, p7) --[[ line: 111 ]]
		-- upvalues: var17 (write), otterModule (copy), var16 (write), var19 (write), p3 (ref)
		if var17 then
			var17:destroy()
			var17 = nil
		end
		local var28 = otterModule.createSingleMotor(value)
		var17 = var28
		var28:onStep(function(p8) --[[ line: 123 ]]
			-- upvalues: var17 (copy), var28 (ref), var16 (copy), var19 (copy), p6 (ref), value (ref), p3 (copy)
			if var17 ~= var28 then
				var28:destroy()
				
				return
			elseif var16 then
				var28:destroy()
				var17 = nil
				
				return
			end
			local var29 = if math.abs(p8 - var19) < 0.5 then var19 else p8
			
			if p6 and p6(value, var29) then return end
			if p3.current then
				p3.current.CanvasPosition = Vector2.new(var29, 0)
			end
		end)
		
		if p7 then
			var28:onComplete(p7)
		end
		var28:start()
	end
	
	local function setGoal(value, p9, p10) --[[ line: 156 ]]
		-- upvalues: var17 (write), var19 (write), otterModule (copy), t (copy)
		if not var17 then return end
		assert(var17 ~= nil, "setGoal called before resetMotor")
		var19 = value.X * (p9 - 1)
		
		if p10 then
			var17:setGoal(otterModule.instant(var19))
			
			return
		end
		var17:setGoal(otterModule.spring(var19, t))
	end
	
	local t_1 = {
		carouselRef = p3,
		getWasTouched = getWasTouched,
		getIsNavigationLocked = getIsNavigationLocked,
		handleDeleteTransition = function(p11, p12, p13, p14, p15, p16) --[[ line: 171 ]]
			-- upvalues: p3 (ref), p4 (ref), var16 (write), var20 (write), var18 (write), resetMotor (ref), setGoal (ref), userGameSettingsService (copy), otterModule (copy), var17 (write), var19 (write)
			local current = p3.current
			local current_1 = p4.current
			
			if not current or not current_1 then return end
			local var34
			assert(current ~= nil, "carousel should exist")
			assert(current_1 ~= nil, "selectedItem should exist")
			local scrollingEnabled = current.ScrollingEnabled
			current.ScrollingEnabled = false
			var16 = false
			var20 = false
			var18 = true
			
			local function handleDeleteNextImageMovement() --[[ line: 194 ]]
				-- upvalues: p13 (ref), current_1 (ref), p14 (ref), resetMotor (copy), current (ref), p16 (ref), p11 (ref), var18 (copy), scrollingEnabled (ref), setGoal (copy), p15 (ref), userGameSettingsService (copy)
				resetMotor(current.CanvasPosition.X, function(p17, p18) --[[ line: 195 | named "onStep" ]]
					-- upvalues: p13 (copy), current_1 (copy), p14 (copy)
					current_1.Size = UDim2.fromOffset(math.round(p13.X - math.abs(p17 - p18)), p13.Y)
					
					return p14 == 1
				end, function() --[[ line: 205 ]]
					-- upvalues: p16 (copy), current_1 (copy), p11 (copy), var18 (copy), current (copy), scrollingEnabled (copy)
					p16()
					current_1.Visible = false
					p11(1)
					var18 = false
					current.ScrollingEnabled = scrollingEnabled
				end)
				setGoal(p13, p14 - 1, p15 or userGameSettingsService.ReducedMotion)
			end
			
			local function handleDeleteImagesFadeIn() --[[ line: 216 ]]
				-- upvalues: p12 (ref), p14 (ref), resetMotor (copy), current (ref), p16 (ref), current_1 (ref), otterModule (copy), p11 (ref), var18 (copy), scrollingEnabled (ref), p13 (ref), var17 (copy), var19 (copy)
				if not p12 then return end
				assert(p12 ~= nil, "setPostDeletionItemBinding should exist")
				resetMotor(current.CanvasPosition.X, function(_, _) --[[ line: 221 ]]
					-- upvalues: p14 (copy)
					return p14 == 1
				end, function() --[[ line: 225 ]]
					-- upvalues: p16 (copy), current_1 (copy), otterModule (copy), p11 (copy), p12 (copy), var18 (copy), current (copy), scrollingEnabled (copy)
					p16()
					current_1.Visible = false
					local var36 = otterModule.createSingleMotor(0)
					var36:onStep(function(p19) --[[ line: 229 ]]
						-- upvalues: p11 (copy), p12 (copy)
						p11(p19)
						p12(1)
					end)
					var36:onComplete(function() --[[ line: 233 ]]
						-- upvalues: var18 (copy), current (copy), scrollingEnabled (copy)
						var18 = false
						current.ScrollingEnabled = scrollingEnabled
					end)
					var36:setGoal(otterModule.spring(1, { frequency = 2 }))
				end)
				local var35 = p14 - 1
				
				if var17 then
					assert(var17 ~= nil, "setGoal called before resetMotor")
					var19 = p13.X * (var35 - 1)
					var17:setGoal(otterModule.instant(var19))
					
					return
				end
			end
			
			local function handleDeleteNextImageFadeOut() --[[ line: 243 ]]
				-- upvalues: p12 (ref), otterModule (copy), handleDeleteImagesFadeIn (ref)
				if p12 then
					assert(p12 ~= nil, "setPostDeletionItemBinding should exist")
					local var37 = otterModule.createSingleMotor(1)
					var37:onStep(p12)
					var37:onComplete(handleDeleteImagesFadeIn)
					var37:setGoal(otterModule.spring(0, { frequency = 6 }))
					
					return
				end
			end
			
			local var33 = otterModule.createSingleMotor(1)
			var33:onStep(p11)
			local _ = nil
			
			if userGameSettingsService.ReducedMotion then
				var34 = 6
				var33:onComplete(handleDeleteNextImageFadeOut)
			else
				var34 = 4
				var33:onComplete(handleDeleteNextImageMovement)
			end
			var33:setGoal(otterModule.spring(0, { frequency = var34 }))
		end,
		handleInertialMove = function(p20, p21) --[[ line: 267 ]]
			-- upvalues: p3 (ref), var16 (write), getClosestItemToCenterModule (copy), var17 (write), otterModule (copy), var19 (write), t (copy), var15 (write), runService (copy), p5 (ref)
			local _ = nil
			local current = p3.current
			
			if var16 or not current then return end
			assert(current ~= nil, "carousel should not be nil")
			local var38 = -current:GetSampledInertialVelocity().X
			current:ClearInertialScrolling()
			local var39, var40 = getClosestItemToCenterModule(p20, current)
			
			if math.abs(var38) < 60 and var39 == p21 then
				if var40 > 0.5 then
					local x = current.CanvasPosition.X
					
					if var17 then
						var17:destroy()
						var17 = nil
					end
					local var41 = otterModule.createSingleMotor(x)
					var17 = var41
					local var42 = nil
					var41:onStep(function(p22) --[[ line: 123 ]]
						-- upvalues: var17 (copy), var41 (ref), var16 (copy), var19 (copy), var42 (ref), x (ref), p3 (copy)
						if var17 ~= var41 then
							var41:destroy()
							
							return
						elseif var16 then
							var41:destroy()
							var17 = nil
							
							return
						end
						local var29 = if math.abs(p22 - var19) < 0.5 then var19 else p22
						
						if var42 and var42(x, var29) then return end
						if p3.current then
							p3.current.CanvasPosition = Vector2.new(var29, 0)
						end
					end)
					var41:start()
					
					if var17 then
						assert(var17 ~= nil, "setGoal called before resetMotor")
						var19 = p20.X * (p21 - 1)
						var17:setGoal(otterModule.spring(var19, t))
					end
				end
				return
			elseif var15 then
				var15:Disconnect()
				var15 = nil
			end
			var15 = runService.RenderStepped:Connect(function(p23) --[[ line: 297 ]]
				-- upvalues: p3 (copy), var16 (copy), var15 (copy), getClosestItemToCenterModule (copy), p20 (ref), var38 (write), p21 (ref), var17 (copy), otterModule (copy), var19 (copy), t (copy), p5 (copy)
				local current = p3.current
				
				if not current or var16 then
					assert(var15 ~= nil, "handleInertialMoveConn should exist")
					var15:Disconnect()
					var15 = nil
					
					return
				end
				assert(current ~= nil, "carousel should not be nil")
				local var43, var44 = getClosestItemToCenterModule(p20, current)
				
				if math.abs(var38) >= 60 then
					current.CanvasPosition += Vector2.new(var38 * p23, 0)
					var38 *= (if math.abs(var38) < 120 then 0.7 else math.max(var44 / (p20.X / 2) * 1.25, 0.85) * 0.95) ^ (p23 / 0.016666666667)
					
					return
				end
				assert(var15 ~= nil, "handleInertialMoveConn should exist")
				var15:Disconnect()
				var15 = nil
				
				if var43 ~= p21 then
					p5(var43)
					
					return
				end
				local x = current.CanvasPosition.X
				
				if var17 then
					var17:destroy()
					var17 = nil
				end
				local var45 = otterModule.createSingleMotor(x)
				var17 = var45
				local var46 = nil
				var45:onStep(function(p24) --[[ line: 123 ]]
					-- upvalues: var17 (copy), var45 (ref), var16 (copy), var19 (copy), var46 (ref), x (ref), p3 (copy)
					if var17 ~= var45 then
						var45:destroy()
						
						return
					elseif var16 then
						var45:destroy()
						var17 = nil
						
						return
					end
					local var29 = if math.abs(p24 - var19) < 0.5 then var19 else p24
					
					if var46 and var46(x, var29) then return end
					if p3.current then
						p3.current.CanvasPosition = Vector2.new(var29, 0)
					end
				end)
				var45:start()
				local var47 = p20
				local var48 = p21
				
				if var17 then
					assert(var17 ~= nil, "setGoal called before resetMotor")
					var19 = var47.X * (var48 - 1)
					var17:setGoal(otterModule.spring(var19, t))
					
					return
				end
			end)
		end,
		onInputBegan = function(_, p25) --[[ line: 343 ]]
			-- upvalues: var18 (write), var16 (write), var20 (write)
			if var18 then return end
			if p25.UserInputType == Enum.UserInputType.Touch then
				var16 = true
				var20 = true
			end
		end,
		resetMotor = resetMotor,
		resetTouchState = resetTouchState,
		setGoal = setGoal,
		setIsNavigationLocked = setIsNavigationLocked
	}
	t_1.resetMotor(0)
	
	return t_1
end

return function(p26, p27, p28) --[[ line: 372 ]]
	-- upvalues: useAnalyticsModule (ref), useBinding (ref), reactModule (ref), useIsHovered (ref), useIsTouchDown (ref), useLastInput (ref), createController (ref), userGameSettingsService (ref), useEffectOnce (ref), getClosestItemToCenterModule (ref), useEventConnection (ref), userInputService (ref), contextActionService (ref), eventNamesModule (ref), fFlagUseMediaPlayerInCarousel (ref)
	local var49 = useAnalyticsModule()
	local var50, var51 = useBinding(1)
	local var52, var53 = useBinding(1)
	local var54 = reactModule.useRef(nil)
	local var55, var56, var57 = useIsHovered()
	local var58 = useIsTouchDown()
	local var59 = reactModule.useRef(nil)
	local var60 = useLastInput()
	local var61 = reactModule.useRef(nil)
	
	if var61.current == nil then
		var61.current = createController(var54, var59, p28)
	end
	local current = var61.current
	assert(current ~= nil, "carouselController should exist")
	reactModule.useEffect(function() --[[ line: 392 ]]
		-- upvalues: var54 (ref), userGameSettingsService (copy), current (ref), p26 (ref), p27 (ref)
		local current_1 = var54.current
		
		if current_1 then
			assert(current_1 ~= nil, "carousel should exist")
			local reducedMotion = userGameSettingsService.ReducedMotion
			current.resetMotor(current_1.CanvasPosition.X)
			current.setGoal(p26, p27, reducedMotion)
			
			return
		end
	end, { p27 })
	useEffectOnce(function() --[[ line: 410 ]]
		-- upvalues: current (ref), p26 (ref), p27 (ref)
		current.setGoal(p26, p27, true)
	end, p27 ~= nil)
	reactModule.useEffect(function() --[[ line: 416 ]]
		-- upvalues: current (ref), p26 (ref), p27 (ref)
		current.setGoal(p26, p27, true)
	end, { p26 })
	reactModule.useEffect(function() --[[ line: 421 ]]
		-- upvalues: var58 (ref), current (ref), p26 (ref), p27 (ref)
		if not var58 and current.getWasTouched() then
			current.resetTouchState()
			current.handleInertialMove(p26, p27)
		end
	end, { var58 })
	useEventConnection(userInputService.PointerAction, reactModule.useCallback(function(p29) --[[ line: 428 ]]
		-- upvalues: var54 (ref), current (ref), getClosestItemToCenterModule (copy), p26 (ref), var55 (ref), p28 (ref)
		local current_1 = var54.current
		
		if not current_1 then return end
		assert(current_1 ~= nil, "carousel should exist")
		
		if current.getIsNavigationLocked() then return end
		local var62 = getClosestItemToCenterModule(p26, current_1)
		
		if var55 and p29 > 0 then
			p28(var62 - 1)
			
			return
		elseif var55 and p29 < 0 then
			p28(var62 + 1)
		end
	end, { var55, p26 }))
	useEventConnection(userInputService.TouchSwipe, reactModule.useCallback(function(p30) --[[ line: 449 ]]
		-- upvalues: userGameSettingsService (copy), var54 (ref), current (ref), getClosestItemToCenterModule (copy), p26 (ref), p28 (ref)
		if not userGameSettingsService.ReducedMotion then return end
		local current_1 = var54.current
		
		if not current_1 then return end
		assert(current_1 ~= nil, "carousel should exist")
		
		if current.getIsNavigationLocked() then return end
		local var63 = getClosestItemToCenterModule(p26, current_1)
		
		if p30 == Enum.SwipeDirection.Left then
			p28(var63 + 1)
			
			return
		elseif p30 == Enum.SwipeDirection.Right then
			p28(var63 - 1)
		end
	end, {}))
	reactModule.useEffect(function() --[[ line: 473 ]]
		-- upvalues: contextActionService (copy), var54 (ref), current (ref), var49 (ref), eventNamesModule (copy), getClosestItemToCenterModule (copy), p26 (ref), p28 (ref)
		contextActionService:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, p31, p32) --[[ line: 474 ]]
			-- upvalues: var54 (copy), current (copy), var49 (copy), eventNamesModule (copy), getClosestItemToCenterModule (copy), p26 (copy), p28 (copy)
			local current_1 = var54.current
			
			if not current_1 then return end
			assert(current_1 ~= nil, "carousel should exist")
			
			if current.getIsNavigationLocked() then return end
			if p31 == Enum.UserInputState.End then
				var49.fireEvent(eventNamesModule.CapturesCarouselNavigatedByKeyboard)
				local var64 = getClosestItemToCenterModule(p26, current_1)
				
				if p32.KeyCode == Enum.KeyCode.Left then
					p28(var64 - 1)
					
					return
				elseif p32.KeyCode == Enum.KeyCode.Right then
					p28(var64 + 1)
				end
			end
		end, false, Enum.KeyCode.Left, Enum.KeyCode.Right)
		
		return function() --[[ line: 496 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CapturesCarouselNavigateShortcutAction")
		end
	end, {})
	
	return {
		carouselInputBegan = reactModule.useCallback(function(p33, p34) --[[ line: 501 ]]
			-- upvalues: current (ref), userGameSettingsService (copy), var56 (ref)
			if current.getIsNavigationLocked() then return end
			if userGameSettingsService.ReducedMotion then
				var56(p33, p34)
				
				return
			end
			current.onInputBegan(p33, p34)
			var56(p33, p34)
		end, { current.onInputBegan, var56 }),
		carouselInputEnded = reactModule.useCallback(function(p35, p36) --[[ line: 515 ]]
			-- upvalues: fFlagUseMediaPlayerInCarousel (copy), var60 (ref), current (ref), var57 (ref)
			if fFlagUseMediaPlayerInCarousel and var60 == "Touch" and not current.getWasTouched() then
				current.onInputBegan(p35, p36)
			end
			var57(p35, p36)
		end, { var57 }),
		carouselRef = var54,
		deleteSelectedItem = reactModule.useCallback(function(p37) --[[ line: 522 ]]
			-- upvalues: current (ref), var51 (ref), var53 (ref), p26 (ref), p27 (ref)
			current.handleDeleteTransition(var51, var53, p26, p27, false, p37)
		end, { p26, p27, var51 }),
		postDeletionItemBinding = var52,
		selectedItemFadeOutBinding = var50,
		selectedItemRef = var59,
		setIsNavigationLocked = current.setIsNavigationLocked
	}
end