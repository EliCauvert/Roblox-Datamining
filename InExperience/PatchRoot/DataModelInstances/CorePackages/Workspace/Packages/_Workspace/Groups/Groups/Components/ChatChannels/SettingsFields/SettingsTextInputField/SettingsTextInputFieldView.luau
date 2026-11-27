local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SettingsFieldBaseModule = require(script.Parent.Parent.SettingsFieldBase)
local Dialog = FoundationModule.Dialog

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), SettingsFieldBaseModule (copy), Dialog (copy)
	local Buttons = {
		{
			text = Frame.cancelText,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			onActivated = Frame.onCancel,
			testId = `{Frame.testId}--cancel`
		},
		{
			text = Frame.saveText,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			isDisabled = not Frame.canSave,
			onActivated = Frame.onSave,
			testId = `{Frame.testId}--save`
		}
	}
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Field = ReactModule.createElement(SettingsFieldBaseModule, {
			title = Frame.title,
			description = Frame.value,
			onClick = Frame.onOpen,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}),
		Editor = if Frame.isEditing then ReactModule.createElement(Dialog.Root, {
			hasBackdrop = true,
			disablePortal = false,
			ref = Frame.dialogRef,
			onClose = if Frame.hideCloseButton then nil else Frame.onCancel,
			testId = `{Frame.testId}--editor`
		}, {
			Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = Frame.title }),
			Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				Body = ReactModule.createElement(FoundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
					Description = ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
						LayoutOrder = 1,
						Text = Frame.description
					}),
					Input = ReactModule.createElement(FoundationModule.View, {
						tag = "col gap-xsmall size-full-0 auto-y",
						LayoutOrder = 2
					}, {
						TextInput = ReactModule.createElement(FoundationModule.TextInput, {
							label = "",
							LayoutOrder = 1,
							inputRef = Frame.inputRef,
							text = Frame.draft,
							onChanged = Frame.onDraftChanged,
							onReturnPressed = Frame.onSave,
							hasError = Frame.hasError,
							width = UDim.new(1, 0),
							testId = `{Frame.testId}--input`
						}),
						RemainingCharacters = ReactModule.createElement(FoundationModule.Text, {
							tag = "size-full-0 auto-y text-caption-small text-align-x-right content-muted",
							LayoutOrder = 2,
							Text = tostring(Frame.remainingCharacters)
						})
					})
				})
			}),
			Actions = ReactModule.createElement(FoundationModule.ButtonGroup, {
				LayoutOrder = 3,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				buttons = Buttons
			})
		}) else nil
	})
end