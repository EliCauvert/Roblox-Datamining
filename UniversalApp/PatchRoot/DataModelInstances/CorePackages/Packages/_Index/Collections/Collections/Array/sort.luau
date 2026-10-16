local Parent = script.Parent.Parent
local NoneModule = require(Parent.Object.None)
local _ = require(Parent.Parent.ES7Types)

local function v3(p1, p2): boolean --[[ Line: 23 ]]
	return type(p1) .. tostring(p1) < type(p2) .. tostring(p2)
end

return function(List, Callback) --[[ Line: 27 ]]
	-- upvalues: v3 (copy), NoneModule (copy)
	local v1: (any, any) -> boolean = v3
	
	if Callback ~= nil and Callback ~= NoneModule then
		if typeof(Callback) ~= "function" then
			error("invalid argument to Array.sort: compareFunction must be a function")
		end
		v1 = function(A, B): boolean --[[ Line: 34 ]]
			-- upvalues: Callback (copy)
			local CallbackResult: number = Callback(A, B)
			
			if typeof(CallbackResult) ~= "number" then
				error(("invalid result from compare function, expected number but got %s"):format((typeof(CallbackResult))))
			end
			return CallbackResult < 0
		end
	end
	table.sort(List, v1)
	
	return List
end