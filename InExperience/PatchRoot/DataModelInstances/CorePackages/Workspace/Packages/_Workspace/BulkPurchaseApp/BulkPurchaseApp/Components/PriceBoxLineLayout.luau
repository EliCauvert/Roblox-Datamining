local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p0)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Start = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, { Content = p0.startSlot }),
		End = reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, { Content = p0.endSlot })
	})
end