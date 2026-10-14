local parent = script:FindFirstAncestor("SplitPane").Parent
local displayModule = require(parent.Display)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local splitPaneTelemetryModule = require(script.Parent.SplitPaneTelemetry)

return function(p1, p2)
	-- upvalues: displayModule (ref), splitPaneTelemetryModule (ref), localUserIdStore (ref)
	local displayStore = displayModule.GetDisplayStore(p2)
	local viewportSize = displayStore.getViewportSize(p2)
	local currentScreenOrientation = p1.getCurrentScreenOrientation(p2)
	
	return {
		viewportSize = if not (viewportSize == Vector2.new(1, 1) or currentScreenOrientation == nil) then Vector2.new(math.round(displayStore.getDesignSpaceViewportWidth(p2)), math.round(viewportSize.Y / displayStore.getPlatformScale(p2))) else nil,
		isLandscape = if currentScreenOrientation ~= Enum.ScreenOrientation.LandscapeLeft then currentScreenOrientation == Enum.ScreenOrientation.LandscapeRight else true,
		view = if p1.getIsSplitPaneCollapsedOrNotActive(p2) then splitPaneTelemetryModule.View.Hidden else splitPaneTelemetryModule.View.Shown,
		userId = localUserIdStore.getCurrentUserId(p2)
	}
end