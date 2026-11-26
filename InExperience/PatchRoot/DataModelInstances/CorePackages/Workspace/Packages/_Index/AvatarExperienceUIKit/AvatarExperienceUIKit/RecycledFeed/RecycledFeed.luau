local ReactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local _ = require(script.Parent.RecycledFeedTypes)
local RecycledFeedViewModule = require(script.Parent.RecycledFeedView)
local UseRecycledFeedViewModelModule = require(script.Parent.useRecycledFeedViewModel)

return function(p1)
	-- upvalues: UseRecycledFeedViewModelModule (copy), ReactModule (copy), RecycledFeedViewModule (copy)
	return ReactModule.createElement(RecycledFeedViewModule, (UseRecycledFeedViewModelModule(p1)))
end