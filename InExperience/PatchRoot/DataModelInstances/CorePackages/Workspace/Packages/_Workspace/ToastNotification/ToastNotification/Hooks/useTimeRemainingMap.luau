local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local _ = require(Parent.type)
local ToastNotificationHelperModule = require(Parent.utils.toastNotificationHelper)
local GetNearestWholeNumberFunction = ToastNotificationHelperModule.getNearestWholeNumber
local CalculateTimeRemainingFunction = ToastNotificationHelperModule.calculateTimeRemaining
local LuauPolyfill = DependenciesModule.LuauPolyfill
local React = DependenciesModule.React
local ClearIntervalFunction = LuauPolyfill.clearInterval
local SetIntervalFunction = LuauPolyfill.setInterval

return function(List, p1) --[[ Line: 26 | Named "useTimeRemainingMap" ]]
	-- upvalues: React (copy), GetNearestWholeNumberFunction (copy), CalculateTimeRemainingFunction (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy)
	local _, UseStateResult2 = React.useState(0)
	local Largests = {}
	local Flag = true
	
	for i, value in pairs(List) do
		local NearestWholeNumber: number = GetNearestWholeNumberFunction(CalculateTimeRemainingFunction(value, p1.notificationReceivedTimestampMs, p1.displayTimestampMs) / 1000)
		
		if NearestWholeNumber > 0 then
			Flag = false
		end
		Largests[i] = math.max(0, NearestWholeNumber)
	end
	React.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: Flag (ref), SetIntervalFunction (upval), UseStateResult2 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = if Flag then nil else SetIntervalFunction(function() --[[ Line: 46 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(os.clock())
		end, 100)
		
		return function() --[[ Line: 51 ]]
			-- upvalues: SetIntervalResult (ref), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, { Flag, UseStateResult2 })
	
	return Largests
end