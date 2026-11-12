local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local DiagnosticsModule = require(script:FindFirstAncestor("ViewRecycler").Core.Diagnostics)
local Frozen = table.freeze({})

local function _(p1: number): boolean
	return p1 == nil or p1 >= 0 and p1 % 1 == 0
end

local _ = function(List, p1, p2, p3, p4, p5)
	table.insert(List, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
end

return function(p1)
	-- upvalues: DiagnosticsModule (copy), Frozen (copy), FFlagViewRecyclerReact08 (copy)
	local Adapter = p1.adapter
	local Tbl = {}
	local Tbl1 = {}
	local Flag = false
	local Flag1 = false
	local Batch = Adapter.batch or function(Callback: () -> ())
		Callback()
	end
	
	local function poolFor(ViewType)
		-- upvalues: Tbl (copy)
		local Entry = Tbl[ViewType]
		
		if Entry == nil then
			Entry = { first = 1, last = 0, viewType = ViewType, items = {} }
			Tbl[ViewType] = Entry
		end
		return Entry
	end
	
	local function _(Key)
		-- upvalues: Tbl1 (copy)
		Tbl1[Key] = nil
	end
	
	local function notify(Action, ViewType, OccupiedDelta, VacantDelta, TotalDelta)
		-- upvalues: p1 (copy)
		if p1.onPoolChanged ~= nil then
			p1.onPoolChanged({
				action = Action,
				viewType = ViewType,
				occupiedDelta = OccupiedDelta,
				vacantDelta = VacantDelta,
				totalDelta = TotalDelta
			})
		end
	end
	
	local function finalize(p2, CreateResults, p3, Enabled)
		-- upvalues: Adapter (copy), Batch (copy), notify (copy)
		if (p2 == nil or #p2 == 0) and (#CreateResults == 0 and (p3 == nil or #p3 == 0 or Adapter.onCreated == nil)) then
			return true, nil
		else
			local v1 = nil
			
			local function _(p4, p5)
				-- upvalues: v1 (ref)
				if not p4 and v1 == nil then
					v1 = p5
				end
			end
			
			local Packed = table.pack(pcall(Batch, function()
				-- upvalues: p2 (copy), notify (upval), v1 (ref), Enabled (copy), CreateResults (copy), Adapter (upval), p3 (copy)
				if p2 ~= nil then
					for _, value in p2 do
						local Success, Result = pcall(notify, value[1], value[2], value[3], value[4], value[5])
						
						if not Success and v1 == nil then
							v1 = Result
						end
					end
				end
				if Enabled ~= false and #CreateResults > 0 and Adapter.onEvicted ~= nil then
					local Success1, Result1 = pcall(Adapter.onEvicted, CreateResults)
					
					if not Success1 and v1 == nil then
						v1 = Result1
					end
				end
				for _, createResult in CreateResults do
					local Success2, Result2 = pcall(Adapter.destroy, createResult)
					
					if not Success2 and v1 == nil then
						v1 = Result2
					end
				end
				if p3 ~= nil and #p3 > 0 and Adapter.onCreated ~= nil then
					local Success3, Result3 = pcall(Adapter.onCreated, p3)
					
					if not Success3 and v1 == nil then
						v1 = Result3
					end
				end
				if v1 ~= nil then
					error(v1, 0)
				end
			end))
			
			return Packed[1], Packed[2]
		end
	end
	
	local function trimPoolExcess(p4, Capacity, List, List1)
		-- upvalues: Tbl1 (copy), DiagnosticsModule (upval)
		while Capacity < p4.last - p4.first + 1 do
			local Item = p4.items[p4.first]
			p4.items[p4.first] = nil
			p4.first += 1
			Tbl1[Item] = nil
			table.insert(List, Item)
			
			if List1 ~= nil then
				table.insert(List1, {
					DiagnosticsModule.PoolAction.Evict,
					p4.viewType,
					0,
					-1,
					-1
				})
			end
		end
	end
	
	local function uniformDirectReuse(Releases, Entry)
		-- upvalues: Tbl1 (copy)
		local CountReleases = #Releases
		
		if CountReleases == 0 or CountReleases ~= #Entry then
			return nil
		end
		local ViewType = Entry[1].viewType
		
		for i = 2, CountReleases do
			if Entry[i].viewType ~= ViewType then
				return nil
			end
		end
		for i1, releas in Releases do
			local Entry1 = Tbl1[releas]
			
			if Entry1 == nil or not Entry1.active then
				error("RecyclingScope: can only release an active view", 3)
			end
			if Entry1.viewType ~= ViewType then
				return nil
			end
			for i2 = 1, i1 - 1 do
				if Releases[i2] == releas then
					error("RecyclingScope: cannot release one view more than once", 3)
				end
			end
		end
		local Buffer = table.create(CountReleases)
		
		for i3 = 1, CountReleases do
			Buffer[i3] = Releases[CountReleases - i3 + 1]
		end
		return { releasedCount = 0, acquired = Buffer }
	end
	
	local Tbl2 = {}
	local Tbl3 = {}
	
	local function exchangeWithoutCreation(Releases, Requests, List)
		-- upvalues: Tbl1 (copy), Tbl2 (copy), DiagnosticsModule (upval), Frozen (upval), Tbl3 (copy), Tbl (copy)
		if #Requests == 0 then
			for _, releas in Releases do
				local Entry = Tbl1[releas]
				
				if Entry == nil or not Entry.active then
					table.clear(Tbl2)
					error("RecyclingScope: can only release an active view", 3)
				end
				if Tbl2[releas] then
					table.clear(Tbl2)
					error("RecyclingScope: cannot release one view more than once", 3)
				end
				Tbl2[releas] = true
			end
			table.clear(Tbl2)
			
			for _, releas1 in Releases do
				local Entry = Tbl1[releas1]
				Entry.active = false
				local Pool = Entry.pool
				Pool.last += 1
				Pool.items[Pool.last] = releas1
				
				if List ~= nil then
					table.insert(List, {
						DiagnosticsModule.PoolAction.Release,
						Entry.viewType,
						-1,
						1,
						0
					})
				end
			end
			return { acquired = Frozen, releasedCount = #Releases }
		else
			if #Releases ~= 0 then
				return nil
			end
			local Flag = true
			
			for _, request in Requests do
				local ViewType = request.viewType
				local Entry = Tbl3[ViewType]
				
				if Entry == nil then
					local Entry1 = Tbl[ViewType]
					Entry = if Entry1 == nil then 0 else Entry1.last - Entry1.first + 1
				end
				if Entry == 0 then
					Flag = false
					break
				else
					Tbl3[ViewType] = Entry - 1
					continue
				end
			end
			table.clear(Tbl3)
			
			if not Flag then
				return nil
			end
			local Buffer = table.create(#Requests)
			
			for i, request1 in Requests do
				local Entry = Tbl[request1.viewType]
				local Item = Entry.items[Entry.last]
				Entry.items[Entry.last] = nil
				Entry.last -= 1
				Tbl1[Item].active = true
				Buffer[i] = Item
				
				if List ~= nil then
					table.insert(List, {
						DiagnosticsModule.PoolAction.Acquire,
						request1.viewType,
						1,
						-1,
						0
					})
				end
			end
			return { releasedCount = 0, acquired = Buffer }
		end
	end
	
	return {
		bind = function(p5)
			-- upvalues: Flag (ref), Flag1 (ref), FFlagViewRecyclerReact08 (upval), Adapter (copy), uniformDirectReuse (copy), p1 (copy), Tbl (copy), trimPoolExcess (copy), finalize (copy), exchangeWithoutCreation (copy), Frozen (upval), Tbl1 (copy), DiagnosticsModule (upval), poolFor (copy)
			assert(not Flag, "RecyclingScope: cannot bind after disposal")
			assert(not Flag1, "RecyclingScope: cannot bind reentrantly")
			local Capacity: number = p5.capacity
			assert(Capacity == nil or Capacity >= 0 and Capacity % 1 == 0, "RecyclingScope: capacity must be a non-negative integer")
			local Releases = p5.releases
			local Requests = p5.requests
			local v2 = nil
			local UniformDirectReuseResult = nil
			
			if FFlagViewRecyclerReact08 then
				v2 = nil
				
				if Adapter.isDestroyed ~= nil then
					for _, releas in Releases do
						if Adapter.isDestroyed(releas) then
							local V50 = v2 or {}
							V50[releas] = true
							v2 = V50
						end
					end
				end
				UniformDirectReuseResult = if v2 == nil then uniformDirectReuse(Releases, Requests) else nil
			else
				UniformDirectReuseResult = uniformDirectReuse(Releases, Requests)
			end
			if UniformDirectReuseResult == nil then
				local T = if p1.onPoolChanged == nil then nil else {}
				local ExchangeWithoutCreationResult = if FFlagViewRecyclerReact08 then if v2 == nil then exchangeWithoutCreation(Releases, Requests, T) else nil else exchangeWithoutCreation(Releases, Requests, T)
				
				if ExchangeWithoutCreationResult == nil then
					Flag1 = true
					local t = {}
					local t1 = {}
					
					for _, releas1 in Releases do
						local Entry = Tbl1[releas1]
						
						if Entry == nil or not Entry.active then
							Flag1 = false
							error("RecyclingScope: can only release an active view", 2)
						end
						if t1[releas1] then
							Flag1 = false
							error("RecyclingScope: cannot release one view more than once", 2)
						end
						t1[releas1] = true
						
						if not FFlagViewRecyclerReact08 or v2 == nil or not v2[releas1] then
							local List = t[Entry.viewType]
							
							if List == nil then
								List = {}
								t[Entry.viewType] = List
							end
							table.insert(List, releas1)
						end
					end
					local t2 = {}
					local t3 = {}
					local t4 = {}
					local t5 = {}
					local CreateResults = {}
					local t6 = {}
					local Success, Result = pcall(function()
						-- upvalues: Requests (copy), t (copy), t3 (copy), t5 (copy), t2 (copy), Tbl (upval), t4 (copy), Adapter (upval), Tbl1 (upval), t6 (copy), CreateResults (copy)
						for i, request in Requests do
							local Entry = t[request.viewType]
							local Removed = if Entry == nil then nil else table.remove(Entry)
							
							if Removed ~= nil then
								t3[i] = Removed
								t5[Removed] = true
								continue
							end
							local Entry1 = t2[request.viewType]
							
							if Entry1 == nil then
								local Entry11 = Tbl[request.viewType]
								Entry1 = if Entry11 == nil then 0 else Entry11.last - Entry11.first + 1
							end
							if Entry1 > 0 then
								t2[request.viewType] = Entry1 - 1
								t4[i] = true
							else
								t2[request.viewType] = 0
								local NewAdapter = Adapter.create(request.viewType)
								assert(Tbl1[NewAdapter] == nil and not t6[NewAdapter], "RecyclingScope: create must return a new view")
								t6[NewAdapter] = true
								CreateResults[i] = NewAdapter
							end
						end
					end)
					
					if not Success then
						finalize(nil, CreateResults, nil, false)
						Flag1 = false
						error(Result, 0)
					end
					local config = {
						releasedCount = 0,
						acquired = if #Requests == 0 then Frozen else table.create(#Requests)
					}
					local T1 = if p1.onPoolChanged == nil then nil else {}
					local List1 = {}
					
					for _, releas2 in Releases do
						if FFlagViewRecyclerReact08 then
							if v2 == nil or not v2[releas2] then
								local Entry1 = t5[releas2]
								local Entry3 = nil
								
								if not Entry1 then
									Entry3 = Tbl1[releas2]
									Entry3.active = false
									local Pool = Entry3.pool
									Pool.last += 1
									Pool.items[Pool.last] = releas2
									config.releasedCount += 1
									Entry1 = T1 == nil
								end
								if not Entry1 then
									table.insert(T1, {
										DiagnosticsModule.PoolAction.Release,
										Entry3.viewType,
										-1,
										1,
										0
									})
								end
							else
								local Entry2 = Tbl1[releas2]
								Tbl1[releas2] = nil
								table.insert(List1, releas2)
								
								if T1 ~= nil then
									table.insert(T1, {
										DiagnosticsModule.PoolAction.Evict,
										Entry2.viewType,
										-1,
										0,
										-1
									})
									continue
								end
							end
						else
							local Entry = t5[releas2]
							local Entry4 = nil
							
							if not Entry then
								Entry4 = Tbl1[releas2]
								Entry4.active = false
								local Pool = Entry4.pool
								Pool.last += 1
								Pool.items[Pool.last] = releas2
								config.releasedCount += 1
								Entry = T1 == nil
							end
							if not Entry then
								table.insert(T1, {
									DiagnosticsModule.PoolAction.Release,
									Entry4.viewType,
									-1,
									1,
									0
								})
							end
						end
					end
					for i, request in Requests do
						local Entry5 = t3[i]
						
						if Entry5 == nil and t4[i] then
							local Entry6 = Tbl[request.viewType]
							Entry5 = Entry6.items[Entry6.last]
							Entry6.items[Entry6.last] = nil
							Entry6.last -= 1
							Tbl1[Entry5].active = true
							
							if T1 ~= nil then
								table.insert(T1, {
									DiagnosticsModule.PoolAction.Acquire,
									request.viewType,
									1,
									-1,
									0
								})
							end
						elseif Entry5 == nil then
							Entry5 = CreateResults[i]
							Tbl1[Entry5] = {
								active = true,
								viewType = request.viewType,
								pool = poolFor(request.viewType)
							}
							
							if T1 ~= nil then
								table.insert(T1, {
									DiagnosticsModule.PoolAction.Create,
									request.viewType,
									1,
									0,
									1
								})
							end
						end
						table.insert(config.acquired, Entry5)
					end
					local Capacity1 = p5.capacity
					
					if Capacity1 ~= nil then
						for _, value2 in Tbl do
							trimPoolExcess(value2, Capacity1, List1, T1)
						end
					end
					local List2 = {}
					
					for _, createResult in CreateResults do
						table.insert(List2, createResult)
					end
					local FinalizeResult3, FinalizeResult2_2 = finalize(T1, List1, List2)
					Flag1 = false
					
					if not FinalizeResult3 then
						error(FinalizeResult2_2, 0)
					end
					return config
				else
					local Frozen1 = Frozen
					local Capacity2 = p5.capacity
					
					if Capacity2 ~= nil then
						Frozen1 = {}
						
						for _, value1 in Tbl do
							trimPoolExcess(value1, Capacity2, Frozen1, T)
						end
					end
					Flag1 = true
					local FinalizeResult1, FinalizeResult2_1 = finalize(T, Frozen1, nil)
					Flag1 = false
					
					if not FinalizeResult1 then
						error(FinalizeResult2_1, 0)
					end
					return ExchangeWithoutCreationResult
				end
			else
				local Capacity3 = p5.capacity
				
				if Capacity3 ~= nil then
					local t = {}
					local T1 = if p1.onPoolChanged == nil then nil else {}
					for _, value in Tbl do
						trimPoolExcess(value, Capacity3, t, T1)
					end
					if #t > 0 then
						Flag1 = true
						local FinalizeResult, FinalizeResult2 = finalize(T1, t, nil)
						Flag1 = false
						
						if not FinalizeResult then
							error(FinalizeResult2, 0)
						end
					end
				end
				return UniformDirectReuseResult
			end
		end,
		dispose = function()
			-- upvalues: Flag (ref), Flag1 (ref), p1 (copy), Tbl1 (copy), Tbl (copy), DiagnosticsModule (upval), finalize (copy)
			if Flag then return end
			assert(not Flag1, "RecyclingScope: cannot dispose during bind")
			Flag = true
			local List = {}
			local T = if p1.onPoolChanged == nil then nil else {}
			for i, value in Tbl1 do
				table.insert(List, i)
				
				if T ~= nil then
					table.insert(T, { viewType = value.viewType, occupied = value.active })
				end
			end
			table.clear(Tbl1)
			table.clear(Tbl)
			local Buffer = if T == nil then nil else table.create(#List)
			
			if Buffer ~= nil then
				for _, value1 in T do
					table.insert(Buffer, {
						DiagnosticsModule.PoolAction.Evict,
						value1.viewType,
						if value1.occupied then -1 else 0,
						if value1.occupied then 0 else -1,
						-1
					})
				end
			end
			local FinalizeResult, FinalizeResult2 = finalize(Buffer, List, nil)
			
			if not FinalizeResult then
				error(FinalizeResult2, 0)
			end
		end
	}
end