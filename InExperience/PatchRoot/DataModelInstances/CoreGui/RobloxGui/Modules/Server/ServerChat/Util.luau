local standardPriority = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants")).StandardPriority

if standardPriority == nil then
	standardPriority = 10
end
local t = {}
t.__index = t
local t_1 = {}
local t_2 = {}
t_2.__index = t_2

function t_2.RebuildProcessCommandsPriorities(p0) --[[ line: 25 ]]
	local var3
	p0.RegisteredPriorites = {}
	
	for i, v in pairs(p0.FunctionMap) do
		var3 = true
		
		for i_1, v_1 in pairs(v) do
			var3 = false
			break
		end
		if not var3 then
			table.insert(p0.RegisteredPriorites, i)
		end
	end
	table.sort(p0.RegisteredPriorites, function(p1, p2) --[[ line: 37 ]]
		return p2 < p1
	end)
end

function t_2.HasFunction(p3, p4) --[[ line: 42 ]]
	return p3.RegisteredFunctions[p4] ~= nil
end

function t_2.RemoveFunction(p5, p6) --[[ line: 49 ]]
	local var4 = p5.RegisteredFunctions[p6]
	p5.RegisteredFunctions[p6] = nil
	p5.FunctionMap[var4][p6] = nil
	p5:RebuildProcessCommandsPriorities()
end

function t_2.AddFunction(p7, p8, p9, p10) --[[ line: 56 ]]
	-- upvalues: standardPriority (write)
	if p10 == nil then
		p10 = standardPriority
	end
	if p7.RegisteredFunctions[p8] then
		error(p8 .. " is already in use!")
	end
	p7.RegisteredFunctions[p8] = p10
	
	if p7.FunctionMap[p10] == nil then
		p7.FunctionMap[p10] = {}
	end
	p7.FunctionMap[p10][p8] = p9
	p7:RebuildProcessCommandsPriorities()
end

function t_2.GetIterator(p11) --[[ line: 75 ]]
	local var5 = 1
	local var6 = nil
	local var7 = nil
	
	return function() --[[ line: 80 ]]
		-- upvalues: var5 (write), p11 (ref), var6 (write), var7 (write)
		while true do
			if #p11.RegisteredPriorites >= var5 then
				local var8 = p11.RegisteredPriorites[var5]
				local var9, var10 = next(p11.FunctionMap[var8], var6)
				var6 = var9
				var7 = var10
				
				if var6 ~= nil then
					return var6, var7, var8
				end
				var5 += 1
			end
		end
	end
end

function t_1.new() --[[ line: 96 ]]
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl.RegisteredFunctions = {}
	tbl.RegisteredPriorites = {}
	tbl.FunctionMap = {}
	
	return tbl
end

function t.NewSortedFunctionContainer(_) --[[ line: 107 ]]
	-- upvalues: t_1 (ref)
	return t_1.new()
end

return t