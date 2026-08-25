local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)

return function(p0)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "col align-x-center align-y-center gap-small size-full auto-xy padding-large"
	}, {
		Title = reactModule.createElement(textModule, {
			tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
			LayoutOrder = 1,
			Text = p0.name
		}),
		Message = reactModule.createElement(textModule, {
			Text = "Designed in Figma \226\128\148 not implemented in Foundation yet.",
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-muted",
			LayoutOrder = 2
		})
	})
end