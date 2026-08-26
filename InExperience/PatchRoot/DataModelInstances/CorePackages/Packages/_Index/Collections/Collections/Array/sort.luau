local parent = script.Parent.Parent
local noneModule = require(parent.Object.None)
local _ = require(parent.Parent.ES7Types)

local var1 = function(p1, p2)
	return type(p1) .. tostring(p1) < type(p2) .. tostring(p2)
end

return function(p1, p2)
	-- upvalues: var1 (ref), noneModule (ref)
	local var2 = var1
	
	if p2 ~= nil and p2 ~= noneModule then
		if typeof(p2) ~= "function" then
			error("invalid argument to Array.sort: compareFunction must be a function")
		end
		var2 = function(p3, p4)
			-- upvalues: p2 (ref)
			local var3 = p2(p3, p4)
			
			if typeof(var3) ~= "number" then
				error(("invalid result from compare function, expected number but got %s"):format(typeof(var3)))
			end
			return var3 < 0
		end
	end
	table.sort(p1, var2)
	
	return p1
end