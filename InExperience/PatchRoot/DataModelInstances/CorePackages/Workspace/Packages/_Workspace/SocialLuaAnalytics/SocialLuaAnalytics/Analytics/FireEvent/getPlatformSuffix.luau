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

return function(p0) --[[ line: 24 ]]
	-- upvalues: getUserInputServiceModule (ref), platformSpecificityModule (ref), isVRAppBuild (ref), platformBucketsModule (ref), t (ref)
	local var4 = getUserInputServiceModule()
	local var5 = nil
	pcall(function() --[[ line: 29 ]]
		-- upvalues: var5 (write), var4 (ref)
		var5 = var4:GetPlatform() or Enum.Platform.None
	end)
	
	if p0 == platformSpecificityModule.All then
		if isVRAppBuild() then
			return platformBucketsModule.Quest
		end
		local var6 = tostring(var5):match(".*%.(.*)")
		
		return var6 or platformBucketsModule.None
	else
		return if p0 == platformSpecificityModule.BucketsOnly then if isVRAppBuild() then platformBucketsModule.Quest else t[var5] or platformBucketsModule.None else ""
	end
end