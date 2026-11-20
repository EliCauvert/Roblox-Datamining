local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)
local RecycledFeedRowViewModule = require(script.Parent.RecycledFeedRowView)
local _ = require(script.Parent.RecycledFeedTypes)
local UseRecycledFeedRowViewModelModule = require(script.Parent.useRecycledFeedRowViewModel)

return function(p1)
	-- upvalues: UseRecycledFeedRowViewModelModule (copy), ReactModule (copy), RecycledFeedRowViewModule (copy)
	return ReactModule.createElement(RecycledFeedRowViewModule, (UseRecycledFeedRowViewModelModule(p1)))
end