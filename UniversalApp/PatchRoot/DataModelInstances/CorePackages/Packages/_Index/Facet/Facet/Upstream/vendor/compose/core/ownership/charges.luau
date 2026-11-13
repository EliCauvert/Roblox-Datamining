local WeakModule = require("../weak")

return function(p1)
	-- upvalues: WeakModule (copy)
	local Tbl = {}
	WeakModule.keys(Tbl)
	local Tbl1 = {}
	WeakModule.keys(Tbl1)
	
	return {
		chargeToOwner = function(Owner, Key, Custody)
			-- upvalues: Tbl (copy), p1 (copy), Tbl1 (copy)
			if Owner == nil then return end
			local Entry = Tbl[Key]
			
			if Entry ~= nil then
				Tbl[Key] = nil
				p1.charges -= 1
				local Entry1 = Tbl1[Entry.owner]
				
				if Entry1 ~= nil then
					local Custody1 = Entry.custody
					Entry1[Custody1] -= 1
				end
			end
			local Entry2 = Tbl1[Owner]
			
			if Entry2 == nil then
				Entry2 = { owned = 0, adopted = 0, borrowed = 0 }
				Tbl1[Owner] = Entry2
			end
			p1.charges += 1
			Tbl[Key] = { owner = Owner, custody = Custody }
			Entry2[Custody] += 1
		end,
		releaseCharge = function(Key)
			-- upvalues: Tbl (copy), p1 (copy), Tbl1 (copy)
			local Entry = Tbl[Key]
			
			if Entry == nil then return end
			Tbl[Key] = nil
			p1.charges -= 1
			local Entry1 = Tbl1[Entry.owner]
			
			if Entry1 ~= nil then
				local Custody = Entry.custody
				Entry1[Custody] -= 1
			end
		end,
		reset = function()
			-- upvalues: Tbl (copy), Tbl1 (copy), p1 (copy)
			table.clear(Tbl)
			table.clear(Tbl1)
			p1.charges = 0
		end,
		ownedCounts = function(p2)
			-- upvalues: Tbl1 (copy)
			local Entry = Tbl1[p2]
			
			return if Entry == nil then { ownedNodes = 0, borrowedNodes = 0 } else {
				ownedNodes = Entry.owned + Entry.adopted,
				borrowedNodes = Entry.borrowed
			}
		end
	}
end