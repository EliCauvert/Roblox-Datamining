local _ = require("../vendor/compose/core")
local _ = require("./types")

return function(p1, p2)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local List = {}
	
	return {
		note = function(p3)
			-- upvalues: List (copy)
			warn(p3)
			table.insert(List, p3)
			
			if #List > 16 then
				table.remove(List, 1)
			end
		end,
		list = function()
			-- upvalues: List (copy)
			return table.clone(List)
		end,
		legal = function(p3, p4, Callback, p5)
			-- upvalues: ReadFunction (copy), Compose (copy), p2 (copy), List (copy)
			local ReadResult = ReadFunction(p4)
			local Flag = false
			
			return Compose.formula(function(p6)
				-- upvalues: ReadFunction (upval), p4 (copy), Callback (copy), ReadResult (ref), Flag (ref), p2 (upval), p3 (copy), p5 (copy), List (upval)
				local ReadResult1 = ReadFunction(p4, p6)
				
				if Callback(ReadResult1) then
					ReadResult = ReadResult1
					Flag = false
				elseif not Flag then
					Flag = true
					local Message: string = `Facet UI.{p2}: {p3} {p5}; the last legal value stays`
					warn(Message)
					table.insert(List, Message)
					
					if #List > 16 then
						table.remove(List, 1)
					end
				end
				return ReadResult
			end)
		end
	}
end