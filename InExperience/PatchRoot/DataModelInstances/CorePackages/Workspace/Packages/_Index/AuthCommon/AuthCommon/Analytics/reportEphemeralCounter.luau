local parent = script:FindFirstAncestor("AuthCommon").Parent
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local platform = game:GetService("UserInputService"):GetPlatform()
local fStringLuaAppEphemeralCounterPrefix = require(parent.SharedFlags).FStringLuaAppEphemeralCounterPrefix

return function(p0, p1) --[[ line: 13 ]]
	-- upvalues: platform (ref), fStringLuaAppEphemeralCounterPrefix (ref), rbxAnalyticsService (ref)
	pcall(function() --[[ line: 14 ]]
		-- upvalues: p0 (write), p1 (write), platform (copy), fStringLuaAppEphemeralCounterPrefix (copy), rbxAnalyticsService (copy)
		assert(type(p0) == "string", "Expected counterName to be a string")
		p0 = p0 or ""
		p1 = p1 or 1
		
		if platform == Enum.Platform.Android then
			p0 = "Android-" .. tostring(p0)
		elseif platform == Enum.Platform.IOS then
			p0 = "iOS-" .. tostring(p0)
		elseif platform == Enum.Platform.Windows then
			p0 = "Win32-" .. tostring(p0)
		elseif platform == Enum.Platform.UWP then
			p0 = "UWP-" .. tostring(p0)
		elseif platform == Enum.Platform.OSX then
			p0 = "Mac-" .. tostring(p0)
		elseif fStringLuaAppEphemeralCounterPrefix ~= "" then
			p0 = fStringLuaAppEphemeralCounterPrefix .. tostring(p0)
		end
		rbxAnalyticsService:ReportCounter(p0, p1)
	end)
end