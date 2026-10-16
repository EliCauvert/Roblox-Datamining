local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local ConstantsModule = require(Moments.Constants)
local Feed = require(Moments.Components.Feed).Feed

return function(p1) --[[ Line: 50 | Named "MomentsFeedSurface" ]]
	-- upvalues: ReactModule (copy), Feed (copy), View (copy), ConstantsModule (copy), FoundationProvider (copy), ColorMode (copy)
	local BottomInset = p1.bottomInset or 0
	local Element = ReactModule.createElement(Feed, {
		source = p1.source,
		active = p1.active,
		playbackActive = p1.playbackActive,
		telemetry = p1.telemetry,
		inactiveDestination = p1.inactiveDestination,
		controllerRef = p1.controllerRef,
		initialIndex = p1.initialIndex,
		trackSurfaceLoad = p1.trackSurfaceLoad
	})
	local RenderFeedContainerFunction = p1.renderFeedContainer
	
	return ReactModule.createElement(View, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = ReactModule.createElement(View, { tag = "size-full" }, {
			OnVideoUI = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
				FeedContainer = if RenderFeedContainerFunction == nil then ReactModule.createElement(View, {
					tag = "size-full",
					padding = if BottomInset > 0 then { bottom = UDim.new(0, BottomInset) } else nil,
					ZIndex = ConstantsModule.DisplayOrder.Feed
				}, { Feed = Element }) else RenderFeedContainerFunction(Element),
				Header = p1.header
			})
		})
	})
end