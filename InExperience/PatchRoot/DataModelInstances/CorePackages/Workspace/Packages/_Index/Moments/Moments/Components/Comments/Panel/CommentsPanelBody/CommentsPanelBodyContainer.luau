local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local CommentsPanelBodyViewModule = require(script.Parent.CommentsPanelBodyView)
local UseCommentsPanelBodyViewModelModule = require(script.Parent.useCommentsPanelBodyViewModel)

return function(p1) --[[ Line: 11 | Named "CommentsPanelBodyContainer" ]]
	-- upvalues: UseCommentsPanelBodyViewModelModule (copy), ReactModule (copy), CommentsPanelBodyViewModule (copy)
	return ReactModule.createElement(CommentsPanelBodyViewModule, (UseCommentsPanelBodyViewModelModule(p1)))
end