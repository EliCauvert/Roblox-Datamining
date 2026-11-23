local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SettingsFieldBaseModule = require(script.Parent.Parent.SettingsFieldBase)
local SettingsTextInputEditorModule = require(script.Parent.SettingsTextInputEditor)
local Dialog = FoundationModule.Dialog

return function(Frame)
	-- upvalues: ReactModule (copy), SettingsFieldBaseModule (copy), Dialog (copy), SettingsTextInputEditorModule (copy)
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
			Title = ReactModule.createElement(Dialog.Title, { text = Frame.title }),
			Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				Editor = ReactModule.createElement(SettingsTextInputEditorModule.Content, Frame)
			}),
			Actions = ReactModule.createElement(SettingsTextInputEditorModule.Actions, Frame)
		}) else nil
	})
end