local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useRefCache = require(parent.ReactUtils).useRefCache
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local dotModule = require(script.Parent.Dot)
local getCarouselIndicatorDotsConfigModule = require(script.Parent.getCarouselIndicatorDotsConfig)

local function getDotCenter(vectorA, vectorB, p1)
	local var1 = math.max(#vectorA - 1, 0) * p1
	local var2 = 0
	
	for i, v in vectorA do
		var1 += v.size
		
		if i < vectorB then
			var2 += v.size + p1
		elseif i == vectorB then
			var2 += v.size / 2
		end
	end
	return var2 - var1 / 2
end

local t = {
	page = 1,
	count = 5,
	testId = "--foundation-carousel-indicator"
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getCarouselIndicatorDotsConfigModule (ref), reactOtterModule (ref), useRefCache (ref), getDotCenter (ref), dotModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var3 = withDefaultsModule(p2, t)
	local var4 = useTokensModule()
	local count = var3.count
	local size100 = var4.Size.Size_100
	local size200 = var4.Size.Size_200
	local size100_1 = var4.Size.Size_100
	local minValue = math.min(5, count)
	local var5 = minValue * size200 + (minValue - 1) * size100
	local var6 = reactModule.useMemo(function()
		-- upvalues: getCarouselIndicatorDotsConfigModule (copy), size200 (ref), size100_1 (ref), var3 (ref), count (ref)
		return getCarouselIndicatorDotsConfigModule(size200, size100_1, var3.page, count)
	end, { size200, size100_1, var3.page, count })
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactOtterModule.useAnimatedBinding(0)
	local var10 = useRefCache()
	local var11 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return {
			easingStyle = var4.Ease.StandardOut,
			duration = var4.Time.Time_200
		}
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var6 (ref), getDotCenter (copy), size100 (ref), var9 (ref), reactOtterModule (copy), var11 (ref), var8 (ref)
		local current = var7.current
		var7.current = var6
		
		if current and current.count == var6.count and current.page ~= var6.page then
			var9(reactOtterModule.ease(0, {
				easingStyle = var11.easingStyle,
				duration = var11.duration,
				startingValue = var8:getValue() + (getDotCenter(current.dots, math.clamp(current.activeVisibleIndex + (var6.page - current.page), 1, #current.dots), size100) - getDotCenter(var6.dots, var6.activeVisibleIndex, size100))
			}))
			
			return
		end
		var9(reactOtterModule.instant(0))
	end, { var6, size100, var11 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return {
			easingStyle = var4.Ease.Linear,
			duration = var4.Time.Time_100
		}
	end, { var4 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return {
			easingStyle = var4.Ease.StandardOut,
			duration = var4.Time.Time_300
		}
	end, { var4 })
	reactModule.useImperativeHandle(p3, function()
		-- upvalues: var3 (ref), var6 (ref), var10 (ref)
		if not var3.onActivated then
			return nil
		end
		local page = nil
		
		for i, v in var6.dots do
			if not v.isActive then
				page = v.page
				break
			end
		end
		return if page then var10[page].current else nil
	end, { var10, var6.dots, var3.onActivated })
	local t_1 = {}
	
	for i, v in var6.dots do
		local var14 = var6.dots[i - 1]
		local var15 = var6.dots[i + 1]
		local var16 = if var14 and var14.isActive then var6.dots[i - 2] else var14
		local var17 = if var15 and var15.isActive then var6.dots[i + 2] else var15
		t_1[`Page{v.page}`] = reactModule.createElement(dotModule, {
			LayoutOrder = i,
			scale = v.size / size200,
			isActive = v.isActive,
			maxSize = size200,
			page = v.page,
			scaleEaseConfig = var13,
			colorEaseConfig = var12,
			onActivated = if v.isActive then nil else var3.onActivated,
			Selectable = not v.isActive and var3.onActivated ~= nil,
			NextSelectionUp = var3.NextSelectionUp,
			NextSelectionDown = var3.NextSelectionDown,
			NextSelectionLeft = if var16 == nil then var3.NextSelectionLeft else var10[var16.page],
			NextSelectionRight = if var17 == nil then var3.NextSelectionRight else var10[var17.page],
			ref = var10[v.page],
			testId = `{var3.testId}--page-{v.page}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var3, { tag = "auto-xy" }), {
		Dots = reactModule.createElement(viewModule, {
			tag = "auto-y",
			Size = UDim2.fromOffset(var5, 0),
			layout = reactModule.useMemo(function()
				-- upvalues: size100 (ref)
				return {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, size100),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}
			end, { size100 }),
			Position = var8:map(function(p4)
				return UDim2.fromOffset(p4, 0)
			end),
			testId = `{var3.testId}--dots`
		}, t_1)
	})
end))