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

return function(value, p1)
	-- upvalues: react (ref), getNearestWholeNumber (ref), calculateTimeRemaining (ref), setInterval (ref), clearInterval (ref)
	local _, var1 = react.useState(0)
	local t = {}
	local var2 = true
	
	for i, v in pairs(value) do
		local var3 = getNearestWholeNumber(calculateTimeRemaining(v, p1.notificationReceivedTimestampMs, p1.displayTimestampMs) / 1000)
		
		if var3 > 0 then
			var2 = false
		end
		t[i] = math.max(0, var3)
	end
	react.useEffect(function()
		-- upvalues: var2 (write), setInterval (copy), var1 (ref), clearInterval (copy)
		local var4 = if not var2 then setInterval(function()
			-- upvalues: var1 (copy)
			var1(os.clock())
		end, 100) else nil
		
		return function()
			-- upvalues: var4 (write), clearInterval (copy)
			if var4 then
				clearInterval(var4)
			end
		end
	end, { var2, var1 })
	
	return t
end