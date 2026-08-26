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

local function _(p1, p2, p3)
	return math.abs(p1 - p2) < p3
end

local function createController(p1, p2, p3)
	-- upvalues: otterModule (ref), t (ref), userGameSettingsService (ref), getClosestItemToCenterModule (ref), runService (ref)
	local var1 = nil
	local var2 = false
	local var3 = nil
	local var4 = false
	local var5 = 0
	local var6 = false
	
	local function getWasTouched()
		-- upvalues: var6 (write)
		return var6
	end
	
	local function resetTouchState()
		-- upvalues: var2 (write), var6 (write)
		var2 = false
		var6 = false
	end
	
	local function getIsNavigationLocked()
		-- upvalues: var4 (write)
		return var4
	end
	
	local function setIsNavigationLocked(value)
		-- upvalues: var2 (write), var6 (write), var4 (write)
		if value == true then
			var2 = false
			var6 = false
		end
		var4 = value
	end
	
	local function resetMotor(value, p4, p5)
		-- upvalues: var3 (write), otterModule (copy), var2 (write), var5 (write), p1 (ref)
		if var3 then
			var3:destroy()
			var3 = nil
		end
		local var7 = otterModule.createSingleMotor(value)
		var3 = var7
		var7:onStep(function(p6)
			-- upvalues: var3 (copy), var7 (ref), var2 (copy), var5 (copy), p4 (ref), value (ref), p1 (copy)
			if var3 ~= var7 then
				var7:destroy()
				
				return
			elseif var2 then
				var7:destroy()
				var3 = nil
				
				return
			end
			local var8 = if math.abs(p6 - var5) < 0.5 then var5 else p6
			
			if p4 and p4(value, var8) then return end
			if p1.current then
				p1.current.CanvasPosition = Vector2.new(var8, 0)
			end
		end)
		
		if p5 then
			var7:onComplete(p5)
		end
		var7:start()
	end
	
	local function setGoal(value, p4, p5)
		-- upvalues: var3 (write), var5 (write), otterModule (copy), t (copy)
		if not var3 then return end
		assert(var3 ~= nil, "setGoal called before resetMotor")
		var5 = value.X * (p4 - 1)
		
		if p5 then
			var3:setGoal(otterModule.instant(var5))
			
			return
		end
		var3:setGoal(otterModule.spring(var5, t))
	end
	
	local t_1 = {
		carouselRef = p1,
		getWasTouched = getWasTouched,
		getIsNavigationLocked = getIsNavigationLocked,
		handleDeleteTransition = function(p4, p5, p6, p7, p8, p9)
			-- upvalues: p1 (ref), p2 (ref), var2 (write), var6 (write), var4 (write), resetMotor (ref), setGoal (ref), userGameSettingsService (copy), otterModule (copy), var3 (write), var5 (write)
			local current = p1.current
			local current_1 = p2.current
			
			if not current or not current_1 then return end
			local var7
			assert(current ~= nil, "carousel should exist")
			assert(current_1 ~= nil, "selectedItem should exist")
			local scrollingEnabled = current.ScrollingEnabled
			current.ScrollingEnabled = false
			var2 = false
			var6 = false
			var4 = true
			
			local function handleDeleteNextImageMovement()
				-- upvalues: p6 (ref), current_1 (ref), p7 (ref), resetMotor (copy), current (ref), p9 (ref), p4 (ref), var4 (copy), scrollingEnabled (ref), setGoal (copy), p8 (ref), userGameSettingsService (copy)
				resetMotor(current.CanvasPosition.X, function(p10, p11)
					-- upvalues: p6 (copy), current_1 (copy), p7 (copy)
					current_1.Size = UDim2.fromOffset(math.round(p6.X - math.abs(p10 - p11)), p6.Y)
					
					return p7 == 1
				end, function()
					-- upvalues: p9 (copy), current_1 (copy), p4 (copy), var4 (copy), current (copy), scrollingEnabled (copy)
					p9()
					current_1.Visible = false
					p4(1)
					var4 = false
					current.ScrollingEnabled = scrollingEnabled
				end)
				setGoal(p6, p7 - 1, p8 or userGameSettingsService.ReducedMotion)
			end
			
			local function handleDeleteImagesFadeIn()
				-- upvalues: p5 (ref), p7 (ref), resetMotor (copy), current (ref), p9 (ref), current_1 (ref), otterModule (copy), p4 (ref), var4 (copy), scrollingEnabled (ref), p6 (ref), var3 (copy), var5 (copy)
				if not p5 then return end
				assert(p5 ~= nil, "setPostDeletionItemBinding should exist")
				resetMotor(current.CanvasPosition.X, function(_, _)
					-- upvalues: p7 (copy)
					return p7 == 1
				end, function()
					-- upvalues: p9 (copy), current_1 (copy), otterModule (copy), p4 (copy), p5 (copy), var4 (copy), current (copy), scrollingEnabled (copy)
					p9()
					current_1.Visible = false
					local var8 = otterModule.createSingleMotor(0)
					var8:onStep(function(p10)
						-- upvalues: p4 (copy), p5 (copy)
						p4(p10)
						p5(1)
					end)
					var8:onComplete(function()
						-- upvalues: var4 (copy), current (copy), scrollingEnabled (copy)
						var4 = false
						current.ScrollingEnabled = scrollingEnabled
					end)
					var8:setGoal(otterModule.spring(1, { frequency = 2 }))
				end)
				local var8 = p7 - 1
				
				if var3 then
					assert(var3 ~= nil, "setGoal called before resetMotor")
					var5 = p6.X * (var8 - 1)
					var3:setGoal(otterModule.instant(var5))
					
					return
				end
			end
			
			local function handleDeleteNextImageFadeOut()
				-- upvalues: p5 (ref), otterModule (copy), handleDeleteImagesFadeIn (ref)
				if p5 then
					assert(p5 ~= nil, "setPostDeletionItemBinding should exist")
					local var8 = otterModule.createSingleMotor(1)
					var8:onStep(p5)
					var8:onComplete(handleDeleteImagesFadeIn)
					var8:setGoal(otterModule.spring(0, { frequency = 6 }))
					
					return
				end
			end
			
			local var8 = otterModule.createSingleMotor(1)
			var8:onStep(p4)
			local _ = nil
			
			if userGameSettingsService.ReducedMotion then
				var7 = 6
				var8:onComplete(handleDeleteNextImageFadeOut)
			else
				var7 = 4
				var8:onComplete(handleDeleteNextImageMovement)
			end
			var8:setGoal(otterModule.spring(0, { frequency = var7 }))
		end,
		handleInertialMove = function(p4, p5)
			-- upvalues: p1 (ref), var2 (write), getClosestItemToCenterModule (copy), var3 (write), otterModule (copy), var5 (write), t (copy), var1 (write), runService (copy), p3 (ref)
			local _ = nil
			local current = p1.current
			
			if var2 or not current then return end
			assert(current ~= nil, "carousel should not be nil")
			local var7 = -current:GetSampledInertialVelocity().X
			current:ClearInertialScrolling()
			local var8, var9 = getClosestItemToCenterModule(p4, current)
			
			if math.abs(var7) < 60 and var8 == p5 then
				if var9 > 0.5 then
					local x = current.CanvasPosition.X
					
					if var3 then
						var3:destroy()
						var3 = nil
					end
					local var10 = otterModule.createSingleMotor(x)
					var3 = var10
					local var11 = nil
					var10:onStep(function(p6)
						-- upvalues: var3 (copy), var10 (ref), var2 (copy), var5 (copy), var11 (ref), x (ref), p1 (copy)
						if var3 ~= var10 then
							var10:destroy()
							
							return
						elseif var2 then
							var10:destroy()
							var3 = nil
							
							return
						end
						local var12 = if math.abs(p6 - var5) < 0.5 then var5 else p6
						
						if var11 and var11(x, var12) then return end
						if p1.current then
							p1.current.CanvasPosition = Vector2.new(var12, 0)
						end
					end)
					var10:start()
					
					if var3 then
						assert(var3 ~= nil, "setGoal called before resetMotor")
						var5 = p4.X * (p5 - 1)
						var3:setGoal(otterModule.spring(var5, t))
					end
				end
				return
			elseif var1 then
				var1:Disconnect()
				var1 = nil
			end
			var1 = runService.RenderStepped:Connect(function(p6)
				-- upvalues: p1 (copy), var2 (copy), var1 (copy), getClosestItemToCenterModule (copy), p4 (ref), var7 (write), p5 (ref), var3 (copy), otterModule (copy), var5 (copy), t (copy), p3 (copy)
				local current = p1.current
				
				if not current or var2 then
					assert(var1 ~= nil, "handleInertialMoveConn should exist")
					var1:Disconnect()
					var1 = nil
					
					return
				end
				assert(current ~= nil, "carousel should not be nil")
				local var12, var13 = getClosestItemToCenterModule(p4, current)
				
				if math.abs(var7) >= 60 then
					current.CanvasPosition += Vector2.new(var7 * p6, 0)
					var7 *= (if math.abs(var7) < 120 then 0.7 else math.max(var13 / (p4.X / 2) * 1.25, 0.85) * 0.95) ^ (p6 / 0.016666666667)
					
					return
				end
				assert(var1 ~= nil, "handleInertialMoveConn should exist")
				var1:Disconnect()
				var1 = nil
				
				if var12 ~= p5 then
					p3(var12)
					
					return
				end
				local x = current.CanvasPosition.X
				
				if var3 then
					var3:destroy()
					var3 = nil
				end
				local var14 = otterModule.createSingleMotor(x)
				var3 = var14
				local var15 = nil
				var14:onStep(function(p7)
					-- upvalues: var3 (copy), var14 (ref), var2 (copy), var5 (copy), var15 (ref), x (ref), p1 (copy)
					if var3 ~= var14 then
						var14:destroy()
						
						return
					elseif var2 then
						var14:destroy()
						var3 = nil
						
						return
					end
					local var16 = if math.abs(p7 - var5) < 0.5 then var5 else p7
					
					if var15 and var15(x, var16) then return end
					if p1.current then
						p1.current.CanvasPosition = Vector2.new(var16, 0)
					end
				end)
				var14:start()
				local var16 = p4
				local var17 = p5
				
				if var3 then
					assert(var3 ~= nil, "setGoal called before resetMotor")
					var5 = var16.X * (var17 - 1)
					var3:setGoal(otterModule.spring(var5, t))
					
					return
				end
			end)
		end,
		onInputBegan = function(_, p4)
			-- upvalues: var4 (write), var2 (write), var6 (write)
			if var4 then return end
			if p4.UserInputType == Enum.UserInputType.Touch then
				var2 = true
				var6 = true
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

return function(p1, p2, p3)
	-- upvalues: useAnalyticsModule (ref), useBinding (ref), reactModule (ref), useIsHovered (ref), useIsTouchDown (ref), useLastInput (ref), createController (ref), userGameSettingsService (ref), useEffectOnce (ref), getClosestItemToCenterModule (ref), useEventConnection (ref), userInputService (ref), contextActionService (ref), eventNamesModule (ref), fFlagUseMediaPlayerInCarousel (ref)
	local var1 = useAnalyticsModule()
	local var2, var3 = useBinding(1)
	local var4, var5 = useBinding(1)
	local var6 = reactModule.useRef(nil)
	local var7, var8, var9 = useIsHovered()
	local var10 = useIsTouchDown()
	local var11 = reactModule.useRef(nil)
	local var12 = useLastInput()
	local var13 = reactModule.useRef(nil)
	
	if var13.current == nil then
		var13.current = createController(var6, var11, p3)
	end
	local current = var13.current
	assert(current ~= nil, "carouselController should exist")
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), userGameSettingsService (copy), current (ref), p1 (ref), p2 (ref)
		local current_1 = var6.current
		
		if current_1 then
			assert(current_1 ~= nil, "carousel should exist")
			local reducedMotion = userGameSettingsService.ReducedMotion
			current.resetMotor(current_1.CanvasPosition.X)
			current.setGoal(p1, p2, reducedMotion)
			
			return
		end
	end, { p2 })
	useEffectOnce(function()
		-- upvalues: current (ref), p1 (ref), p2 (ref)
		current.setGoal(p1, p2, true)
	end, p2 ~= nil)
	reactModule.useEffect(function()
		-- upvalues: current (ref), p1 (ref), p2 (ref)
		current.setGoal(p1, p2, true)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), current (ref), p1 (ref), p2 (ref)
		if not var10 and current.getWasTouched() then
			current.resetTouchState()
			current.handleInertialMove(p1, p2)
		end
	end, { var10 })
	useEventConnection(userInputService.PointerAction, reactModule.useCallback(function(p4)
		-- upvalues: var6 (ref), current (ref), getClosestItemToCenterModule (copy), p1 (ref), var7 (ref), p3 (ref)
		local current_1 = var6.current
		
		if not current_1 then return end
		assert(current_1 ~= nil, "carousel should exist")
		
		if current.getIsNavigationLocked() then return end
		local var14 = getClosestItemToCenterModule(p1, current_1)
		
		if var7 and p4 > 0 then
			p3(var14 - 1)
			
			return
		elseif var7 and p4 < 0 then
			p3(var14 + 1)
		end
	end, { var7, p1 }))
	useEventConnection(userInputService.TouchSwipe, reactModule.useCallback(function(p4)
		-- upvalues: userGameSettingsService (copy), var6 (ref), current (ref), getClosestItemToCenterModule (copy), p1 (ref), p3 (ref)
		if not userGameSettingsService.ReducedMotion then return end
		local current_1 = var6.current
		
		if not current_1 then return end
		assert(current_1 ~= nil, "carousel should exist")
		
		if current.getIsNavigationLocked() then return end
		local var14 = getClosestItemToCenterModule(p1, current_1)
		
		if p4 == Enum.SwipeDirection.Left then
			p3(var14 + 1)
			
			return
		elseif p4 == Enum.SwipeDirection.Right then
			p3(var14 - 1)
		end
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), var6 (ref), current (ref), var1 (ref), eventNamesModule (copy), getClosestItemToCenterModule (copy), p1 (ref), p3 (ref)
		contextActionService:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, p4, p5)
			-- upvalues: var6 (copy), current (copy), var1 (copy), eventNamesModule (copy), getClosestItemToCenterModule (copy), p1 (copy), p3 (copy)
			local current_1 = var6.current
			
			if not current_1 then return end
			assert(current_1 ~= nil, "carousel should exist")
			
			if current.getIsNavigationLocked() then return end
			if p4 == Enum.UserInputState.End then
				var1.fireEvent(eventNamesModule.CapturesCarouselNavigatedByKeyboard)
				local var14 = getClosestItemToCenterModule(p1, current_1)
				
				if p5.KeyCode == Enum.KeyCode.Left then
					p3(var14 - 1)
					
					return
				elseif p5.KeyCode == Enum.KeyCode.Right then
					p3(var14 + 1)
				end
			end
		end, false, Enum.KeyCode.Left, Enum.KeyCode.Right)
		
		return function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CapturesCarouselNavigateShortcutAction")
		end
	end, {})
	
	return {
		carouselInputBegan = reactModule.useCallback(function(p4, p5)
			-- upvalues: current (ref), userGameSettingsService (copy), var8 (ref)
			if current.getIsNavigationLocked() then return end
			if userGameSettingsService.ReducedMotion then
				var8(p4, p5)
				
				return
			end
			current.onInputBegan(p4, p5)
			var8(p4, p5)
		end, { current.onInputBegan, var8 }),
		carouselInputEnded = reactModule.useCallback(function(p4, p5)
			-- upvalues: fFlagUseMediaPlayerInCarousel (copy), var12 (ref), current (ref), var9 (ref)
			if fFlagUseMediaPlayerInCarousel and var12 == "Touch" and not current.getWasTouched() then
				current.onInputBegan(p4, p5)
			end
			var9(p4, p5)
		end, { var9 }),
		carouselRef = var6,
		deleteSelectedItem = reactModule.useCallback(function(p4)
			-- upvalues: current (ref), var3 (ref), var5 (ref), p1 (ref), p2 (ref)
			current.handleDeleteTransition(var3, var5, p1, p2, false, p4)
		end, { p1, p2, var3 }),
		postDeletionItemBinding = var4,
		selectedItemFadeOutBinding = var2,
		selectedItemRef = var11,
		setIsNavigationLocked = current.setIsNavigationLocked
	}
end