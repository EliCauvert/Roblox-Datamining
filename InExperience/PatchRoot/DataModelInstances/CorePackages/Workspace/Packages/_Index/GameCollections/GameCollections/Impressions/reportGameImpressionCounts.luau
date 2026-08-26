local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("GameCollections").Parent
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local appPage = require(parent.RobloxAppEnums).AppPage
local var1 = "Other"
pcall(function()
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

return function(p1, p2, p3, p4)
	-- upvalues: appPage (ref), var1 (write), isVRAppBuild (ref)
	if not p1 or not p1.Diag then return end
	if not p2 then return end
	local var2 = "Other"
	
	if p2 == appPage.Home or p2 == appPage.Games then
		if p4 == 1 then
			var2 = "GamesList"
		elseif p2 == appPage.Home then
			var2 = "Home"
		else
			assert(p2 == appPage.Games, `{p2} should always be Games here`)
			var2 = "Games"
		end
	elseif p2 == "recommended" then
		var2 = "GameDetail"
	elseif p2 == appPage.SearchPage then
		var2 = "SearchPage"
	end
	p1.Diag:reportCounterSimple((if isVRAppBuild() then "VR" else var1) .. "-GameImps-" .. var3, p3)
end