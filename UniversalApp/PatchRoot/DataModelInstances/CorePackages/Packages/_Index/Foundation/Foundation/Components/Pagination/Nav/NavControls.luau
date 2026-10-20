local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.PaginationSize)
local PaginationDirectionModule = require(Foundation.Enums.PaginationDirection)
local NavButtonModule = require(script.Parent.NavButton)
local PaginationSlotsUtilsModule = require(script.Parent.Parent.paginationSlotsUtils)
local _ = require(script.Parent.Parent.usePaginationSelectionChain)
local config = {
	start = {
		PaginationDirectionModule.First,
		PaginationDirectionModule.Backward
	},
	["end"] = {
		PaginationDirectionModule.Forward,
		PaginationDirectionModule.Last
	}
}
local config1 = { start = "left-nav", ["end"] = "right-nav" }

local function _(First, p1)
	-- upvalues: PaginationDirectionModule (copy)
	return First ~= PaginationDirectionModule.First and First ~= PaginationDirectionModule.Last or p1.hasFirstLastButtons
end

local _ = function(Backward, p1)
	-- upvalues: PaginationDirectionModule (copy)
	return if Backward == PaginationDirectionModule.First then p1.isFirstDisabled elseif Backward == PaginationDirectionModule.Backward then p1.isBackDisabled elseif Backward == PaginationDirectionModule.Forward then p1.isForwardDisabled else p1.isLastDisabled
end

return ReactModule.memo(function(Frame)
	-- upvalues: config (copy), PaginationDirectionModule (copy), PaginationSlotsUtilsModule (copy), ReactModule (copy), NavButtonModule (copy), ViewModule (copy), config1 (copy)
	local Entry = config[Frame.side]
	local Elements = {}
	local LayoutOrder = 0
	
	for i = 1, #Entry do
		local Entry1 = Entry[i]
		
		if Entry1 ~= PaginationDirectionModule.First and Entry1 ~= PaginationDirectionModule.Last or Frame.hasFirstLastButtons then
			LayoutOrder += 1
			local NAVSLOTID = PaginationSlotsUtilsModule.NAV_SLOT_IDS[Entry1]
			local SlotBindings = Frame.selection.getSlotBindings(NAVSLOTID)
			Elements[Entry1] = ReactModule.createElement(NavButtonModule, {
				baseTestId = Frame.testId,
				slotSize = Frame.size,
				direction = Entry1,
				isDisabled = if Entry1 == PaginationDirectionModule.First then Frame.isFirstDisabled elseif Entry1 == PaginationDirectionModule.Backward then Frame.isBackDisabled elseif Entry1 == PaginationDirectionModule.Forward then Frame.isForwardDisabled else Frame.isLastDisabled,
				LayoutOrder = LayoutOrder,
				onDirectionActivated = Frame.onDirectionActivated,
				ref = Frame.selection.getSlotRef(NAVSLOTID),
				Selectable = SlotBindings.Selectable,
				NextSelectionLeft = SlotBindings.NextSelectionLeft,
				NextSelectionRight = SlotBindings.NextSelectionRight,
				NextSelectionUp = SlotBindings.NextSelectionUp,
				NextSelectionDown = SlotBindings.NextSelectionDown
			})
		end
	end
	return ReactModule.createElement(ViewModule, {
		tag = "row gap-xsmall auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.testId}--{config1[Frame.side]}`
	}, Elements)
end)