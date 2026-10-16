local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Platform = game:GetService("UserInputService"):GetPlatform()
local FStringLuaAppEphemeralCounterPrefix = require(script:FindFirstAncestor("AuthCommon").Parent.SharedFlags).FStringLuaAppEphemeralCounterPrefix

return function(CounterName, Amount) --[[ Line: 13 ]]
	-- upvalues: Platform (copy), FStringLuaAppEphemeralCounterPrefix (copy), RbxAnalyticsService (copy)
	pcall(function() --[[ Line: 14 ]]
		-- upvalues: CounterName (ref), Amount (ref), Platform (upval), FStringLuaAppEphemeralCounterPrefix (upval), RbxAnalyticsService (upval)
		assert(type(CounterName) == "string", "Expected counterName to be a string")
		CounterName = CounterName or ""
		Amount = Amount or 1
		
		if Platform == Enum.Platform.Android then
			CounterName = "Android-" .. tostring(CounterName)
		elseif Platform == Enum.Platform.IOS then
			CounterName = "iOS-" .. tostring(CounterName)
		elseif Platform == Enum.Platform.Windows then
			CounterName = "Win32-" .. tostring(CounterName)
		elseif Platform == Enum.Platform.UWP then
			CounterName = "UWP-" .. tostring(CounterName)
		elseif Platform == Enum.Platform.OSX then
			CounterName = "Mac-" .. tostring(CounterName)
		elseif FStringLuaAppEphemeralCounterPrefix ~= "" then
			CounterName = FStringLuaAppEphemeralCounterPrefix .. tostring(CounterName)
		end
		RbxAnalyticsService:ReportCounter(CounterName, Amount)
	end)
end