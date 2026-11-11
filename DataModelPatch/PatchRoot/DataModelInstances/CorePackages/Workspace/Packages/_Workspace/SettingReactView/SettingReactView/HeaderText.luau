local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local Text = require(Parent.Foundation).Text

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-xy content-emphasis text-heading-small",
		testId = "settings-header-text",
		Text = p1.text
	})
end)