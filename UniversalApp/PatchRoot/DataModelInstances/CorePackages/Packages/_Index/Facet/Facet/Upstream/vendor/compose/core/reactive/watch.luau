--!native

local EvaluationModule = require("./evaluation")
local Stats = EvaluationModule.stats
local DynamicModule = require("../dynamic")
local GraphModule = require("./graph")
local NodeModule = require("./node")
local _ = require("./types")
local State = Stats.state
local CLEAN = GraphModule.CLEAN
local CHECK = GraphModule.CHECK
local DIRTY = GraphModule.DIRTY

local function v10(_) end

local function v11(_) end

local function installScope(p1, p2)
	-- upvalues: v10 (ref), v11 (ref)
	v10 = p1
	v11 = p2
end

local function rerun(p1, p2)
	-- upvalues: State (copy), Stats (copy), CLEAN (copy), v10 (ref), GraphModule (copy)
	if State.enabled then
		Stats.bump("watchRuns")
		State.recorder.enterRun(p1)
	end
	p1.state = CLEAN
	
	if p1.inherited ~= nil then
		v10(p1)
	end
	if p2 == nil then
		GraphModule.runEffect(p1)
		
		return
	else
		GraphModule.runEffectIn(p2, p1)
	end
end

local function _(p1)
	-- upvalues: GraphModule (copy)
	p1.retry = true
	p1.retry = false
	
	return (GraphModule.dependenciesMoved(p1))
end

local _ = function(p1)
	-- upvalues: GraphModule (copy)
	local Success, Result = pcall(GraphModule.dependenciesMoved, p1)
	
	return not Success or Result
end

local Module = {}
Module.__index = Module
NodeModule.adopt(Module)
Module.state = CLEAN
Module.kind = 3
Module.released = false
Module.queued = false

function Module.run(p1, p2)
	-- upvalues: CHECK (copy), GraphModule (copy), CLEAN (copy), rerun (copy)
	if p1.released then return end
	if p1.state == CHECK then
		p1.retry = true
		p1.retry = false
		
		if not GraphModule.dependenciesMoved(p1) then
			p1.state = CLEAN
			
			return
		end
	end
	rerun(p1, p2)
end

Module.runIn = Module.run
local Module1 = {}
Module1.__index = Module1
NodeModule.adopt(Module1)
Module1.state = CLEAN
Module1.group = true
Module1.kind = 4
Module1.released = false
Module1.queued = false
local v1 = nil

local function sweep(p1, _, p2)
	-- upvalues: EvaluationModule (copy), v1 (ref), DIRTY (copy), State (copy), Stats (copy), CLEAN (copy), GraphModule (copy)
	local Reactor = p1.reactor
	local EnterFrameResult, EnterFrameResult2, EnterFrameResult3 = EvaluationModule.enterFrame(p1)
	local v2 = p2
	while v2 ~= nil do
		local v3 = v2[4]
		v1 = v3
		local v4 = v2[2]
		
		if v4 ~= nil and v4 ~= p1 and v4[2] == nil and v4.state == DIRTY and v4.reactor == Reactor and not v4.queued and not v4.released and v4.group then
			if State.enabled then
				Stats.bump("watchRuns")
				State.recorder.enterRun(v4)
			end
			v4.state = CLEAN
			GraphModule.runEffectIn(EnterFrameResult, v4)
		end
		v2 = v3
	end
	EvaluationModule.leaveFrame(EnterFrameResult, EnterFrameResult2, EnterFrameResult3)
end

function Module1.run(p3, p4)
	-- upvalues: CHECK (copy), GraphModule (copy), CLEAN (copy), rerun (copy), EvaluationModule (copy), v1 (ref), sweep (copy)
	local Source = p3.source
	p3.source = nil
	repeat
		if p3.released then break end
		if p3.state == CHECK then
			p3.retry = true
			p3.retry = false
			
			if not GraphModule.dependenciesMoved(p3) then
				p3.state = CLEAN
				break
			end
		end
		rerun(p3, p4)
	until true
	if Source == nil then return end
	local First = Source.first
	
	if First ~= nil and First[4] == nil then return end
	local SnapshotResult, SnapshotResult2 = EvaluationModule.snapshot()
	local First1 = Source.first
	local Entry = nil
	while First1 ~= nil do
		local v5 = v1
		v1 = nil
		local Success, Result = pcall(sweep, p3, Source, First1)
		local v6 = v1
		v1 = v5
		
		if Success then break end
		EvaluationModule.leave(SnapshotResult, SnapshotResult2)
		local Entry1 = Entry or {}
		Entry = Entry1
		table.insert(Entry1, (tostring(Result)))
		First1 = v6
	end
	if Entry ~= nil then
		if #Entry == 1 then
			error(Entry[1], 0)
		end
		error(("Compose: %d fused bindings failed:\n  %s"):format(#Entry, table.concat(Entry, "\n  ")), 0)
	end
end

function Module1.runIn(p5, p6)
	-- upvalues: CHECK (copy), Module1 (copy), State (copy), Stats (copy), CLEAN (copy), GraphModule (copy)
	if p5.source ~= nil or p5.state == CHECK then
		Module1.run(p5, p6)
		
		return
	end
	if p5.released then return end
	if State.enabled then
		Stats.bump("watchRuns")
		State.recorder.enterRun(p5)
	end
	p5.state = CLEAN
	GraphModule.runEffectIn(p6, p5)
end

local Module2 = {}
Module2.__index = Module2
NodeModule.adopt(Module2)
Module2.state = CLEAN
Module2.kind = 3
Module2.released = false
Module2.queued = false

function Module2.run(p5, p6)
	-- upvalues: CHECK (copy), GraphModule (copy), CLEAN (copy), rerun (copy)
	if p5.released then return end
	if p5.state == CHECK then
		local Success, Result = pcall(GraphModule.dependenciesMoved, p5)
		
		if Success and not Result then
			p5.state = CLEAN
			
			return
		end
	end
	rerun(p5, p6)
end

Module2.runIn = Module2.run

local function begin(Reactor, Effect, p5, p6, Inherited)
	-- upvalues: NodeModule (copy), State (copy), EvaluationModule (copy), rerun (copy), GraphModule (copy), v11 (ref)
	local config = {
		reads = nil,
		child = nil,
		reactor = Reactor,
		effect = Effect,
		inherited = Inherited
	}
	NodeModule.classify(config, p5)
	
	if State.enabled then
		State.recorder.born(config, p6)
	end
	local SnapshotResult, SnapshotResult2 = EvaluationModule.snapshot()
	local Success, Result = pcall(rerun, config, nil)
	
	if not Success then
		EvaluationModule.leave(SnapshotResult, SnapshotResult2)
		GraphModule.release(config)
		
		if config.child ~= nil then
			v11(config)
		end
		error(Result, 0)
	end
	if #config == 0 and not config.queued then
		config.effect = nil
	end
	return config
end

local _ = function(Reactor, Effect, p5, p6, Inherited)
	-- upvalues: begin (copy), GraphModule (copy), v11 (ref)
	local BeginResult = begin(Reactor, Effect, p5, p6, Inherited)
	
	return function()
		-- upvalues: BeginResult (copy), GraphModule (upval), v11 (upval)
		if BeginResult.released then return end
		GraphModule.release(BeginResult)
		BeginResult.queued = false
		
		if BeginResult.child ~= nil then
			v11(BeginResult)
		end
	end
end

return {
	watchGuarded = function(Reactor, Effect, p5)
		-- upvalues: Module2 (copy), begin (copy), GraphModule (copy), v11 (ref)
		local BeginResult = begin(Reactor, Effect, Module2, p5, nil)
		
		return function()
			-- upvalues: BeginResult (copy), GraphModule (upval), v11 (upval)
			if BeginResult.released then return end
			GraphModule.release(BeginResult)
			BeginResult.queued = false
			
			if BeginResult.child ~= nil then
				v11(BeginResult)
			end
		end
	end,
	watchScoped = function(Reactor, Effect, p5, Inherited, p6)
		-- upvalues: Module2 (copy), Module (copy), begin (copy), GraphModule (copy), v11 (ref)
		local BeginResult = begin(Reactor, Effect, if p6 then Module2 else Module, p5, Inherited)
		
		return function()
			-- upvalues: BeginResult (copy), GraphModule (upval), v11 (upval)
			if BeginResult.released then return end
			GraphModule.release(BeginResult)
			BeginResult.queued = false
			
			if BeginResult.child ~= nil then
				v11(BeginResult)
			end
		end
	end,
	installScope = installScope,
	watchStatic = function(p5, p6, p7)
		-- upvalues: GraphModule (copy), DynamicModule (copy)
		return GraphModule.listen(p5, GraphModule.nodeOf(p6), DynamicModule.listener(p7))
	end,
	terminalNode = function(Reactor, Effect, p5)
		-- upvalues: begin (copy), Module2 (copy), Module1 (copy)
		return (begin(Reactor, Effect, if p5 then Module2 else Module1, nil))
	end,
	releaseHeld = function(p5)
		-- upvalues: NodeModule (copy), GraphModule (copy)
		local AsNodeResult = NodeModule.asNode(p5)
		
		if AsNodeResult ~= nil then
			if AsNodeResult.listener ~= nil then
				GraphModule.unlisten(AsNodeResult)
				
				return
			end
			if not AsNodeResult.released and AsNodeResult.state ~= nil then
				GraphModule.release(AsNodeResult)
				AsNodeResult.queued = false
			end
		end
	end,
	releaseEdge = function(p5)
		-- upvalues: GraphModule (copy)
		if p5.listener ~= nil then
			GraphModule.unlisten(p5)
			
			return
		end
		if not p5.released and p5.state ~= nil then
			GraphModule.release(p5)
			p5.queued = false
		end
	end,
	watchTerminal = function(Reactor, Effect)
		-- upvalues: Module1 (copy), begin (copy), GraphModule (copy), v11 (ref)
		local BeginResult = begin(Reactor, Effect, Module1, nil, nil)
		
		return function()
			-- upvalues: BeginResult (copy), GraphModule (upval), v11 (upval)
			if BeginResult.released then return end
			GraphModule.release(BeginResult)
			BeginResult.queued = false
			
			if BeginResult.child ~= nil then
				v11(BeginResult)
			end
		end
	end,
	sample = function(p5)
		-- upvalues: GraphModule (copy)
		return GraphModule.untracked(p5)
	end
}