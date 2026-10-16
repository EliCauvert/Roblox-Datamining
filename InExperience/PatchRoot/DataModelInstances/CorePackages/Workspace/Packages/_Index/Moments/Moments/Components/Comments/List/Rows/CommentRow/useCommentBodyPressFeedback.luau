local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagMomentsCommentRowRedesignModule = require(Moments.Flags.FFlagMomentsCommentRowRedesign)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local ControlState = FoundationModule.Enums.ControlState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local config1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function _(Hover): boolean --[[ Line: 32 | Named "isFadingState" ]]
	-- upvalues: ControlState (copy)
	return Hover == ControlState.Hover or Hover == ControlState.Pressed
end

return function(p1, Current) --[[ Line: 37 | Named "useCommentBodyPressFeedback" ]]
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), ControlState (copy), config (copy), config1 (copy), FFlagMomentsCommentRowRedesignModule (copy), GetColorStyleWithTransparencyModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseRefResult = ReactModule.useRef(ControlState.Default)
	local UseRefResult1 = ReactModule.useRef(Current)
	ReactModule.useLayoutEffect(function() --[[ Line: 43 ]]
		-- upvalues: UseRefResult1 (copy), Current (copy), UseRefResult (copy), ControlState (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		UseRefResult1.current = Current
		local IsHoverMatch: boolean = Current
		
		if IsHoverMatch then
			local Current1 = UseRefResult.current
			IsHoverMatch = Current1 == ControlState.Hover or Current1 == ControlState.Pressed
		end
		UseAnimatedBindingResult2((ReactOtterModule.instant(if IsHoverMatch then 1 else 0)))
	end, { p1, Current })
	local Default = if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Color.Content.Default else UseTokensResult.Color.Content.Emphasis
	
	return {
		onStateChanged = ReactModule.useCallback(function(Current) --[[ Line: 50 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ControlState (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), config1 (upval)
			UseRefResult.current = Current
			
			if UseRefResult1.current then
				local IsCurrentMatch: boolean = Current == ControlState.Hover or Current == ControlState.Pressed
				UseAnimatedBindingResult2(ReactOtterModule.ease(if IsCurrentMatch then 1 else 0, if IsCurrentMatch then config else config1))
			end
		end, { UseAnimatedBindingResult2 }),
		textStyle = ReactModule.useMemo(function() --[[ Line: 61 ]]
			-- upvalues: UseAnimatedBindingResult (copy), GetColorStyleWithTransparencyModule (upval), Default (copy)
			return UseAnimatedBindingResult:map(function(p2: number) --[[ Line: 62 ]]
				-- upvalues: GetColorStyleWithTransparencyModule (upval), Default (upval)
				return GetColorStyleWithTransparencyModule(Default, p2 * 0.4)
			end)
		end, { UseAnimatedBindingResult, Default })
	}
end