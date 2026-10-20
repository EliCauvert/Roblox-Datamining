local Foundation = script:FindFirstAncestor("Foundation")
local Module = require(Foundation)
local Children = Foundation.Components:GetChildren()
local Children1 = Foundation.Providers:GetChildren()
local Children2 = Foundation.Utility:GetChildren()

return function(p1)
	-- upvalues: Children (copy), Module (copy), Children1 (copy), Children2 (copy)
	local List = {}
	
	for _, child in Children do
		local Success, _ = pcall(function()
			-- upvalues: Module (upval), child (copy)
			return Module[child.Name]
		end)
		
		if Success == p1 then
			table.insert(List, child)
		end
	end
	for _, value in Children1 do
		local Success1, _ = pcall(function()
			-- upvalues: Module (upval), value (copy)
			return Module[value.Name .. "Provider"]
		end)
		
		if Success1 == p1 then
			table.insert(List, value)
		end
	end
	for _, value1 in Children2 do
		local Success2, _ = pcall(function()
			-- upvalues: Module (upval), value1 (copy)
			return Module.Utility[value1.Name]
		end)
		
		if p1 and Success2 == p1 then
			table.insert(List, value1)
		end
	end
	return List
end