local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		padding = { left = p1.bleed, right = p1.bleed }
	}, {
		Pressable = reactModule.createElement(view, {
			ref = p1.pressableRef,
			onActivated = p1.onActivated,
			onStateChanged = p1.onStateChanged,
			onSecondaryActivated = p1.onSecondaryActivated,
			tag = {
				["size-full-0 auto-y padding-x-small radius-medium"] = true,
				["bg-surface-100"] = p1.isHighlighted
			},
			testId = p1.testId
		}, {
			ListItem = p1.children,
			MenuAnchor = reactModule.createElement(view, {
				tag = "position-top-right anchor-top-right size-0-0",
				ref = p1.anchorRef
			})
		})
	})
end