local reactModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React)
local useLoadingTimersModule = require(script.Parent.useLoadingTimers)

return function(p0) --[[ line: 26 | named "useFetchTimeLogging" ]]
	-- upvalues: useLoadingTimersModule (ref), reactModule (ref)
	local var2 = useLoadingTimersModule({})
	local var3 = reactModule.useRef("")
	local loading = p0.loading
	local error = p0.error
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: loading (ref), var3 (ref), var2 (ref), p0 (ref), error (ref)
		if loading then
			var3.current = var2.start(p0.timerKey)
		end
		if not loading and var3.current == p0.timerKey then
			local var4 = var2.stop(p0.timerKey)
			var3.current = ""
			
			if error then
				p0.onError(var4, p0.timerKey)
				
				return
			end
			p0.onSuccess(var4, p0.timerKey)
		end
	end, { p0.timerKey, loading, error })
end