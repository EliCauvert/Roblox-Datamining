--!native

local DiagnosticsModule = require("../diagnostics")
local NodeModule = require("./node")
local WeakModule = require("../weak")
local DynamicModule = require("../dynamic")
local EvaluationModule = require("./evaluation")
local Stats = EvaluationModule.stats
local Cache = EvaluationModule.cache
local ReactorModule = require("./reactor")
local _ = require("./types")
local State = Stats.state
local Validation = EvaluationModule.validation
local Clock = { now = 0 }

local function nextVersion(): number
	-- upvalues: Clock (copy)
	local NewNow = Clock.now + 1
	Clock.now = NewNow
	
	return NewNow
end

local Detachers = NodeModule.detachers
local NodeOfFunction = NodeModule.nodeOf
local IdentityKey = NodeModule.identityKey
local List = {}
local t = {}
WeakModule.keys(t)
local Count = 0

local function observe(Key, p1)
	-- upvalues: t (copy), Count (ref)
	local Entry = t[Key]
	
	if p1 == nil or Entry ~= nil then
		if p1 == nil and Entry ~= nil then
			Count -= 1
		end
	else
		Count += 1
	end
	if p1 == nil then
		t[Key] = nil
		
		return
	else
		t[Key] = p1
	end
end

local t1 = {}
WeakModule.keys(t1)

local function _(Key)
	-- upvalues: DynamicModule (copy), t1 (copy)
	if Key.coalescing then
		local First = Key.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Key.coalescing = nil
		DynamicModule.write(Key, "set", nil)
		t1[Key] = nil
	end
end

function State.resume()
	-- upvalues: t1 (copy), DynamicModule (copy)
	for i in t1 do
		if i.coalescing then
			local First = i.first
			
			if First ~= nil then
				local FirstEntry = First[2]
				
				if FirstEntry == nil then
					local Version: number = First.version
					
					if Version ~= nil and Version < 0 then
						First.version = -Version - 1
					end
				else
					FirstEntry.coalesced = false
				end
			end
			i.coalescing = nil
			DynamicModule.write(i, "set", nil)
			t1[i] = nil
		end
	end
end

local function coalesce(Coalesced, p1, p2)
	-- upvalues: DynamicModule (copy), t1 (copy)
	if not Coalesced.coalescing then
		Coalesced.coalescing = 1
		DynamicModule.write(Coalesced, "set", p2)
		
		if p1.state == nil then
			p1.version = -(p1.version or 0) - 1
		else
			p1.coalesced = Coalesced
		end
		t1[Coalesced] = true
	end
end

local _ = function(p1): string
	return if p1.state == nil or p1.refresh == nil then "cell" else "formula"
end

local function append(Key, Entry)
	-- upvalues: Count (ref), t (copy), DynamicModule (copy), t1 (copy)
	local First = Key.first
	
	if First == nil then
		Key.first = Entry
		Entry[3] = Entry
		
		if Count > 0 then
			local Entry1: (any) -> () = t[Key]
			
			if Entry1 then
				Entry1(true)
			end
		end
		return
	else
		if First.listenerGroup and (Entry[2] ~= nil or Entry.reactor ~= First.reactor) then
			First.listenerGroup = false
		end
		if Key.coalescing ~= nil and Key.coalescing then
			local First1 = Key.first
			
			if First1 ~= nil then
				local FirstEntry1 = First1[2]
				
				if FirstEntry1 == nil then
					local Version: number = First1.version
					
					if Version ~= nil and Version < 0 then
						First1.version = -Version - 1
					end
				else
					FirstEntry1.coalesced = false
				end
			end
			Key.coalescing = nil
			DynamicModule.write(Key, "set", nil)
			t1[Key] = nil
		end
		local FirstEntry = First[3]
		
		if FirstEntry ~= nil then
			FirstEntry[4] = Entry
		end
		Entry[3] = FirstEntry
		First[3] = Entry
	end
end

local _ = function(p1, p2)
	-- upvalues: append (copy)
	local config = {
		p1,
		p2,
		nil,
		nil,
		version = p1.version
	}
	append(p1, config)
	
	return config
end

local function detach(Entry)
	-- upvalues: DynamicModule (copy), t1 (copy), Count (ref), t (copy)
	local Entry1 = Entry[1]
	
	if Entry1 == nil then return end
	if Entry1.coalescing then
		local First = Entry1.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Entry1.coalescing = nil
		DynamicModule.write(Entry1, "set", nil)
		t1[Entry1] = nil
	end
	local First1 = Entry1.first
	local Entry2 = Entry[3]
	local Entry3 = Entry[4]
	
	if Entry == First1 then
		Entry1.first = Entry3
		
		if Entry3 ~= nil then
			Entry3[3] = Entry2
			
			if Entry3[2] == nil then
				Entry3.listenerGroup = Entry.listenerGroup == true
			end
		end
	else
		if Entry2 ~= nil then
			Entry2[4] = Entry3
		end
		if Entry3 == nil then
			if First1 ~= nil then
				First1[3] = Entry2
			end
		else
			Entry3[3] = Entry2
		end
	end
	Entry[3] = nil
	Entry[4] = nil
	
	if Count > 0 and Entry1.first == nil then
		local Entry4: (any) -> () = t[Entry1]
		
		if Entry4 then
			Entry4(false)
		end
	end
end

local function trim(Consumer, Reads)
	-- upvalues: detach (copy)
	for i = #Consumer, Reads, -1 do
		local ConsumerEntry = Consumer[i]
		
		if ConsumerEntry ~= nil then
			detach(ConsumerEntry)
		end
		Consumer[i] = nil
	end
end

local function markStale(p1, State1: number)
	-- upvalues: State (copy), ReactorModule (copy), markStale (copy), List (ref)
	local v1 = p1
	while v1 ~= nil do
		local Source = v1
		v1 = nil
		
		if State.enabled then
			local Cell: string = if Source.state == nil or Source.refresh == nil then "cell" else "formula"
			local First = Source.first
			while First ~= nil do
				State.recorder.edge(Source, Cell, First[2] or First)
				First = First[4]
			end
		end
		local First1 = Source.first
		local Reactor = nil
		local Reactor1 = nil
		while First1 ~= nil do
			local FirstEntry = First1[2]
			local FirstEntry1 = First1[4]
			
			if FirstEntry == nil then
				local Reactor2 = First1.reactor
				
				if Reactor2 ~= Reactor then
					Reactor = Reactor2
					ReactorModule.enqueue(First1)
				end
			else
				local State2 = FirstEntry.state or 0
				local Kind = FirstEntry.kind
				local IsStateMatch = if Kind == 1 or Kind == 2 then State2 == 3 else FirstEntry.retry
				
				if State2 < State1 or IsStateMatch then
					if IsStateMatch and Kind ~= 1 and Kind ~= 2 then
						FirstEntry.retry = false
					end
					FirstEntry.state = State1
					
					if State2 == 0 or IsStateMatch then
						if Kind == 1 then
							if FirstEntry1 == nil then
								v1 = FirstEntry
							else
								markStale(FirstEntry, 1)
							end
						elseif Kind == 2 then
							local CutoffFunction: (any) -> () = FirstEntry.cutoff
							
							if CutoffFunction ~= nil then
								CutoffFunction(FirstEntry)
							end
						elseif Kind == nil then
							table.insert(List, FirstEntry)
						elseif State1 == 2 and Kind == 4 then
							local Reactor3 = FirstEntry.reactor
							
							if FirstEntry[2] == nil then
								if Reactor3 ~= Reactor1 then
									Reactor1 = Reactor3
									FirstEntry.source = Source
									ReactorModule.enqueue(FirstEntry)
								end
							else
								ReactorModule.enqueue(FirstEntry)
							end
						else
							ReactorModule.enqueue(FirstEntry)
						end
					end
				end
			end
			First1 = FirstEntry1
		end
		State1 = 1
	end
end

local function settleTouched()
	-- upvalues: List (ref), ReactorModule (copy)
	if #List == 0 then
		ReactorModule.settleTouched()
		
		return
	end
	local List1 = {}
	while #List > 0 do
		local List2 = List
		List = {}
		
		for _, value in List2 do
			local Invalidate = value.invalidate
			local NoInvalidate = Invalidate == nil or value.released
			local Result1 = nil
			
			if not NoInvalidate then
				local Success1
				Success1, Result1 = pcall(Invalidate, value)
				NoInvalidate = Success1
			end
			if not NoInvalidate then
				table.insert(List1, (tostring(Result1)))
			end
		end
	end
	local Success, Result = pcall(ReactorModule.settleTouched)
	
	if not Success then
		table.insert(List1, (tostring(Result)))
	end
	if #List1 > 0 then
		error(table.concat(List1, "\n"), 0)
	end
end

local function notANode(p2, p3)
	-- upvalues: DiagnosticsModule (copy)
	local DescribeResult = DiagnosticsModule.describe(p3)
	
	return DiagnosticsModule.raise("reactive/not-a-node", ("%s was given a %s where a cell or formula was expected"):format(p2, DescribeResult), {
		expected = "a cell or a formula",
		fix = "a body is called, not read: write source(use) rather than use(source), or wrap it once with Compose.formula(source)",
		actual = DescribeResult,
		contract = ("%s records a dependency on a node the graph owns, and only a cell or a formula is one"):format(p2)
	})
end

local _ = function()
	-- upvalues: DiagnosticsModule (copy)
	return DiagnosticsModule.raise("reactive/no-evaluation", "use() was called outside a reactive body", {
		contract = "use reads a cell or formula and records a dependency, which only means something while a formula, watch, or bound property is evaluating",
		fix = "read it with :peek() outside a reactive body, or move the read inside one"
	})
end

local function use(p2)
	-- upvalues: Cache (copy), EvaluationModule (copy), NodeOfFunction (copy), notANode (copy), DiagnosticsModule (copy), NodeModule (copy), trim (copy), append (copy)
	local Consumer = Cache.consumer
	
	if Consumer == nil or Cache.thread ~= coroutine.running() then
		Consumer = EvaluationModule.context()
	end
	if Consumer ~= nil then
		local Reads: number = Consumer.reads
		
		if Reads == nil then
			if type(p2) ~= "table" or p2.version == nil then
				return notANode("use", p2)
			end
			local RefreshFunction: (any) -> () = p2.refresh
			
			if RefreshFunction then
				RefreshFunction(p2)
			end
			return NodeModule.readCached(p2)
		else
			local NewReads = Reads + 1
			local ConsumerEntry = Consumer[NewReads]
			
			if ConsumerEntry == nil or not rawequal(ConsumerEntry[1], p2) then
				local ConsumerEntry1 = Consumer[Reads]
				
				if ConsumerEntry1 == nil or not rawequal(ConsumerEntry1[1], p2) then
					if type(p2) ~= "table" or p2.version == nil then
						return notANode("use", p2)
					end
					Consumer.reads = NewReads
					trim(Consumer, NewReads)
					local config = {
						p2,
						Consumer,
						nil,
						nil,
						version = p2.version
					}
					append(p2, config)
					Consumer[NewReads] = config
					ConsumerEntry = config
				else
					ConsumerEntry = ConsumerEntry1
				end
			else
				Consumer.reads = NewReads
				
				if p2.state == 0 then
					ConsumerEntry.version = p2.version
					local Cache1 = p2.cache
					
					return if Cache1 == nil then NodeModule.readCached(p2) else Cache1.value
				end
			end
			local Refresh: (any) -> () = if p2.state == 0 then nil else p2.refresh
			
			if Refresh ~= nil then
				Refresh(p2)
			end
			ConsumerEntry.version = p2.version
			local Cache2 = p2.cache
			
			return if Cache2 == nil then NodeModule.readCached(p2) else Cache2.value
		end
	elseif type(p2) == "table" and NodeOfFunction(p2).version ~= nil then
		local _ = DiagnosticsModule.raise("reactive/no-evaluation", "use() was called outside a reactive body", {
			contract = "use reads a cell or formula and records a dependency, which only means something while a formula, watch, or bound property is evaluating",
			fix = "read it with :peek() outside a reactive body, or move the read inside one"
		})
		
		return NodeModule.readCached(p2)
	else
		return notANode("use", p2)
	end
end

local function dependenciesMoved(p2): boolean
	for i = 1, #p2 do
		local v2 = p2[i]
		local v3 = v2 == nil
		local v4 = nil
		
		if not v3 then
			v4 = v2[1]
			v3 = v4 == nil
		end
		if not v3 then
			local Refresh: (any) -> () = if v4.state == 0 then nil else v4.refresh
			
			if Refresh ~= nil then
				Refresh(v4)
			end
			if v4.version ~= v2.version then
				return true
			end
		end
	end
	return false
end

local function evaluate(Consumer, p3, p4)
	-- upvalues: Cache (copy), EvaluationModule (copy), Validation (copy), trim (copy)
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
	local Result = nil
	local Success = nil
	
	if Validation.validating then
		Success, Result = pcall(EvaluationModule.call, p3, p4)
	else
		Success, Result = pcall(p3, p4)
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
		if Consumer.run == nil then
			Consumer.state = 2
			Consumer.retry = true
		end
		error(Result, 0)
	end
	local Reads = Consumer.reads or 0
	
	if Reads < #Consumer then
		trim(Consumer, Reads + 1)
	end
	return Result
end

local function runEffect(p3)
	-- upvalues: DynamicModule (copy), t1 (copy), EvaluationModule (copy), Validation (copy), use (copy), trim (copy)
	local Coalesced = p3.coalesced
	
	if type(Coalesced) == "table" and Coalesced.coalescing then
		local First = Coalesced.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Coalesced.coalescing = nil
		DynamicModule.write(Coalesced, "set", nil)
		t1[Coalesced] = nil
	end
	local EnterFrameResult, EnterFrameResult2, EnterFrameResult3 = EvaluationModule.enterFrame(p3)
	p3.reads = 0
	local EffectFunction: (any) -> () = p3.effect
	
	if EffectFunction then
		if Validation.validating then
			EvaluationModule.call(EffectFunction, use)
		else
			EffectFunction(use)
		end
	end
	EvaluationModule.leaveFrame(EnterFrameResult, EnterFrameResult2, EnterFrameResult3)
	local Reads = p3.reads or 0
	
	if Reads < #p3 then
		trim(p3, Reads + 1)
	end
end

local function runEffectIn(Frame, Consumer)
	-- upvalues: DynamicModule (copy), t1 (copy), Cache (copy), Validation (copy), EvaluationModule (copy), use (copy), trim (copy)
	local Coalesced = Consumer.coalesced
	
	if type(Coalesced) == "table" and Coalesced.coalescing then
		local First = Coalesced.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Coalesced.coalescing = nil
		DynamicModule.write(Coalesced, "set", nil)
		t1[Coalesced] = nil
	end
	Frame.consumer = Consumer
	
	if Cache.frame == Frame then
		Cache.consumer = Consumer
	end
	Consumer.reads = 0
	local EffectFunction: (any) -> () = Consumer.effect
	
	if EffectFunction then
		if Validation.validating then
			EvaluationModule.call(EffectFunction, use)
		else
			EffectFunction(use)
		end
	end
	local Reads = Consumer.reads or 0
	
	if Reads < #Consumer then
		trim(Consumer, Reads + 1)
	end
end

local function release(p3)
	-- upvalues: trim (copy)
	if not p3.released then
		p3.released = true
		p3.reads = nil
		trim(p3, 1)
		p3.state = 2
		
		return
	end
end

local _ = function(p3): number
	local Count = 0
	local First = p3.first
	while First ~= nil do
		Count += 1
		First = First[4]
	end
	return Count
end

local function untracked(p4)
	-- upvalues: EvaluationModule (copy)
	local EnterFrameResult, EnterFrameResult2, EnterFrameResult3 = EvaluationModule.enterFrame(nil)
	local Success, Result = pcall(p4)
	EvaluationModule.leaveFrame(EnterFrameResult, EnterFrameResult2, EnterFrameResult3)
	
	if not Success then
		error(Result, 0)
	end
	return Result
end

local function countNotification(p4)
	-- upvalues: State (copy), Stats (copy)
	if State.enabled then
		local Count = 0
		local First = p4.first
		while First ~= nil do
			Count += 1
			First = First[4]
		end
		Stats.bump("notifications", Count)
		State.recorder.wake(p4, if p4.state == nil or p4.refresh == nil then "cell" else "formula", Count)
	end
end

local Module = {}
Module.__index = Module
Module.listenerGroup = true
NodeModule.adopt(Module)
local v5 = nil

local function sweep(p5, Reactor, Version, p6)
	-- upvalues: v5 (ref), State (copy), Stats (copy)
	local v6 = p6
	while v6 ~= nil do
		local v7 = v6[4]
		v5 = v7
		
		if rawget(v6, 2) == nil and v6.reactor == Reactor then
			local ListenerFunction: (any, any) -> () = v6.listener
			
			if ListenerFunction ~= nil and v6.version ~= Version then
				v6.version = Version
				
				if State.enabled then
					Stats.bump("watchRuns")
					State.recorder.enterRun(v6)
				end
				if v6.subject == nil then
					ListenerFunction(p5.value)
				else
					ListenerFunction(p5.value, v6)
				end
			end
		end
		v6 = v7
	end
end

local function runListeners(First, p7)
	-- upvalues: State (copy), Stats (copy), v5 (ref), sweep (copy)
	local Version = p7.version
	local First1 = p7.first
	
	if First1 == First and rawget(First, 4) == nil then
		local ListenerFunction: (any, any) -> () = First.listener
		
		if ListenerFunction ~= nil and First.version ~= Version then
			First.version = Version
			
			if State.enabled then
				Stats.bump("watchRuns")
				State.recorder.enterRun(First)
			end
			if First.subject ~= nil then
				ListenerFunction(p7.value, First)
				
				return
			end
			ListenerFunction(p7.value)
		end
		return
	else
		local Reactor = First.reactor
		local Entry = nil
		while First1 ~= nil do
			local v8 = v5
			v5 = nil
			local Success, Result = pcall(sweep, p7, Reactor, Version, First1)
			local v9 = v5
			v5 = v8
			
			if Success then break end
			local Entry1 = Entry or {}
			Entry = Entry1
			table.insert(Entry1, (tostring(Result)))
			First1 = v9
		end
		if Entry ~= nil then
			if #Entry == 1 then
				error(Entry[1], 0)
			end
			error(("Compose: %d direct bindings failed:\n  %s"):format(#Entry, table.concat(Entry, "\n  ")), 0)
		end
	end
end

function Module.run(Entry)
	-- upvalues: DynamicModule (copy), t1 (copy), State (copy), runListeners (copy)
	local Entry1 = Entry[1]
	
	if Entry1 == nil or Entry1.released then return end
	if (Entry.version or 0) < 0 and Entry1.coalescing then
		local First = Entry1.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Entry1.coalescing = nil
		DynamicModule.write(Entry1, "set", nil)
		t1[Entry1] = nil
	end
	local RefreshFunction: (any) -> () = Entry1.refresh
	
	if RefreshFunction then
		RefreshFunction(Entry1)
	end
	if Entry1.first ~= Entry or rawget(Entry, 4) ~= nil or State.enabled then
		runListeners(Entry, Entry1)
		
		return
	end
	local ListenerFunction: (any, any) -> () = Entry.listener
	local Version = Entry1.version
	
	if ListenerFunction ~= nil and Entry.version ~= Version then
		Entry.version = Version
		
		if Entry.subject ~= nil then
			ListenerFunction(Entry1.value, Entry)
			
			return
		end
		ListenerFunction(Entry1.value)
	end
end

Module.runIn = Module.run
local Module1 = {}
Module1.__index = Module1
Module1.listenerGroup = true
NodeModule.adopt(Module1)

function Module1.run(Entry)
	-- upvalues: DynamicModule (copy), t1 (copy), State (copy), runListeners (copy)
	local Entry1 = Entry[1]
	
	if Entry1 == nil then return end
	if (Entry.version or 0) < 0 and Entry1.coalescing then
		local First = Entry1.first
		
		if First ~= nil then
			local FirstEntry = First[2]
			
			if FirstEntry == nil then
				local Version: number = First.version
				
				if Version ~= nil and Version < 0 then
					First.version = -Version - 1
				end
			else
				FirstEntry.coalesced = false
			end
		end
		Entry1.coalescing = nil
		DynamicModule.write(Entry1, "set", nil)
		t1[Entry1] = nil
	end
	if Entry1.first ~= Entry or rawget(Entry, 4) ~= nil or State.enabled then
		runListeners(Entry, Entry1)
		
		return
	end
	local ListenerFunction: (any, any) -> () = Entry.listener
	local Version = Entry1.version
	
	if ListenerFunction ~= nil and Entry.version ~= Version then
		Entry.version = Version
		
		if Entry.subject ~= nil then
			ListenerFunction(Entry1.value, Entry)
			
			return
		end
		ListenerFunction(Entry1.value)
	end
end

local function makeListener(Reactor, p8)
	-- upvalues: Module (copy), Module1 (copy), NodeModule (copy)
	local RefreshFunction: (any) -> () = p8.refresh
	
	if RefreshFunction then
		RefreshFunction(p8)
	end
	local Module2 = if RefreshFunction == nil or p8.refresh == nil then Module1 else Module
	local config = {
		p8,
		nil,
		nil,
		nil,
		version = p8.version,
		reactor = Reactor
	}
	NodeModule.classify(config, Module2)
	
	return config
end

local function startListener(Entry)
	-- upvalues: State (copy), Stats (copy), append (copy)
	local Entry1 = Entry[1]
	local ListenerFunction: (any, any) -> () = Entry.listener
	
	if Entry1 == nil or ListenerFunction == nil then return end
	if State.enabled then
		State.recorder.born(Entry)
		Stats.bump("watchRuns")
		State.recorder.enterRun(Entry)
	end
	if Entry.subject == nil then
		ListenerFunction(Entry1.value)
	else
		ListenerFunction(Entry1.value, Entry)
	end
	append(Entry1, Entry)
end

return {
	CLEAN = 0,
	CHECK = 1,
	DIRTY = 2,
	RETRY = 3,
	detachers = Detachers,
	nodeOf = NodeOfFunction,
	identityKey = IdentityKey,
	clock = Clock,
	nextVersion = nextVersion,
	coalesce = coalesce,
	observe = observe,
	trim = trim,
	markStale = markStale,
	settleTouched = settleTouched,
	notANode = notANode,
	use = use,
	runEffect = runEffect,
	runEffectIn = runEffectIn,
	dependenciesMoved = dependenciesMoved,
	evaluate = evaluate,
	release = release,
	untracked = untracked,
	countNotification = countNotification,
	listen = function(Reactor, p8, Listener)
		-- upvalues: makeListener (copy), startListener (copy), detach (copy)
		local Listener1 = makeListener(Reactor, p8)
		Listener1.listener = Listener
		startListener(Listener1)
		
		return function()
			-- upvalues: Listener1 (copy), detach (upval)
			if Listener1.listener ~= nil then
				Listener1.listener = nil
				detach(Listener1)
			end
		end
	end,
	listenEdge = function(Reactor, p8, Listener, Subject, FastKey, Transform, Written)
		-- upvalues: makeListener (copy), startListener (copy)
		local Listener1 = makeListener(Reactor, p8)
		Listener1.listener = Listener
		Listener1.subject = Subject
		Listener1.fastKey = FastKey
		
		if Transform ~= nil then
			Listener1.transform = Transform
			Listener1.written = Written
		end
		startListener(Listener1)
		
		return Listener1
	end,
	unlisten = function(p8)
		-- upvalues: detach (copy)
		if p8.listener ~= nil then
			p8.listener = nil
			detach(p8)
		end
	end
}