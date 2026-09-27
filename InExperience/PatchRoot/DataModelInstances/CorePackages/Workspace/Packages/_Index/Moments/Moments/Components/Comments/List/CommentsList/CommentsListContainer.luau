local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local commentsListViewModule = require(script.Parent.CommentsListView)
local useCommentsListViewModelModule = require(script.Parent.useCommentsListViewModel)

return function(p1)
	-- upvalues: useCommentsListViewModelModule (ref), reactModule (ref), commentsListViewModule (ref)
	return reactModule.createElement(commentsListViewModule, useCommentsListViewModelModule(p1))
end