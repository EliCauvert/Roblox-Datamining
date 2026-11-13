--!native

local _ = require("../types")
local OwnerModule = require("../ownership/owner")
local Block = require("../runtime/children").block
local SupportModule = require("./support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")

return function(p1, p2)
	-- upvalues: SupportModule (copy), OwnerModule (copy), CellModule (copy), Block (copy)
	local Indexes = SupportModule.sourceOf(p1, "indexes", "source")
	local Indexes1 = SupportModule.builderOf(p2, "indexes", "render")
	
	return function(p3)
		-- upvalues: SupportModule (upval), OwnerModule (upval), Indexes (copy), CellModule (upval), Block (upval), Indexes1 (copy)
		local Indexes2 = SupportModule.ownerFor("indexes")
		SupportModule.mountPointOf(p3, "indexes")
		local Tbl = {}
		local Tbl1 = {}
		OwnerModule.own(Indexes2, function()
			-- upvalues: Tbl (copy), Tbl1 (copy)
			table.clear(Tbl)
			table.clear(Tbl1)
		end)
		OwnerModule.watch(Indexes2, function(p4)
			-- upvalues: Indexes (upval), Tbl (copy), Tbl1 (copy), CellModule (upval), Block (upval), p3 (copy), Indexes2 (copy), Indexes1 (upval), OwnerModule (upval)
			local IndexesResult = Indexes(p4)
			local CountIndexesResult = #IndexesResult
			
			for i = 1, CountIndexesResult do
				local Entry = Tbl[i]
				local IndexesResultEntry = IndexesResult[i]
				
				if Entry == nil then
					local CellResult = CellModule.cell(IndexesResultEntry)
					local IndexedRow, IndexedRow2 = Block.mountRows(p3, Indexes2, Indexes1, CellResult, i, "indexed row")
					
					if IndexedRow ~= nil then
						OwnerModule.adopt(IndexedRow2, function()
							-- upvalues: Block (upval), p3 (upval), IndexedRow (copy)
							Block.releaseNode(p3, IndexedRow)
						end)
					end
					Tbl[i] = { owner = IndexedRow2, value = CellResult }
					Tbl1[i] = IndexesResultEntry
				else
					if Tbl1[i] ~= IndexesResultEntry then
						Tbl1[i] = IndexesResultEntry
						Entry.value:set(IndexesResultEntry)
					end
				end
			end
			for i1 = #Tbl, CountIndexesResult + 1, -1 do
				OwnerModule.dispose(Tbl[i1].owner)
				Tbl[i1] = nil
				Tbl1[i1] = nil
			end
		end)
	end
end