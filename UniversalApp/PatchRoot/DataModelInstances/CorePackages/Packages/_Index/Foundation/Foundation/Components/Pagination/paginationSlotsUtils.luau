local paginationDirectionModule = require(script:FindFirstAncestor("Foundation").Enums.PaginationDirection)
local t = {
	[paginationDirectionModule.First] = "first",
	[paginationDirectionModule.Backward] = "back",
	[paginationDirectionModule.Forward] = "forward",
	[paginationDirectionModule.Last] = "last"
}

return {
	NAV_SLOT_IDS = t,
	getPageSlotId = function(p0) --[[ line: 71 ]]
		return `page-{p0}`
	end,
	getPaginationSelectableSlotOrder = function(p1) --[[ line: 76 ]]
		-- upvalues: t (ref), paginationDirectionModule (ref)
		local t_1 = {}
		
		if p1.hasFirstLastButtons and not p1.isFirstDisabled then
			table.insert(t_1, t[paginationDirectionModule.First])
		end
		if not p1.isBackDisabled then
			table.insert(t_1, t[paginationDirectionModule.Backward])
		end
		if p1.pageSlots then
			for i, v in p1.pageSlots do
				if v ~= "ellipsis" and v ~= p1.currentPage then
					table.insert(t_1, `page-{v}`)
				end
			end
		end
		if not p1.isForwardDisabled then
			table.insert(t_1, t[paginationDirectionModule.Forward])
		end
		if p1.hasFirstLastButtons and not p1.isLastDisabled then
			table.insert(t_1, t[paginationDirectionModule.Last])
		end
		return t_1
	end,
	getVisiblePageSlots = function(p2, p3) --[[ line: 30 ]]
		if p3 <= 7 then
			local t = {}
			
			for i = 1, p3 do
				table.insert(t, i)
			end
			return t
		else
			local t = {}
			
			if p2 <= 4 then
				table.insert(t, 1)
				table.insert(t, 2)
				table.insert(t, 3)
				table.insert(t, 4)
				table.insert(t, 5)
				table.insert(t, "ellipsis")
				table.insert(t, p3)
				
				return t
			elseif p3 - 4 + 1 <= p2 then
				table.insert(t, 1)
				table.insert(t, "ellipsis")
				
				for i_1 = p3 - 4, p3 do
					table.insert(t, i_1)
				end
				return t
			else
				table.insert(t, 1)
				table.insert(t, "ellipsis")
				
				for i_2 = p2 - 1, p2 + 1 do
					table.insert(t, i_2)
				end
				table.insert(t, "ellipsis")
				table.insert(t, p3)
				
				return t
			end
		end
	end
}