local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local commentsComposerContainerModule = require(moments.Components.Comments.Composer.CommentsComposerContainer)
local commentsPanelBodyContainerModule = require(moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)

return function(p1)
	-- upvalues: reactModule (ref), sheet (ref), dialogSize (ref), text (ref), view (ref), commentsPanelBodyContainerModule (ref), commentsComposerContainerModule (ref)
	return reactModule.createElement(sheet.Root, {
		testId = "moments-comments-sheet",
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		size = dialogSize.Medium,
		snapPoints = { 0.6, 0.95 }
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.title
			})
		}),
		Content = reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, {
			ContentSlot = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-content-slot"
			}, {
				PanelBody = reactModule.createElement(commentsPanelBodyContainerModule, p1.panelBodyProps)
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { ref = p1.actionsRef }, {
			ComposerSlot = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-composer-slot"
			}, {
				Composer = if p1.composerProps ~= nil then nil else reactModule.createElement(commentsComposerContainerModule, p1.composerProps)
			})
		})
	})
end