local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("GameCollections").Parent
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local appPage = require(parent.RobloxAppEnums).AppPage
local var1 = "Other"
pcall(function() --[[ line: 11 ]]
	-- upvalues: userInputService (ref), var1 (write)
	local platform = userInputService:GetPlatform()
	
	if platform == Enum.Platform.Android then
		var1 = "Android"
		
		return
	elseif platform == Enum.Platform.IOS then
		var1 = "iOS"
		
		return
	elseif platform == Enum.Platform.Windows then
		var1 = "Win"
		
		return
	elseif platform == Enum.Platform.UWP then
		var1 = "UWP"
		
		return
	elseif platform == Enum.Platform.OSX then
		var1 = "Mac"
		
		return
	elseif platform == Enum.Platform.XBox360 or platform == Enum.Platform.XBoxOne then
		var1 = "XBox"
		
		return
	elseif platform == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and platform == Enum.Platform.PS5 then
		var1 = "PS"
	end
end)

return function(p0, p1, p2, p3) --[[ line: 32 ]]
	-- upvalues: appPage (ref), var1 (write), isVRAppBuild (ref)
	if not p0 or not p0.Diag then return end
	if not p1 then return end
	local var3 = "Other"
	
	if p1 == appPage.Home or p1 == appPage.Games then
		if p3 == 1 then
			var3 = "GamesList"
		elseif p1 == appPage.Home then
			var3 = "Home"
		else
			assert(p1 == appPage.Games, `{p1} should always be Games here`)
			var3 = "Games"
		end
	elseif p1 == "recommended" then
		var3 = "GameDetail"
	elseif p1 == appPage.SearchPage then
		var3 = "SearchPage"
	end
	p0.Diag:reportCounterSimple((if isVRAppBuild() then "VR" else var1) .. "-GameImps-" .. var3, p2)
end