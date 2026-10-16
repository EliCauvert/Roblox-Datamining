local PaginationDirectionModule = require(script:FindFirstAncestor("Foundation").Enums.PaginationDirection)
local config = {
	[PaginationDirectionModule.First] = "first",
	[PaginationDirectionModule.Backward] = "back",
	[PaginationDirectionModule.Forward] = "forward",
	[PaginationDirectionModule.Last] = "last"
}

return {
	NAV_SLOT_IDS = config,
	getPageSlotId = function(p1): string --[[ Line: 71 ]]
		return `page-{p1}`
	end,
	getPaginationSelectableSlotOrder = function(p1) --[[ Line: 76 ]]
		-- upvalues: config (copy), PaginationDirectionModule (copy)
		local List = {}
		
		if p1.hasFirstLastButtons and not p1.isFirstDisabled then
			table.insert(List, config[PaginationDirectionModule.First])
		end
		if not p1.isBackDisabled then
			table.insert(List, config[PaginationDirectionModule.Backward])
		end
		if p1.pageSlots then
			for _, pageSlot in p1.pageSlots do
				if pageSlot ~= "ellipsis" and pageSlot ~= p1.currentPage then
					table.insert(List, `page-{pageSlot}`)
				end
			end
		end
		if not p1.isForwardDisabled then
			table.insert(List, config[PaginationDirectionModule.Forward])
		end
		if p1.hasFirstLastButtons and not p1.isLastDisabled then
			table.insert(List, config[PaginationDirectionModule.Last])
		end
		return List
	end,
	getVisiblePageSlots = function(p2: number, p3: number) --[[ Line: 30 ]]
		if p3 <= 7 then
			local List = {}
			
			for i = 1, p3 do
				table.insert(List, i)
			end
			return List
		else
			local List1 = {}
			
			if p2 <= 4 then
				table.insert(List1, 1)
				table.insert(List1, 2)
				table.insert(List1, 3)
				table.insert(List1, 4)
				table.insert(List1, 5)
				table.insert(List1, "ellipsis")
				table.insert(List1, p3)
				
				return List1
			end
			if p3 - 4 + 1 <= p2 then
				table.insert(List1, 1)
				table.insert(List1, "ellipsis")
				
				for i1 = p3 - 4, p3 do
					table.insert(List1, i1)
				end
				return List1
			else
				table.insert(List1, 1)
				table.insert(List1, "ellipsis")
				
				for i2 = p2 - 1, p2 + 1 do
					table.insert(List1, i2)
				end
				table.insert(List1, "ellipsis")
				table.insert(List1, p3)
				
				return List1
			end
		end
	end
}