local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChatCaptureGridModule = require(script.Parent.ChatCaptureGrid)
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), Sheet (copy), Text (copy), ChatCaptureGridModule (copy), Button (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(Sheet.Root, {
		defaultSnapPointIndex = 1,
		testId = "ChatCaptureGalleryView",
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		snapPoints = { 0.5, 1 }
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill auto-y padding-y-small text-heading-small text-align-x-left content-emphasis",
				Text = p1.titleText,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SelectionCount = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-small content-muted",
				Text = p1.selectionCountText
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Grid = ReactModule.createElement(ChatCaptureGridModule, {
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
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Confirm = ReactModule.createElement(Button, {
				testId = "ChatCaptureGalleryView.Confirm",
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onConfirm,
				size = InputSize.Medium,
				text = p1.addText,
				variant = ButtonVariant.Emphasis
			})
		})
	})
end