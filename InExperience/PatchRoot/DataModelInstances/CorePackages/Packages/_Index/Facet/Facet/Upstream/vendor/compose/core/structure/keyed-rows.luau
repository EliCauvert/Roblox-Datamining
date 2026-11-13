--!native

local _ = require("../types")
local OwnerModule = require("../ownership/owner")
local Block = require("../runtime/children").block
local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local LisModule = require("./lis")
local CellModule = require("../reactive/cell")

return function(p1, p2, Callback1, p3, Callback)
	-- upvalues: SupportModule (copy), OwnerModule (copy), Block (copy), CellModule (copy), DiagnosticsModule (copy), LisModule (copy)
	local Keyed = SupportModule.sourceOf(p1, "keyed", "from")
	local v1 = p3 == nil
	
	return function(p4)
		-- upvalues: SupportModule (upval), OwnerModule (upval), Block (upval), Callback (copy), CellModule (upval), p3 (copy), p2 (copy), DiagnosticsModule (upval), v1 (copy), Keyed (copy), Callback1 (copy), LisModule (upval)
		local Keyed1 = SupportModule.ownerFor("keyed")
		SupportModule.mountPointOf(p4, "keyed")
		local OrdersChildren = p4.ordersChildren
		local Tbl = {}
		local List = {}
		local Tbl1 = {}
		local Tbl2 = {}
		local Tbl3 = {}
		local Tbl4 = Tbl3
		local t = {}
		local Positions = {}
		local t1 = {}
		local Total = 0
		local Count = 0
		local v2 = 0
		OwnerModule.own(Keyed1, function()
			-- upvalues: Tbl (copy), Block (upval), p4 (copy), List (copy), Tbl1 (ref), Tbl2 (ref), Tbl3 (ref)
			for _, value in Tbl do
				Block.releaseNode(p4, value.node)
			end
			table.clear(Tbl)
			table.clear(List)
			table.clear(Tbl1)
			table.clear(Tbl2)
			table.clear(Tbl3)
		end)
		
		local function normalize()
			-- upvalues: Total (ref), List (copy), Count (ref)
			if Total == 0 then return end
			table.move(List, Total + 1, Total + Count, 1)
			
			for i = Count + 1, Total + Count do
				List[i] = nil
			end
			for i1 = 1, Count do
				List[i1].position = i1
			end
			Total = 0
		end
		
		local function _(p5, p6)
			-- upvalues: List (copy)
			for i = p5, p6 do
				List[i].position = i
			end
		end
		
		local _ = function(p7, p8)
			-- upvalues: Tbl4 (ref), Callback (upval)
			local Second = p7.second
			local Cache = Second.cache
			local Entry = Tbl4[p8]
			
			if Cache == nil or Cache.value ~= Entry and (Callback == nil or not Callback(Cache.value, Entry)) then
				Second:set(Entry)
			end
		end
		
		local function mountRow(p7, Key, p8, Item)
			-- upvalues: CellModule (upval), p3 (upval), Tbl4 (ref), Block (upval), p4 (copy), Keyed1 (copy), p2 (upval), Tbl (copy)
			local CellResult = CellModule.cell(Item)
			local CellResult1 = if p3 == nil then CellModule.cell(Tbl4[p7]) else p3
			local KeyedRow, KeyedRow2 = Block.mountRow(p4, Keyed1, p2, CellResult, CellResult1, Key, "keyed row", p8)
			local config = {
				position = 0,
				mark = 0,
				owner = KeyedRow2,
				node = KeyedRow,
				value = CellResult,
				second = CellResult1,
				key = Key,
				item = Item
			}
			Tbl[Key] = config
			
			return config
		end
		
		local _ = function(Index, p7)
			-- upvalues: DiagnosticsModule (upval)
			return DiagnosticsModule.raise("structure/duplicate-key", "two items in a keyed collection share a key", {
				contract = "keys identify rows across updates, so they must be unique within one update",
				fix = "pass a keyOf that returns a stable unique id, e.g. function(item) return item.id end",
				index = Index,
				detail = ("the same key is also used at index %d"):format(p7)
			})
		end
		
		local function raiseFailures(Entry)
			if Entry ~= nil then
				if #Entry == 1 then
					error(Entry[1], 0)
				end
				error(("Compose: %d keyed row factories failed:\n  %s"):format(#Entry, table.concat(Entry, "\n  ")), 0)
			end
		end
		
		local _ = function(p7)
			-- upvalues: Block (upval), p4 (copy), OwnerModule (upval), Tbl (copy)
			Block.releaseNode(p4, p7.node)
			OwnerModule.dispose(p7.owner)
			Tbl[p7.key] = nil
			p7.position = 0
		end
		
		local function trimHead(p7, Count1, Count2): boolean
			-- upvalues: Count (ref), Tbl (copy), Tbl2 (ref), Total (ref), List (copy), Block (upval), p4 (copy), OwnerModule (upval), v1 (upval), Tbl4 (ref), Callback (upval), mountRow (copy), normalize (copy), raiseFailures (copy)
			if Count == 0 or Count1 == 0 then
				return false
			end
			local Entry = Tbl[Tbl2[1]]
			
			if Entry == nil then
				return false
			end
			local Position: number = Entry.position
			local PositionDelta = Position - Total - 1
			local CountDelta = Count - PositionDelta
			
			if PositionDelta <= 0 or Count1 < CountDelta or Count2 ~= CountDelta then
				return false
			end
			for i = 2, CountDelta do
				if List[Position + i - 1].key ~= Tbl2[i] then
					return false
				end
			end
			for i1 = Total + 1, Total + PositionDelta do
				local Entry1 = List[i1]
				Block.releaseNode(p4, Entry1.node)
				OwnerModule.dispose(Entry1.owner)
				Tbl[Entry1.key] = nil
				Entry1.position = 0
				List[i1] = nil
			end
			Total += PositionDelta
			Count = CountDelta
			
			for i2 = 1, CountDelta do
				local Entry2 = List[Total + i2]
				local Item = p7[i2]
				
				if Entry2.item ~= Item then
					Entry2.item = Item
					Entry2.value:set(Item)
				end
				if v1 then
					local Second = Entry2.second
					local Cache = Second.cache
					local Entry3 = Tbl4[i2]
					
					if Cache == nil or Cache.value ~= Entry3 and (Callback == nil or not Callback(Cache.value, Entry3)) then
						Second:set(Entry3)
					end
				end
			end
			local v3 = nil
			
			for i3 = CountDelta + 1, Count1 do
				local Success, Result = pcall(mountRow, i3, Tbl2[i3], Count + 1, p7[i3])
				
				if Success then
					Count += 1
					local NewTotal = Total + Count
					List[NewTotal] = Result
					Result.position = NewTotal
				else
					local List1 = v3 or {}
					v3 = List1
					table.insert(List1, (tostring(Result)))
				end
			end
			if Count < Total then
				normalize()
			end
			raiseFailures(v3)
			
			return true
		end
		
		local Count1 = 0
		local Count2 = 0
		
		local function reconcile(p8)
			-- upvalues: Count2 (ref), Keyed (upval), Tbl4 (ref), Callback1 (upval), Tbl2 (ref), Tbl3 (ref), v2 (ref), Tbl1 (ref), Count (ref), List (copy), Total (ref), v1 (upval), t (copy), Tbl (copy), DiagnosticsModule (upval), OrdersChildren (copy), Callback (upval), trimHead (copy), normalize (copy), Block (upval), p4 (copy), OwnerModule (upval), mountRow (copy), raiseFailures (copy), Positions (copy), t1 (copy), LisModule (upval)
			Count2 += 1
			local Count1: number = Count2
			local KeyedResult = Keyed(p8)
			local CountKeyedResult = #KeyedResult
			Tbl4 = Callback1(KeyedResult, CountKeyedResult, Tbl2, Tbl3)
			
			for i = #Tbl2, CountKeyedResult + 1, -1 do
				Tbl2[i] = nil
			end
			for i1 = #Tbl3, CountKeyedResult + 1, -1 do
				Tbl3[i1] = nil
			end
			local v4 = v2 + 1
			v2 = v4 + CountKeyedResult
			table.clear(Tbl1)
			local Count3 = 0
			local Count4: number = Count
			local Tbl5 = Tbl2
			local Tbl6 = Tbl4
			local Total1: number = Total
			local Count5 = 0
			local Count6 = 0
			local Smallest = math.min(Count4, CountKeyedResult)
			while Count5 < Smallest do
				local Entry = List[Total1 + Count5 + 1]
				
				if not rawequal(Entry.key, Tbl5[Count5 + 1]) then break end
				Count5 += 1
				Entry.mark = v4 + Count5
				local Cache = if v1 then Entry.second.cache else nil
				
				if Entry.item == KeyedResult[Count5] and (not v1 or Cache ~= nil and Cache.value == Tbl6[Count5]) then continue end
				Count6 += 1
				t[Count6] = Count5
			end
			local Count7: number = Count5
			local v5 = nil
			local Tbl7 = Tbl1
			
			for i2 = Count5 + 1, CountKeyedResult do
				local KeyedResultEntry = KeyedResult[i2]
				local Entry = Tbl5[i2]
				local Entry1 = Tbl[Entry]
				
				if Entry1 == nil then
					local V73 = v5 or {}
					v5 = V73
					local Entry2 = V73[Entry]
					
					if Entry2 ~= nil then
						local _ = DiagnosticsModule.raise("structure/duplicate-key", "two items in a keyed collection share a key", {
							contract = "keys identify rows across updates, so they must be unique within one update",
							fix = "pass a keyOf that returns a stable unique id, e.g. function(item) return item.id end",
							index = i2,
							detail = ("the same key is also used at index %d"):format(Entry2)
						})
					end
					V73[Entry] = i2
				else
					local PositionDelta = Entry1.position - Total1
					
					if v4 <= Entry1.mark then
						local _ = DiagnosticsModule.raise("structure/duplicate-key", "two items in a keyed collection share a key", {
							contract = "keys identify rows across updates, so they must be unique within one update",
							fix = "pass a keyOf that returns a stable unique id, e.g. function(item) return item.id end",
							index = i2,
							detail = ("the same key is also used at index %d"):format(Entry1.mark - v4)
						})
					end
					Entry1.mark = v4 + i2
					Count7 += 1
					
					if OrdersChildren then
						Tbl7[i2] = Entry1
					elseif PositionDelta ~= i2 or Entry1.item ~= KeyedResultEntry or v1 and (Entry1.second.cache == nil or Entry1.second.cache.value ~= Tbl6[i2]) then
						Count3 += 1
						Tbl7[Count3] = Entry1
					end
				end
			end
			for i4 = 1, Count6 do
				local Entry: number = t[i4]
				local Entry3 = List[Total + Entry]
				local KeyedResultEntry = KeyedResult[Entry]
				
				if Entry3.item ~= KeyedResultEntry then
					Entry3.item = KeyedResultEntry
					Entry3.value:set(KeyedResultEntry)
				end
				if v1 then
					local Second = Entry3.second
					local Cache = Second.cache
					local Entry4 = Tbl4[Entry]
					
					if Cache == nil or Cache.value ~= Entry4 and (Callback == nil or not Callback(Cache.value, Entry4)) then
						Second:set(Entry4)
					end
				end
			end
			if OrdersChildren or v5 ~= nil or CountKeyedResult ~= Count4 then
				if trimHead(KeyedResult, CountKeyedResult, Count7) then return end
				normalize()
				local Count8: number = Count4
				local Count9: number = CountKeyedResult
				while Count5 < Count8 and (Count5 < Count9 and rawequal(List[Count8].key, Tbl5[Count9])) do
					Count8 -= 1
					Count9 -= 1
				end
				local CountDelta = Count9 - Count8
				
				for i7 = Count9 + 1, CountKeyedResult do
					local Entry = List[i7 - CountDelta]
					local KeyedResultEntry = KeyedResult[i7]
					
					if Entry.item ~= KeyedResultEntry then
						Entry.item = KeyedResultEntry
						Entry.value:set(KeyedResultEntry)
					end
					if v1 then
						local Second = Entry.second
						local Cache = Second.cache
						local Entry5 = Tbl4[i7]
						
						if Cache == nil or Cache.value ~= Entry5 and (Callback == nil or not Callback(Cache.value, Entry5)) then
							Second:set(Entry5)
						end
					end
				end
				if Count5 == CountKeyedResult and Count4 == CountKeyedResult then return end
				local Flag1 = false
				
				if Count7 < Count4 then
					for i9 = Count5 + 1, Count8 do
						local Entry = List[i9]
						
						if Entry.mark < v4 then
							Block.releaseNode(p4, Entry.node)
							OwnerModule.dispose(Entry.owner)
							Tbl[Entry.key] = nil
							Entry.position = 0
							Flag1 = true
						end
					end
				end
				if OrdersChildren then
					if Flag1 then
						local Count11: number = Count5
						local CountList = #List
						
						for i12 = Count5 + 1, CountList do
							local Entry = List[i12]
							
							if Entry.position ~= 0 then
								Count11 += 1
								List[Count11] = Entry
								Entry.position = Count11
							end
						end
						for i13 = CountList, Count11 + 1, -1 do
							List[i13] = nil
						end
					end
					local Count10 = 0
					local v6 = 0
					local Flag = true
					
					for i8 = Count5 + 1, Count9 do
						local Entry = Tbl1[i8]
						
						if Entry ~= nil then
							local KeyedResultEntry = KeyedResult[i8]
							
							if Entry.item ~= KeyedResultEntry then
								Entry.item = KeyedResultEntry
								Entry.value:set(KeyedResultEntry)
							end
							if v1 then
								local Second = Entry.second
								local Cache = Second.cache
								local Entry5 = Tbl4[i8]
								
								if Cache == nil or Cache.value ~= Entry5 and (Callback == nil or not Callback(Cache.value, Entry5)) then
									Second:set(Entry5)
								end
							end
							local Position2 = Entry.position
							Count10 += 1
							
							if Position2 < v6 then
								Flag = false
							end
							v6 = Position2
							Positions[Count10] = Position2
							t1[Count10] = i8
						end
					end
					local CountDelta1 = Count9 - Count5
					
					if Flag and (Count10 == CountDelta1 and not Flag1 and Count4 == CountKeyedResult) then return end
					if not Flag and Count10 == CountDelta1 and Count4 == CountKeyedResult then
						local Entry = List[Count5 + 1]
						local Entry6 = List[Count9]
						local NewCount = Count5 + 2
						
						if Tbl1[Count5 + 1] == Entry6 and Tbl1[Count9] == Entry then
							while NewCount < Count9 and Tbl1[NewCount] == List[NewCount] do
								NewCount += 1
							end
							if Count9 <= NewCount then
								List[Count5 + 1] = Entry6
								List[Count9] = Entry
								Entry6.position = Count5 + 1
								Entry.position = Count9
								p4.moveTo(Entry6.node, Count5 + 1)
								
								if CountDelta1 > 2 then
									p4.moveTo(Entry.node, Count9)
								end
								return
							end
						end
					end
					local LisModuleResult = if Flag then nil else LisModule(Positions, Count10)
					local List4 = nil
					
					if LisModuleResult == nil then
						local Position: number = Count5
						
						for i14 = Count5 + 1, Count9 do
							local Entry = Tbl1[i14]
							Position += 1
							
							if Entry == nil then
								local Success1, Result1 = pcall(mountRow, i14, Tbl2[i14], Position, KeyedResult[i14])
								
								if Count2 ~= Count1 then return end
								if Success1 then
									table.insert(List, Position, Result1)
									
									for i5 = Position, #List do
										List[i5].position = i5
									end
								else
									local List1 = List4 or {}
									List4 = List1
									table.insert(List1, (tostring(Result1)))
									Position -= 1
								end
							else
								if Count10 < CountDelta1 and List[Position] ~= Entry then
									local Position3: number = Entry.position
									table.remove(List, Position3)
									table.insert(List, Position, Entry)
									
									for i17 = math.min(Position3, Position), math.max(Position3, Position) do
										List[i17].position = i17
									end
								else
									List[Position] = Entry
									Entry.position = Position
								end
							end
						end
						for i16 = #List, Position + CountKeyedResult - Count9 + 1, -1 do
							List[i16] = nil
						end
					else
						local Entry = Tbl1[Count9 + 1]
						local Entry7 = if Count9 < CountKeyedResult then Entry else nil
						local v7 = 1
						
						for i15 = Count9, Count5 + 1, -1 do
							local Entry8 = Tbl1[i15]
							local Position = if Entry7 == nil then #List + 1 else Entry7.position
							
							if Entry8 == nil then
								local Success2, Result2 = pcall(mountRow, i15, Tbl2[i15], Position, KeyedResult[i15])
								
								if Count2 ~= Count1 then return end
								if not Success2 then
									local List3 = List4 or {}
									List4 = List3
									table.insert(List3, (tostring(Result2)))
									continue
								end
								table.insert(List, Position, Result2)
								
								for i18 = Position, #List do
									List[i18].position = i18
								end
								Entry8 = Result2
							elseif i15 == t1[LisModuleResult[v7]] then
								v7 += 1
							else
								local Position1: number = Entry8.position
								table.remove(List, Position1)
								local v8 = if Position1 < Position then Position - 1 else Position
								table.insert(List, v8, Entry8)
								
								for i3 = math.min(Position1, v8), math.max(Position1, v8) do
									List[i3].position = i3
								end
								p4.moveTo(Entry8.node, v8)
							end
							Entry7 = Entry8
						end
					end
					Count = #List
					raiseFailures(List4)
					
					return
				else
					local Position1: number = Count5
					local v9 = nil
					
					for i10 = Count5 + 1, CountKeyedResult do
						local Entry = Tbl[Tbl2[i10]]
						
						if Entry == nil then
							local Success, Result = pcall(mountRow, i10, Tbl2[i10], Position1 + 1, KeyedResult[i10])
							
							if Count2 ~= Count1 then return end
							if not Success then
								local List2 = v9 or {}
								v9 = List2
								table.insert(List2, (tostring(Result)))
								continue
							else
								Entry = Result
							end
						elseif i10 <= Count9 then
							local KeyedResultEntry = KeyedResult[i10]
							
							if Entry.item ~= KeyedResultEntry then
								Entry.item = KeyedResultEntry
								Entry.value:set(KeyedResultEntry)
							end
							if v1 then
								local Second = Entry.second
								local Cache = Second.cache
								local Entry9 = Tbl4[i10]
								
								if Cache == nil or Cache.value ~= Entry9 and (Callback == nil or not Callback(Cache.value, Entry9)) then
									Second:set(Entry9)
								end
							end
						end
						Position1 += 1
						local v10 = assert(Entry)
						
						if v10.position ~= Position1 then
							List[Position1] = v10
							v10.position = Position1
						end
					end
					for i11 = #List, Position1 + 1, -1 do
						List[i11] = nil
					end
					Count = Position1
					raiseFailures(v9)
					
					return
				end
			else
				for i6 = 1, Count3 do
					local v11 = assert(Tbl1[i6])
					local MarkDelta = v11.mark - v4
					local KeyedResultEntry = KeyedResult[MarkDelta]
					
					if v11.item ~= KeyedResultEntry then
						v11.item = KeyedResultEntry
						v11.value:set(KeyedResultEntry)
					end
					if v1 then
						local Second = v11.second
						local Cache = Second.cache
						local Entry = Tbl4[MarkDelta]
						
						if Cache == nil or Cache.value ~= Entry and (Callback == nil or not Callback(Cache.value, Entry)) then
							Second:set(Entry)
						end
					end
					List[Total + MarkDelta] = v11
					v11.position = Total + MarkDelta
				end
			end
		end
		
		OwnerModule.watch(Keyed1, function(p9)
			-- upvalues: Count1 (ref), Tbl2 (ref), Tbl1 (ref), Tbl3 (ref), Tbl4 (ref), reconcile (copy)
			Count1 += 1
			local Tbl = Tbl2
			local Tbl5 = Tbl1
			local Tbl6 = Tbl3
			local Tbl7 = Tbl4
			
			if Count1 > 1 then
				Tbl2 = {}
				Tbl1 = {}
				Tbl3 = {}
			end
			local Success, Result = pcall(reconcile, p9)
			Tbl2 = Tbl
			Tbl1 = Tbl5
			Tbl3 = Tbl6
			Tbl4 = Tbl7
			Count1 -= 1
			
			if not Success then
				error(Result, 0)
			end
		end)
	end
end