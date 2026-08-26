local parent = script:FindFirstAncestor("SocialCarousel").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLoadingTimers = require(parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers

return function(p1)
	-- upvalues: useLoadingTimers (ref), reactModule (ref), cryoModule (ref)
	local var1 = useLoadingTimers({})
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), cryoModule (copy), var1 (ref), p1 (ref)
		if var2.current[p2] then
			return
		end
		var2.current = cryoModule.Dictionary.join(var2.current, { [p2] = true })
		p1(p2, var1.getTime("carouselLoadingTime"))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.start("carouselLoadingTime")
	end, {})
	
	return { onSuccessfulRender = var3 }
end