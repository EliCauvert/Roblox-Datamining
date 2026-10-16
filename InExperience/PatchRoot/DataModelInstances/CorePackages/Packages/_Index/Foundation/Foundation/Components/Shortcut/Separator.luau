local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local ShortcutSeparatorModule = require(Foundation.Enums.ShortcutSeparator)
local _ = require(script.Parent.useShortcutVariants)
local config = {
	[ShortcutSeparatorModule.Or] = "/",
	[ShortcutSeparatorModule.More] = "…"
}

return function(Frame) --[[ Line: 27 | Named "Separator" ]]
	-- upvalues: ReactModule (copy), TextModule (copy), config (copy)
	return ReactModule.createElement(TextModule, {
		Text = config[Frame.separator],
		tag = Frame.variantProps.separator.tag,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end