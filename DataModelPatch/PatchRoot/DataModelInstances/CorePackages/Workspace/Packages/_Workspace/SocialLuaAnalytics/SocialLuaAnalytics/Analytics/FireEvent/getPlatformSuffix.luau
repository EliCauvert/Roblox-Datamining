local IsVRAppBuildFunction = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.AppCommonLib).IsVRAppBuild
local GetUserInputServiceModule = require(script.Parent.getUserInputService)
local PlatformBucketsModule = require(script.Parent.Parent.Enums.PlatformBuckets)
local PlatformSpecificityModule = require(script.Parent.Parent.Enums.PlatformSpecificity)
local config = {
	[Enum.Platform.Windows] = PlatformBucketsModule.Windows,
	[Enum.Platform.OSX] = PlatformBucketsModule.Mac,
	[Enum.Platform.IOS] = PlatformBucketsModule.IOS,
	[Enum.Platform.Android] = PlatformBucketsModule.Android,
	[Enum.Platform.UWP] = PlatformBucketsModule.Windows,
	[Enum.Platform.XBox360] = PlatformBucketsModule.XBox,
	[Enum.Platform.XBoxOne] = PlatformBucketsModule.XBox,
	[Enum.Platform.PS3] = PlatformBucketsModule.Playstation,
	[Enum.Platform.PS4] = PlatformBucketsModule.Playstation,
	[Enum.Platform.PS5] = PlatformBucketsModule.Playstation,
	[Enum.Platform.None] = PlatformBucketsModule.None
}

return function(All)
	-- upvalues: GetUserInputServiceModule (copy), PlatformSpecificityModule (copy), IsVRAppBuildFunction (copy), PlatformBucketsModule (copy), config (copy)
	local UserInputServiceModule = GetUserInputServiceModule()
	local Platform = nil
	pcall(function()
		-- upvalues: Platform (ref), UserInputServiceModule (copy)
		Platform = UserInputServiceModule:GetPlatform() or Enum.Platform.None
	end)
	
	if All ~= PlatformSpecificityModule.All then
		return if All == PlatformSpecificityModule.BucketsOnly then if IsVRAppBuildFunction() then PlatformBucketsModule.Quest else config[Platform] or PlatformBucketsModule.None else ""
	elseif IsVRAppBuildFunction() then
		return PlatformBucketsModule.Quest
	else
		local v1 = tostring(Platform):match(".*%.(.*)")
		
		return if v1 then v1 else PlatformBucketsModule.None
	end
end