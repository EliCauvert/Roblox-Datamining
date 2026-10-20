local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local CommentRowViewModule = require(script.Parent.CommentRowView)
local UseCommentRowViewModelModule = require(script.Parent.useCommentRowViewModel)

return function(p1)
	-- upvalues: UseCommentRowViewModelModule (copy), ReactModule (copy), CommentRowViewModule (copy)
	return ReactModule.createElement(CommentRowViewModule, (UseCommentRowViewModelModule(p1)))
end