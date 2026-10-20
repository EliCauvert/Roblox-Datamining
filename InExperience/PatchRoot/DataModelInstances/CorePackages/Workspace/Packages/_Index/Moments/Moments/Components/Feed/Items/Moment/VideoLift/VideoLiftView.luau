local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local MediaSurfaceContext = require(Parent.MomentsCommon).Media.MediaSurfaceContext
local _Vector2 = Vector2.new(0.5, 0.5)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), _Vector2 (copy), MediaSurfaceContext (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "--moments-item-video-lift",
		onAbsolutePositionChanged = p1.onItemRectChanged,
		onAbsoluteSizeChanged = p1.onItemRectChanged
	}, {
		Media = ReactModule.createElement(View, {
			testId = "--moments-item-video-lift-media",
			AnchorPoint = _Vector2,
			Position = p1.position,
			Size = p1.size
		}, {
			Surface = ReactModule.createElement(MediaSurfaceContext.Provider, { value = p1.mediaSurface }, p1.children)
		})
	})
end