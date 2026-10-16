local parent = script:FindFirstAncestor("PYMKCarousel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local homePagePYMKPercentageOfViewPortToStartFetch = game:DefineFastInt("HomePagePYMKPercentageOfViewPortToStartFetch", 25)

local var1 = function()
	-- upvalues: useSelector (ref), reactModule (ref)
	local var2 = useSelector(function(p1)
		return p1.ScreenSize
	end)
	local var3 = useSelector(function(p1)
		return p1.TopBar.topBarHeight
	end)
	local var4 = useSelector(function(p1)
		return p1.GlobalGuiInset
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref), var4 (ref)
		return {
			min = Vector2.new(0, var3),
			max = Vector2.new(var2.X, var2.Y - var4.bottom)
		}
	end, { var3, var2, var4 })
end

local _ = function(p1, p2)
	-- upvalues: homePagePYMKPercentageOfViewPortToStartFetch (ref)
	local current = p2 and p2.current
	
	if current then
		local y = current.AbsolutePosition.Y
		local var2 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
		local y_1 = p1.min.Y
		local y_2 = p1.max.Y
		local var3 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
		
		return y_1 - var3 < y and var2 < y_2 + var3
	end
	return false
end

return function(p1)
	-- upvalues: useNavigationFocus (ref), var1 (ref), reactModule (ref), homePagePYMKPercentageOfViewPortToStartFetch (ref)
	local elementRef = p1.elementRef
	local scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	local callback = p1.callback
	local var2 = useNavigationFocus()
	local var3 = var1()
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), elementRef (ref), homePagePYMKPercentageOfViewPortToStartFetch (copy), var2 (ref), callback (ref), scrollViewPositionChangedSignal (ref)
		local var4
		local var5 = elementRef
		local current = var5 and var5.current
		
		if current then
			local y = current.AbsolutePosition.Y
			local var6 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
			local y_1 = var3.min.Y
			local y_2 = var3.max.Y
			local var7 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
			var4 = y_1 - var7 < y and var6 < y_2 + var7
		else
			var4 = false
		end
		if var4 and var2 then
			callback()
		end
		if scrollViewPositionChangedSignal then
			scrollViewPositionChangedSignal:connect(function()
				-- upvalues: var3 (copy), elementRef (copy), homePagePYMKPercentageOfViewPortToStartFetch (copy), var2 (copy), callback (copy)
				local var8
				local current = elementRef and elementRef.current
				
				if current then
					local y = current.AbsolutePosition.Y
					local var9 = current.AbsolutePosition.Y + current.AbsoluteSize.Y
					local y_1 = var3.min.Y
					local y_2 = var3.max.Y
					local var10 = (y_2 - y_1) / 100 * homePagePYMKPercentageOfViewPortToStartFetch
					var8 = y_1 - var10 < y and var9 < y_2 + var10
				else
					var8 = false
				end
				if var8 and var2 then
					callback()
				end
			end)
		end
	end, { elementRef, scrollViewPositionChangedSignal, var2, var3 })
end