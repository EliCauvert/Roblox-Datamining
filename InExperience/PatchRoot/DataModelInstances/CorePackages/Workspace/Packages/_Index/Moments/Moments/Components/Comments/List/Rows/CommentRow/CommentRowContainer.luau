local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local commentRowViewModule = require(script.Parent.CommentRowView)
local useCommentRowViewModelModule = require(script.Parent.useCommentRowViewModel)

return function(p1)
	-- upvalues: useCommentRowViewModelModule (ref), reactModule (ref), commentRowViewModule (ref)
	return reactModule.createElement(commentRowViewModule, useCommentRowViewModelModule(p1))
end