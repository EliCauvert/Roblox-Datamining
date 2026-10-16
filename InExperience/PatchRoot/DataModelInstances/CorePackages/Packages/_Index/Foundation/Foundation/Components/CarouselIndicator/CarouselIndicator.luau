local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseRefCacheFunction = require(Parent.ReactUtils).useRefCache
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local DotModule = require(script.Parent.Dot)
local GetCarouselIndicatorDotsConfigModule = require(script.Parent.getCarouselIndicatorDotsConfig)

local function getDotCenter(Dots, ActiveVisibleIndex, Size): number --[[ Line: 26 ]]
	local ScaledLargest = math.max(#Dots - 1, 0) * Size
	local NewSize = 0
	
	for i, dot in Dots do
		ScaledLargest += dot.size
		
		if i < ActiveVisibleIndex then
			NewSize += dot.size + Size
		elseif i == ActiveVisibleIndex then
			NewSize += dot.size / 2
		end
	end
	return NewSize - ScaledLargest / 2
end

local config = {
	page = 1,
	count = 5,
	testId = "--foundation-carousel-indicator"
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 51 | Named "CarouselIndicator" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), GetCarouselIndicatorDotsConfigModule (copy), ReactOtterModule (copy), UseRefCacheFunction (copy), getDotCenter (copy), DotModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Count: number = WithDefaultsModuleResult.count
	local Size100 = UseTokensModuleResult.Size.Size_100
	local Size200 = UseTokensModuleResult.Size.Size_200
	local Size100_1 = UseTokensModuleResult.Size.Size_100
	local Smallest = math.min(5, Count)
	local XOffset = Smallest * Size200 + (Smallest - 1) * Size100
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: GetCarouselIndicatorDotsConfigModule (upval), Size200 (copy), Size100_1 (copy), WithDefaultsModuleResult (copy), Count (copy)
		return GetCarouselIndicatorDotsConfigModule(Size200, Size100_1, WithDefaultsModuleResult.page, Count)
	end, { Size200, Size100_1, WithDefaultsModuleResult.page, Count })
	local UseRefResult = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseRefCacheResult = UseRefCacheFunction()
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_200
		}
	end, { UseTokensModuleResult })
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: UseRefResult (copy), UseMemoResult (copy), getDotCenter (upval), Size100 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult1 (copy), UseAnimatedBindingResult (copy)
		local Current = UseRefResult.current
		UseRefResult.current = UseMemoResult
		
		if Current and Current.count == UseMemoResult.count and Current.page ~= UseMemoResult.page then
			UseAnimatedBindingResult2(ReactOtterModule.ease(0, {
				easingStyle = UseMemoResult1.easingStyle,
				duration = UseMemoResult1.duration,
				startingValue = UseAnimatedBindingResult:getValue() + (getDotCenter(Current.dots, math.clamp(Current.activeVisibleIndex + (UseMemoResult.page - Current.page), 1, #Current.dots), Size100) - getDotCenter(UseMemoResult.dots, UseMemoResult.activeVisibleIndex, Size100))
			}))
			
			return
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
		end
	end, { UseMemoResult, Size100, UseMemoResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 99 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.Linear,
			duration = UseTokensModuleResult.Time.Time_100
		}
	end, { UseTokensModuleResult })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 106 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_300
		}
	end, { UseTokensModuleResult })
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 113 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UseMemoResult (copy), UseRefCacheResult (copy)
		if not WithDefaultsModuleResult.onActivated then
			return nil
		end
		local Page = nil
		
		for _, dot in UseMemoResult.dots do
			if not dot.isActive then
				Page = dot.page
				break
			end
		end
		return if Page then UseRefCacheResult[Page].current else nil
	end, {
		UseRefCacheResult,
		UseMemoResult.dots,
		WithDefaultsModuleResult.onActivated
	})
	local Elements = {}
	
	for LayoutOrder, dot in UseMemoResult.dots do
		local Dot = UseMemoResult.dots[LayoutOrder - 1]
		local Dot1 = UseMemoResult.dots[LayoutOrder + 1]
		local Dot2 = if Dot and Dot.isActive then UseMemoResult.dots[LayoutOrder - 2] else Dot
		local Dot3 = if Dot1 and Dot1.isActive then UseMemoResult.dots[LayoutOrder + 2] else Dot1
		Elements[`Page{dot.page}`] = ReactModule.createElement(DotModule, {
			LayoutOrder = LayoutOrder,
			scale = dot.size / Size200,
			isActive = dot.isActive,
			maxSize = Size200,
			page = dot.page,
			scaleEaseConfig = UseMemoResult3,
			colorEaseConfig = UseMemoResult2,
			onActivated = if dot.isActive then nil else WithDefaultsModuleResult.onActivated,
			Selectable = not dot.isActive and WithDefaultsModuleResult.onActivated ~= nil,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = if Dot2 == nil then WithDefaultsModuleResult.NextSelectionLeft else UseRefCacheResult[Dot2.page],
			NextSelectionRight = if Dot3 == nil then WithDefaultsModuleResult.NextSelectionRight else UseRefCacheResult[Dot3.page],
			ref = UseRefCacheResult[dot.page],
			testId = `{WithDefaultsModuleResult.testId}--page-{dot.page}`
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy" }), {
		Dots = ReactModule.createElement(ViewModule, {
			tag = "auto-y",
			Size = UDim2.fromOffset(XOffset, 0),
			layout = ReactModule.useMemo(function() --[[ Line: 162 ]]
				-- upvalues: Size100 (copy)
				return {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, Size100),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}
			end, { Size100 }),
			Position = UseAnimatedBindingResult:map(function(XOffset): UDim2 --[[ Line: 182 ]]
				return UDim2.fromOffset(XOffset, 0)
			end),
			testId = `{WithDefaultsModuleResult.testId}--dots`
		}, Elements)
	})
end))