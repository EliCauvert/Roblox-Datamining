local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local cryoModule = require(parent.Cryo)
local swipeDirectionModule = require(appChat.Enums.SwipeDirection)
local appChatSwipeStartThreshold = game:DefineFastInt("AppChatSwipeStartThreshold", 10)
local appChatSwipeCompleteThreshold = game:DefineFastInt("AppChatSwipeCompleteThreshold", 50)
local appChatSwipeMaxVerticalDrift = game:DefineFastInt("AppChatSwipeMaxVerticalDrift", 35)
local appChatGlobalSwipeTracking = game:DefineFastFlag("AppChatGlobalSwipeTracking", false)
local var9 = nil
local t = { frequency = 4, dampingRatio = 0.8 }
local t_1 = {
	onSwipeComplete = function() --[[ line: 34 ]] end,
	direction = swipeDirectionModule.Right,
	swipeStartThreshold = appChatSwipeStartThreshold,
	swipeCompleteThreshold = appChatSwipeCompleteThreshold,
	swipeMaxVerticalDrift = appChatSwipeMaxVerticalDrift
}

return function(p0) --[[ line: 47 | named "useSwipeGesture" ]]
	-- upvalues: cryoModule (ref), t_1 (ref), reactOtterModule (ref), reactModule (ref), appChatGlobalSwipeTracking (ref), var9 (write), t (ref), swipeDirectionModule (ref)
	local var12 = cryoModule.Dictionary.union(t_1, p0)
	local var13, var14 = reactOtterModule.useAnimatedBinding(0)
	local var15 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: var13 (ref), var12 (ref)
		return var13:map(function(p1) --[[ line: 52 ]]
			-- upvalues: var12 (copy)
			return math.clamp(p1 / var12.swipeCompleteThreshold, 0, 1)
		end)
	end, { var13, var12.swipeCompleteThreshold })
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(Vector2.zero)
	local var19 = reactModule.useRef(false)
	local var20 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: var16 (ref), appChatGlobalSwipeTracking (copy), var9 (copy), var18 (ref), var17 (ref), var19 (ref), var14 (ref), reactOtterModule (copy), t (copy), var12 (ref)
		return {
			getActiveInput = function() --[[ line: 63 ]]
				-- upvalues: var16 (copy)
				return var16.current
			end,
			setOffset = function(p2) --[[ line: 94 ]]
				-- upvalues: var14 (copy), reactOtterModule (copy), t (copy), var19 (copy), var12 (copy)
				var14(reactOtterModule.spring(p2, t))
				
				if not var19.current and var12.swipeCompleteThreshold < p2 then
					var19.current = true
					
					if var12.onSwipeThresholdReached then
						var12.onSwipeThresholdReached()
						
						return
					end
				elseif var19.current and p2 <= var12.swipeCompleteThreshold then
					var19.current = false
				end
			end,
			isPastCompleteThreshold = function() --[[ line: 91 ]]
				-- upvalues: var19 (copy)
				return var19.current
			end,
			startSwipe = function(p3, p4) --[[ line: 66 ]]
				-- upvalues: appChatGlobalSwipeTracking (copy), var9 (copy), var16 (copy), var18 (copy), var17 (copy)
				if appChatGlobalSwipeTracking then
					var9 = p3
				end
				var16.current = p3
				var18.current = Vector2.new(p3.Position.X, p3.Position.Y)
				var17.current = p3.Changed:Connect(function() --[[ line: 72 ]]
					-- upvalues: p4 (ref)
					p4()
				end)
			end,
			resetSwipe = function() --[[ line: 82 ]]
				-- upvalues: appChatGlobalSwipeTracking (copy), var9 (copy), var16 (copy), var19 (copy), var17 (copy), var14 (copy), reactOtterModule (copy), t (copy)
				if appChatGlobalSwipeTracking and var9 == var16.current then
					var9 = nil
				end
				var16.current = nil
				var19.current = false
				
				if var17.current then
					var17.current:Disconnect()
					var17.current = nil
				end
				var14(reactOtterModule.spring(0, t))
			end,
			disconnectInputListener = function() --[[ line: 76 ]]
				-- upvalues: var17 (copy)
				if var17.current then
					var17.current:Disconnect()
					var17.current = nil
				end
			end
		}
	end, { var14 })
	local var21 = reactModule.useCallback(function() --[[ line: 116 ]]
		-- upvalues: var20 (ref), var12 (ref), var18 (ref), swipeDirectionModule (copy)
		local activeInput = var20.getActiveInput()
		
		if not activeInput then return end
		if activeInput.UserInputState == Enum.UserInputState.End or activeInput.UserInputState == Enum.UserInputState.Cancel then
			if var20.isPastCompleteThreshold() then
				var12.onSwipeComplete()
			end
			var20.resetSwipe()
			
			return
		else
			local var24 = Vector2.new(activeInput.Position.X, activeInput.Position.Y) - var18.current
			local var25 = if var12.direction == swipeDirectionModule.Right then var24.X else -var24.X
			
			if var25 < var12.swipeStartThreshold or var12.swipeMaxVerticalDrift < math.abs(var24.Y) then
				var20.setOffset(0)
				
				return
			end
			var20.setOffset(math.max(0, var25))
		end
	end, {
		var20,
		var12.swipeCompleteThreshold,
		var12.swipeMaxVerticalDrift,
		var12.direction,
		var14
	})
	reactModule.useEffect(function() --[[ line: 159 ]]
		-- upvalues: var20 (ref)
		return var20.resetSwipe
	end, { var20.resetSwipe })
	local var22 = reactModule.useCallback(function(_, p5) --[[ line: 163 ]]
		-- upvalues: appChatGlobalSwipeTracking (copy), var9 (copy), var20 (ref), var21 (ref)
		if appChatGlobalSwipeTracking and var9 ~= nil then return end
		if var20.getActiveInput() ~= nil then return end
		if p5.UserInputType == Enum.UserInputType.Touch or p5.UserInputType == Enum.UserInputType.MouseButton1 then
			var20.startSwipe(p5, var21)
		end
	end, {})
	
	return reactModule.useMemo(function() --[[ line: 181 ]]
		-- upvalues: var13 (ref), var15 (ref), var22 (ref)
		return {
			swipeOffset = var13,
			swipeProgress = var15,
			onInputBegan = var22
		}
	end, { var13, var15, var22 })
end