local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Start = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, { Content = p1.startSlot }),
		End = reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, { Content = p1.endSlot })
	})
end