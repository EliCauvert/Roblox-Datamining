-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

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

local function _(p0, p1) --[[ line: 56 | named "shouldShowNavButton" ]]
	-- upvalues: paginationDirectionModule (ref)
	return if p0 == paginationDirectionModule.First or p0 == paginationDirectionModule.Last then p1.hasFirstLastButtons else true
end

local _ = function(p2, p3) --[[ line: 64 | named "getIsDisabled" ]]
	-- upvalues: paginationDirectionModule (ref)
	return if p2 == paginationDirectionModule.First then p3.isFirstDisabled elseif p2 == paginationDirectionModule.Backward then p3.isBackDisabled elseif p2 == paginationDirectionModule.Forward then p3.isForwardDisabled else p3.isLastDisabled
end

return reactModule.memo(function(p4) --[[ line: 76 | named "NavControls" ]]
	-- upvalues: t (ref), paginationDirectionModule (ref), paginationSlotsUtilsModule (ref), reactModule (ref), navButtonModule (ref), viewModule (ref), t_1 (ref)
	local side = t[p4.side]
	local t_2 = {}
	local var9 = 0
	
	for i = 1, #side do
		local var10 = side[i]
		local var11 = if var10 == paginationDirectionModule.First or var10 == paginationDirectionModule.Last then p4.hasFirstLastButtons else true
		
		if var11 then
			var9 += 1
			var11 = paginationSlotsUtilsModule.NAV_SLOT_IDS[var10]
			local slotBindings = p4.selection.getSlotBindings(var11)
			t_2[var10] = reactModule.createElement(navButtonModule, {
				baseTestId = p4.testId,
				slotSize = p4.size,
				direction = var10,
				isDisabled = if var10 == paginationDirectionModule.First then p4.isFirstDisabled elseif var10 == paginationDirectionModule.Backward then p4.isBackDisabled elseif var10 == paginationDirectionModule.Forward then p4.isForwardDisabled else p4.isLastDisabled,
				layoutOrder = var9,
				onDirectionActivated = p4.onDirectionActivated,
				ref = p4.selection.getSlotRef(var11),
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
		LayoutOrder = p4.layoutOrder,
		testId = `{p4.testId}--{t_1[p4.side]}`
	}, t_2)
end)