local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseLoadingTimersFunction = require(Parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers

return function(Callback)
	-- upvalues: UseLoadingTimersFunction (copy), ReactModule (copy), CryoModule (copy)
	local UseLoadingTimersResult = UseLoadingTimersFunction({})
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), CryoModule (upval), UseLoadingTimersResult (copy), Callback (copy)
		if not UseRefResult.current[p1] then
			UseRefResult.current = CryoModule.Dictionary.join(UseRefResult.current, { [p1] = true })
			Callback(p1, (UseLoadingTimersResult.getTime("carouselLoadingTime")))
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseLoadingTimersResult (copy)
		UseLoadingTimersResult.start("carouselLoadingTime")
	end, {})
	
	return { onSuccessfulRender = UseResult }
end