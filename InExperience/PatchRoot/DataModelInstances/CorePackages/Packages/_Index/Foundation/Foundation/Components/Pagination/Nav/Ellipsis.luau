local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.PaginationSize)
local paginationUtilsModule = require(script.Parent.Parent.paginationUtils)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), viewModule (ref), paginationUtilsModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		tag = paginationUtilsModule.getCircularSlotTag(p0.slotSize),
		testId = p0.testId
	}, {
		Text = reactModule.createElement(textModule, {
			Text = "...",
			LayoutOrder = 1,
			tag = paginationUtilsModule.getPageLabelTag(p0.slotSize)
		})
	})
end)