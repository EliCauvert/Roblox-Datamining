local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local ReactModule = require(Parent.React)
local Text = require(Parent.Foundation).Text

return function(Frame)
	-- upvalues: ReactModule (copy), Text (copy)
	return if Frame.text == nil or Frame.text == "" then nil else ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-system-alert",
		Text = Frame.text,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end