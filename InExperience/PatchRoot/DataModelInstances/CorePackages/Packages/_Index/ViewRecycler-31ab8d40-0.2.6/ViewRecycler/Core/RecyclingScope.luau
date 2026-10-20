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
	-- upvalues: Frozen (copy), DiagnosticsModule (copy)
	local MaxPoolSize: number = p1.maxPoolSize
	local MaxPoolSize1: boolean = MaxPoolSize == nil or MaxPoolSize >= 0 and MaxPoolSize % 1 == 0
	assert(MaxPoolSize1, "RecyclingScope: maxPoolSize must be a non-negative integer")
	local Adapter = p1.adapter
	MaxPoolSize1 = p1.maxPoolSize
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local Count = 1
	local Count1 = 1
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
		-- upvalues: Tbl1 (copy), Tbl2 (copy)
		local Entry = Tbl1[Key]
		local CountTbl2 = #Tbl2
		local Entry1 = Tbl2[CountTbl2]
		
		if Entry.inventoryIndex ~= CountTbl2 then
			Tbl2[Entry.inventoryIndex] = Entry1
			Tbl1[Entry1].inventoryIndex = Entry.inventoryIndex
		end
		Tbl2[CountTbl2] = nil
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
	
	local function evictExcess()
		-- upvalues: Tbl (copy), MaxPoolSize1 (ref), Tbl1 (copy), Tbl2 (copy), DiagnosticsModule (upval), p1 (copy), Adapter (copy)
		local Items = {}
		local List = {}
		
		for _, value in Tbl do
			while MaxPoolSize1 ~= nil and MaxPoolSize1 < value.last - value.first + 1 do
				local Item = value.items[value.first]
				value.items[value.first] = nil
				value.first += 1
				local Entry = Tbl1[Item]
				local CountTbl2 = #Tbl2
				local Entry1 = Tbl2[CountTbl2]
				
				if Entry.inventoryIndex ~= CountTbl2 then
					Tbl2[Entry.inventoryIndex] = Entry1
					Tbl1[Entry1].inventoryIndex = Entry.inventoryIndex
				end
				Tbl2[CountTbl2] = nil
				Tbl1[Item] = nil
				table.insert(Items, Item)
				table.insert(List, { value.viewType })
			end
		end
		for _, value1 in List do
			local Evict = DiagnosticsModule.PoolAction.Evict
			local ViewType = value1[1]
			
			if p1.onPoolChanged ~= nil then
				p1.onPoolChanged({
					occupiedDelta = 0,
					vacantDelta = -1,
					totalDelta = -1,
					action = Evict,
					viewType = ViewType
				})
			end
		end
		for _, item in Items do
			Adapter.destroy(item)
		end
	end
	
	return {
		exchange = function(Owner, List1, List2)
			-- upvalues: Flag (ref), Flag1 (ref), Count1 (ref), Tbl1 (copy), p1 (copy), Frozen (upval), Tbl (copy), MaxPoolSize1 (ref), Tbl2 (copy), Batch (copy), Adapter (copy), DiagnosticsModule (upval), poolFor (copy), Count (ref)
			assert(not Flag, "RecyclingScope: cannot exchange after destruction")
			assert(not Flag1, "RecyclingScope: cannot mutate during an exchange")
			assert(Owner ~= nil, "RecyclingScope: exchange requires an owner")
			local ValidationToken: number = Count1
			Count1 += 1
			local T = if #List2 == 0 then nil else {}
			for _, value in List1 do
				local Entry = Tbl1[value.view]
				assert(Entry ~= nil and (Entry.owner == Owner and Entry.leaseToken == value.leaseToken), "RecyclingScope: cannot use a stale Lease")
				assert(Entry.validationToken ~= ValidationToken, "RecyclingScope: cannot release one Lease more than once")
				Entry.validationToken = ValidationToken
			end
			if #List2 == 0 and p1.onPoolChanged == nil then
				local config = { acquired = Frozen, releasedCount = #List1 }
				local Items = {}
				Flag1 = true
				
				for _, value1 in List1 do
					local Entry = Tbl1[value1.view]
					Entry.owner = nil
					Entry.leaseToken = nil
					local Pool = Entry.pool
					Pool.last += 1
					Entry.pool.items[Entry.pool.last] = value1.view
				end
				for _, value2 in Tbl do
					while MaxPoolSize1 ~= nil and MaxPoolSize1 < value2.last - value2.first + 1 do
						local Item = value2.items[value2.first]
						value2.items[value2.first] = nil
						value2.first += 1
						local Entry = Tbl1[Item]
						local CountTbl2 = #Tbl2
						local Entry1 = Tbl2[CountTbl2]
						
						if Entry.inventoryIndex ~= CountTbl2 then
							Tbl2[Entry.inventoryIndex] = Entry1
							Tbl1[Entry1].inventoryIndex = Entry.inventoryIndex
						end
						Tbl2[CountTbl2] = nil
						Tbl1[Item] = nil
						table.insert(Items, Item)
					end
				end
				Flag1 = false
				Batch(function()
					-- upvalues: Items (copy), Adapter (upval)
					for _, item in Items do
						Adapter.destroy(item)
					end
				end)
				
				return config
			else
				Flag1 = true
				local NewLasts = {}
				
				for i, value3 in Tbl do
					NewLasts[i] = value3.last - value3.first + 1
				end
				local T1 = if #List1 == 0 then nil else {}
				
				if T1 ~= nil then
					for _, value4 in List1 do
						local Entry = Tbl1[value4.view]
						local List = T1[Entry.viewType]
						
						if List == nil then
							List = {}
							T1[Entry.viewType] = List
						end
						table.insert(List, value4.view)
					end
				end
				local CreateResults = {}
				local T2 = if T1 == nil then nil else {}
				local Frozen1 = if T2 == nil then Frozen else {}
				local Success, Result = pcall(function()
					-- upvalues: List2 (copy), T1 (copy), T2 (copy), Frozen1 (copy), NewLasts (copy), Adapter (upval), Tbl1 (upval), T (copy), CreateResults (copy)
					for i, value in List2 do
						local Entry = if T1 == nil then nil else T1[value.viewType]
						local Removed = if Entry == nil then nil else table.remove(Entry)
						
						if Removed == nil then
							local NewLast = NewLasts[value.viewType] or 0
							
							if NewLast > 0 then
								NewLasts[value.viewType] = NewLast - 1
							else
								local NewAdapter = Adapter.create(value.viewType)
								assert(Tbl1[NewAdapter] == nil and not T[NewAdapter], "RecyclingScope: create must return a new view")
								T[NewAdapter] = true
								CreateResults[i] = NewAdapter
							end
						else
							T2[i] = Removed
							Frozen1[Removed] = true
						end
					end
				end)
				
				if not Success then
					Flag1 = false
					
					for _, createResult in CreateResults do
						Adapter.destroy(createResult)
					end
					error(Result, 0)
				end
				local config = { releasedCount = 0, acquired = table.create(#List2) }
				local Items1 = {}
				local T3 = if p1.onPoolChanged == nil then nil else {}
				for _, value5 in List1 do
					local FrozenEntry = Frozen1[value5.view]
					local Entry = nil
					
					if not FrozenEntry then
						Entry = Tbl1[value5.view]
						Entry.owner = nil
						Entry.leaseToken = nil
						local Pool = Entry.pool
						Pool.last += 1
						Pool.items[Pool.last] = value5.view
						config.releasedCount += 1
						FrozenEntry = T3 == nil
					end
					if not FrozenEntry then
						table.insert(T3, {
							DiagnosticsModule.PoolAction.Release,
							Entry.viewType,
							-1,
							1,
							0
						})
					end
				end
				for i1, value6 in List2 do
					local PoolForResult = poolFor(value6.viewType)
					local Entry = if T2 == nil then nil else T2[i1]
					
					if Entry == nil then
						if PoolForResult.first <= PoolForResult.last then
							Entry = PoolForResult.items[PoolForResult.last]
							PoolForResult.items[PoolForResult.last] = nil
							PoolForResult.last -= 1
							
							if T3 ~= nil then
								table.insert(T3, {
									DiagnosticsModule.PoolAction.Acquire,
									value6.viewType,
									1,
									-1,
									0
								})
							end
						else
							local CreateResult = CreateResults[i1]
							Entry = CreateResult
							Tbl1[CreateResult] = {
								owner = nil,
								leaseToken = nil,
								validationToken = nil,
								viewType = value6.viewType,
								pool = PoolForResult,
								inventoryIndex = #Tbl2 + 1
							}
							table.insert(Tbl2, CreateResult)
							
							if T3 ~= nil then
								table.insert(T3, {
									DiagnosticsModule.PoolAction.Create,
									value6.viewType,
									1,
									0,
									1
								})
							end
						end
					end
					local Entry4 = Tbl1[Entry]
					local LeaseToken: number = Count
					Count += 1
					Entry4.owner = Owner
					Entry4.leaseToken = LeaseToken
					table.insert(config.acquired, { view = Entry, leaseToken = LeaseToken })
				end
				for _, value7 in Tbl do
					while MaxPoolSize1 ~= nil and MaxPoolSize1 < value7.last - value7.first + 1 do
						local Item = value7.items[value7.first]
						value7.items[value7.first] = nil
						value7.first += 1
						local Entry2 = Tbl1[Item]
						local CountTbl2 = #Tbl2
						local Entry3 = Tbl2[CountTbl2]
						
						if Entry2.inventoryIndex ~= CountTbl2 then
							Tbl2[Entry2.inventoryIndex] = Entry3
							Tbl1[Entry3].inventoryIndex = Entry2.inventoryIndex
						end
						Tbl2[CountTbl2] = nil
						Tbl1[Item] = nil
						table.insert(Items1, Item)
						
						if T3 ~= nil then
							table.insert(T3, {
								DiagnosticsModule.PoolAction.Evict,
								value7.viewType,
								0,
								-1,
								-1
							})
						end
					end
				end
				Flag1 = false
				Batch(function()
					-- upvalues: T3 (copy), p1 (upval), Items1 (copy), Adapter (upval)
					if T3 ~= nil then
						for _, value in T3 do
							local Action = value[1]
							local ViewType = value[2]
							local OccupiedDelta = value[3]
							local VacantDelta = value[4]
							local TotalDelta = value[5]
							
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
					end
					for _, value1 in Items1 do
						Adapter.destroy(value1)
					end
				end)
				
				return config
			end
		end,
		batch = Batch,
		isLeaseCurrent = function(Owner, p2, LeaseToken): boolean
			-- upvalues: Tbl1 (copy), Flag (ref)
			local Entry = Tbl1[p2]
			
			return not Flag and (Entry ~= nil and (Entry.owner == Owner and Entry.leaseToken == LeaseToken))
		end,
		setMaxPoolSize = function(Value: number)
			-- upvalues: Flag (ref), Flag1 (ref), MaxPoolSize1 (ref), evictExcess (copy)
			assert(not Flag and not Flag1, "RecyclingScope: cannot set capacity now")
			assert(Value == nil or Value >= 0 and Value % 1 == 0, "RecyclingScope: maxPoolSize must be a non-negative integer")
			MaxPoolSize1 = Value
			evictExcess()
		end,
		getScopeInventory = function()
			-- upvalues: Tbl2 (copy)
			return table.clone(Tbl2)
		end,
		getVacantViews = function()
			-- upvalues: Tbl (copy)
			local Items = {}
			
			for _, value in Tbl do
				for i = value.first, value.last do
					table.insert(Items, value.items[i])
				end
			end
			return Items
		end,
		destroy = function()
			-- upvalues: Flag (ref), Flag1 (ref), Tbl2 (copy), p1 (copy), Tbl1 (copy), Tbl (copy), Batch (copy), notify (copy), DiagnosticsModule (upval), Adapter (copy)
			if Flag then return end
			assert(not Flag1, "RecyclingScope: cannot destroy during an exchange")
			Flag = true
			local Copy = table.clone(Tbl2)
			local Buffer = if p1.onPoolChanged == nil then nil else table.create(#Copy)
			
			if Buffer ~= nil then
				for i, value in Copy do
					local Entry = Tbl1[value]
					Buffer[i] = { viewType = Entry.viewType, occupied = Entry.owner ~= nil }
				end
			end
			table.clear(Tbl2)
			table.clear(Tbl1)
			table.clear(Tbl)
			local v1 = nil
			
			local function _(p2, p3)
				-- upvalues: v1 (ref)
				if not p2 and v1 == nil then
					v1 = p3
				end
			end
			
			Batch(function()
				-- upvalues: Copy (copy), Buffer (copy), notify (upval), DiagnosticsModule (upval), v1 (ref), Adapter (upval)
				for i, value in Copy do
					local NoBuffer = Buffer == nil
					local Result = nil
					
					if not NoBuffer then
						local BufferEntry = Buffer[i]
						local Success
						Success, Result = pcall(notify, DiagnosticsModule.PoolAction.Evict, BufferEntry.viewType, if BufferEntry.occupied then -1 else 0, if BufferEntry.occupied then 0 else -1, -1)
						NoBuffer = Success or v1 ~= nil
					end
					if not NoBuffer then
						v1 = Result
					end
					local Success1, Result1 = pcall(Adapter.destroy, value)
					
					if not Success1 and v1 == nil then
						v1 = Result1
					end
				end
			end)
			
			if v1 ~= nil then
				error(v1, 0)
			end
		end
	}
end