local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local CryoModule = require(Parent.Cryo)
local SwipeDirectionModule = require(AppChat.Enums.SwipeDirection)
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
	-- upvalues: CryoModule (copy), config1 (copy), ReactOtterModule (copy), ReactModule (copy), AppChatGlobalSwipeTracking (copy), Current (ref), config (copy), SwipeDirectionModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config1, p1)
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
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), UnionResult (copy)
		return {
			getActiveInput = function()
				-- upvalues: UseRefResult (upval)
				return UseRefResult.current
			end,
			setOffset = function(Largest)
				-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval), UseRefResult3 (upval), UnionResult (upval)
				UseAnimatedBindingResult2(ReactOtterModule.spring(Largest, config))
				
				if not UseRefResult3.current and UnionResult.swipeCompleteThreshold < Largest then
					UseRefResult3.current = true
					
					if UnionResult.onSwipeThresholdReached then
						UnionResult.onSwipeThresholdReached()
						
						return
					end
				elseif UseRefResult3.current and Largest <= UnionResult.swipeCompleteThreshold then
					UseRefResult3.current = false
				end
			end,
			isPastCompleteThreshold = function()
				-- upvalues: UseRefResult3 (upval)
				return UseRefResult3.current
			end,
			startSwipe = function(Current1, Callback)
				-- upvalues: AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult (upval), UseRefResult2 (upval), UseRefResult1 (upval)
				if AppChatGlobalSwipeTracking then
					Current = Current1
				end
				UseRefResult.current = Current1
				UseRefResult2.current = Vector2.new(Current1.Position.X, Current1.Position.Y)
				UseRefResult1.current = Current1.Changed:Connect(function()
					-- upvalues: Callback (copy)
					Callback()
				end)
			end,
			resetSwipe = function()
				-- upvalues: AppChatGlobalSwipeTracking (upval), Current (upval), UseRefResult (upval), UseRefResult3 (upval), UseRefResult1 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
				if AppChatGlobalSwipeTracking and Current == UseRefResult.current then
					Current = nil
				end
				UseRefResult.current = nil
				UseRefResult3.current = false
				
				if UseRefResult1.current then
					UseRefResult1.current:Disconnect()
					UseRefResult1.current = nil
				end
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
			end,
			disconnectInputListener = function()
				-- upvalues: UseRefResult1 (upval)
				if UseRefResult1.current then
					UseRefResult1.current:Disconnect()
					UseRefResult1.current = nil
				end
			end
		}
	end, { UseAnimatedBindingResult2 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy), UnionResult (copy), UseRefResult2 (copy), SwipeDirectionModule (upval)
		local ActiveInput = UseMemoResult1.getActiveInput()
		
		if not ActiveInput then return end
		if ActiveInput.UserInputState == Enum.UserInputState.End or ActiveInput.UserInputState == Enum.UserInputState.Cancel then
			if UseMemoResult1.isPastCompleteThreshold() then
				UnionResult.onSwipeComplete()
			end
			UseMemoResult1.resetSwipe()
			
			return
		else
			local VectorDelta = Vector2.new(ActiveInput.Position.X, ActiveInput.Position.Y) - UseRefResult2.current
			local X = if UnionResult.direction == SwipeDirectionModule.Right then VectorDelta.X else -VectorDelta.X
			local Magnitude = math.abs(VectorDelta.Y)
			
			if X < UnionResult.swipeStartThreshold or UnionResult.swipeMaxVerticalDrift < Magnitude then
				UseMemoResult1.setOffset(0)
				
				return
			else
				UseMemoResult1.setOffset((math.max(0, X)))
			end
		end
	end, {
		UseMemoResult1,
		UnionResult.swipeCompleteThreshold,
		UnionResult.swipeMaxVerticalDrift,
		UnionResult.direction,
		UseAnimatedBindingResult2
	})
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
	end, {})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), UseMemoResult (copy), UseResult1 (copy)
		return {
			swipeOffset = UseAnimatedBindingResult,
			swipeProgress = UseMemoResult,
			onInputBegan = UseResult1
		}
	end, { UseAnimatedBindingResult, UseMemoResult, UseResult1 })
end