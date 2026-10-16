local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local CommentsComposerViewModule = require(script.Parent.CommentsComposerView)
local UseCommentsComposerViewModelModule = require(script.Parent.useCommentsComposerViewModel)

return function(p1) --[[ Line: 11 | Named "CommentsComposerContainer" ]]
	-- upvalues: UseCommentsComposerViewModelModule (copy), ReactModule (copy), CommentsComposerViewModule (copy)
	return ReactModule.createElement(CommentsComposerViewModule, (UseCommentsComposerViewModelModule(p1)))
end