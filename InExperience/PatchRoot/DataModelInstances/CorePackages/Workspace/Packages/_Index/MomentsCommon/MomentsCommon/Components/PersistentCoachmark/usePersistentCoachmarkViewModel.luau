local parent = script.Parent.Parent.Parent
local _ = require(parent.Utils.createCoachmarkImpressionCache)
local reactModule = require(parent.Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local impressionCache = p1.impressionCache
	local onSessionHandled = p1.onSessionHandled
	local autoDismissSeconds = p1.autoDismissSeconds
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), impressionCache (ref)
		if p1.isSessionHandled then
			return false
		end
		local value = impressionCache.getValue()
		
		return value >= 0 and value < p1.maxImpressions
	end, {})
	local var2, var3 = reactModule.useState(var1)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref), impressionCache (ref), onSessionHandled (ref), p1 (ref)
		if var1 and not var4.current then
			var4.current = true
			impressionCache.incrementValue()
			onSessionHandled()
			
			if p1.onImpression ~= nil then
				p1.onImpression()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), autoDismissSeconds (ref), var5 (ref), var3 (ref)
		if var2 and autoDismissSeconds ~= nil then
			var5.current = task.delay(autoDismissSeconds, function()
				-- upvalues: var3 (copy)
				var3(false)
			end)
			
			return function()
				-- upvalues: var5 (copy)
				if var5.current ~= nil then
					task.cancel(var5.current)
					var5.current = nil
				end
			end
		end
	end, { var2, autoDismissSeconds })
	
	return {
		isOpen = var2,
		onClose = reactModule.useCallback(function()
			-- upvalues: impressionCache (ref), p1 (ref), var3 (ref)
			impressionCache.dismissValue()
			
			if p1.onDismissed ~= nil then
				p1.onDismissed()
			end
			var3(false)
		end, {})
	}
end