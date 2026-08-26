local parent = script:FindFirstAncestor("AuthCommon").Parent
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local platform = game:GetService("UserInputService"):GetPlatform()
local fStringLuaAppEphemeralCounterPrefix = require(parent.SharedFlags).FStringLuaAppEphemeralCounterPrefix

return function(p1, p2)
	-- upvalues: platform (ref), fStringLuaAppEphemeralCounterPrefix (ref), rbxAnalyticsService (ref)
	pcall(function()
		-- upvalues: p1 (write), p2 (write), platform (copy), fStringLuaAppEphemeralCounterPrefix (copy), rbxAnalyticsService (copy)
		assert(type(p1) == "string", "Expected counterName to be a string")
		p1 = p1 or ""
		p2 = p2 or 1
		
		if platform == Enum.Platform.Android then
			p1 = "Android-" .. tostring(p1)
		elseif platform == Enum.Platform.IOS then
			p1 = "iOS-" .. tostring(p1)
		elseif platform == Enum.Platform.Windows then
			p1 = "Win32-" .. tostring(p1)
		elseif platform == Enum.Platform.UWP then
			p1 = "UWP-" .. tostring(p1)
		elseif platform == Enum.Platform.OSX then
			p1 = "Mac-" .. tostring(p1)
		elseif fStringLuaAppEphemeralCounterPrefix ~= "" then
			p1 = fStringLuaAppEphemeralCounterPrefix .. tostring(p1)
		end
		rbxAnalyticsService:ReportCounter(p1, p2)
	end)
end