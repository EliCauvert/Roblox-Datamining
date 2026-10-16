local Parent = script:FindFirstAncestor("SplitPane").Parent
local DisplayModule = require(Parent.Display)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SplitPaneTelemetryModule = require(script.Parent.SplitPaneTelemetry)

return function(p1, p2) --[[ Line: 14 | Named "getTelemetrySnapshot" ]]
	-- upvalues: DisplayModule (copy), SplitPaneTelemetryModule (copy), LocalUserIdStore (copy)
	local DisplayStore = DisplayModule.GetDisplayStore(p2)
	local ViewportSize = DisplayStore.getViewportSize(p2)
	local PlatformScale = DisplayStore.getPlatformScale(p2)
	local DesignSpaceViewportWidth: number = DisplayStore.getDesignSpaceViewportWidth(p2)
	local CurrentScreenOrientation = p1.getCurrentScreenOrientation(p2)
	
	return {
		viewportSize = if ViewportSize == Vector2.new(1, 1) or CurrentScreenOrientation == nil then nil else Vector2.new(math.round(DesignSpaceViewportWidth), (math.round(ViewportSize.Y / PlatformScale))),
		isLandscape = CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight,
		view = if p1.getIsSplitPaneCollapsedOrNotActive(p2) then SplitPaneTelemetryModule.View.Hidden else SplitPaneTelemetryModule.View.Shown,
		userId = LocalUserIdStore.getCurrentUserId(p2)
	}
end