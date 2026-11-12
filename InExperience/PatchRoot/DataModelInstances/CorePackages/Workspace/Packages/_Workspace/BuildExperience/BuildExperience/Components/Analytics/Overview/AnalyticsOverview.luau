local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AnalyticsEventContextModule = require(BuildExperience.Analytics.AnalyticsEventContext)
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsPageEvents)
local AnalyticsWindowModule = require(BuildExperience.Analytics.AnalyticsWindow)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local FFlagBuildExperienceEventContextTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceEventContextTelemetry)
local AnalyticsOverviewViewModule = require(script.Parent.AnalyticsOverviewView)
local UseAnalyticsOverviewViewModelModule = require(script.Parent.useAnalyticsOverviewViewModel)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)

return function(p1)
	-- upvalues: ReactModule (copy), AnalyticsWindowModule (copy), UseAnalyticsOverviewViewModelModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), AnalyticsOverviewViewModule (copy), AnalyticsEventContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialWindowId or AnalyticsWindowModule.DEFAULT_WINDOW_ID)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local WindowByIdEntry = AnalyticsWindowModule.WindowById[UseStateResult] or AnalyticsWindowModule.LastWeek
	local UseAnalyticsOverviewViewModelModuleResult = UseAnalyticsOverviewViewModelModule(p1.universeId, WindowByIdEntry, p1.initialMetricId or "UniqueUsersWithPlaySessions", UseStateResult1, UseStateResult2_1)
	local UseMemoResult = if FFlagBuildExperienceEventContextTelemetryModule then ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return { placeId = p1.placeId, conversationId = p1.conversationId }
	end, { p1.placeId, p1.conversationId }) else nil
	local Element = ReactModule.createElement(AnalyticsOverviewViewModule, {
		overviewTitle = UseAnalyticsOverviewViewModelModuleResult.overviewTitle,
		keyStatsTitle = UseAnalyticsOverviewViewModelModuleResult.keyStatsTitle,
		instantStats = UseAnalyticsOverviewViewModelModuleResult.instantStats,
		statsCards = UseAnalyticsOverviewViewModelModuleResult.statsCards,
		windows = UseAnalyticsOverviewViewModelModuleResult.windows,
		selectedWindowId = UseStateResult,
		onWindowSelected = UseStateResult2,
		universeId = p1.universeId,
		window = WindowByIdEntry,
		sheet = UseAnalyticsOverviewViewModelModuleResult.sheet,
		onSheetClose = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(nil)
		end, {}),
		onOpenChat = if FFlagBuildCheckGamePermissionsModule and not UseGamePermissionsModule({ universeId = p1.universeId }).canEditOnBuild then nil else p1.onOpenChat,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	})
	
	return if UseMemoResult == nil then Element else ReactModule.createElement(AnalyticsEventContextModule.Provider, { value = UseMemoResult }, Element)
end