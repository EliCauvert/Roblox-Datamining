local ActiveModule = require("./ownership/active")
local OwnerModule = require("./ownership/owner")
local DiagnosticsModule = require("./diagnostics")
local DynamicModule = require("./dynamic")
local GraphModule = require("./reactive/graph")
local NodeModule = require("./reactive/node")
local _ = require("./reactive/types")
local Module = {}
Module.__index = Module

function Module.peek(p1)
	-- upvalues: NodeModule (copy)
	local RefreshFunction: (any) -> () = p1.refresh
	
	if RefreshFunction ~= nil then
		RefreshFunction(p1)
	end
	return NodeModule.readCached(p1)
end

NodeModule.adopt(Module)

return function(p1)
	-- upvalues: ActiveModule (copy), DiagnosticsModule (copy), GraphModule (copy), OwnerModule (copy), DynamicModule (copy), Module (copy)
	local CurrentResult = ActiveModule.current()
	
	if CurrentResult == nil then
		return DiagnosticsModule.raise("selector/no-active-owner", "selector ran with no owner to hold it", {
			contract = "a selector and its projections live exactly as long as their creating owner",
			fix = "create the selector inside a component or Compose.withOwner(owner, ...)"
		})
	end
	local config = {
		reads = 0,
		retry = false,
		released = false,
		state = GraphModule.DIRTY
	}
	local v1 = p1
	local Tbl = {}
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local Flag = false
	
	local function _()
		-- upvalues: config (copy), DiagnosticsModule (upval)
		if not config.released then return end
		return DiagnosticsModule.raise("reactive/disposed-selector", "a disposed selector cannot be read", {
			contract = "selector disposal permanently releases its source and projections",
			fix = "keep reads within the selector owner's lifetime"
		})
	end
	
	local _ = function(p2)
		-- upvalues: v2 (ref), Tbl (copy)
		return if p2 == nil then v2 else Tbl[p2]
	end
	
	local _ = function(p2, Value)
		-- upvalues: GraphModule (upval)
		if p2 ~= nil and p2.value ~= Value then
			p2.value = Value
			p2.version = GraphModule.nextVersion()
			GraphModule.markStale(p2, GraphModule.DIRTY)
		end
	end
	
	local function readSource(Callback)
		-- upvalues: v1 (ref)
		return Callback(assert(v1))
	end
	
	local function update()
		-- upvalues: config (copy), DiagnosticsModule (upval), GraphModule (upval), readSource (copy), v4 (ref), Flag (ref), Tbl (copy), v2 (ref), v3 (ref)
		if config.released then
			local _ = DiagnosticsModule.raise("reactive/disposed-selector", "a disposed selector cannot be read", {
				contract = "selector disposal permanently releases its source and projections",
				fix = "keep reads within the selector owner's lifetime"
			})
		end
		if config.state == GraphModule.CLEAN then return end
		config.state = GraphModule.CLEAN
		local Success, Result = pcall(GraphModule.evaluate, config, readSource, GraphModule.use)
		
		if Success then
			local Flag1: boolean = Flag
			
			if config.released then return end
			v4 = nil
			Flag = false
			local v5 = v3
			v3 = Result
			local Entry = if v5 == nil then v2 else Tbl[v5]
			local IsEqual = rawequal(v5, v3)
			
			if Entry ~= nil and Entry.value ~= IsEqual then
				Entry.value = IsEqual
				Entry.version = GraphModule.nextVersion()
				GraphModule.markStale(Entry, GraphModule.DIRTY)
			end
			local v6 = v3
			local Entry1 = if v6 == nil then v2 else Tbl[v6]
			
			if Entry1 ~= nil and Entry1.value ~= true then
				Entry1.value = true
				Entry1.version = GraphModule.nextVersion()
				GraphModule.markStale(Entry1, GraphModule.DIRTY)
			end
			if Flag1 then
				for _, value1 in Tbl do
					GraphModule.markStale(value1, GraphModule.DIRTY)
				end
				if v2 then
					GraphModule.markStale(v2, GraphModule.DIRTY)
				end
			end
			return
		else
			v4 = Result
			Flag = true
			config.state = GraphModule.CLEAN
			config.retry = true
			
			for _, value in Tbl do
				GraphModule.markStale(value, GraphModule.DIRTY)
			end
			if v2 then
				GraphModule.markStale(v2, GraphModule.DIRTY)
			end
		end
	end
	
	config.invalidate = update
	local OwnResult: () -> () = OwnerModule.own(CurrentResult, function()
		-- upvalues: GraphModule (upval), config (copy), Tbl (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref)
		GraphModule.release(config)
		table.clear(Tbl)
		v1 = nil
		v2 = nil
		v3 = nil
		v4 = nil
	end)
	
	local function refreshProjection(_)
		-- upvalues: update (copy), Flag (ref), v4 (ref)
		update()
		
		if Flag then
			error(v4, 0)
		end
	end
	
	update()
	
	if Flag then
		local v7 = v4
		OwnResult()
		error(v7, 0)
	end
	return function(Key)
		-- upvalues: config (copy), DiagnosticsModule (upval), v2 (ref), Tbl (copy), GraphModule (upval), refreshProjection (copy), DynamicModule (upval), v3 (ref), Module (upval)
		if config.released then
			local _ = DiagnosticsModule.raise("reactive/disposed-selector", "a disposed selector cannot be read", {
				contract = "selector disposal permanently releases its source and projections",
				fix = "keep reads within the selector owner's lifetime"
			})
		end
		local Entry = if Key == nil then v2 else Tbl[Key]
		
		if Entry ~= nil then
			return Entry
		end
		local config1 = {
			value = nil,
			cache = nil,
			version = GraphModule.nextVersion(),
			refresh = refreshProjection
		}
		DynamicModule.cache(config1, (rawequal(v3, Key)))
		local self = setmetatable(config1, Module)
		
		if Key == nil then
			v2 = self
			
			return self
		else
			Tbl[Key] = self
			
			return self
		end
	end
end