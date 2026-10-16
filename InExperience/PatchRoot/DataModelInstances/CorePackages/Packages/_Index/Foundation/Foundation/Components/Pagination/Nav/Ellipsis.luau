local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.PaginationSize)
local PaginationUtilsModule = require(script.Parent.Parent.paginationUtils)

return ReactModule.memo(function(Frame) --[[ Line: 21 | Named "Ellipsis" ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), PaginationUtilsModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		tag = PaginationUtilsModule.getCircularSlotTag(Frame.slotSize),
		testId = Frame.testId
	}, {
		Text = ReactModule.createElement(TextModule, {
			Text = "...",
			LayoutOrder = 1,
			tag = PaginationUtilsModule.getPageLabelTag(Frame.slotSize)
		})
	})
end)