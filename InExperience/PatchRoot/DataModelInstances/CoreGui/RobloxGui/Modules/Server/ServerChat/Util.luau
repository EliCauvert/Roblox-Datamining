local StandardPriority = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants")).StandardPriority

if StandardPriority == nil then
	StandardPriority = 10
end
local Util = {}
Util.__index = Util
local Module = {}
Module.__index = Module

function Module.RebuildProcessCommandsPriorities(p1) --[[ Line: 25 ]]
	p1.RegisteredPriorites = {}
	local Flag = nil
	
	for i, value in pairs(p1.FunctionMap) do
		Flag = true
		
		for _, _ in pairs(value) do
			Flag = false
			break
		end
		if not Flag then
			table.insert(p1.RegisteredPriorites, i)
		end
	end
	table.sort(p1.RegisteredPriorites, function(A, B): boolean --[[ Line: 37 ]]
		return B < A
	end)
end

function Module.HasFunction(p2, p3): boolean --[[ Line: 42 ]]
	return p2.RegisteredFunctions[p3] ~= nil
end

function Module.RemoveFunction(p2, p3) --[[ Line: 49 ]]
	p2.RegisteredFunctions[p3] = nil
	p2.FunctionMap[p2.RegisteredFunctions[p3]][p3] = nil
	p2:RebuildProcessCommandsPriorities()
end

function Module.AddFunction(p2, Text, p3, StandardPriority1) --[[ Line: 56 ]]
	-- upvalues: StandardPriority (ref)
	if StandardPriority1 == nil then
		StandardPriority1 = StandardPriority
	end
	if p2.RegisteredFunctions[Text] then
		error(Text .. " is already in use!")
	end
	p2.RegisteredFunctions[Text] = StandardPriority1
	
	if p2.FunctionMap[StandardPriority1] == nil then
		p2.FunctionMap[StandardPriority1] = {}
	end
	p2.FunctionMap[StandardPriority1][Text] = p3
	p2:RebuildProcessCommandsPriorities()
end

function Module.GetIterator(p2) --[[ Line: 75 ]]
	local Count = 1
	local v1 = nil
	local v2 = nil
	
	return function() --[[ Line: 80 ]]
		-- upvalues: Count (ref), p2 (copy), v1 (ref), v2 (ref)
		local RegisteredPriorite = nil
		while true do
			if #p2.RegisteredPriorites < Count then return end
			RegisteredPriorite = p2.RegisteredPriorites[Count]
			v1, v6 = next(p2.FunctionMap[RegisteredPriorite], v1)
			
			if v1 ~= nil then
				return v1, v2, RegisteredPriorite
			end
			Count += 1
		end
	end
end

local config = {
	new = function() --[[ Line: 96 ]]
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.RegisteredFunctions = {}
		self.RegisteredPriorites = {}
		self.FunctionMap = {}
		
		return self
	end
}

function Util:NewSortedFunctionContainer() --[[ Line: 107 ]]
	-- upvalues: config (copy)
	return config.new()
end

return Util