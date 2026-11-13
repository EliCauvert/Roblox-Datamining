local _ = require("../runtime/children")
local _ = require("../ownership/active")
local _ = require("../ownership/owner")
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

local function retainSlots(p1, Callback, _)
	-- upvalues: CellModule (copy), KeyedRowsModule (copy), CellResult (copy)
	local SourceFunction = p1.source
	local SelectFunction = p1.select
	local Equals = p1.equals
	local t = {}
	local t1 = {}
	local CellResults = {}
	local CellResults1 = {}
	local t2 = {}
	local t3 = {}
	local Tbl = {}
	local Tbl1 = {}
	local List = {}
	local Count = 0
	
	return KeyedRowsModule(function(p2)
		-- upvalues: SourceFunction (copy), SelectFunction (copy), Tbl1 (copy), List (copy), t1 (copy), t (copy), Tbl (copy), Count (ref), CellResults (copy), CellResults1 (copy), t2 (copy), t3 (copy)
		local SelectResult = SelectFunction(p2, (SourceFunction(p2)))
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
				table.insert(List, i1)
			end
		end
		table.sort(List)
		table.clear(Tbl)
		local Count1 = 0
		
		for i2 = 1, CountValues do
			local Key = Keys[i2]
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
			end
			Tbl[i2] = Entry
			local CellResult = CellResults[Entry]
			
			if CellResult == nil then
				t2[Entry] = States[i2]
				t3[Entry] = Key
			else
				CellResult:set(States[i2])
				local CellResult1 = CellResults1[Entry]
				
				if CellResult1 ~= nil then
					CellResult1:set(Key)
				end
			end
		end
		for i3 = Count1 + 1, #List do
			local Entry = List[i3]
			CellResults[Entry] = nil
			CellResults1[Entry] = nil
		end
		return Values
	end, function(p3, _, Key)
		-- upvalues: CellResults (copy), CellResults1 (copy), CellModule (upval), t2 (copy), Equals (copy), t3 (copy), Callback (copy)
		local CellResult = CellResults[Key]
		local CellResult1 = CellResults1[Key]
		
		if CellResult == nil or CellResult1 == nil then
			CellResult = CellModule.cell(t2[Key], Equals)
			CellResult1 = CellModule.cell(t3[Key])
			CellResults[Key] = CellResult
			CellResults1[Key] = CellResult1
			t2[Key] = nil
			t3[Key] = nil
		end
		return Callback(p3, CellResult, CellResult1)
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