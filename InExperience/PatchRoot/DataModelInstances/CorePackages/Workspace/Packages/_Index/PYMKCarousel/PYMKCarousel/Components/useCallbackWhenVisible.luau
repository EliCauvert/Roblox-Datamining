local parent = script:FindFirstAncestor("PYMKCarousel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local fFlagEnableOnScreenAPIIntegration = require(parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local var1 = if fFlagEnableOnScreenAPIIntegration then require(parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local homePagePYMKPercentageOfViewPortToStartFetch = game:DefineFastInt("HomePagePYMKPercentageOfViewPortToStartFetch", 25)

local var2 = function()
	-- upvalues: useSelector (ref), reactModule (ref)
	local var3 = useSelector(function(p1)
		return p1.ScreenSize
	end)
	local var4 = useSelector(function(p1)
		return p1.TopBar.topBarHeight
	end)
	local var5 = useSelector(function(p1)
		return p1.GlobalGuiInset
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), var3 (ref), var5 (ref)
		return {
			min = Vector2.new(0, var4),
			max = Vector2.new(var3.X, var3.Y - var5.bottom)
		}
	end, { var4, var3, var5 })
end

local _ = function(p1, p2)
	-- upvalues: homePagePYMKPercentageOfViewPortToStartFetch (ref)
	local current = p2 and p2.current
	
	if current then
		local y = current.AbsolutePosition.Y
		local var3 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
		local y_1 = p1.min.Y
		local y_2 = p1.max.Y
		local var4 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
		
		return y_1 - var4 < y and var3 < y_2 + var4
	end
	return false
end

return function(p1)
	-- upvalues: fFlagEnableOnScreenAPIIntegration (ref), var1 (ref), useNavigationFocus (ref), var2 (ref), reactModule (ref), homePagePYMKPercentageOfViewPortToStartFetch (ref)
	local elementRef = p1.elementRef
	local scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	local callback = p1.callback
	local var3 = if fFlagEnableOnScreenAPIIntegration then var1() else useNavigationFocus()
	local var4 = var2()
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), elementRef (ref), homePagePYMKPercentageOfViewPortToStartFetch (copy), var3 (ref), callback (ref), scrollViewPositionChangedSignal (ref)
		local var5
		local var6 = elementRef
		local current = var6 and var6.current
		
		if current then
			local y = current.AbsolutePosition.Y
			local var7 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
			local y_1 = var4.min.Y
			local y_2 = var4.max.Y
			local var8 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
			var5 = y_1 - var8 < y and var7 < y_2 + var8
		else
			var5 = false
		end
		if var5 and var3 then
			callback()
		end
		if scrollViewPositionChangedSignal then
			scrollViewPositionChangedSignal:connect(function()
				-- upvalues: var4 (copy), elementRef (copy), homePagePYMKPercentageOfViewPortToStartFetch (copy), var3 (copy), callback (copy)
				local var9
				local current = elementRef and elementRef.current
				
				if current then
					local y = current.AbsolutePosition.Y
					local var10 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
					local y_1 = var4.min.Y
					local y_2 = var4.max.Y
					local var11 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
					var9 = y_1 - var11 < y and var10 < y_2 + var11
				else
					var9 = false
				end
				if var9 and var3 then
					callback()
				end
			end)
		end
	end, {
		elementRef,
		scrollViewPositionChangedSignal,
		var3,
		var4
	})
end