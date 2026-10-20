local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local CryoModule = require(Parent.Cryo)
local SwipeDirectionModule = require(AppChat.Enums.SwipeDirection)
local FFlagAppChatSwipeGestureLatestConfigModule = require(AppChat.Flags.FFlagAppChatSwipeGestureLatestConfig)
local AppChatGlobalSwipeTracking = game:DefineFastFlag("AppChatGlobalSwipeTracking", false)
local Current = nil
local config = { frequency = 4, dampingRatio = 0.8 }
local config1 = {
	onSwipeComplete = function() end,
	direction = SwipeDirectionModule.Right,
	swipeStartThreshold = game:DefineFastInt("AppChatSwipeStartThreshold", 10),
	swipeCompleteThreshold = game:DefineFastInt("AppChatSwipeCompleteThreshold", 50),
	swipeMaxVerticalDrift = game:DefineFastInt("AppChatSwipeMaxVerticalDrift", 35)
}

return function(p1)
	-- upvalues: CryoModule (copy), config1 (copy), ReactModule (copy), FFlagAppChatSwipeGestureLatestConfigModule (copy), ReactOtterModule (copy), AppChatGlobalSwipeTracking (copy), Current (ref), config (copy), SwipeDirectionModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config1, p1)
	local UseRefResult = ReactModule.useRef(UnionResult)
	
	if FFlagAppChatSwipeGestureLatestConfigModule then
		UseRefResult.current = UnionResult
	end
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), UnionResult (copy)
		return UseAnimatedBindingResult:map(function(p2): number
			-- upvalues: UnionResult (upval)
			return (math.clamp(p2 / UnionResult.swipeCompleteThreshold, 0, 1))
		end)
	end, {
		UseAnimatedBindingResult,
		UnionResult.swipeCompleteThreshold
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult4 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), UseRefResult (copy)
		return {
			getActiveInput = function()
				-- upvalues: UseRefResult1 (upval)
				return UseRefResult1.current
			end,
			setOffset = function(Largest)
				-- upvalues: UseRefResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval), UseRefResult4 (upval)
				local Current = UseRefResult.current
				UseAnimatedBindingResult2(ReactOtterModule.spring(Largest, config))
				
				if not UseRefResult4.current and Current.swipeCompleteThreshold < Largest then
					UseRefResult4.current = true
					
					if Current.onSwipeThresholdReached then
						Current.onSwipeThresholdReached()
						
						return
					end
				elseif UseRefResult4.current and Largest <= Current.swipeCompleteThreshold then
					UseRefResult4.current = false
				end
			end,
			isPastCompleteThreshold = function()
				-- upvalues: UseRefResult4 (upval)
				return UseRefResult4.current
			end,
			startSwipe = function(Current1, Callback)
				-- upvalues: AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult2 (upval)
				if AppChatGlobalSwipeTracking then
					Current = Current1
				end
				UseRefResult1.current = Current1
				UseRefResult3.current = Vector2.new(Current1.Position.X, Current1.Position.Y)
				UseRefResult2.current = Current1.Changed:Connect(function()
					-- upvalues: Callback (copy)
					Callback()
				end)
			end,
			resetSwipe = function()
				-- upvalues: AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult1 (upval), UseRefResult4 (upval), UseRefResult2 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
				if AppChatGlobalSwipeTracking and Current == UseRefResult1.current then
					Current = nil
				end
				UseRefResult1.current = nil
				UseRefResult4.current = false
				
				if UseRefResult2.current then
					UseRefResult2.current:Disconnect()
					UseRefResult2.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
			end,
			disconnectInputListener = function()
				-- upvalues: UseRefResult2 (upval)
				if UseRefResult2.current then
					UseRefResult2.current:Disconnect()
					UseRefResult2.current = nil
				end
			end
		}
	end, { UseAnimatedBindingResult2 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseMemoResult1 (copy), UseRefResult3 (copy), SwipeDirectionModule (upval)
		local Current = UseRefResult.current
		local ActiveInput = UseMemoResult1.getActiveInput()
		
		if not ActiveInput then return end
		if ActiveInput.UserInputState == Enum.UserInputState.End or ActiveInput.UserInputState == Enum.UserInputState.Cancel then
			if UseMemoResult1.isPastCompleteThreshold() then
				Current.onSwipeComplete()
			end
			UseMemoResult1.resetSwipe()
			
			return
		else
			local VectorDelta = Vector2.new(ActiveInput.Position.X, ActiveInput.Position.Y) - UseRefResult3.current
			local X = if Current.direction == SwipeDirectionModule.Right then VectorDelta.X else -VectorDelta.X
			local Magnitude = math.abs(VectorDelta.Y)
			
			if X < Current.swipeStartThreshold or Current.swipeMaxVerticalDrift < Magnitude then
				UseMemoResult1.setOffset(0)
				
				return
			else
				UseMemoResult1.setOffset((math.max(0, X)))
			end
		end
	end, { UseMemoResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy)
		return UseMemoResult1.resetSwipe
	end, { UseMemoResult1.resetSwipe })
	local UseResult1 = ReactModule.useCallback(function(_, Input)
		-- upvalues: AppChatGlobalSwipeTracking (upval), Current (upval), UseMemoResult1 (copy), UseResult (copy)
		if AppChatGlobalSwipeTracking and Current ~= nil then return end
		if UseMemoResult1.getActiveInput() ~= nil then return end
		if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseMemoResult1.startSwipe(Input, UseResult)
		end
	end, { UseMemoResult1, UseResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), UseMemoResult (copy), UseResult1 (copy)
		return {
			swipeOffset = UseAnimatedBindingResult,
			swipeProgress = UseMemoResult,
			onInputBegan = UseResult1
		}
	end, { UseAnimatedBindingResult, UseMemoResult, UseResult1 })
end