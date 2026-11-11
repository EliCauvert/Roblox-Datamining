local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local UseDialogVariantsFunction = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local UseDialogModule = require(script.Parent.Parent.useDialog)

return function(Frame)
	-- upvalues: UseDialogVariantsFunction (copy), UseDialogModule (copy), ReactModule (copy), TextModule (copy)
	return ReactModule.createElement(TextModule, {
		RichText = true,
		Text = Frame.Text,
		tag = UseDialogVariantsFunction().contentText.tag,
		LayoutOrder = Frame.LayoutOrder,
		testId = `{UseDialogModule().testId}--text`
	})
end