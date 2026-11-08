local BuildExperiencePlaytestLaunch = script:FindFirstAncestor("BuildExperiencePlaytestLaunch")
local Parent = BuildExperiencePlaytestLaunch.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Logger = require(Parent.Loggers).Logger
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local CanViewBuildModule = require(BuildExperiencePlaytestLaunch.canViewBuild)
local OpenDeepLinkModule = require(BuildExperiencePlaytestLaunch.openDeepLink)

return function(p1, p2)
	-- upvalues: CanViewBuildModule (copy), UniversalAppPolicyModule (copy), Logger (copy), AppPage (copy), OpenDeepLinkModule (copy)
	if not CanViewBuildModule(UniversalAppPolicyModule.getAppFeaturePolicies()) then
		Logger:warning("goToBuild: dropped a request because the user cannot view Build")
		
		return
	end
	if p1 then
		OpenDeepLinkModule("roblox://navigation/build", true)
		
		return
	end
	if p2 == nil then
		error("goToBuild needs a navigation object outside an experience")
	end
	p2.navigate(AppPage.Build)
end