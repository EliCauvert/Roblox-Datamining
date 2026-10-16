local ReactModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React)
local UseLoadingTimersModule = require(script.Parent.useLoadingTimers)

return function(p1) --[[ Line: 26 | Named "useFetchTimeLogging" ]]
	-- upvalues: UseLoadingTimersModule (copy), ReactModule (copy)
	local UseLoadingTimersModuleResult = UseLoadingTimersModule({})
	local UseRefResult = ReactModule.useRef("")
	local Loading = p1.loading
	local Error = p1.error
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: Loading (copy), UseRefResult (copy), UseLoadingTimersModuleResult (copy), p1 (copy), Error (copy)
		if Loading then
			UseRefResult.current = UseLoadingTimersModuleResult.start(p1.timerKey)
		end
		if not Loading and UseRefResult.current == p1.timerKey then
			local StopResult = UseLoadingTimersModuleResult.stop(p1.timerKey)
			UseRefResult.current = ""
			
			if Error then
				p1.onError(StopResult, p1.timerKey)
				
				return
			end
			p1.onSuccess(StopResult, p1.timerKey)
		end
	end, { p1.timerKey, Loading, Error })
end