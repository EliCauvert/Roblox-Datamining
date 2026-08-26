local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local constantsModule = require(moments.Constants)
local feed = require(moments.Components.Feed).Feed

return function(p1)
	-- upvalues: reactModule (ref), feed (ref), view (ref), constantsModule (ref), foundationProvider (ref), colorMode (ref)
	local bottomInset = p1.bottomInset or 0
	local var1 = reactModule.createElement(feed, {
		source = p1.source,
		active = p1.active,
		playbackActive = p1.playbackActive,
		telemetry = p1.telemetry,
		controllerRef = p1.controllerRef,
		initialIndex = p1.initialIndex,
		trackSurfaceLoad = p1.trackSurfaceLoad
	})
	local renderFeedContainer = p1.renderFeedContainer
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = reactModule.createElement(view, { tag = "size-full" }, {
			OnVideoUI = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
				FeedContainer = if renderFeedContainer ~= nil then reactModule.createElement(view, {
					tag = "size-full",
					padding = if bottomInset > 0 then { bottom = UDim.new(0, bottomInset) } else nil,
					ZIndex = constantsModule.DisplayOrder.Feed
				}, { Feed = var1 }) else renderFeedContainer(var1),
				Header = p1.header
			})
		})
	})
end