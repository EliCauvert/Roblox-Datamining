local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseTileLoadingLatencyInitializerModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer)

return function(p1, Enabled)
	-- upvalues: UseTileLoadingLatencyInitializerModule (copy), ReactModule (copy)
	local UseTileLoadingLatencyInitializerModuleResult = UseTileLoadingLatencyInitializerModule(p1)
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), UseTileLoadingLatencyInitializerModuleResult (copy)
		if Enabled == false then return end
		if UseTileLoadingLatencyInitializerModuleResult.trackerLoadedThumbnails == nil then return end
		if UseTileLoadingLatencyInitializerModuleResult.prevImpressionResults == UseTileLoadingLatencyInitializerModuleResult.trackerLoadedThumbnails then return end
		local Flag = false
		
		for _, trackerLoadedThumbnail in UseTileLoadingLatencyInitializerModuleResult.trackerLoadedThumbnails do
			if trackerLoadedThumbnail == true then
				Flag = true
				break
			end
		end
		if not Flag or not UseTileLoadingLatencyInitializerModuleResult.trackerStartTime then return end
		if Flag and not UseTileLoadingLatencyInitializerModuleResult.trackerEndTime then
			UseTileLoadingLatencyInitializerModuleResult.fireTileLoadingLatencyTracker(UseTileLoadingLatencyInitializerModuleResult, true)
		end
	end, {
		p1, UseTileLoadingLatencyInitializerModuleResult.currentPageName,
		UseTileLoadingLatencyInitializerModuleResult.trackerLoadedThumbnails,
		UseTileLoadingLatencyInitializerModuleResult.trackerStartTime,
		UseTileLoadingLatencyInitializerModuleResult.trackerEndTime,
		UseTileLoadingLatencyInitializerModuleResult.coldStart,
		UseTileLoadingLatencyInitializerModuleResult.currentCategory,
		UseTileLoadingLatencyInitializerModuleResult.currentSubcategory, Enabled
	})
end