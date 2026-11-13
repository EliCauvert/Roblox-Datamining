local WeakModule = require("../weak")
local _ = require("../reactive/types")
local NodesModule = require("./nodes")
local Config = nil
local Inspecting = NodesModule.inspecting

local function _(p1)
	-- upvalues: Config (ref)
	local Config1 = Config
	
	if Config1 == nil or Config1.broken then return end
	if not pcall(p1, Config1) then
		Config1.broken = true
	end
end

local function recordFor(p1)
	-- upvalues: Config (ref), WeakModule (copy)
	local Config1 = Config
	
	if Config1 == nil then
		return nil
	end
	local Record = Config1.records[p1]
	
	if Record ~= nil then
		return Record
	elseif Config1.maxOwners <= Config1.orderedCount then
		Config1.droppedOwners += 1
		
		return nil
	else
		Config1.nextId += 1
		local Children = {}
		WeakModule.keys(Children)
		local config = {
			label = nil,
			owned = 0,
			adopted = 0,
			borrowed = 0,
			watches = 0,
			cleanups = 0,
			childCount = 0,
			isChild = false,
			isMount = false,
			id = Config1.nextId,
			children = Children
		}
		Config1.records[p1] = config
		Config1.orderedCount += 1
		Config1.ordered[Config1.orderedCount] = p1
		
		return config
	end
end

return {
	flag = Inspecting,
	isActive = function(): boolean
		-- upvalues: Config (ref)
		return Config ~= nil
	end,
	start = function(p1)
		-- upvalues: WeakModule (copy), Config (ref), Inspecting (copy)
		local P13 = p1 or {}
		local Records = {}
		WeakModule.keys(Records)
		local Ordered = {}
		WeakModule.values(Ordered)
		local NodeOwner = {}
		WeakModule.keys(NodeOwner)
		Config = {
			orderedCount = 0,
			nextId = 0,
			droppedOwners = 0,
			droppedNodes = 0,
			nodes = 0,
			broken = false,
			records = Records,
			ordered = Ordered,
			maxOwners = P13.maxOwners or 4096,
			maxNodes = P13.maxNodes or 16384,
			nodeOwner = NodeOwner
		}
		Inspecting.active = true
	end,
	stop = function()
		-- upvalues: Config (ref), Inspecting (copy), NodesModule (copy)
		Config = nil
		Inspecting.active = false
		NodesModule.resetCharges()
	end,
	label = function(p1, Label)
		-- upvalues: recordFor (copy), Config (ref)
		local function v28()
			-- upvalues: recordFor (upval), p1 (copy), Label (copy)
			local RecordForResult = recordFor(p1)
			
			if RecordForResult ~= nil then
				RecordForResult.label = Label
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v28, Config1) then
				Config1.broken = true
			end
		end
	end,
	node = function(p1, p2, p3)
		-- upvalues: recordFor (copy), Config (ref)
		local function v12(p4)
			-- upvalues: recordFor (upval), p1 (copy), p3 (copy), p2 (copy)
			local RecordForResult = recordFor(p1)
			
			if RecordForResult == nil then return end
			if p3 == "owned" then
				RecordForResult.owned += 1
			elseif p3 == "adopted" then
				RecordForResult.adopted += 1
			else
				RecordForResult.borrowed += 1
			end
			if p4.maxNodes <= p4.nodes then
				p4.droppedNodes += 1
				
				return
			else
				p4.nodes += 1
				p4.nodeOwner[p2] = RecordForResult
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v12, Config1) then
				Config1.broken = true
			end
		end
	end,
	mount = function(p1)
		-- upvalues: recordFor (copy), Config (ref)
		local function v15()
			-- upvalues: recordFor (upval), p1 (copy)
			local RecordForResult = recordFor(p1)
			
			if RecordForResult ~= nil then
				RecordForResult.isMount = true
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v15, Config1) then
				Config1.broken = true
			end
		end
	end,
	watch = function(p1)
		-- upvalues: recordFor (copy), Config (ref)
		local function v18()
			-- upvalues: recordFor (upval), p1 (copy)
			local RecordForResult = recordFor(p1)
			
			if RecordForResult ~= nil then
				RecordForResult.watches += 1
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v18, Config1) then
				Config1.broken = true
			end
		end
	end,
	cleanup = function(p1)
		-- upvalues: recordFor (copy), Config (ref)
		local function v21()
			-- upvalues: recordFor (upval), p1 (copy)
			local RecordForResult = recordFor(p1)
			
			if RecordForResult ~= nil then
				RecordForResult.cleanups += 1
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v21, Config1) then
				Config1.broken = true
			end
		end
	end,
	child = function(p1, p2)
		-- upvalues: recordFor (copy), Config (ref)
		local function v24()
			-- upvalues: recordFor (upval), p1 (copy), p2 (copy)
			local RecordForResult = recordFor(p1)
			local RecordForResult1 = recordFor(p2)
			
			if RecordForResult == nil or RecordForResult1 == nil then return end
			if RecordForResult.children[p2] == nil then
				RecordForResult.children[p2] = true
				RecordForResult.childCount += 1
			end
			RecordForResult1.isChild = true
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v24, Config1) then
				Config1.broken = true
			end
		end
	end,
	__state = function()
		-- upvalues: Config (ref)
		return Config
	end
}