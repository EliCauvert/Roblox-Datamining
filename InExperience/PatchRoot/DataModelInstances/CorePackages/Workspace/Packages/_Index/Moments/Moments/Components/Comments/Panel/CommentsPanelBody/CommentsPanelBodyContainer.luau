local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local commentsPanelBodyViewModule = require(script.Parent.CommentsPanelBodyView)
local useCommentsPanelBodyViewModelModule = require(script.Parent.useCommentsPanelBodyViewModel)

return function(p1)
	-- upvalues: useCommentsPanelBodyViewModelModule (ref), reactModule (ref), commentsPanelBodyViewModule (ref)
	return reactModule.createElement(commentsPanelBodyViewModule, useCommentsPanelBodyViewModelModule(p1))
end