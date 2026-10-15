local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCoreSystem)
local sduiReportGamePlayIntentModule = require(script.Parent.sduiReportGamePlayIntent)
local hoverTileCoordinator = require(parent.GameTile).HoverTileCoordinator
local fFlagSduiResetHoverOnExperienceLaunch = require(parent.SharedFlags).FFlagSduiResetHoverOnExperienceLaunch
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), fFlagSduiResetHoverOnExperienceLaunch (ref), hoverTileCoordinator (ref), sduiReportGamePlayIntentModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	return reactModule.useCallback(function(p8)
		-- upvalues: fFlagSduiResetHoverOnExperienceLaunch (copy), hoverTileCoordinator (copy), sduiReportGamePlayIntentModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if fFlagSduiResetHoverOnExperienceLaunch then
			hoverTileCoordinator.default:reset()
		end
		sduiReportGamePlayIntentModule({
			sduiContext = p1,
			analyticsContext = p2,
			universeId = p3,
			placeId = p4,
			rootPlaceId = p5,
			appliedFilters = p6,
			launchData = p7,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p8 else nil
		})
	end, {
		p1.dependencies.eventIngest, p2, p3, p4, p5, p6, p7,
		p1.dependencies.sessionService, p1
	})
end