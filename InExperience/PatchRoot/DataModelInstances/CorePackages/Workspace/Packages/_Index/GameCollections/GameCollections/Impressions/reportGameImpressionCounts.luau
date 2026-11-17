local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("GameCollections").Parent
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagAppIaHomeCampaignSubTab = require(Parent.SharedFlags).FFlagAppIaHomeCampaignSubTab
local v1 = "Other"
pcall(function()
	-- upvalues: UserInputService (copy), v1 (ref)
	local Platform = UserInputService:GetPlatform()
	
	if Platform == Enum.Platform.Android then
		v1 = "Android"
		
		return
	end
	if Platform == Enum.Platform.IOS then
		v1 = "iOS"
		
		return
	end
	if Platform == Enum.Platform.Windows then
		v1 = "Win"
		
		return
	end
	if Platform == Enum.Platform.UWP then
		v1 = "UWP"
		
		return
	end
	if Platform == Enum.Platform.OSX then
		v1 = "Mac"
		
		return
	end
	if Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.XBoxOne then
		v1 = "XBox"
		
		return
	end
	if Platform == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and Platform == Enum.Platform.PS5 then
		v1 = "PS"
	end
end)

return function(p1, Games, p2, p3)
	-- upvalues: AppPage (copy), FFlagAppIaHomeCampaignSubTab (copy), v1 (ref), IsVRAppBuildFunction (copy)
	if not p1 or not p1.Diag then return end
	if not Games then return end
	local GamesList = "Other"
	
	if Games == AppPage.Home or Games == AppPage.Games then
		if p3 == 1 then
			GamesList = "GamesList"
		elseif Games == AppPage.Home then
			GamesList = "Home"
		else
			assert(Games == AppPage.Games, `{Games} should always be Games here`)
			GamesList = "Games"
		end
	elseif Games == "recommended" then
		GamesList = "GameDetail"
	elseif Games == AppPage.SearchPage then
		GamesList = "SearchPage"
	elseif FFlagAppIaHomeCampaignSubTab and Games == AppPage.Campaign then
		GamesList = if p3 == 1 then "GamesList" else "Campaign"
	end
	p1.Diag:reportCounterSimple((if IsVRAppBuildFunction() then "VR" else v1) .. "-GameImps-" .. GamesList, p2)
end