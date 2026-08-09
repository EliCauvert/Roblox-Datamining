local _ = require(script.Parent.Parent.types)

return {
	awaitRequestState = function(p0, p1) --[[ line: 11 ]]
		while p0(false).status == "pending" do
			if p1 > os.clock() then
				task.wait()
				continue
			end
			return p0(false)
		end
		return p0(false)
	end,
	awaitRequestStateCancelled = function(p2, p3) --[[ line: 21 ]]
		while p2(false).status == "pending" and not p3() do
			task.wait()
		end
		return p2(false)
	end,
	getMaxHistorySequenceId = function(a) --[[ line: 31 ]]
		local var0 = nil
		
		for i, v in a do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" and (var0 == nil or var0 < sequenceId) then
				var0 = sequenceId
			end
		end
		return var0
	end,
	getSessionLoadHistory = function(p4) --[[ line: 42 ]]
		local var1 = if p4 ~= nil then nil else p4.history
		
		return if typeof(var1) == "table" then var1 else {}
	end,
	getNextHistoryPageToken = function(p5) --[[ line: 47 ]]
		local var2 = if p5 ~= nil then nil else p5.nextHistoryPageToken
		
		return if typeof(var2) == "string" and var2 ~= "" then var2 else nil
	end,
	collectSequenceIds = function(p6) --[[ line: 52 ]]
		local t = {}
		
		for i, v in p6 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" then
				t[sequenceId] = true
			end
		end
		return t
	end,
	historyOverlapsSequenceIds = function(p7, p8) --[[ line: 63 ]]
		for i, v in p7 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" and p8[sequenceId] then
				return true
			end
		end
		return false
	end,
	appendUniqueHistoryBySequenceId = function(p9, p10, p11) --[[ line: 73 ]]
		local var4 = 0
		
		for i, v in p10 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) ~= "number" or not p11[sequenceId] then
				if typeof(sequenceId) == "number" then
					p11[sequenceId] = true
				end
				table.insert(p9, v)
				var4 += 1
			end
		end
		return var4
	end,
	cloneHistoryBySequenceId = function(p12) --[[ line: 92 ]]
		return table.clone(p12)
	end,
	resolveNonNegativeNumber = function(p13, p14) --[[ line: 96 ]]
		return if typeof(p13) == "number" and p13 >= 0 then p13 else p14
	end,
	resolvePositiveNumber = function(p15, p16) --[[ line: 103 ]]
		return if typeof(p15) == "number" and p15 > 0 then p15 else p16
	end
}