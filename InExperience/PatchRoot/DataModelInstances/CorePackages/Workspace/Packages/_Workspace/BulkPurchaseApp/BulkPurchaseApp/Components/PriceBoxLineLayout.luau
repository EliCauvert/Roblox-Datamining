local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(Frame) --[[ Line: 13 | Named "PriceBoxLineLayout" ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Start = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill auto-y" }, { Content = Frame.startSlot }),
		End = ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy" }, { Content = Frame.endSlot })
	})
end