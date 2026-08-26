local _ = require(script.Parent.types)

local function _(p1)
	local sequenceId = p1.sequenceId
	
	return if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
end

return {
	mergeHistoryIntoMap = function(p1, p2, p3)
		for i, v in p2 do
			local sequenceId = v.sequenceId
			local var1 = if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil
			
			if var1 ~= nil and p3[var1] == nil then
				p1[var1] = v
			end
		end
	end,
	orderMergedHistoryItems = function(p4, p5)
		local cloned = table.clone(p4)
		
		for i, v in p5 do
			cloned[i] = v
		end
		local t = {}
		
		for i_1, v_1 in cloned do
			table.insert(t, v_1)
		end
		table.sort(t, function(p6, p7)
			local sequenceId = p6.sequenceId
			local var2 = (if typeof(sequenceId) == "number" and sequenceId >= 0 then sequenceId else nil) or -1
			local sequenceId_1 = p7.sequenceId
			sequenceId = if typeof(sequenceId_1) == "number" and sequenceId_1 >= 0 then sequenceId_1 else nil
			
			return var2 < (sequenceId or -1)
		end)
		
		return t
	end,
	ingestOverlayUpdate = function(p6, _, p7, p8)
		if typeof(p8) == "number" and p8 >= 0 then
			local cloned = table.clone(p7)
			cloned.sequenceId = p8
			p6[p8] = cloned
			
			return true
		end
		return false
	end
}