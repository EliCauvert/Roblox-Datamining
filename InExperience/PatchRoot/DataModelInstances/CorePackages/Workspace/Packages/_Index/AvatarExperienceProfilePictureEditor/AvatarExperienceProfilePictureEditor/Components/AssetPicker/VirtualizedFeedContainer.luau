local ReactModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.React)
local VirtualizedFeedViewModule = require(script.Parent.VirtualizedFeedView)
local UseVirtualizedFeedViewModelModule = require(script.Parent.useVirtualizedFeedViewModel)

return function(p1) --[[ Line: 10 | Named "AssetPickerVirtualizedFeedContainer" ]]
	-- upvalues: UseVirtualizedFeedViewModelModule (copy), ReactModule (copy), VirtualizedFeedViewModule (copy)
	return ReactModule.createElement(VirtualizedFeedViewModule, (UseVirtualizedFeedViewModelModule(p1)))
end