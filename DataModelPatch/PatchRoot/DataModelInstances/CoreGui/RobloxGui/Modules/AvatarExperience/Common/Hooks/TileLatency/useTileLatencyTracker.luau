local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local _ = require(Modules.AvatarExperience.Common.Components.WidgetList.Types)
local UseTileLoadingLatencyInitializerModule = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer)
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local AXFixOrganicTTILogging = game:DefineFastFlag("AXFixOrganicTTILogging", false)

return function(p1, p2, p3)
	-- upvalues: UseTileLoadingLatencyInitializerModule (copy), UsePreviousFunction (copy), ReactModule (copy), AXFixOrganicTTILogging (copy)
	local UseTileLoadingLatencyInitializerModuleResult = UseTileLoadingLatencyInitializerModule(p1)
	local UsePreviousResult = UsePreviousFunction(p2)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseTileLoadingLatencyInitializerModuleResult.currentCategory)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseTileLoadingLatencyInitializerModuleResult.currentSubcategory)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), UseTileLoadingLatencyInitializerModuleResult (copy)
		if p3 and UseTileLoadingLatencyInitializerModuleResult then
			UseTileLoadingLatencyInitializerModuleResult.fireTileLoadingLatencyTracker(UseTileLoadingLatencyInitializerModuleResult, nil, true)
			
			return
		end
	end, { p3 })
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseTileLoadingLatencyInitializerModuleResult (copy), UsePreviousResult (copy), UseStateResult (copy), UseStateResult1 (copy), AXFixOrganicTTILogging (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if not p2 or #p2 == 0 then return end
		if UseTileLoadingLatencyInitializerModuleResult.trackerStartTime ~= nil and #p2 > 0 and UsePreviousResult ~= p2 and (UseStateResult ~= UseTileLoadingLatencyInitializerModuleResult.currentCategory or UseStateResult1 ~= UseTileLoadingLatencyInitializerModuleResult.currentSubcategory or AXFixOrganicTTILogging and (not UsePreviousResult or #UsePreviousResult == 0)) then
			UseTileLoadingLatencyInitializerModuleResult.fireTileLoadingLatencyTracker(UseTileLoadingLatencyInitializerModuleResult)
		end
		UseStateResult2(UseTileLoadingLatencyInitializerModuleResult.currentCategory)
		UseStateResult2_1(UseTileLoadingLatencyInitializerModuleResult.currentSubcategory)
	end, {
		UseTileLoadingLatencyInitializerModuleResult.currentPageName, p1,
		UseTileLoadingLatencyInitializerModuleResult.trackerStartTime,
		UseTileLoadingLatencyInitializerModuleResult.currentCategory,
		UseTileLoadingLatencyInitializerModuleResult.currentSubcategory, p2,
		UseStateResult
	})
end