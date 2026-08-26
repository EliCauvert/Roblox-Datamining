local isVRAppBuild = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.AppCommonLib).IsVRAppBuild
local getUserInputServiceModule = require(script.Parent.getUserInputService)
local platformBucketsModule = require(script.Parent.Parent.Enums.PlatformBuckets)
local platformSpecificityModule = require(script.Parent.Parent.Enums.PlatformSpecificity)
local t = {
	[Enum.Platform.Windows] = platformBucketsModule.Windows,
	[Enum.Platform.OSX] = platformBucketsModule.Mac,
	[Enum.Platform.IOS] = platformBucketsModule.IOS,
	[Enum.Platform.Android] = platformBucketsModule.Android,
	[Enum.Platform.UWP] = platformBucketsModule.Windows,
	[Enum.Platform.XBox360] = platformBucketsModule.XBox,
	[Enum.Platform.XBoxOne] = platformBucketsModule.XBox,
	[Enum.Platform.PS3] = platformBucketsModule.Playstation,
	[Enum.Platform.PS4] = platformBucketsModule.Playstation,
	[Enum.Platform.PS5] = platformBucketsModule.Playstation,
	[Enum.Platform.None] = platformBucketsModule.None
}

return function(p1)
	-- upvalues: getUserInputServiceModule (ref), platformSpecificityModule (ref), isVRAppBuild (ref), platformBucketsModule (ref), t (ref)
	local var1 = getUserInputServiceModule()
	local var2 = nil
	pcall(function()
		-- upvalues: var2 (write), var1 (ref)
		var2 = var1:GetPlatform() or Enum.Platform.None
	end)
	
	if p1 == platformSpecificityModule.All then
		if isVRAppBuild() then
			return platformBucketsModule.Quest
		end
		local var3 = tostring(var2):match(".*%.(.*)")
		
		return var3 or platformBucketsModule.None
	else
		return if p1 == platformSpecificityModule.BucketsOnly then if isVRAppBuild() then platformBucketsModule.Quest else t[var2] or platformBucketsModule.None else ""
	end
end