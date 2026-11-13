local _ = require("../vendor/compose/core")
local self = setmetatable({}, { __mode = "k" })

return {
	create = function(p1, Key)
		-- upvalues: self (copy)
		local CellResult = p1.cell(nil)
		self[Key] = CellResult
		p1.cleanup(function()
			-- upvalues: CellResult (copy), self (upval), Key (copy)
			CellResult:set(nil)
			self[Key] = nil
		end)
	end,
	bind = function(p1, p2, p3)
		-- upvalues: self (copy)
		local SelfEntry = if p2 then self[p2] else nil
		
		if SelfEntry ~= nil then
			SelfEntry:set(p3)
			p1.cleanup(function()
				-- upvalues: SelfEntry (copy), p3 (copy)
				if SelfEntry:peek() == p3 then
					SelfEntry:set(nil)
				end
			end)
			
			return
		end
	end,
	resolve = function(p1, Callback)
		-- upvalues: self (copy)
		if typeof(p1) == "Instance" then
			local SelfEntry = self[p1]
			
			return if SelfEntry then Callback(SelfEntry) else nil
		else
			return nil
		end
	end
}