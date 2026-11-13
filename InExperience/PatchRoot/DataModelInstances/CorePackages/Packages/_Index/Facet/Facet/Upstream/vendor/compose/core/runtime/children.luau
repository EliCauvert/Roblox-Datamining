--!native

local DiagnosticsModule = require("../diagnostics")
local ActiveModule = require("../ownership/active")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local DynamicModule = require("../dynamic")

local function _(p1, p2: number): number
	local Total = 0
	
	for i = 1, p2 - 1 do
		Total += p1[i]
	end
	return Total
end

local function refuse(Key, p3)
	-- upvalues: DiagnosticsModule (copy)
	return DiagnosticsModule.raise("structure/not-a-mount-point", ("a directive %s %q on its mount point"):format(p3, Key), {
		contract = "a child written as a function is a directive, and receives a mount point, not the parent node",
		fix = "use insert, moveTo, remove, count, parent, or host; to reach the parent node itself, read mountPoint.parent",
		key = Key
	})
end

local config = {
	__index = function(_, p3)
		-- upvalues: refuse (copy)
		return refuse(tostring(p3), "read")
	end,
	__newindex = function(_, p3, _)
		-- upvalues: refuse (copy)
		return refuse(tostring(p3), "assigned")
	end
}

local function mountPointFor(p3, p4)
	-- upvalues: DiagnosticsModule (copy), config (copy)
	local Host = p3.host
	local Render = Host.render
	local MoveChildFunction = Render.moveChild
	local Parent = p3.parent
	
	return (setmetatable({
		parent = Parent,
		host = Host,
		insert = function(p5, p6)
			-- upvalues: p3 (copy), p4 (copy), DiagnosticsModule (upval), Render (copy), Parent (copy)
			local v1: number = p3[p4]
			local Index = if p6 == nil then v1 + 1 else p6
			
			if Index < 1 or v1 + 1 < Index then
				return DiagnosticsModule.raise("structure/position-out-of-range", "a directive asked for a position it cannot have", {
					contract = "a slot-local position must be inside the slot, or exactly one past its end",
					index = Index,
					expected = ("between 1 and %d"):format(v1 + 1)
				})
			end
			local InsertChildFunction: (any, any, any) -> () = Render.insertChild
			local Total = 0
			
			for i = 1, p4 - 1 do
				Total += p3[i]
			end
			InsertChildFunction(Parent, p5, Total + Index)
			p3[p4] = v1 + 1
			p3.total += 1
		end,
		moveTo = function(p7, Index: number)
			-- upvalues: MoveChildFunction (copy), p3 (copy), p4 (copy), DiagnosticsModule (upval), Parent (copy)
			if MoveChildFunction == nil then return end
			local v2 = p3[p4]
			
			if Index < 1 or v2 < Index then
				return DiagnosticsModule.raise("structure/position-out-of-range", "a directive asked to move a node outside its slot", {
					contract = "a move must land inside the slot it started in",
					index = Index,
					expected = ("between 1 and %d"):format(v2)
				})
			end
			local Total = 0
			
			for i = 1, p4 - 1 do
				Total += p3[i]
			end
			MoveChildFunction(Parent, p7, Total + Index)
		end,
		ordersChildren = MoveChildFunction ~= nil,
		remove = function(p8)
			-- upvalues: Render (copy), Parent (copy), p3 (copy), p4 (copy)
			Render.removeChild(Parent, p8)
			p3[p4] -= 1
			p3.total -= 1
		end,
		count = function()
			-- upvalues: p3 (copy), p4 (copy)
			return p3[p4]
		end
	}, config))
end

local _ = function(p7)
	-- upvalues: DynamicModule (copy)
	return if type(p7) == "table" then DynamicModule.nodeList(p7) else nil
end

local function requireNodes(p7, Component)
	-- upvalues: DynamicModule (copy), DiagnosticsModule (copy)
	local NodeListResult = if type(p7) == "table" then DynamicModule.nodeList(p7) else nil
	
	if NodeListResult == nil then
		return DiagnosticsModule.raise("mount/not-a-node-list", "a component returned something that is not a list of nodes", {
			expected = "a node, or an array of nodes",
			component = Component,
			actual = DiagnosticsModule.describe(p7)
		})
	end
	local ValueType = nil
	for Index, value in NodeListResult do
		ValueType = type(value)
		
		if type(value) ~= "table" and type(value) ~= "userdata" then
			return DiagnosticsModule.raise("mount/not-a-node", "a component returned something that is not a node", {
				expected = "a node created through runtime.create, or adopted from the host",
				component = Component,
				index = Index,
				actual = DiagnosticsModule.describe(value),
				fix = if ValueType == "function" then "if this is a named constructor, call it with a props table -- Part \"Ground\" {}" else nil
			})
		end
	end
	return NodeListResult
end

local v2 = 0

local function insertAll(p8, List, p9)
	-- upvalues: v2 (ref)
	local NewCountResult = if p9 == nil then p8.count() + 1 else p9
	for i, value in List do
		p8.insert(value, NewCountResult + i - 1)
		v2 = i
	end
end

local _ = function(p10)
	-- upvalues: DynamicModule (copy)
	local NodeListResult = if type(p10) == "table" then DynamicModule.nodeList(p10) else nil
	
	if NodeListResult == nil then
		return nil
	end
	for _, value in NodeListResult do
		local ValueType = type(value)
		
		if ValueType ~= "table" and ValueType ~= "userdata" then
			return nil
		end
	end
	return NodeListResult
end

local function place(p11, Child, p12, p13, AnonymousComponent, p14, p15)
	-- upvalues: OwnerModule (copy), DynamicModule (copy), requireNodes (copy), v2 (ref), insertAll (copy)
	if not p12 then
		OwnerModule.dispose(Child)
		error(p13, 0)
	end
	local NodeListResult = if type(p13) == "table" then DynamicModule.nodeList(p13) else nil
	local v3 = nil
	
	if NodeListResult == nil then
		v3 = nil
	else
		for _, value in NodeListResult do
			local ValueType = type(value)
			
			if ValueType ~= "table" and ValueType ~= "userdata" then
				v3 = nil
			else
				continue
			end
		end
		v3 = NodeListResult
	end
	if v3 == nil then
		local _, Result = pcall(requireNodes, p13, AnonymousComponent)
		OwnerModule.dispose(Child)
		error(Result, 0)
	end
	local v4: number = v2
	v2 = 0
	local Success, Result1 = pcall(insertAll, p11, v3, p14)
	local v5: number = v2
	v2 = v4
	
	if not Success then
		for i = v5, 1, -1 do
			pcall(p11.remove, v3[i])
		end
		OwnerModule.dispose(Child)
		error(Result1, 0)
	end
	if not p15 then
		OwnerModule.adopt(Child, function()
			-- upvalues: p11 (copy), v3 (copy)
			for i = #v3, 1, -1 do
				p11.remove(v3[i])
			end
		end)
	end
	return v3
end

local function rowOutputs(Success, p16, ...)
	if p16 == nil or select("#", ...) ~= 0 then
		return Success, nil, { p16, ... }
	else
		return Success, p16, nil
	end
end

return {
	block = {
		mountBlock = function(p16, p17, p18, p19, p20, p21)
			-- upvalues: OwnerModule (copy), ActiveModule (copy), place (copy)
			local Child = OwnerModule.createChild(p17)
			local PushResult = ActiveModule.push(Child)
			local Success, Result = pcall(p18)
			ActiveModule.pop(Child, PushResult)
			
			return {
				nodes = place(p16, Child, Success, Result, p19, p20, p21),
				owner = Child
			}
		end,
		mountRow = function(p16, p17, p18, p19, p20, p21, Component, p22)
			-- upvalues: OwnerModule (copy), ActiveModule (copy), DiagnosticsModule (copy)
			local Child = OwnerModule.createChild(p17)
			local PushResult = ActiveModule.push(Child)
			local Success, Result = pcall(p18, p19, p20, p21)
			ActiveModule.pop(Child, PushResult)
			
			if not Success then
				OwnerModule.dispose(Child)
				error(Result, 0)
			end
			if type(Result) ~= "table" and type(Result) ~= "userdata" then
				OwnerModule.dispose(Child)
				
				return DiagnosticsModule.raise("mount/not-a-node", "a row returned something that is not a node", {
					index = 1,
					expected = "a node created through runtime.create, or adopted from the host",
					component = Component,
					actual = DiagnosticsModule.describe(Result)
				})
			end
			local Success1, Result1 = pcall(p16.insert, Result, p22)
			
			if not Success1 then
				OwnerModule.dispose(Child)
				error(Result1, 0)
			end
			return Result, Child
		end,
		mountRows = function(p16, p17, p18, p19, p20, p21)
			-- upvalues: OwnerModule (copy), ActiveModule (copy), rowOutputs (copy), place (copy)
			local Child = OwnerModule.createChild(p17)
			local PushResult = ActiveModule.push(Child)
			local RowOutputsResult, RowOutputsResult2, RowOutputsResult3 = rowOutputs(pcall(p18, p19, p20))
			ActiveModule.pop(Child, PushResult)
			
			if RowOutputsResult3 == nil and RowOutputsResult then
				if type(RowOutputsResult2) == "table" or type(RowOutputsResult2) == "userdata" then
					local Success, Result = pcall(p16.insert, RowOutputsResult2, nil)
					
					if not Success then
						OwnerModule.dispose(Child)
						error(Result, 0)
					end
					return RowOutputsResult2, Child
				else
					place(p16, Child, true, { RowOutputsResult2 }, p21, nil, nil)
				end
			else
				place(p16, Child, RowOutputsResult, if RowOutputsResult then RowOutputsResult3 else RowOutputsResult2, p21, nil, nil)
			end
			return nil, Child
		end,
		mountSingle = function(Direct, Parent, p16, Callback)
			-- upvalues: OwnerModule (copy), ActiveModule (copy), rowOutputs (copy), place (copy), mountPointFor (copy)
			local Child = OwnerModule.createChild(p16)
			local PushResult = ActiveModule.push(Child)
			local RowOutputsResult, RowOutputsResult2, RowOutputsResult3 = rowOutputs(pcall(Callback))
			ActiveModule.pop(Child, PushResult)
			
			if RowOutputsResult and RowOutputsResult3 == nil and (type(RowOutputsResult2) == "table" or type(RowOutputsResult2) == "userdata") then
				local Render = Direct.render
				local Success, Result = pcall(Render.insertChild, Parent, RowOutputsResult2, 1)
				
				if not Success then
					OwnerModule.dispose(Child)
					error(Result, 0)
				end
				OwnerModule.adopt(Child, function()
					-- upvalues: Render (copy), Parent (copy), RowOutputsResult2 (copy)
					Render.removeChild(Parent, RowOutputsResult2)
				end)
				
				return Child, RowOutputsResult2
			else
				local config = {
					total = 0,
					host = Direct,
					direct = Direct,
					parent = Parent
				}
				local v6 = #config + 1
				config[v6] = 0
				local MountPointForResult = mountPointFor(config, v6)
				local RowOutputsResult3_1 = if RowOutputsResult then RowOutputsResult3 or { RowOutputsResult2 } else RowOutputsResult2
				local AnonymousComponent = nil
				
				if type(Callback) == "function" then
					local DebugInfo = debug.info(Callback, "n")
					AnonymousComponent = if DebugInfo == "" then "<anonymous component>" else DebugInfo
				else
					AnonymousComponent = "<not a component>"
				end
				return Child, place(MountPointForResult, Child, RowOutputsResult, RowOutputsResult3_1, AnonymousComponent, nil, nil)[1]
			end
		end,
		releaseNode = function(p16, p17)
			p16.remove(p17)
		end,
		releaseNodes = function(p16, p17)
			for i = #p17, 1, -1 do
				p16.remove(p17[i])
			end
		end,
		nameOf = function(Callback)
			if type(Callback) == "function" then
				local DebugInfo = debug.info(Callback, "n")
				
				return if DebugInfo == "" then "<anonymous component>" else DebugInfo
			else
				return "<not a component>"
			end
		end,
		requireNodes = requireNodes
	},
	createList = function(Host, Parent, p18)
		return {
			total = 0,
			host = Host,
			direct = p18 or Host,
			parent = Parent
		}
	end,
	addSlot = function(p18): number
		local v6 = #p18 + 1
		p18[v6] = 0
		
		return v6
	end,
	mountPointFor = mountPointFor,
	insertStatic = function(p18, Key, p19)
		p18.direct.render.insertChild(p18.parent, p19, p18.total + 1)
		p18[Key] += 1
		p18.total += 1
	end,
	wholeOf = function(Direct, Parent)
		-- upvalues: mountPointFor (copy)
		local config = {
			total = 0,
			host = Direct,
			direct = Direct,
			parent = Parent
		}
		local v6 = #config + 1
		config[v6] = 0
		
		return (mountPointFor(config, v6))
	end
}