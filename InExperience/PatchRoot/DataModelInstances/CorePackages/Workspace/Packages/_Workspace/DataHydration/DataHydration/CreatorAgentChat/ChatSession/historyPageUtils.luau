local _ = require(script.Parent.Parent.types)

return {
	awaitRequestState = function(p1, p2)
		while p1(false).status == "pending" do
			if p2 > os.clock() then
				task.wait()
				continue
			end
			return p1(false)
		end
		return p1(false)
	end,
	awaitRequestStateCancelled = function(p3, p4)
		while p3(false).status == "pending" and not p4() do
			task.wait()
		end
		return p3(false)
	end,
	getMaxHistorySequenceId = function(a)
		local var1 = nil
		
		for i, v in a do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" and (var1 == nil or var1 < sequenceId) then
				var1 = sequenceId
			end
		end
		return var1
	end,
	getSessionLoadHistory = function(p5)
		local var2 = if p5 ~= nil then nil else p5.history
		
		return if typeof(var2) == "table" then var2 else {}
	end,
	getNextHistoryPageToken = function(p5)
		local var2 = if p5 ~= nil then nil else p5.nextHistoryPageToken
		
		return if typeof(var2) == "string" and var2 ~= "" then var2 else nil
	end,
	collectSequenceIds = function(p5)
		local t = {}
		
		for i, v in p5 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" then
				t[sequenceId] = true
			end
		end
		return t
	end,
	historyOverlapsSequenceIds = function(p6, p7)
		for i, v in p6 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) == "number" and p7[sequenceId] then
				return true
			end
		end
		return false
	end,
	appendUniqueHistoryBySequenceId = function(p8, p9, p10)
		local var2 = 0
		
		for i, v in p9 do
			local sequenceId = v.sequenceId
			
			if typeof(sequenceId) ~= "number" or not p10[sequenceId] then
				if typeof(sequenceId) == "number" then
					p10[sequenceId] = true
				end
				table.insert(p8, v)
				var2 += 1
			end
		end
		return var2
	end,
	cloneHistoryBySequenceId = function(p11)
		return table.clone(p11)
	end,
	resolveNonNegativeNumber = function(p11, p12)
		return if typeof(p11) == "number" and p11 >= 0 then p11 else p12
	end,
	resolvePositiveNumber = function(p11, p12)
		return if typeof(p11) == "number" and p11 > 0 then p11 else p12
	end
}