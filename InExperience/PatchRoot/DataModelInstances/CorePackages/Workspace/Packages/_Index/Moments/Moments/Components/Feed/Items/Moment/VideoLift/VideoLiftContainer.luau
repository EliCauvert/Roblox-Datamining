local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local videoLiftViewModule = require(script.Parent.VideoLiftView)
local useVideoLiftViewModelModule = require(script.Parent.useVideoLiftViewModel)

return function(p1)
	-- upvalues: useVideoLiftViewModelModule (ref), reactModule (ref), videoLiftViewModule (ref)
	local var1 = useVideoLiftViewModelModule(p1.feedItemId)
	
	return reactModule.createElement(videoLiftViewModule, {
		size = var1.size,
		position = var1.position,
		mediaSurface = var1.mediaSurface,
		onItemRectChanged = var1.onItemRectChanged
	}, p1.children)
end