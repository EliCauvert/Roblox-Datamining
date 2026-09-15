local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local shortcutSeparatorModule = require(foundation.Enums.ShortcutSeparator)
local _ = require(script.Parent.useShortcutVariants)
local t = {
	[shortcutSeparatorModule.Or] = "/",
	[shortcutSeparatorModule.More] = "\226\128\166"
}

return function(p1)
	-- upvalues: reactModule (ref), textModule (ref), t (ref)
	return reactModule.createElement(textModule, {
		Text = t[p1.separator],
		tag = p1.variantProps.separator.tag,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end