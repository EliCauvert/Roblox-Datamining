local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Recycling.RecyclingScope)
local Frozen = table.freeze({})
local Frozen1 = table.freeze({ entered = Frozen, updated = Frozen, departed = Frozen })

return function(p1)
	-- upvalues: Frozen1 (copy), Frozen (copy)
	local RecyclingScope = p1.recyclingScope
	local PrepareDesiredAssignmentFunction = p1.prepareDesiredAssignment
	local Tbl = {}
	local Frozens = {}
	local Flag = false
	local Tbl1 = {}
	local Tbl2 = {}
	local Tbl3 = {}
	
	local function makeAssignment(Key, Value)
		-- upvalues: PrepareDesiredAssignmentFunction (copy)
		if PrepareDesiredAssignmentFunction == nil then
			return table.freeze({ key = Key, value = Value })
		else
			local PrepareDesiredAssignmentResult = PrepareDesiredAssignmentFunction({ key = Key, value = Value })
			
			return table.freeze({
				key = PrepareDesiredAssignmentResult.key,
				value = PrepareDesiredAssignmentResult.value
			})
		end
	end
	
	local function _(ViewType)
		-- upvalues: Frozens (copy)
		local Frozen = Frozens[ViewType]
		
		if Frozen == nil then
			Frozen = table.freeze({ viewType = ViewType })
			Frozens[ViewType] = Frozen
		end
		return Frozen
	end
	
	local function apply(List1, List2)
		-- upvalues: Flag (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy), Frozens (copy), Frozen1 (upval), Frozen (upval), RecyclingScope (copy), makeAssignment (copy), Tbl3 (copy)
		assert(not Flag, "SlotBinder: cannot apply after destruction")
		local List3 = {}
		local Flag1 = false
		
		for _, value in List1 do
			local Entry = Tbl[value]
			
			if Entry ~= nil then
				table.insert(List3, Entry.view)
				Tbl1[value] = true
				Flag1 = true
			end
		end
		local Requests = {}
		local List4 = {}
		local List = nil
		local v1 = #List2 > 1
		for _, value1 in List2 do
			local Key = value1.key
			
			if v1 then
				if Tbl2[Key] then
					table.clear(Tbl2)
					table.clear(Tbl1)
					error(`Virtualizer: duplicate key "{Key}"`, 0)
				end
				Tbl2[Key] = true
			end
			local Entry = Tbl[Key]
			local Inverted: boolean = Entry ~= nil and not (Flag1 and Tbl1[Key])
			
			if not Inverted or Entry.viewType ~= value1.viewType then
				if Inverted then
					table.insert(List3, Entry.view)
				end
				table.insert(List4, value1)
				local ViewType = value1.viewType
				local Frozen2 = Frozens[ViewType]
				
				if Frozen2 == nil then
					Frozen2 = table.freeze({ viewType = ViewType })
					Frozens[ViewType] = Frozen2
				end
				table.insert(Requests, Frozen2)
			elseif value1.changed or Entry.value ~= value1.value then
				List = List or {}
				table.insert(List, value1)
			end
		end
		if v1 then
			table.clear(Tbl2)
		end
		if #List3 == 0 and #Requests == 0 and List == nil then
			return Frozen1
		end
		local Acquired = Frozen
		
		if #List3 > 0 or #Requests > 0 then
			local Success, Result = pcall(RecyclingScope.bind, { releases = List3, requests = Requests })
			
			if not Success then
				table.clear(Tbl1)
				error(Result, 0)
			end
			Acquired = Result.acquired
		end
		if Flag1 then
			for i in Tbl1 do
				Tbl[i] = nil
			end
			table.clear(Tbl1)
		end
		local v2: boolean = #List3 > 0 and #List4 > 0
		for i1, value2 in List4 do
			local AcquiredEntry = Acquired[i1]
			value2.view = AcquiredEntry
			value2.assignment = makeAssignment(value2.key, value2.value)
			Tbl[value2.key] = value2
			
			if v2 then
				Tbl3[AcquiredEntry] = true
			end
		end
		local Updated = Frozen
		
		if List ~= nil then
			Updated = table.create(#List)
			
			for i2, value3 in List do
				local Entry = Tbl[value3.key]
				Entry.value = value3.value
				Entry.assignment = makeAssignment(value3.key, value3.value)
				Updated[i2] = Entry
			end
		end
		local Departed = Frozen
		
		if #List3 > 0 then
			if v2 then
				Departed = {}
				
				for _, value4 in List3 do
					if not Tbl3[value4] then
						table.insert(Departed, value4)
					end
				end
				table.clear(Tbl3)
			else
				Departed = List3
			end
		end
		return {
			entered = if #List4 == 0 then Frozen else List4,
			updated = Updated,
			departed = Departed
		}
	end
	
	local function releaseAll()
		-- upvalues: Tbl (copy), RecyclingScope (copy)
		local Releases = {}
		
		for _, value in Tbl do
			table.insert(Releases, value.view)
		end
		table.clear(Tbl)
		
		if #Releases > 0 then
			RecyclingScope.bind({ releases = Releases, requests = {} })
		end
		return Releases
	end
	
	return {
		apply = apply,
		sync = function(List)
			-- upvalues: Tbl (copy), apply (copy)
			local t = {}
			
			for _, value in List do
				t[value.key] = true
			end
			local List1 = {}
			
			for i in Tbl do
				if not t[i] then
					table.insert(List1, i)
				end
			end
			return (apply(List1, List))
		end,
		get = function(p2)
			-- upvalues: Tbl (copy)
			return Tbl[p2]
		end,
		releaseAll = function()
			-- upvalues: Flag (ref), releaseAll (copy)
			assert(not Flag, "SlotBinder: cannot release after destruction")
			
			return (releaseAll())
		end,
		destroy = function()
			-- upvalues: Flag (ref), releaseAll (copy)
			if not Flag then
				releaseAll()
				Flag = true
				
				return
			end
		end
	}
end