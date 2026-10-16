local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCoreSystem)
local SduiReportGamePlayIntentModule = require(script.Parent.sduiReportGamePlayIntent)
local HoverTileCoordinator = require(Parent.GameTile).HoverTileCoordinator
local FFlagSduiResetHoverOnExperienceLaunch = require(Parent.SharedFlags).FFlagSduiResetHoverOnExperienceLaunch
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(SduiContext, AnalyticsContext, UniverseId, PlaceId, RootPlaceId, AppliedFilters, LaunchData) --[[ Line: 15 | Named "useSduiReportExperienceLaunched" ]]
	-- upvalues: ReactModule (copy), FFlagSduiResetHoverOnExperienceLaunch (copy), HoverTileCoordinator (copy), SduiReportGamePlayIntentModule (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy)
	return ReactModule.useCallback(function(p1) --[[ Line: 28 ]]
		-- upvalues: FFlagSduiResetHoverOnExperienceLaunch (upval), HoverTileCoordinator (upval), SduiReportGamePlayIntentModule (upval), SduiContext (copy), AnalyticsContext (copy), UniverseId (copy), PlaceId (copy), RootPlaceId (copy), AppliedFilters (copy), LaunchData (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		if FFlagSduiResetHoverOnExperienceLaunch then
			HoverTileCoordinator.default:reset()
		end
		SduiReportGamePlayIntentModule({
			sduiContext = SduiContext,
			analyticsContext = AnalyticsContext,
			universeId = UniverseId,
			placeId = PlaceId,
			rootPlaceId = RootPlaceId,
			appliedFilters = AppliedFilters,
			launchData = LaunchData,
			actionType = if FFlagLuaAppDemoModePlayButtonTelemetry then p1 else nil
		})
	end, {
		SduiContext.dependencies.eventIngest, AnalyticsContext, UniverseId, PlaceId,
		RootPlaceId, AppliedFilters, LaunchData,
		SduiContext.dependencies.sessionService, SduiContext
	})
end