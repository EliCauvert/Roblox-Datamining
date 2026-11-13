--!native

local DiagnosticsModule = require("../diagnostics")
local DynamicModule = require("../dynamic")
local EvaluationModule = require("./evaluation")
local GraphModule = require("./graph")
local NodeModule = require("./node")
local _ = require("./types")
local CellModule = require("./cell")
local Stats = EvaluationModule.stats
local State = Stats.state
local Validation = EvaluationModule.validation
local CLEAN = GraphModule.CLEAN
local CHECK = GraphModule.CHECK
local DIRTY = GraphModule.DIRTY
local RETRY = GraphModule.RETRY
local Clock = GraphModule.clock
local Use = GraphModule.use
local Cache = EvaluationModule.cache
local Detachers = NodeModule.detachers

local function _()
	-- upvalues: DiagnosticsModule (copy)
	return DiagnosticsModule.raise("reactive/disposed-formula", "a disposed formula cannot be read", {
		contract = "formula disposal permanently releases its dependencies",
		fix = "keep reads within the formula lifetime, or create a new formula"
	})
end

local function none(_)
	return nil
end

local Module = {}
Module.__index = Module
Module.kind = 1
Module.released = false
Module.retry = false

function Module.refresh(Consumer)
	-- upvalues: DiagnosticsModule (copy), CLEAN (copy), CHECK (copy), RETRY (copy), none (copy), Cache (copy), EvaluationModule (copy), Validation (copy), Use (copy), GraphModule (copy), State (copy), Stats (copy), CellModule (copy), DynamicModule (copy), Clock (copy)
	local State1 = Consumer.state
	
	if State1 == 4 then
		local _ = DiagnosticsModule.raise("reactive/disposed-formula", "a disposed formula cannot be read", {
			contract = "formula disposal permanently releases its dependencies",
			fix = "keep reads within the formula lifetime, or create a new formula"
		})
	end
	if State1 == CLEAN then return end
	repeat
		if State1 ~= CHECK then break end
		Consumer.state = RETRY
		local Flag = false
		
		for i = 1, #Consumer do
			local ConsumerEntry = Consumer[i]
			local NoConsumerEntry = ConsumerEntry == nil
			local ConsumerEntry1 = nil
			
			if not NoConsumerEntry then
				ConsumerEntry1 = ConsumerEntry[1]
				NoConsumerEntry = ConsumerEntry1 == nil
			end
			if not NoConsumerEntry then
				local Refresh: (any) -> () = if ConsumerEntry1.state == CLEAN then nil else ConsumerEntry1.refresh
				
				if Refresh ~= nil then
					Refresh(ConsumerEntry1)
				end
				if ConsumerEntry1.version ~= ConsumerEntry.version then
					Flag = true
					break
				end
			end
		end
		if Flag then break end
		Consumer.state = if Consumer.state == 4 then 4 else CLEAN
		
		return
	until true
	Consumer.state = if Consumer.state == 4 then 4 else CLEAN
	local Body = Consumer.body or none
	local CurrentThread = coroutine.running()
	local Frame = if CurrentThread == Cache.thread then Cache.frame else nil
	local FrameResult = if Frame == nil then EvaluationModule.frame() else Frame
	local Consumer1 = FrameResult.consumer
	local Order: number = FrameResult.order
	
	if Order == 0 then
		Cache.active += 1
	end
	local NewOrder = Cache.order + 1
	Cache.order = NewOrder
	FrameResult.consumer = Consumer
	FrameResult.order = NewOrder
	Cache.consumer = Consumer
	Consumer.reads = 0
	local Success = nil
	local Result = nil
	
	if Validation.validating then
		Success, Result = pcall(EvaluationModule.call, Body, Use)
	else
		Success, Result = pcall(Body, Use)
	end
	FrameResult.consumer = Consumer1
	FrameResult.order = Order
	
	if Order == 0 then
		Cache.active -= 1
	end
	Cache.thread = CurrentThread
	Cache.frame = FrameResult
	Cache.consumer = if Order > 0 then Consumer1 else nil
	
	if not Success then
		Consumer.state = if Consumer.released then 4 else RETRY
		error(Result, 0)
	end
	local Reads = Consumer.reads or 0
	
	if Reads < #Consumer then
		GraphModule.trim(Consumer, Reads + 1)
	end
	Consumer.reads = nil
	
	if Consumer.state == 4 then
		local _ = DiagnosticsModule.raise("reactive/disposed-formula", "a disposed formula cannot be read", {
			contract = "formula disposal permanently releases its dependencies",
			fix = "keep reads within the formula lifetime, or create a new formula"
		})
	end
	if State.enabled then
		Stats.bump("formulaRecomputations")
		State.recorder.recompute(Consumer)
	end
	local Cache1 = Consumer.cache
	local Value = Consumer.value
	local Equals = Consumer.equals
	
	if if Equals == nil and not Validation.validating then Value == Result elseif Equals == nil then EvaluationModule.call(CellModule.defaultEquals, Value, Result) else Cache1 ~= nil and EvaluationModule.call(CellModule.compare, Equals, Value, Result) then
		if Cache1 == nil then
			DynamicModule.cache(Consumer, Result)
		end
		if State.enabled then
			Stats.bump("formulaRecomputationsSuppressed")
			State.recorder.suppressedRecompute(Consumer)
		end
		return
	else
		Consumer.value = Result
		
		if Cache1 == nil then
			DynamicModule.cache(Consumer, Result)
		end
		local NewNow = Clock.now + 1
		Clock.now = NewNow
		Consumer.version = NewNow
	end
end

function Module.peek(Consumer)
	-- upvalues: Module (copy), NodeModule (copy)
	Module.refresh(Consumer)
	local Cache = Consumer.cache
	
	return if Cache == nil then NodeModule.readCached(Consumer) else Cache.value
end

local function readOnly(_)
	-- upvalues: DiagnosticsModule (copy)
	return DiagnosticsModule.raise("reactive/read-only", "a formula cannot be set", {
		contract = "a formula derives its value from what it reads",
		fix = "set a cell the formula reads, or use a cell instead"
	})
end

Module.set = readOnly
Module.update = readOnly
NodeModule.adopt(Module)

local _ = function(Key)
	-- upvalues: Detachers (copy), GraphModule (copy)
	local Detacher: () -> () = Detachers[Key]
	
	if Detacher then
		Detachers[Key] = nil
		Detacher()
	end
	Key.state = 4
	GraphModule.release(Key)
	Key.state = 4
	Key.body = nil
	Key.cache = nil
	Key.value = nil
	Key.equals = nil
end

local function cutoff(p1)
	-- upvalues: Module (copy), GraphModule (copy)
	if p1.released or p1.first == nil then return end
	local Version = p1.version
	
	if not pcall(Module.refresh, p1) or p1.version ~= Version then
		GraphModule.markStale(p1, GraphModule.DIRTY)
	end
end

function Module.dispose(p1)
	-- upvalues: NodeModule (copy), Detachers (copy), GraphModule (copy)
	local NodeOfResult = NodeModule.nodeOf(p1)
	local Detacher: () -> () = Detachers[NodeOfResult]
	
	if Detacher then
		Detachers[NodeOfResult] = nil
		Detacher()
	end
	NodeOfResult.state = 4
	GraphModule.release(NodeOfResult)
	NodeOfResult.state = 4
	NodeOfResult.body = nil
	NodeOfResult.cache = nil
	NodeOfResult.value = nil
	NodeOfResult.equals = nil
end

return function(Body, Equals)
	-- upvalues: DIRTY (copy), Module (copy), cutoff (copy)
	local config = {
		version = 0,
		state = DIRTY,
		body = Body,
		refresh = Module.refresh
	}
	
	if Equals ~= nil then
		config.equals = Equals
		config.cutoff = cutoff
		config.kind = 2
	end
	return (setmetatable(config, Module))
end