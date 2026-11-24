local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UserGameSettings = UserSettings():GetService("UserGameSettings")

return function(Frame)
	-- upvalues: FoundationModule (copy), UserGameSettings (copy), ReactModule (copy), MotionModule (copy), View (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsOpen = Frame.isOpen
	local IsIsHeldOpen = Frame.isHeldOpen == true
	local IsOpen1 = IsOpen or IsIsHeldOpen
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion or UserGameSettings.ReducedMotion
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ isAnimating = false, isMounted = IsOpen1 })
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ progress = if IsOpen1 then 1 else 0 })
	local UseRefResult = ReactModule.useRef(IsOpen1)
	local UseRefResult1 = ReactModule.useRef(IsOpen)
	local UseRefResult2 = ReactModule.useRef(IsIsHeldOpen)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy), MotionModule (upval), ReducedMotion (copy)
		local StandardOut = UseTokensResult.Ease.StandardOut
		local TransitionResult = MotionModule.transition({
			duration = if ReducedMotion then 0 else UseTokensResult.Time.Time_200,
			easingStyle = StandardOut
		})
		local TransitionResult1 = MotionModule.transition({ duration = 0, easingStyle = StandardOut })
		
		return {
			open = MotionModule.createState({ progress = 1 }, { default = TransitionResult }),
			closed = MotionModule.createState({ progress = 0 }, { default = TransitionResult }),
			openAtOnce = MotionModule.createState({ progress = 1 }, { default = TransitionResult1 }),
			closedAtOnce = MotionModule.createState({ progress = 0 }, { default = TransitionResult1 })
		}
	end, { ReducedMotion, UseTokensResult })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult3 (copy)
		return function()
			-- upvalues: UseRefResult3 (upval)
			UseRefResult3.current += 1
		end
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), IsOpen (copy), UseRefResult2 (copy), IsIsHeldOpen (copy), UseRefResult (copy), IsOpen1 (copy), UseRefResult3 (copy), UseStateResult2 (copy), UseMotionResult2 (copy), UseMemoResult (copy), ReducedMotion (copy)
		local IsNotCurrentMatch = UseRefResult1.current ~= IsOpen
		local IsNotCurrentMatch1 = UseRefResult2.current ~= IsIsHeldOpen
		UseRefResult1.current = IsOpen
		UseRefResult2.current = IsIsHeldOpen
		
		if UseRefResult.current ~= IsOpen1 then
			UseRefResult.current = IsOpen1
			UseRefResult3.current += 1
			local Current = UseRefResult3.current
			
			if ReducedMotion or not IsNotCurrentMatch or IsNotCurrentMatch1 then
				UseStateResult2({ isAnimating = false, isMounted = IsOpen1 })
				UseMotionResult2(if IsOpen1 then UseMemoResult.openAtOnce else UseMemoResult.closedAtOnce)
				
				return
			else
				local Open = if IsOpen1 then UseMemoResult.open else UseMemoResult.closed
				UseStateResult2({ isMounted = true, isAnimating = true })
				UseMotionResult2(Open, {
					onAnimationComplete = function(Enabled)
						-- upvalues: UseRefResult3 (upval), Current (copy), UseStateResult2 (upval), IsOpen1 (upval)
						if Enabled == true and UseRefResult3.current == Current then
							UseStateResult2({ isAnimating = false, isMounted = IsOpen1 })
						end
					end
				})
				
				return
			end
		elseif IsOpen1 and not IsOpen and (IsNotCurrentMatch or IsNotCurrentMatch1) then
			UseRefResult3.current += 1
			UseStateResult2(function(p1)
				return if p1.isAnimating then { isMounted = true, isAnimating = false } else p1
			end)
			UseMotionResult2(UseMemoResult.openAtOnce)
		end
	end, {
		IsOpen1, IsOpen, IsIsHeldOpen, ReducedMotion, UseMemoResult, UseMotionResult2
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseMotionResult (copy), UseBindingResult (copy)
		return ReactModule.joinBindings({ UseMotionResult.progress, UseBindingResult }):map(function(Entry): UDim2
			return UDim2.new(1, 0, 0, (math.round(Entry[1] * Entry[2])))
		end)
	end, { UseMotionResult.progress, UseBindingResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, { UseBindingResult2 })
	
	if UseStateResult.isMounted then
		local IsAnimating = UseStateResult.isAnimating
		
		return ReactModule.createElement(View, {
			tag = "col",
			LayoutOrder = Frame.LayoutOrder,
			Size = if IsAnimating then UseMemoResult1 else UDim2.fromScale(1, 0),
			AutomaticSize = if IsAnimating then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
			ClipsDescendants = IsAnimating,
			testId = Frame.testId or "HeightReveal"
		}, {
			Content = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				onAbsoluteSizeChanged = UseResult
			}, Frame.children)
		})
	else
		return nil
	end
end