local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), sheet (ref), dialogSize (ref), text (ref), view (ref)
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
		Content = reactModule.createElement(sheet.Content, nil, {
			ContentSlot = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-content-slot"
			}, p1.content)
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			ComposerSlot = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-composer-slot"
			}, p1.composer)
		})
	})
end