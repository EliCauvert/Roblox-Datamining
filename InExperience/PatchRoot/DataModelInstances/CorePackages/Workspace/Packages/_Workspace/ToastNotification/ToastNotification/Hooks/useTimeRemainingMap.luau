local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local _ = require(parent.type)
local toastNotificationHelperModule = require(parent.utils.toastNotificationHelper)
local getNearestWholeNumber = toastNotificationHelperModule.getNearestWholeNumber
local calculateTimeRemaining = toastNotificationHelperModule.calculateTimeRemaining
local luauPolyfill = dependenciesModule.LuauPolyfill
local react = dependenciesModule.React
local clearInterval = luauPolyfill.clearInterval
local setInterval = luauPolyfill.setInterval

return function(value, p0) --[[ line: 26 | named "useTimeRemainingMap" ]]
	-- upvalues: react (ref), getNearestWholeNumber (ref), calculateTimeRemaining (ref), setInterval (ref), clearInterval (ref)
	local _, var2 = react.useState(0)
	local t = {}
	local var4 = true
	
	for i, v in pairs(value) do
		local var5 = getNearestWholeNumber(calculateTimeRemaining(v, p0.notificationReceivedTimestampMs, p0.displayTimestampMs) / 1000)
		
		if var5 > 0 then
			var4 = false
		end
		t[i] = math.max(0, var5)
	end
	react.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var4 (write), setInterval (copy), var2 (ref), clearInterval (copy)
		local var6 = if not var4 then setInterval(function() --[[ line: 46 ]]
			-- upvalues: var2 (copy)
			var2(os.clock())
		end, 100) else nil
		
		return function() --[[ line: 51 ]]
			-- upvalues: var6 (write), clearInterval (copy)
			if var6 then
				clearInterval(var6)
			end
		end
	end, { var4, var2 })
	
	return t
end