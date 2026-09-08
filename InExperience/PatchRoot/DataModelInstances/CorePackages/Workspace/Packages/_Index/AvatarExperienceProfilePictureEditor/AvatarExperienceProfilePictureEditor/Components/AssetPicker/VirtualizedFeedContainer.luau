local reactModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.React)
local virtualizedFeedViewModule = require(script.Parent.VirtualizedFeedView)
local useVirtualizedFeedViewModelModule = require(script.Parent.useVirtualizedFeedViewModel)

return function(value)
	-- upvalues: useVirtualizedFeedViewModelModule (ref), reactModule (ref), virtualizedFeedViewModule (ref)
	return reactModule.createElement(virtualizedFeedViewModule, useVirtualizedFeedViewModelModule(value))
end