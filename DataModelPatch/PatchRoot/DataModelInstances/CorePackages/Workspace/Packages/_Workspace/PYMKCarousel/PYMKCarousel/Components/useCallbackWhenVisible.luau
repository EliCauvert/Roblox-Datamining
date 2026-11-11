local Parent = script:FindFirstAncestor("PYMKCarousel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local HomePagePYMKPercentageOfViewPortToStartFetch = game:DefineFastInt("HomePagePYMKPercentageOfViewPortToStartFetch", 25)

local function v3()
	-- upvalues: UseSelectorFunction (copy), ReactModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.TopBar.topBarHeight
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end)
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy), UseSelectorResult2 (copy)
		return {
			min = Vector2.new(0, UseSelectorResult1),
			max = Vector2.new(UseSelectorResult.X, UseSelectorResult.Y - UseSelectorResult2.bottom)
		}
	end, {
		UseSelectorResult1,
		UseSelectorResult,
		UseSelectorResult2
	}))
end

local function _(p1, p2): boolean
	-- upvalues: HomePagePYMKPercentageOfViewPortToStartFetch (copy)
	local Current = p2 and p2.current
	
	if Current then
		local NewY = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y
		local Y = p1.min.Y
		local Y1 = p1.max.Y
		local ScaledY = (Y1 - Y) / 100 * HomePagePYMKPercentageOfViewPortToStartFetch
		
		return Y - ScaledY < Current.AbsolutePosition.Y and NewY < Y1 + ScaledY
	else
		return false
	end
end

return function(p1)
	-- upvalues: UseNavigationFocusFunction (copy), v3 (copy), ReactModule (copy), HomePagePYMKPercentageOfViewPortToStartFetch (copy)
	local ElementRef = p1.elementRef
	local ScrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	local CallbackFunction = p1.callback
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local v1 = v3()
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), ElementRef (copy), HomePagePYMKPercentageOfViewPortToStartFetch (upval), UseNavigationFocusResult (copy), CallbackFunction (copy), ScrollViewPositionChangedSignal (copy)
		local Current = ElementRef and ElementRef.current
		local v2 = nil
		
		if Current then
			local NewY = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y
			local Y = v1.min.Y
			local Y1 = v1.max.Y
			local ScaledY = (Y1 - Y) / 100 * HomePagePYMKPercentageOfViewPortToStartFetch
			v2 = Y - ScaledY < Current.AbsolutePosition.Y and NewY < Y1 + ScaledY
		else
			v2 = false
		end
		if v2 and UseNavigationFocusResult then
			CallbackFunction()
		end
		if ScrollViewPositionChangedSignal then
			ScrollViewPositionChangedSignal:connect(function()
				-- upvalues: v1 (upval), ElementRef (upval), HomePagePYMKPercentageOfViewPortToStartFetch (upval), UseNavigationFocusResult (upval), CallbackFunction (upval)
				local Current = ElementRef and ElementRef.current
				local v3 = nil
				
				if Current then
					local NewY = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y
					local Y = v1.min.Y
					local Y1 = v1.max.Y
					local ScaledY = (Y1 - Y) / 100 * HomePagePYMKPercentageOfViewPortToStartFetch
					v3 = Y - ScaledY < Current.AbsolutePosition.Y and NewY < Y1 + ScaledY
				else
					v3 = false
				end
				if v3 and UseNavigationFocusResult then
					CallbackFunction()
				end
			end)
		end
	end, {
		ElementRef,
		ScrollViewPositionChangedSignal,
		UseNavigationFocusResult,
		v1
	})
end