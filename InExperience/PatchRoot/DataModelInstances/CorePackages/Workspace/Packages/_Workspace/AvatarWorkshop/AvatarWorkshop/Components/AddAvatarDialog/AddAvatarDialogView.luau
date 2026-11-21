local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AvatarPreviewContainerModule = require(AvatarWorkshop.Components.AvatarPreview.AvatarPreviewContainer)
local _ = require(AvatarWorkshop.Components.AvatarPreview.useAvatarPreviewViewModel)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), FoundationModule (copy), AvatarPreviewContainerModule (copy), Orientation (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "avatar-workshop-add-avatar-dialog",
		size = DialogSize.Small,
		onClose = p1.onCancel
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = p1.bodyText }),
			Preview = ReactModule.createElement(View, {
				tag = "size-full-0 radius-medium clip bg-shift-200",
				LayoutOrder = 2,
				testId = "avatar-workshop-add-avatar-dialog-preview",
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.ScaleWithParentSize,
					DominantAxis = Enum.DominantAxis.Width
				}
			}, {
				Preview = if p1.previewProps == nil and p1.hasLoadFailed then ReactModule.createElement(View, { tag = "size-full padding-medium" }, {
					ErrorState = ReactModule.createElement(FoundationModule.Empty, {
						testId = "avatar-workshop-add-avatar-dialog-load-failed",
						text = p1.previewFailedText,
						button = { text = p1.tryAgainText, onActivated = p1.onRetryLoad }
					})
				}) elseif p1.previewProps == nil then ReactModule.createElement(View, {
					tag = "row align-x-center align-y-center size-full",
					testId = "avatar-workshop-add-avatar-dialog-preview-loading"
				}, {
					Loading = ReactModule.createElement(FoundationModule.Loading)
				}) elseif p1.hasPreviewFailed then ReactModule.createElement(View, { tag = "size-full padding-medium" }, {
					ErrorState = ReactModule.createElement(FoundationModule.Empty, {
						testId = "avatar-workshop-add-avatar-dialog-preview-failed",
						text = p1.previewFailedText,
						button = { text = p1.tryAgainText, onActivated = p1.onRetryPreview }
					})
				}) else ReactModule.createElement(AvatarPreviewContainerModule, p1.previewProps)
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = Orientation.Vertical,
			actions = {
				{
					text = p1.addText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = p1.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end