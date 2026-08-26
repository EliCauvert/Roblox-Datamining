local standardPriority = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants")).StandardPriority

if standardPriority == nil then
	standardPriority = 10
end
local t = {}
t.__index = t
local t_1 = {}
local t_2 = {}
t_2.__index = t_2

function t_2.RebuildProcessCommandsPriorities(p1)
	local var1
	p1.RegisteredPriorites = {}
	
	for i, v in pairs(p1.FunctionMap) do
		var1 = true
		
		for i_1, v_1 in pairs(v) do
			var1 = false
			break
		end
		if not var1 then
			table.insert(p1.RegisteredPriorites, i)
		end
	end
	table.sort(p1.RegisteredPriorites, function(p2, p3)
		return p3 < p2
	end)
end

function t_2.HasFunction(p2, p3)
	return p2.RegisteredFunctions[p3] ~= nil
end

function t_2.RemoveFunction(p2, p3)
	local var2 = p2.RegisteredFunctions[p3]
	p2.RegisteredFunctions[p3] = nil
	p2.FunctionMap[var2][p3] = nil
	p2:RebuildProcessCommandsPriorities()
end

function t_2.AddFunction(p2, p3, p4, p5)
	-- upvalues: standardPriority (write)
	if p5 == nil then
		p5 = standardPriority
	end
	if p2.RegisteredFunctions[p3] then
		error(p3 .. " is already in use!")
	end
	p2.RegisteredFunctions[p3] = p5
	
	if p2.FunctionMap[p5] == nil then
		p2.FunctionMap[p5] = {}
	end
	p2.FunctionMap[p5][p3] = p4
	p2:RebuildProcessCommandsPriorities()
end

function t_2.GetIterator(p2)
	local var2 = 1
	local var3 = nil
	local var4 = nil
	
	return function()
		-- upvalues: var2 (write), p2 (ref), var3 (write), var4 (write)
		while true do
			if #p2.RegisteredPriorites >= var2 then
				local var5 = p2.RegisteredPriorites[var2]
				local var6, var7 = next(p2.FunctionMap[var5], var3)
				var3 = var6
				var4 = var7
				
				if var3 ~= nil then
					return var3, var4, var5
				end
				var2 += 1
			end
		end
	end
end

function t_1.new()
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl.RegisteredFunctions = {}
	tbl.RegisteredPriorites = {}
	tbl.FunctionMap = {}
	
	return tbl
end

function t.NewSortedFunctionContainer(_)
	-- upvalues: t_1 (ref)
	return t_1.new()
end

return t