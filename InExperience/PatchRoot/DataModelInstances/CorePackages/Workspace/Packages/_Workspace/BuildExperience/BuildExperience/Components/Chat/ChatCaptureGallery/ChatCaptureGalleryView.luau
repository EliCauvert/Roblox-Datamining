local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ChatCaptureEmptyStateModule = require(script.Parent.ChatCaptureEmptyState)
local ChatCaptureGridModule = require(script.Parent.ChatCaptureGrid)
local _ = require(script.Parent.ChatCaptureToolbarIllustration)
local FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabled)
local Button = FoundationModule.Button
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule (copy), ReactModule (copy), Sheet (copy), Text (copy), ChatCaptureEmptyStateModule (copy), ChatCaptureGridModule (copy), Button (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy)
	local Education = if FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule and p1.education ~= nil and p1.education.isShown then p1.education else nil
	
	return ReactModule.createElement(Sheet.Root, {
		testId = "ChatCaptureGalleryView",
		defaultSnapPointIndex = if Education == nil then 1 else 2,
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
				Text = p1.selectionCountText,
				Visible = Education == nil
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			EmptyState = if Education == nil then nil else ReactModule.createElement(ChatCaptureEmptyStateModule, {
				descriptionText = Education.descriptionText,
				emptyText = p1.emptyText,
				howToSteps = Education.howToSteps,
				toolbarLayout = Education.toolbarLayout
			}),
			Grid = if Education == nil then ReactModule.createElement(ChatCaptureGridModule, {
				captures = p1.captures,
				isFinished = p1.isFinished,
				isLoading = p1.isLoading,
				isSelected = p1.isSelected,
				emptyText = p1.emptyText,
				onCaptureToggled = p1.onCaptureToggled,
				onShowMore = p1.onShowMore,
				shouldProgressivelyLoad = p1.shouldProgressivelyLoad,
				showMoreText = p1.showMoreText
			}) else nil
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Confirm = ReactModule.createElement(Button, {
				testId = "ChatCaptureGalleryView.Confirm",
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onConfirm,
				size = InputSize.Medium,
				text = if Education == nil then p1.addText else Education.dismissText,
				variant = ButtonVariant.Emphasis
			})
		})
	})
end