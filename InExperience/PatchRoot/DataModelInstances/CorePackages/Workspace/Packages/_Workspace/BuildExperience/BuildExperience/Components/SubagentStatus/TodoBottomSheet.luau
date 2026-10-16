local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local TodoListModule = require(script.Parent.TodoList)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "TodoBottomSheet" ]]
	-- upvalues: ReactModule (copy), Sheet (copy), View (copy), Text (copy), TodoListModule (copy)
	local TestId = p1.testId or "subagent-status-bottom-sheet"
	
	return ReactModule.createElement(Sheet.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		snapPoints = { 0.5, 1 },
		testId = TestId
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			TitleWrapper = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-y-small"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = p1.title,
					testId = `{TestId}-title`
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			List = ReactModule.createElement(TodoListModule, {
				LayoutOrder = 1,
				items = p1.items,
				testId = `{TestId}-list`
			})
		})
	})
end)