local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)

return function(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "col align-x-center align-y-center gap-small size-full auto-xy padding-large"
	}, {
		Title = ReactModule.createElement(TextModule, {
			tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
			LayoutOrder = 1,
			Text = p1.name
		}),
		Message = ReactModule.createElement(TextModule, {
			Text = "Designed in Figma — not implemented in Foundation yet.",
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-muted",
			LayoutOrder = 2
		})
	})
end