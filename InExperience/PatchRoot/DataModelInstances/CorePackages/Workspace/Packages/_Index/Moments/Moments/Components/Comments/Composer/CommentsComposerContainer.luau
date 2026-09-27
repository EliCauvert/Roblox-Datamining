local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local commentsComposerViewModule = require(script.Parent.CommentsComposerView)
local useCommentsComposerViewModelModule = require(script.Parent.useCommentsComposerViewModel)

return function(p1)
	-- upvalues: useCommentsComposerViewModelModule (ref), reactModule (ref), commentsComposerViewModule (ref)
	return reactModule.createElement(commentsComposerViewModule, useCommentsComposerViewModelModule(p1))
end