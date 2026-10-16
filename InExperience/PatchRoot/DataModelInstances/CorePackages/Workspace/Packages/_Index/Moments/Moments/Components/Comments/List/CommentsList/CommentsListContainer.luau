local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local CommentsListViewModule = require(script.Parent.CommentsListView)
local UseCommentsListViewModelModule = require(script.Parent.useCommentsListViewModel)

return function(p1) --[[ Line: 11 | Named "CommentsListContainer" ]]
	-- upvalues: UseCommentsListViewModelModule (copy), ReactModule (copy), CommentsListViewModule (copy)
	return ReactModule.createElement(CommentsListViewModule, (UseCommentsListViewModelModule(p1)))
end