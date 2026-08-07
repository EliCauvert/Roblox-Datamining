local foundation = script:FindFirstAncestor("Foundation")
local unknownModule = require(foundation)
local children = foundation.Components:GetChildren()
local children_1 = foundation.Providers:GetChildren()
local children_2 = foundation.Utility:GetChildren()

return function(p0) --[[ line: 7 | named "GetStories" ]]
	-- upvalues: children (ref), unknownModule (ref), children_1 (ref), children_2 (ref)
	local status
	local t = {}
	
	for i, v in children do
		ok, status = pcall(function() --[[ line: 10 ]]
			-- upvalues: unknownModule (copy), v (ref)
			return unknownModule[v.Name]
		end)
		
		if ok == p0 then
			table.insert(t, v)
		end
	end
	for i, v_1 in children_1 do
		ok, status = pcall(function() --[[ line: 19 ]]
			-- upvalues: unknownModule (copy), v_1 (ref)
			return unknownModule[v_1.Name .. "Provider"]
		end)
		
		if ok == p0 then
			table.insert(t, v_1)
		end
	end
	for i, v_2 in children_2 do
		ok, status = pcall(function() --[[ line: 28 ]]
			-- upvalues: unknownModule (copy), v_2 (ref)
			return unknownModule.Utility[v_2.Name]
		end)
		
		if p0 and ok == p0 then
			table.insert(t, v_2)
		end
	end
	return t
end