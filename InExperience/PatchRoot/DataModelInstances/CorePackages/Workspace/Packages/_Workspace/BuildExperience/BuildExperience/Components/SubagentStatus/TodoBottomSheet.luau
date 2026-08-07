local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local todoListModule = require(script.Parent.TodoList)
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 25 | named "TodoBottomSheet" ]]
	-- upvalues: reactModule (ref), sheet (ref), view (ref), text (ref), todoListModule (ref)
	local testId = p0.testId or "subagent-status-bottom-sheet"
	
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p0.isOpen,
		onClose = p0.onClose,
		snapPoints = { 0.5, 1 },
		testId = testId
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			TitleWrapper = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-y-small"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = p0.title,
					testId = `{testId}-title`
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			List = reactModule.createElement(todoListModule, {
				LayoutOrder = 1,
				items = p0.items,
				testId = `{testId}-list`
			})
		})
	})
end)