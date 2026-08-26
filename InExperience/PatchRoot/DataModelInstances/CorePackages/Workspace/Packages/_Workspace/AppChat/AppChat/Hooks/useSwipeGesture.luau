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
local var1 = nil
local t = { frequency = 4, dampingRatio = 0.8 }
local t_1 = {
	onSwipeComplete = function() end,
	direction = swipeDirectionModule.Right,
	swipeStartThreshold = appChatSwipeStartThreshold,
	swipeCompleteThreshold = appChatSwipeCompleteThreshold,
	swipeMaxVerticalDrift = appChatSwipeMaxVerticalDrift
}

return function(p1)
	-- upvalues: cryoModule (ref), t_1 (ref), reactOtterModule (ref), reactModule (ref), appChatGlobalSwipeTracking (ref), var1 (write), t (ref), swipeDirectionModule (ref)
	local var2 = cryoModule.Dictionary.union(t_1, p1)
	local var3, var4 = reactOtterModule.useAnimatedBinding(0)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref)
		return var3:map(function(p2)
			-- upvalues: var2 (copy)
			return math.clamp(p2 / var2.swipeCompleteThreshold, 0, 1)
		end)
	end, { var3, var2.swipeCompleteThreshold })
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(Vector2.zero)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), appChatGlobalSwipeTracking (copy), var1 (copy), var8 (ref), var7 (ref), var9 (ref), var4 (ref), reactOtterModule (copy), t (copy), var2 (ref)
		return {
			getActiveInput = function()
				-- upvalues: var6 (copy)
				return var6.current
			end,
			setOffset = function(p2)
				-- upvalues: var4 (copy), reactOtterModule (copy), t (copy), var9 (copy), var2 (copy)
				var4(reactOtterModule.spring(p2, t))
				
				if not var9.current and var2.swipeCompleteThreshold < p2 then
					var9.current = true
					
					if var2.onSwipeThresholdReached then
						var2.onSwipeThresholdReached()
						
						return
					end
				elseif var9.current and p2 <= var2.swipeCompleteThreshold then
					var9.current = false
				end
			end,
			isPastCompleteThreshold = function()
				-- upvalues: var9 (copy)
				return var9.current
			end,
			startSwipe = function(p2, p3)
				-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var6 (copy), var8 (copy), var7 (copy)
				if appChatGlobalSwipeTracking then
					var1 = p2
				end
				var6.current = p2
				var8.current = Vector2.new(p2.Position.X, p2.Position.Y)
				var7.current = p2.Changed:Connect(function()
					-- upvalues: p3 (ref)
					p3()
				end)
			end,
			resetSwipe = function()
				-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var6 (copy), var9 (copy), var7 (copy), var4 (copy), reactOtterModule (copy), t (copy)
				if appChatGlobalSwipeTracking and var1 == var6.current then
					var1 = nil
				end
				var6.current = nil
				var9.current = false
				
				if var7.current then
					var7.current:Disconnect()
					var7.current = nil
				end
				var4(reactOtterModule.spring(0, t))
			end,
			disconnectInputListener = function()
				-- upvalues: var7 (copy)
				if var7.current then
					var7.current:Disconnect()
					var7.current = nil
				end
			end
		}
	end, { var4 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var2 (ref), var8 (ref), swipeDirectionModule (copy)
		local activeInput = var10.getActiveInput()
		
		if not activeInput then return end
		if activeInput.UserInputState == Enum.UserInputState.End or activeInput.UserInputState == Enum.UserInputState.Cancel then
			if var10.isPastCompleteThreshold() then
				var2.onSwipeComplete()
			end
			var10.resetSwipe()
			
			return
		else
			local var12 = Vector2.new(activeInput.Position.X, activeInput.Position.Y) - var8.current
			local var13 = if var2.direction == swipeDirectionModule.Right then var12.X else -var12.X
			
			if var13 < var2.swipeStartThreshold or var2.swipeMaxVerticalDrift < math.abs(var12.Y) then
				var10.setOffset(0)
				
				return
			end
			var10.setOffset(math.max(0, var13))
		end
	end, {
		var10,
		var2.swipeCompleteThreshold,
		var2.swipeMaxVerticalDrift,
		var2.direction,
		var4
	})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref)
		return var10.resetSwipe
	end, { var10.resetSwipe })
	local var12 = reactModule.useCallback(function(_, p2)
		-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var10 (ref), var11 (ref)
		if appChatGlobalSwipeTracking and var1 ~= nil then return end
		if var10.getActiveInput() ~= nil then return end
		if p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1 then
			var10.startSwipe(p2, var11)
		end
	end, {})
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var5 (ref), var12 (ref)
		return {
			swipeOffset = var3,
			swipeProgress = var5,
			onInputBegan = var12
		}
	end, { var3, var5, var12 })
end