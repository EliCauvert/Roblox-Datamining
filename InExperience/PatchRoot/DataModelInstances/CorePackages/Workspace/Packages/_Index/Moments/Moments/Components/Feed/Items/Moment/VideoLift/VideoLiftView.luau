local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local view = foundationModule.View
local mediaSurfaceContext = momentsCommonModule.Media.MediaSurfaceContext
local vector2 = Vector2.new(0.5, 0.5)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), vector2 (ref), mediaSurfaceContext (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		testId = "--moments-item-video-lift",
		onAbsolutePositionChanged = p1.onItemRectChanged,
		onAbsoluteSizeChanged = p1.onItemRectChanged
	}, {
		Media = reactModule.createElement(view, {
			testId = "--moments-item-video-lift-media",
			AnchorPoint = vector2,
			Position = p1.position,
			Size = p1.size
		}, {
			Surface = reactModule.createElement(mediaSurfaceContext.Provider, { value = p1.mediaSurface }, p1.children)
		})
	})
end