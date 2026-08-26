local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.PaginationSize)
local paginationDirectionModule = require(foundation.Enums.PaginationDirection)
local navButtonModule = require(script.Parent.NavButton)
local paginationSlotsUtilsModule = require(script.Parent.Parent.paginationSlotsUtils)
local _ = require(script.Parent.Parent.usePaginationSelectionChain)
local t = {
	start = {
		paginationDirectionModule.First,
		paginationDirectionModule.Backward
	},
	["end"] = {
		paginationDirectionModule.Forward,
		paginationDirectionModule.Last
	}
}
local t_1 = { start = "left-nav", ["end"] = "right-nav" }

local function _(p1, p2)
	-- upvalues: paginationDirectionModule (ref)
	return if p1 == paginationDirectionModule.First or p1 == paginationDirectionModule.Last then p2.hasFirstLastButtons else true
end

local _ = function(p1, p2)
	-- upvalues: paginationDirectionModule (ref)
	return if p1 == paginationDirectionModule.First then p2.isFirstDisabled elseif p1 == paginationDirectionModule.Backward then p2.isBackDisabled elseif p1 == paginationDirectionModule.Forward then p2.isForwardDisabled else p2.isLastDisabled
end

return reactModule.memo(function(p1)
	-- upvalues: t (ref), paginationDirectionModule (ref), paginationSlotsUtilsModule (ref), reactModule (ref), navButtonModule (ref), viewModule (ref), t_1 (ref)
	local side = t[p1.side]
	local t_2 = {}
	local var1 = 0
	
	for i = 1, #side do
		local var2 = side[i]
		local var3 = if var2 == paginationDirectionModule.First or var2 == paginationDirectionModule.Last then p1.hasFirstLastButtons else true
		
		if var3 then
			var1 += 1
			var3 = paginationSlotsUtilsModule.NAV_SLOT_IDS[var2]
			local slotBindings = p1.selection.getSlotBindings(var3)
			t_2[var2] = reactModule.createElement(navButtonModule, {
				baseTestId = p1.testId,
				slotSize = p1.size,
				direction = var2,
				isDisabled = if var2 == paginationDirectionModule.First then p1.isFirstDisabled elseif var2 == paginationDirectionModule.Backward then p1.isBackDisabled elseif var2 == paginationDirectionModule.Forward then p1.isForwardDisabled else p1.isLastDisabled,
				LayoutOrder = var1,
				onDirectionActivated = p1.onDirectionActivated,
				ref = p1.selection.getSlotRef(var3),
				Selectable = slotBindings.Selectable,
				NextSelectionLeft = slotBindings.NextSelectionLeft,
				NextSelectionRight = slotBindings.NextSelectionRight,
				NextSelectionUp = slotBindings.NextSelectionUp,
				NextSelectionDown = slotBindings.NextSelectionDown
			})
		end
	end
	return reactModule.createElement(viewModule, {
		tag = "row gap-xsmall auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = `{p1.testId}--{t_1[p4.side]}`
	}, t_2)
end)