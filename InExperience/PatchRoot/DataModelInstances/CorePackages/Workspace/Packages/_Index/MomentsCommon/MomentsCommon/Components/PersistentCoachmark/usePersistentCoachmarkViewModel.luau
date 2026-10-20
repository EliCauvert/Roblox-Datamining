local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Utils.createCoachmarkImpressionCache)
local ReactModule = require(Parent.Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local ImpressionCache = p1.impressionCache
	local OnSessionHandledFunction = p1.onSessionHandled
	local AutoDismissSeconds = p1.autoDismissSeconds
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), ImpressionCache (copy)
		if p1.isSessionHandled then
			return false
		else
			local Value: number = ImpressionCache.getValue()
			
			return Value >= 0 and Value < p1.maxImpressions
		end
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseMemoResult)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), ImpressionCache (copy), OnSessionHandledFunction (copy), p1 (copy)
		if UseMemoResult and not UseRefResult.current then
			UseRefResult.current = true
			ImpressionCache.incrementValue()
			OnSessionHandledFunction()
			
			if p1.onImpression ~= nil then
				p1.onImpression()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), AutoDismissSeconds (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult or AutoDismissSeconds == nil then return end
		UseRefResult1.current = task.delay(AutoDismissSeconds, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current ~= nil then
				task.cancel(UseRefResult1.current)
				UseRefResult1.current = nil
			end
		end
	end, { UseStateResult, AutoDismissSeconds })
	
	return {
		isOpen = UseStateResult,
		onClose = ReactModule.useCallback(function()
			-- upvalues: ImpressionCache (copy), p1 (copy), UseStateResult2 (copy)
			ImpressionCache.dismissValue()
			
			if p1.onDismissed ~= nil then
				p1.onDismissed()
			end
			UseStateResult2(false)
		end, {})
	}
end