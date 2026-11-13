local ToastScheduleModule = {
	DEFAULTS = table.freeze({
		maxVisible = 3,
		queueCap = 8,
		duration = 4,
		readFloor = 2.5
	})
}

local function _(p1: number, p2)
	return if type(p1) == "number" and p1 == p1 and p1 >= 0 and p1 < 1e999 then p1 else p2
end

function ToastScheduleModule.new(p1)
	-- upvalues: ToastScheduleModule (copy)
	local P2 = p1 or {}
	local DEFAULTS = ToastScheduleModule.DEFAULTS
	local MaxVisible: number = P2.maxVisible
	local MaxVisible1 = DEFAULTS.maxVisible
	local Largest = math.max(1, (math.floor(if type(MaxVisible) == "number" and MaxVisible == MaxVisible and MaxVisible >= 0 and MaxVisible < 1e999 then MaxVisible else MaxVisible1)))
	local QueueCap: number = P2.queueCap
	local QueueCap1 = DEFAULTS.queueCap
	local Largest1 = math.max(1, (math.floor(if type(QueueCap) == "number" and QueueCap == QueueCap and QueueCap >= 0 and QueueCap < 1e999 then QueueCap else QueueCap1)))
	local Duration: number = P2.duration
	local Duration1 = DEFAULTS.duration
	local Duration2 = if type(Duration) == "number" and Duration == Duration and Duration >= 0 and Duration < 1e999 then Duration else Duration1
	local ReadFloor: number = P2.readFloor
	local ReadFloor1 = DEFAULTS.readFloor
	local ReadFloor2 = if type(ReadFloor) == "number" and ReadFloor == ReadFloor and ReadFloor >= 0 and ReadFloor < 1e999 then ReadFloor else ReadFloor1
	local Now = P2.now or os.clock
	local List = {}
	local List1 = {}
	local Id = 0
	local Flag = false
	local List2 = {}
	local Count = 0
	local List3 = {}
	
	local function guarded(Enqueue, ...)
		-- upvalues: Count (ref), List3 (copy)
		Count += 1
		local Success, Result = pcall(Enqueue, ...)
		local Result1 = if Success then nil else Result
		
		if Success and Count == 1 then
			while Result1 == nil and #List3 > 0 do
				local Success1, Result2 = pcall((assert(table.remove(List3, 1))))
				Result1 = if Success1 then nil else Result2
			end
		end
		Count -= 1
		
		if Result1 ~= nil then
			table.clear(List3)
			error(Result1, 0)
		end
		return Result
	end
	
	local function outranks(A, B): boolean
		return if A.priority == B.priority then A.id < B.id else B.priority < A.priority
	end
	
	local function _(p2, p3)
		-- upvalues: Flag (ref), P2 (copy), List3 (copy)
		Flag = true
		local OnDismiss = P2.onDismiss
		
		if OnDismiss then
			table.insert(List3, function()
				-- upvalues: OnDismiss (copy), p2 (copy), p3 (copy)
				OnDismiss(p2, p3)
			end)
		end
	end
	
	local _ = function(p2, p3): boolean
		return p2.shownAt ~= nil and p2.readFloor <= p3 - p2.shownAt
	end
	
	local _ = function(Key)
		-- upvalues: List (copy)
		if Key == nil then
			return nil
		end
		for i, value in List do
			if value.key == Key then
				return i
			end
		end
		return nil
	end
	
	local _ = function()
		-- upvalues: List1 (copy), List (copy)
		local v1 = nil
		for i, value in List1 do
			local Key = value.key
			
			if Key == nil then
				v1 = nil
			else
				v1 = nil
				
				for i1, value1 in List do
					if value1.key == Key then
						v1 = i1
						break
					end
				end
			end
			if v1 == nil then
				return i
			end
		end
		return nil
	end
	
	local _ = function(Entry, Reason)
		-- upvalues: List2 (copy)
		if not Entry.asked[Reason] then
			Entry.asked[Reason] = true
			table.insert(List2, { entry = Entry, reason = Reason })
		end
	end
	
	local _ = function(Index, ShownAt)
		-- upvalues: List1 (copy), List (copy), Flag (ref)
		local v2 = assert(table.remove(List1, Index))
		v2.shownAt = ShownAt
		table.insert(List, v2)
		Flag = true
	end
	
	local function resolve()
		-- upvalues: Now (copy), List (copy), List2 (copy), Flag (ref), P2 (copy), List3 (copy), List1 (copy), Largest (copy)
		local NowResult = Now()
		
		for _, Entry in table.clone(List) do
			if Entry.duration <= NowResult - assert(Entry.shownAt) then
				if not Entry.held then
					table.remove(List, assert(table.find(List, Entry)))
					Flag = true
					local OnDismiss = P2.onDismiss
					
					if OnDismiss then
						local v2 = "timeout"
						table.insert(List3, function()
							-- upvalues: OnDismiss (copy), Entry (copy), v2 (copy)
							OnDismiss(Entry, v2)
						end)
					end
				elseif not Entry.asked.timeout then
					Entry.asked.timeout = true
					table.insert(List2, { reason = "timeout", entry = Entry })
				end
			end
		end
		local Index = nil
		for _, value in List1 do
			local Key = value.key
			
			if Key == nil then
				Index = nil
			else
				Index = nil
				
				for i, value1 in List do
					if value1.key == Key then
						Index = i
						break
					end
				end
			end
			if Index then
				local Entry1 = List[Index]
				
				if Entry1.shownAt ~= nil and NowResult - Entry1.shownAt >= Entry1.readFloor then
					if List[Index].held then
						local Entry2 = List[Index]
						
						if not Entry2.asked.supersede then
							Entry2.asked.supersede = true
							table.insert(List2, { reason = "supersede", entry = Entry2 })
						end
					else
						local v3 = assert(table.remove(List, Index))
						Flag = true
						local OnDismiss1 = P2.onDismiss
						
						if OnDismiss1 then
							local v4 = "supersede"
							table.insert(List3, function()
								-- upvalues: OnDismiss1 (copy), v3 (copy), v4 (copy)
								OnDismiss1(v3, v4)
							end)
						end
					end
				end
			end
		end
		local Index1 = nil
		local v5 = nil
		local Index3 = nil
		local v6 = nil
		local Index2 = nil
		while #List < Largest do
			Index1 = nil
			
			for i3, value4 in List1 do
				local Key = value4.key
				
				if Key == nil then
					v5 = nil
				else
					v5 = nil
					
					for i4, value5 in List do
						if value5.key == Key then
							v5 = i4
							break
						end
					end
				end
				if v5 == nil then
					Index1 = i3
					break
				end
			end
			if Index1 == nil then break end
			local v7 = assert(table.remove(List1, Index1))
			v7.shownAt = NowResult
			table.insert(List, v7)
			Flag = true
		end
		while Largest <= #List do
			Index3 = nil
			
			for i1, value2 in List1 do
				local Key = value2.key
				
				if Key == nil then
					v6 = nil
				else
					v6 = nil
					
					for i5, value6 in List do
						if value6.key == Key then
							v6 = i5
							break
						end
					end
				end
				if v6 == nil then
					Index3 = i1
					break
				end
			end
			if Index3 == nil then break end
			Index2 = 1
			
			for i2, value3 in List do
				local Entry3 = List[Index2]
				
				if if Entry3.priority == value3.priority then Entry3.id < value3.id else value3.priority < Entry3.priority then
					Index2 = i2
				end
			end
			local Entry4 = List1[Index3]
			local Entry5 = List[Index2]
			
			if not (if Entry4.priority == Entry5.priority then Entry4.id < Entry5.id else Entry5.priority < Entry4.priority) then break end
			local Entry6 = List[Index2]
			
			if Entry6.shownAt == nil or NowResult - Entry6.shownAt < Entry6.readFloor then break end
			if List[Index2].held then
				local Entry7 = List[Index2]
				
				if Entry7.asked.preempt then break end
				Entry7.asked.preempt = true
				table.insert(List2, { reason = "preempt", entry = Entry7 })
				break
			end
			local v8 = assert(table.remove(List, Index2))
			Flag = true
			local OnDismiss2 = P2.onDismiss
			
			if OnDismiss2 then
				local v9 = "preempt"
				table.insert(List3, function()
					-- upvalues: OnDismiss2 (copy), v8 (copy), v9 (copy)
					OnDismiss2(v8, v9)
				end)
			end
			local v10 = assert(table.remove(List1, Index3))
			v10.shownAt = NowResult
			table.insert(List, v10)
			Flag = true
		end
		if Flag then
			Flag = false
			
			if P2.onChange then
				table.insert(List3, P2.onChange)
			end
		end
		local OnProposeFunction = P2.onPropose
		
		for _, value7 in List2 do
			if OnProposeFunction then
				table.insert(List3, function()
					-- upvalues: OnProposeFunction (copy), value7 (copy)
					OnProposeFunction(value7.entry, value7.reason)
				end)
			end
		end
		table.clear(List2)
		
		return nil
	end
	
	local function enqueue(p2)
		-- upvalues: Id (ref), Duration2 (copy), ReadFloor2 (copy), List1 (copy), Flag (ref), P2 (copy), List3 (copy), outranks (copy), Largest1 (copy), resolve (copy)
		Id += 1
		local config = {
			shownAt = nil,
			id = Id,
			key = if type(p2.key) == "string" then p2.key else nil,
			priority = if type(p2.priority) == "number" and math.abs(p2.priority) < 1e999 then p2.priority else 0
		}
		local Duration = nil
		
		if p2.duration == 1e999 then
			Duration = 1e999
		else
			local Duration1: number = p2.duration
			Duration = if type(Duration1) == "number" and Duration1 == Duration1 and Duration1 >= 0 and Duration1 < 1e999 then Duration1 else Duration2
		end
		config.duration = Duration
		local ReadFloor: number = p2.readFloor
		config.readFloor = if type(ReadFloor) == "number" and ReadFloor == ReadFloor and ReadFloor >= 0 and ReadFloor < 1e999 then ReadFloor else ReadFloor2
		config.data = p2.data
		config.held = p2.held == true
		config.asked = {}
		
		if config.key then
			for i = #List1, 1, -1 do
				if List1[i].key == config.key then
					local v11 = assert(table.remove(List1, i))
					Flag = true
					local OnDismiss = P2.onDismiss
					
					if OnDismiss then
						local v12 = "supersede"
						table.insert(List3, function()
							-- upvalues: OnDismiss (copy), v11 (copy), v12 (copy)
							OnDismiss(v11, v12)
						end)
					end
				end
			end
		end
		table.insert(List1, config)
		Flag = true
		table.sort(List1, outranks)
		while Largest1 < #List1 do
			local v13 = assert(table.remove(List1))
			Flag = true
			local OnDismiss1 = P2.onDismiss
			
			if not OnDismiss1 then continue end
			local v14 = "capacity"
			table.insert(List3, function()
				-- upvalues: OnDismiss1 (copy), v13 (copy), v14 (copy)
				OnDismiss1(v13, v14)
			end)
		end
		resolve()
		
		return config.id
	end
	
	return {
		push = function(p3)
			-- upvalues: guarded (copy), enqueue (copy)
			return guarded(enqueue, p3)
		end,
		update = function()
			-- upvalues: guarded (copy), resolve (copy)
			guarded(resolve)
		end,
		dismiss = function(Id, p3)
			-- upvalues: guarded (copy), List (copy), List1 (copy), Flag (ref), P2 (copy), List3 (copy), resolve (copy)
			return guarded(function(): boolean
				-- upvalues: List (upval), List1 (upval), Id (copy), p3 (copy), Flag (upval), P2 (upval), List3 (upval), resolve (upval)
				for _, value in { List, List1 } do
					for i, value1 in value do
						if value1.id == Id then
							table.remove(value, i)
							local P17 = p3 or "manual"
							Flag = true
							local OnDismissFunction = P2.onDismiss
							
							if OnDismissFunction then
								table.insert(List3, function()
									-- upvalues: OnDismissFunction (copy), value1 (copy), P17 (copy)
									OnDismissFunction(value1, P17)
								end)
							end
							resolve()
							
							return true
						end
					end
				end
				return false
			end)
		end,
		visible = function()
			-- upvalues: List (copy)
			return table.clone(List)
		end,
		queued = function()
			-- upvalues: List1 (copy)
			return table.clone(List1)
		end,
		counts = function()
			-- upvalues: List (copy), List1 (copy)
			return { visible = #List, queued = #List1 }
		end,
		isEmpty = function(): boolean
			-- upvalues: List (copy), List1 (copy)
			return #List == 0 and #List1 == 0
		end
	}
end

return ToastScheduleModule