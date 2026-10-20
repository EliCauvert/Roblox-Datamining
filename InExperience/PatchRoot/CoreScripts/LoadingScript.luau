local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local CorePackages = game:GetService("CorePackages")
local PlaceId = game.PlaceId
local Selected: number = select("#", ...)

if PlaceId <= 0 and Selected > 0 then
	PlaceId = select(1, ...)
end
if game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false) then
	coroutine.wrap(function()
		-- upvalues: CorePackages (copy)
		require(CorePackages.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end
if require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer() then
	require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)
	require(CorePackages.Workspace.Packages.BuildExperience.mountTeamCreateViewer)(PlaceId)
	
	return
else
	coroutine.wrap(require(CorePackages.Workspace.Packages.ExperienceLoadingScript).loadingScript)(PlaceId, 72)
end