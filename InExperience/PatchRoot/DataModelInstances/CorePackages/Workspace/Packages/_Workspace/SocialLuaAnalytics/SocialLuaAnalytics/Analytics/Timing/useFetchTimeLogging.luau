local reactModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React)
local useLoadingTimersModule = require(script.Parent.useLoadingTimers)

return function(p1)
	-- upvalues: useLoadingTimersModule (ref), reactModule (ref)
	local var1 = useLoadingTimersModule({})
	local var2 = reactModule.useRef("")
	local loading = p1.loading
	local error = p1.error
	reactModule.useEffect(function()
		-- upvalues: loading (ref), var2 (ref), var1 (ref), p1 (ref), error (ref)
		if loading then
			var2.current = var1.start(p1.timerKey)
		end
		if not loading and var2.current == p1.timerKey then
			local var3 = var1.stop(p1.timerKey)
			var2.current = ""
			
			if error then
				p1.onError(var3, p1.timerKey)
				
				return
			end
			p1.onSuccess(var3, p1.timerKey)
		end
	end, { p1.timerKey, loading, error })
end