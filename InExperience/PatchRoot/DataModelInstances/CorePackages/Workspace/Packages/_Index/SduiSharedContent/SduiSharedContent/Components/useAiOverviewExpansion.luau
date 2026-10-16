local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local config = { dampingRatio = 0.9, frequency = 6 }

return function(p1) --[[ Line: 32 | Named "useAiOverviewExpansion" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), config (copy)
	local SectionGap = if p1.hasHeader and p1.hasExpandableBody then p1.sectionGap else 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 40 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 43 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsoluteSize.Y)
	end, {})
	local CompactHeight: number = p1.compactHeight
	local IsCompactHeightAbove: boolean = CompactHeight ~= nil and CompactHeight > 0
	local CompactHeight1: number = if IsCompactHeightAbove then CompactHeight else 0
	local UseStateResult3_1 = UseStateResult3 or 0
	local NewSectionGap = if p1.hasHeader then (UseStateResult4 or 0) + SectionGap else 0
	local NewButtonHeight = p1.buttonHeight + p1.sectionGap
	local NoIsCompactHeightAbove: boolean = not IsCompactHeightAbove or (not p1.hasHeader or UseStateResult4 ~= nil)
	local NoIsCompactHeightAbove1: boolean = not IsCompactHeightAbove or (not p1.hasExpandableBody or UseStateResult3 ~= nil)
	local Largest: number = if IsCompactHeightAbove then math.max(0, CompactHeight1 - NewSectionGap - NewButtonHeight) else 0
	local IsLargestBelow: boolean = IsCompactHeightAbove and (NoIsCompactHeightAbove and (NoIsCompactHeightAbove1 and (Largest > 0 and Largest + 1 < UseStateResult3_1)))
	local Inverted: boolean = IsCompactHeightAbove and (p1.hasExpandableBody and (not UseStateResult and not (NoIsCompactHeightAbove and NoIsCompactHeightAbove1)))
	local NoUseStateResult: boolean = IsLargestBelow and not UseStateResult
	local NoUseStateResult1: boolean = IsLargestBelow and (UseStateResult and not UseStateResult1)
	local Inverted1: boolean = Inverted or (NoUseStateResult or NoUseStateResult1)
	local Inverted2: boolean = Inverted or NoUseStateResult
	local ReducedMotion = p1.reducedMotion
	local UseStateResult5 = if UseStateResult then UseStateResult3_1 elseif Inverted1 then Largest else 0
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(UseStateResult5, (ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseRefResult.current = false
			UseStateResult2_1(true)
		end
	end, {})))
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 88 ]]
		-- upvalues: UseStateResult2 (copy), IsLargestBelow (copy), ReducedMotion (copy), UseRefResult (copy), UseStateResult2_1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult3_1 (copy), config (upval)
		UseStateResult2(true)
		
		if not IsLargestBelow then return end
		if ReducedMotion then
			UseRefResult.current = false
			UseStateResult2_1(true)
			UseAnimatedBindingResult2((ReactOtterModule.instant(UseStateResult3_1)))
			
			return
		else
			UseRefResult.current = true
			UseStateResult2_1(false)
			UseAnimatedBindingResult2((ReactOtterModule.spring(UseStateResult3_1, config)))
		end
	end, {
		UseStateResult3_1,
		IsLargestBelow,
		ReducedMotion,
		UseAnimatedBindingResult2
	})
	ReactModule.useLayoutEffect(function() --[[ Line: 110 ]]
		-- upvalues: NoUseStateResult1 (copy), UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult5 (copy)
		if not NoUseStateResult1 then
			UseRefResult.current = false
			UseAnimatedBindingResult2((ReactOtterModule.instant(UseStateResult5)))
			
			return
		end
	end, {
		UseStateResult5,
		NoUseStateResult1,
		UseAnimatedBindingResult2
	})
	
	return {
		isCompact = NoUseStateResult,
		shouldReserveCompactHeight = Inverted2,
		useCompactViewport = Inverted1,
		animatedViewportHeight = UseAnimatedBindingResult,
		onExpand = UseResult2,
		onHeaderAbsoluteSizeChanged = UseResult,
		onContentAbsoluteSizeChanged = UseResult1
	}
end