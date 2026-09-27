local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)

return function()
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		Text = "Comments are read-only",
		tag = "auto-xy text-body-small content-muted",
		testId = "moments-comments-read-only"
	})
end