local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local useDialogModule = require(script.Parent.Parent.useDialog)

return function(p0) --[[ line: 17 | named "DialogText" ]]
	-- upvalues: useDialogVariants (ref), useDialogModule (ref), reactModule (ref), textModule (ref)
	return reactModule.createElement(textModule, {
		RichText = true,
		Text = p0.Text,
		tag = useDialogVariants().contentText.tag,
		LayoutOrder = p0.LayoutOrder,
		testId = `{useDialogModule().testId}--text`
	})
end