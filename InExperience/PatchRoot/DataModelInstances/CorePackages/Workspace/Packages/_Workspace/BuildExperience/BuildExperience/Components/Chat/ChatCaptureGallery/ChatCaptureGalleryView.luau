local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local chatCaptureGridModule = require(script.Parent.ChatCaptureGrid)
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), sheet (ref), text (ref), chatCaptureGridModule (ref), button (ref), fillBehavior (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 1,
		testId = "ChatCaptureGalleryView",
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		snapPoints = { 0.5, 1 }
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y padding-y-small text-heading-small text-align-x-left content-emphasis",
				Text = p1.titleText,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SelectionCount = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-small content-muted",
				Text = p1.selectionCountText
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			Grid = reactModule.createElement(chatCaptureGridModule, {
				captures = p1.captures,
				isFinished = p1.isFinished,
				isLoading = p1.isLoading,
				isSelected = p1.isSelected,
				emptyText = p1.emptyText,
				onCaptureToggled = p1.onCaptureToggled,
				onShowMore = p1.onShowMore,
				shouldProgressivelyLoad = p1.shouldProgressivelyLoad,
				showMoreText = p1.showMoreText
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Confirm = reactModule.createElement(button, {
				testId = "ChatCaptureGalleryView.Confirm",
				fillBehavior = fillBehavior.Fill,
				onActivated = p1.onConfirm,
				size = inputSize.Medium,
				text = p1.addText,
				variant = buttonVariant.Emphasis
			})
		})
	})
end