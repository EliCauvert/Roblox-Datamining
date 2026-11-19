local _ = require(script.Parent.Types)

return {
	groupIntoRows = function(List2)
		local t = {}
		local GroupIds = {}
		
		for _, value in List2 do
			local List = t[value.groupId]
			
			if List == nil then
				List = {}
				t[value.groupId] = List
				table.insert(GroupIds, value.groupId)
			end
			table.insert(List, value)
		end
		local List3 = {}
		
		for _, groupId in GroupIds do
			local List1 = t[groupId]
			table.sort(List1, function(A, B): boolean
				return if A.y == B.y then A.x < B.x else A.y < B.y
			end)
			local List4 = {}
			local Y = -1e999
			
			for _, value1 in List1 do
				if value1.isCarousel and #List4 > 0 then
					table.insert(List4[#List4], value1)
				elseif Y + value1.height / 2 < value1.y then
					Y = value1.y
					table.insert(List4, { value1 })
				else
					table.insert(List4[#List4], value1)
				end
			end
			for _, value2 in List4 do
				table.sort(value2, function(A, B): boolean
					return A.x < B.x
				end)
				local config = {
					top = 1e999,
					isFullyVisible = true,
					visibleHeight = 0,
					keys = {}
				}
				
				for _, value3 in value2 do
					table.insert(config.keys, value3.key)
					config.top = math.min(config.top, value3.y)
					config.visibleHeight = math.max(config.visibleHeight, value3.visibleHeight)
					
					if value3.visibleHeight < value3.height - 1 then
						config.isFullyVisible = false
					end
				end
				table.insert(List3, config)
			end
		end
		table.sort(List3, function(A, B): boolean
			return A.top < B.top
		end)
		
		return List3
	end,
	pickRow = function(List)
		local v1 = nil
		
		for _, value in List do
			if value.isFullyVisible then
				return value
			elseif v1 == nil or v1.visibleHeight < value.visibleHeight then
				v1 = value
			end
		end
		return v1
	end,
	nextInRow = function(Entry, Value)
		if #Entry == 0 then
			return nil
		else
			local FoundIndex = if Value then table.find(Entry, Value) else nil
			
			return if FoundIndex == nil then Entry[1] else Entry[FoundIndex % #Entry + 1]
		end
	end,
	chooseActiveKey = function(p1)
		if p1.inputMode ~= "Touch" then
			return nil, nil
		elseif p1.selectedKey then
			return p1.selectedKey, "Selected"
		else
			local Row = p1.row
			
			if Row == nil or #Row == 0 then
				return nil, nil
			elseif p1.rowCurrentKey and table.find(Row, p1.rowCurrentKey) then
				return p1.rowCurrentKey, "Row"
			else
				return Row[1], "Row"
			end
		end
	end
}