local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local corePackagesService = game:GetService("CorePackages")
local placeId = game.PlaceId

if placeId <= 0 and select("#", ...) > 0 then
	placeId = select(1, ...)
end
if game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false) then
	coroutine.wrap(function() --[[ line: 23 ]]
		-- upvalues: corePackagesService (ref)
		require(corePackagesService.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end
coroutine.wrap(require(corePackagesService.Workspace.Packages.ExperienceLoadingScript).loadingScript)(placeId, 72)