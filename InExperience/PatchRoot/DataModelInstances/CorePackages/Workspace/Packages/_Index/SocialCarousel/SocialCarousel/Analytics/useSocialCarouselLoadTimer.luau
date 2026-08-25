local parent = script:FindFirstAncestor("SocialCarousel").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLoadingTimers = require(parent.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers

return function(p0)
	-- upvalues: useLoadingTimers (ref), reactModule (ref), cryoModule (ref)
	local var2 = useLoadingTimers({})
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), cryoModule (copy), var2 (ref), p0 (ref)
		if var3.current[p1] then
			return
		end
		var3.current = cryoModule.Dictionary.join(var3.current, { [p1] = true })
		p0(p1, var2.getTime("carouselLoadingTime"))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2.start("carouselLoadingTime")
	end, {})
	
	return { onSuccessfulRender = var4 }
end