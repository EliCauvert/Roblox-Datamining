local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local VideoLiftViewModule = require(script.Parent.VideoLiftView)
local UseVideoLiftViewModelModule = require(script.Parent.useVideoLiftViewModel)

return function(p1) --[[ Line: 19 | Named "VideoLiftContainer" ]]
	-- upvalues: UseVideoLiftViewModelModule (copy), ReactModule (copy), VideoLiftViewModule (copy)
	local UseVideoLiftViewModelModuleResult = UseVideoLiftViewModelModule(p1.feedItemId)
	
	return ReactModule.createElement(VideoLiftViewModule, {
		size = UseVideoLiftViewModelModuleResult.size,
		position = UseVideoLiftViewModelModuleResult.position,
		mediaSurface = UseVideoLiftViewModelModuleResult.mediaSurface,
		onItemRectChanged = UseVideoLiftViewModelModuleResult.onItemRectChanged
	}, p1.children)
end