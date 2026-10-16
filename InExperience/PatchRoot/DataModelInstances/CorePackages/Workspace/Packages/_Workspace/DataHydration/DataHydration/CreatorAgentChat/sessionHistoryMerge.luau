local _ = require(script.Parent.types)

local function _(p1) --[[ Line: 7 | Named "getSequenceId" ]]
	local SequenceId: number = p1.sequenceId
	
	return if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
end

return {
	mergeHistoryIntoMap = function(p1, List, p2) --[[ Line: 12 ]]
		for _, value in List do
			local SequenceId: number = value.sequenceId
			local SequenceId1 = if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil
			
			if SequenceId1 ~= nil and p2[SequenceId1] == nil then
				p1[SequenceId1] = value
			end
		end
	end,
	orderMergedHistoryItems = function(Tbl, List) --[[ Line: 25 ]]
		local Copy = table.clone(Tbl)
		
		for i, value in List do
			Copy[i] = value
		end
		local List1 = {}
		
		for _, value1 in Copy do
			table.insert(List1, value1)
		end
		table.sort(List1, function(A, B): boolean --[[ Line: 39 ]]
			local SequenceId: number = A.sequenceId
			local SequenceId1: number = B.sequenceId
			
			return ((if typeof(SequenceId) == "number" and SequenceId >= 0 then SequenceId else nil) or -1) < ((if typeof(SequenceId1) == "number" and SequenceId1 >= 0 then SequenceId1 else nil) or -1)
		end)
		
		return List1
	end,
	ingestOverlayUpdate = function(p3, _, Tbl, SequenceId: number): boolean --[[ Line: 48 ]]
		if typeof(SequenceId) == "number" and SequenceId >= 0 then
			local Copy = table.clone(Tbl)
			Copy.sequenceId = SequenceId
			p3[SequenceId] = Copy
			
			return true
		else
			return false
		end
	end
}