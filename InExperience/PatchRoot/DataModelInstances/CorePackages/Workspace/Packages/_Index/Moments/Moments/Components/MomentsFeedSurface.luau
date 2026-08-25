local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local constantsModule = require(moments.Constants)
local feed = require(moments.Components.Feed).Feed

return function(p0)
	-- upvalues: reactModule (ref), feed (ref), view (ref), constantsModule (ref), foundationProvider (ref), colorMode (ref)
	local bottomInset = p0.bottomInset or 0
	local var5 = reactModule.createElement(feed, {
		source = p0.source,
		active = p0.active,
		playbackActive = p0.playbackActive,
		telemetry = p0.telemetry,
		controllerRef = p0.controllerRef,
		initialIndex = p0.initialIndex,
		trackSurfaceLoad = p0.trackSurfaceLoad
	})
	local renderFeedContainer = p0.renderFeedContainer
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = reactModule.createElement(view, { tag = "size-full" }, {
			OnVideoUI = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
				FeedContainer = if renderFeedContainer ~= nil then reactModule.createElement(view, {
					tag = "size-full",
					padding = if bottomInset > 0 then { bottom = UDim.new(0, bottomInset) } else nil,
					ZIndex = constantsModule.DisplayOrder.Feed
				}, { Feed = var5 }) else renderFeedContainer(var5),
				Header = p0.header
			})
		})
	})
end