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
coroutine.wrap(require(CorePackages.Workspace.Packages.ExperienceLoadingScript).loadingScript)(PlaceId, 72)