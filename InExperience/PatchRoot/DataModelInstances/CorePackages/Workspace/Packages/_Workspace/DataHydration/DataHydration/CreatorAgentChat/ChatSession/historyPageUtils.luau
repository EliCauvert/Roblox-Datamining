local _ = require(script.Parent.Parent.types)

return {
	awaitRequestState = function(Callback1, p1, Callback)
		while Callback1(false).status == "pending" do
			if p1 <= os.clock() or Callback ~= nil and Callback() then
				return Callback1(false)
			end
			task.wait()
		end
		return Callback1(false)
	end,
	awaitRequestStateCancelled = function(Callback, p2)
		while Callback(false).status == "pending" and not p2() do
			task.wait()
		end
		return Callback(false)
	end,
	getMaxHistorySequenceId = function(List)
		local v1 = nil
		
		for _, value in List do
			local SequenceId = value.sequenceId
			
			if typeof(SequenceId) == "number" and (v1 == nil or v1 < SequenceId) then
				v1 = SequenceId
			end
		end
		return v1
	end,
	getSessionLoadHistory = function(p3)
		local History = if p3 == nil then nil else p3.history
		
		return if typeof(History) == "table" then History else {}
	end,
	getNextHistoryPageToken = function(p3)
		local NextHistoryPageToken = if p3 == nil then nil else p3.nextHistoryPageToken
		
		return if typeof(NextHistoryPageToken) == "string" and NextHistoryPageToken ~= "" then NextHistoryPageToken else nil
	end,
	collectSequenceIds = function(List)
		local t = {}
		
		for _, value in List do
			local SequenceId = value.sequenceId
			
			if typeof(SequenceId) == "number" then
				t[SequenceId] = true
			end
		end
		return t
	end,
	historyOverlapsSequenceIds = function(List, p3): boolean
		for _, value in List do
			local SequenceId = value.sequenceId
			
			if typeof(SequenceId) == "number" and p3[SequenceId] then
				return true
			end
		end
		return false
	end,
	appendUniqueHistoryBySequenceId = function(List, List1, p4): number
		local Count = 0
		
		for _, value in List1 do
			local SequenceId = value.sequenceId
			
			if typeof(SequenceId) ~= "number" or not p4[SequenceId] then
				if typeof(SequenceId) == "number" then
					p4[SequenceId] = true
				end
				table.insert(List, value)
				Count += 1
			end
		end
		return Count
	end,
	cloneHistoryBySequenceId = function(Tbl)
		return table.clone(Tbl)
	end,
	resolveNonNegativeNumber = function(p5: number, p6)
		return if typeof(p5) == "number" and p5 >= 0 then p5 else p6
	end,
	resolvePositiveNumber = function(p5: number, p6)
		return if typeof(p5) == "number" and p5 > 0 then p5 else p6
	end
}