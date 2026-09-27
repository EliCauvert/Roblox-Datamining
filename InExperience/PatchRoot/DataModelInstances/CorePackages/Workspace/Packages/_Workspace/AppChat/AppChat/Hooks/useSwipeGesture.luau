local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local cryoModule = require(parent.Cryo)
local swipeDirectionModule = require(appChat.Enums.SwipeDirection)
local fFlagAppChatSwipeGestureLatestConfigModule = require(appChat.Flags.FFlagAppChatSwipeGestureLatestConfig)
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
	-- upvalues: cryoModule (ref), t_1 (ref), reactModule (ref), fFlagAppChatSwipeGestureLatestConfigModule (ref), reactOtterModule (ref), appChatGlobalSwipeTracking (ref), var1 (write), t (ref), swipeDirectionModule (ref)
	local var2 = cryoModule.Dictionary.union(t_1, p1)
	local var3 = reactModule.useRef(var2)
	
	if fFlagAppChatSwipeGestureLatestConfigModule then
		var3.current = var2
	end
	local var4, var5 = reactOtterModule.useAnimatedBinding(0)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var2 (ref)
		return var4:map(function(p2)
			-- upvalues: var2 (copy)
			return math.clamp(p2 / var2.swipeCompleteThreshold, 0, 1)
		end)
	end, { var4, var2.swipeCompleteThreshold })
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(Vector2.zero)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), appChatGlobalSwipeTracking (copy), var1 (copy), var9 (ref), var8 (ref), var10 (ref), var5 (ref), reactOtterModule (copy), t (copy), var3 (ref)
		return {
			getActiveInput = function()
				-- upvalues: var7 (copy)
				return var7.current
			end,
			setOffset = function(p2)
				-- upvalues: var3 (copy), var5 (copy), reactOtterModule (copy), t (copy), var10 (copy)
				local current = var3.current
				var5(reactOtterModule.spring(p2, t))
				
				if not var10.current and current.swipeCompleteThreshold < p2 then
					var10.current = true
					
					if current.onSwipeThresholdReached then
						current.onSwipeThresholdReached()
						
						return
					end
				elseif var10.current and p2 <= current.swipeCompleteThreshold then
					var10.current = false
				end
			end,
			isPastCompleteThreshold = function()
				-- upvalues: var10 (copy)
				return var10.current
			end,
			startSwipe = function(p2, p3)
				-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var7 (copy), var9 (copy), var8 (copy)
				if appChatGlobalSwipeTracking then
					var1 = p2
				end
				var7.current = p2
				var9.current = Vector2.new(p2.Position.X, p2.Position.Y)
				var8.current = p2.Changed:Connect(function()
					-- upvalues: p3 (ref)
					p3()
				end)
			end,
			resetSwipe = function()
				-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var7 (copy), var10 (copy), var8 (copy), var5 (copy), reactOtterModule (copy), t (copy)
				if appChatGlobalSwipeTracking and var1 == var7.current then
					var1 = nil
				end
				var7.current = nil
				var10.current = false
				
				if var8.current then
					var8.current:Disconnect()
					var8.current = nil
				end
				var5(reactOtterModule.spring(0, t))
			end,
			disconnectInputListener = function()
				-- upvalues: var8 (copy)
				if var8.current then
					var8.current:Disconnect()
					var8.current = nil
				end
			end
		}
	end, { var5 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var11 (ref), var9 (ref), swipeDirectionModule (copy)
		local current = var3.current
		local activeInput = var11.getActiveInput()
		
		if not activeInput then return end
		if activeInput.UserInputState == Enum.UserInputState.End or activeInput.UserInputState == Enum.UserInputState.Cancel then
			if var11.isPastCompleteThreshold() then
				current.onSwipeComplete()
			end
			var11.resetSwipe()
			
			return
		else
			local var13 = Vector2.new(activeInput.Position.X, activeInput.Position.Y) - var9.current
			local var14 = if current.direction == swipeDirectionModule.Right then var13.X else -var13.X
			
			if var14 < current.swipeStartThreshold or current.swipeMaxVerticalDrift < math.abs(var13.Y) then
				var11.setOffset(0)
				
				return
			end
			var11.setOffset(math.max(0, var14))
		end
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return var11.resetSwipe
	end, { var11.resetSwipe })
	local var13 = reactModule.useCallback(function(_, p2)
		-- upvalues: appChatGlobalSwipeTracking (copy), var1 (copy), var11 (ref), var12 (ref)
		if appChatGlobalSwipeTracking and var1 ~= nil then return end
		if var11.getActiveInput() ~= nil then return end
		if p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1 then
			var11.startSwipe(p2, var12)
		end
	end, { var11, var12 })
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), var6 (ref), var13 (ref)
		return {
			swipeOffset = var4,
			swipeProgress = var6,
			onInputBegan = var13
		}
	end, { var4, var6, var13 })
end