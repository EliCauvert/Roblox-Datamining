local _ = require("../runtime/children")
local ActiveModule = require("../ownership/active")
local OwnerModule = require("../ownership/owner")
local _ = require("../host")
local SupportModule = require("../structure/support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local KeyedRowsModule = require("../structure/keyed-rows")
local CellResult = CellModule.cell(0)

local function retainKeyed(p1, Render)
	-- upvalues: KeyedRowsModule (copy)
	local SourceFunction = p1.source
	local SelectFunction = p1.select
	local v1 = nil
	
	return KeyedRowsModule(function(p2)
		-- upvalues: SelectFunction (copy), SourceFunction (copy), v1 (ref)
		local SelectResult = SelectFunction(p2, SourceFunction(p2))
		v1 = SelectResult
		
		return SelectResult.values
	end, Render, function(_, p2, p3, p4)
		-- upvalues: v1 (ref)
		local v2 = assert(v1)
		table.move(v2.keys, 1, p2, 1, p3)
		table.move(v2.states, 1, p2, 1, p4)
		
		return p4
	end, nil, p1.equals)
end

local function retainSlots(p1, Callback, OwnerForResult)
	-- upvalues: OwnerModule (copy), CellModule (copy), ActiveModule (copy), KeyedRowsModule (copy), CellResult (copy)
	local SourceFunction = p1.source
	local SelectFunction = p1.select
	local Equals = p1.equals
	local t = {}
	local t1 = {}
	local CellResults = {}
	local CellResults1 = {}
	local CellResults2 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local t5 = {}
	local Tbl = {}
	local Tbl1 = {}
	local List = {}
	local Count = 0
	local v1 = nil
	local Tbl2 = {}
	
	local function contains(List, PeekResult): boolean
		-- upvalues: v1 (ref), Tbl2 (copy), p1 (copy)
		if List ~= v1 then
			table.clear(Tbl2)
			
			for i, value in List do
				Tbl2[p1.key(value, i)] = true
			end
			v1 = List
		end
		return Tbl2[PeekResult] == true
	end
	
	return KeyedRowsModule(function(p2)
		-- upvalues: SourceFunction (copy), v1 (ref), Tbl2 (copy), SelectFunction (copy), Tbl1 (copy), List (copy), t1 (copy), t (copy), t3 (copy), Tbl (copy), Count (ref), CellResults (copy), CellResults2 (copy), CellResults1 (copy), t4 (copy), t5 (copy), contains (copy), t2 (copy), OwnerModule (upval)
		local SourceResult = SourceFunction(p2)
		
		if v1 ~= SourceResult then
			v1 = nil
			table.clear(Tbl2)
		end
		local SelectResult = SelectFunction(p2, SourceResult)
		local Values = SelectResult.values
		local Keys = SelectResult.keys
		local States = SelectResult.states
		local CountValues = #Values
		table.clear(Tbl1)
		
		for i = 1, CountValues do
			Tbl1[Keys[i]] = true
		end
		table.clear(List)
		
		for i1, value in t1 do
			if Tbl1[value] == nil then
				t1[i1] = nil
				t[value] = nil
				t3[i1] = true
			end
		end
		for i2 in t3 do
			table.insert(List, i2)
		end
		table.sort(List)
		table.clear(Tbl)
		local Count1 = 0
		
		for i3 = 1, CountValues do
			local Key = Keys[i3]
			local Entry = t[Key]
			
			if Entry == nil then
				Count1 += 1
				Entry = List[Count1]
				
				if Entry == nil then
					Count += 1
					Entry = Count
				end
				t[Key] = Entry
				t1[Entry] = Key
				t3[Entry] = nil
			end
			Tbl[i3] = Entry
			local CellResult = CellResults[Entry]
			
			if CellResult == nil then
				t4[Entry] = States[i3]
				t5[Entry] = Key
			else
				CellResults2[Entry]:set(Values[i3])
				CellResult:set(States[i3])
				local CellResult1 = CellResults1[Entry]
				
				if CellResult1 ~= nil then
					CellResult1:set(Key)
				end
			end
		end
		local Count2 = 0
		
		for i4 = Count1 + 1, #List do
			local Entry = List[i4]
			local CellResult = CellResults1[Entry]
			
			if Count2 < CountValues and CellResult ~= nil and contains(SourceResult, CellResult:peek()) then
				Count2 += 1
			else
				local Entry1 = t2[Entry]
				t2[Entry] = nil
				t3[Entry] = nil
				CellResults2[Entry] = nil
				CellResults[Entry] = nil
				CellResults1[Entry] = nil
				t4[Entry] = nil
				t5[Entry] = nil
				
				if Entry1 ~= nil then
					OwnerModule.dispose(Entry1.owner)
				end
			end
		end
		return Values
	end, function(p3, _, Key)
		-- upvalues: t2 (copy), CellModule (upval), CellResults2 (copy), CellResults (copy), CellResults1 (copy), t4 (copy), Equals (copy), t5 (copy), OwnerModule (upval), OwnerForResult (copy), ActiveModule (upval), Callback (copy)
		local Entry = t2[Key]
		
		if Entry ~= nil then
			return Entry.node
		end
		local CellResult = CellModule.cell(p3:peek())
		CellResults2[Key] = CellResult
		local CellResult1 = CellResults[Key]
		local CellResult2 = CellResults1[Key]
		
		if CellResult1 == nil or CellResult2 == nil then
			CellResult1 = CellModule.cell(t4[Key], Equals)
			CellResult2 = CellModule.cell(t5[Key])
			CellResults[Key] = CellResult1
			CellResults1[Key] = CellResult2
			t4[Key] = nil
			t5[Key] = nil
		end
		local Child = OwnerModule.createChild(OwnerForResult)
		local Success, Result = pcall(ActiveModule.withOwner, Child, function()
			-- upvalues: Callback (upval), CellResult (copy), CellResult1 (ref), CellResult2 (ref)
			return Callback(CellResult, CellResult1, CellResult2)
		end)
		
		if not Success then
			OwnerModule.dispose(Child)
			error(Result, 0)
		end
		t2[Key] = { node = Result, owner = Child }
		
		return Result
	end, function(_, p3, p4, p5)
		-- upvalues: Tbl (copy)
		table.move(Tbl, 1, p3, 1, p4)
		
		return p5
	end, CellResult, nil)
end

return function(p3)
	-- upvalues: SupportModule (copy), retainSlots (copy), retainKeyed (copy)
	local Recycle = p3.recycle
	local Render = p3.render
	
	return function(p4)
		-- upvalues: SupportModule (upval), p3 (copy), Recycle (copy), retainSlots (upval), Render (copy), retainKeyed (upval)
		SupportModule.mountPointOf(p4, p3.primitive)
		local RetainSlotsResult = nil
		
		if Recycle then
			RetainSlotsResult = retainSlots(p3, Recycle, SupportModule.ownerFor(p3.primitive))
		else
			assert(Render ~= nil, "retain needs render or recycle")
			RetainSlotsResult = retainKeyed(p3, Render)
		end
		RetainSlotsResult(p4)
	end
end