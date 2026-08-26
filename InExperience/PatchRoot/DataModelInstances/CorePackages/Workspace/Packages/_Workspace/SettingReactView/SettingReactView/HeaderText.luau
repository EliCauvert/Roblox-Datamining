local parent = script.Parent.Parent
local reactModule = require(parent.React)
local text = require(parent.Foundation).Text

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "auto-xy content-emphasis text-heading-small",
		testId = "settings-header-text",
		Text = p1.text
	})
end)