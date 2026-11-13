--!native

local DynamicModule = require("../dynamic")
local EvaluationModule = require("./evaluation")
local GraphModule = require("./graph")
local NodeModule = require("./node")
local ReactorModule = require("./reactor")
local _ = require("./types")
local Clock = GraphModule.clock
local Stats = EvaluationModule.stats
local State = Stats.state
local Validation = EvaluationModule.validation
local DIRTY = GraphModule.DIRTY
local CHECK = GraphModule.CHECK

local function _(p1)
	-- upvalues: State (copy), Stats (copy)
	if State.enabled then
		Stats.bump("cellWritesSuppressed")
		State.recorder.write(p1, true)
	end
end

local function write(p1)
	-- upvalues: Clock (copy), State (copy), Stats (copy), GraphModule (copy), ReactorModule (copy), DIRTY (copy), CHECK (copy)
	local NewNow = Clock.now + 1
	Clock.now = NewNow
	p1.version = NewNow
	local First = p1.first
	
	if State.enabled then
		Stats.bump("cellWrites")
		GraphModule.countNotification(p1)
		State.recorder.write(p1, false)
	else
		if First == nil then return end
		local FirstEntry = First[2]
		
		if FirstEntry ~= nil then
			if rawget(First, 4) == nil then
				local State1 = FirstEntry.state
				
				if State1 == DIRTY and not FirstEntry.retry then return end
				if State1 == CHECK and not FirstEntry.retry then
					FirstEntry.state = DIRTY
					
					return
				end
				if FirstEntry.run ~= nil then
					FirstEntry.retry = false
					FirstEntry.state = DIRTY
					local Reactor = FirstEntry.reactor
					
					if Reactor == nil or not Reactor.batching then
						ReactorModule.enqueue(FirstEntry)
						GraphModule.settleTouched()
					elseif not FirstEntry.queued then
						FirstEntry.queued = true
						local NewCount = Reactor.count + 1
						Reactor.count = NewCount
						Reactor.queue[NewCount] = FirstEntry
						
						return
					end
					return
				end
			end
		elseif rawget(First, 4) == nil or First.listenerGroup then
			local Reactor = First.reactor
			
			if Reactor == nil or not Reactor.batching then
				ReactorModule.runNow(First)
			elseif not First.queued then
				First.queued = true
				local NewCount = Reactor.count + 1
				Reactor.count = NewCount
				Reactor.queue[NewCount] = First
				
				return
			end
			return
		end
	end
	if First ~= nil then
		GraphModule.markStale(p1, DIRTY)
		GraphModule.settleTouched()
		
		return
	end
end

local function same(p1, p2): boolean
	return p1 == p2
end

local function compare(p1, p2, p3)
	-- upvalues: DynamicModule (copy)
	local InvokeResult = DynamicModule.invoke(p1, p2, p3)
	assert(type(InvokeResult) == "boolean", "Compose equality must return a boolean")
	
	return InvokeResult
end

local Module = {}
Module.__index = Module
Module.version = 0
Module.state = GraphModule.CLEAN

function Module.peek(p1)
	-- upvalues: NodeModule (copy)
	local Cache = p1.cache
	
	return if Cache == nil then NodeModule.readCached(p1) else Cache.value
end

local function coalesced(p1, Value)
	-- upvalues: Module (copy)
	if p1.coalescing == nil then
		Module.set(p1, Value)
		
		return
	end
	if type(Value) == "number" or p1.value ~= Value then
		p1.value = Value
	end
end

function Module.set(p1, Value)
	-- upvalues: Validation (copy), EvaluationModule (copy), same (copy), State (copy), Stats (copy), Clock (copy), GraphModule (copy), coalesced (copy), ReactorModule (copy), DIRTY (copy), CHECK (copy)
	local Value1 = p1.value
	
	if not (if Validation.validating then EvaluationModule.call(same, Value1, Value) else Value1 == Value) then
		p1.value = Value
		local First = p1.first
		
		if First == nil and not State.enabled then
			local NewNow = Clock.now + 1
			Clock.now = NewNow
			p1.version = NewNow
			
			return
		end
		local FirstEntry = if First == nil then nil else First[2]
		
		if First == nil or State.enabled or FirstEntry ~= nil or rawget(First, 4) ~= nil and not First.listenerGroup then
			local State1 = if FirstEntry == nil then nil else FirstEntry.state
			
			if State1 ~= DIRTY or FirstEntry == nil or not FirstEntry.group or State.enabled or First == nil or rawget(First, 4) ~= nil or FirstEntry.retry then
				local NewNow = Clock.now + 1
				Clock.now = NewNow
				p1.version = NewNow
				
				if State.enabled then
					Stats.bump("cellWrites")
					GraphModule.countNotification(p1)
					State.recorder.write(p1, false)
				else
					if First == nil then return end
					if FirstEntry ~= nil and rawget(First, 4) == nil then
						if State1 == DIRTY and not FirstEntry.retry then return end
						if State1 == CHECK and not FirstEntry.retry then
							FirstEntry.state = DIRTY
							
							return
						end
						if FirstEntry.run ~= nil then
							FirstEntry.retry = false
							FirstEntry.state = DIRTY
							local Reactor = FirstEntry.reactor
							
							if Reactor == nil or not Reactor.batching then
								ReactorModule.runNow(FirstEntry)
							elseif not FirstEntry.queued then
								FirstEntry.queued = true
								local NewCount = Reactor.count + 1
								Reactor.count = NewCount
								Reactor.queue[NewCount] = FirstEntry
								
								return
							end
							return
						end
					end
				end
				if First ~= nil then
					GraphModule.markStale(p1, DIRTY)
					GraphModule.settleTouched()
					
					return
				end
				return
			elseif FirstEntry[2] == nil and FirstEntry.queued then
				GraphModule.coalesce(p1, FirstEntry, coalesced)
			end
			return
		else
			local NewNow = Clock.now + 1
			Clock.now = NewNow
			p1.version = NewNow
			local Reactor = First.reactor
			
			if Reactor == nil or not Reactor.batching then
				ReactorModule.runNow(First)
			elseif not First.queued then
				First.queued = true
				local NewCount = Reactor.count + 1
				Reactor.count = NewCount
				Reactor.queue[NewCount] = First
				
				return
			elseif not Validation.validating then
				GraphModule.coalesce(p1, First, coalesced)
				
				return
			end
			return
		end
	elseif State.enabled and State.enabled then
		Stats.bump("cellWritesSuppressed")
		State.recorder.write(p1, true)
	end
end

local Module1 = {}
Module1.__index = Module1
Module1.version = 0
Module1.state = GraphModule.CLEAN

function Module1.set(p1, Value)
	-- upvalues: EvaluationModule (copy), compare (copy), State (copy), Stats (copy), Clock (copy), write (copy)
	if not EvaluationModule.call(compare, p1.equals, p1.value, Value) then
		p1.value = Value
		
		if p1.first == nil and not State.enabled then
			local NewNow = Clock.now + 1
			Clock.now = NewNow
			p1.version = NewNow
			
			return
		else
			write(p1)
			
			return
		end
	elseif State.enabled and State.enabled then
		Stats.bump("cellWritesSuppressed")
		State.recorder.write(p1, true)
	end
end

function Module.update(p1, p2)
	-- upvalues: EvaluationModule (copy)
	p1:set(EvaluationModule.call(p2, p1:peek()))
end

function Module:dispose() end

Module1.peek = Module.peek
Module1.update = Module.update
Module1.dispose = Module.dispose
local Module2 = {}
Module2.__index = Module2
Module2.version = 0
Module2.update = Module.update
Module2.dispose = Module.dispose

local function establish(p1)
	-- upvalues: DynamicModule (copy), EvaluationModule (copy), Module1 (copy), Module (copy)
	if p1.cache == nil then
		DynamicModule.cache(p1, EvaluationModule.call(assert(p1.initial)))
		p1.initial = nil
	end
	p1.refresh = nil
	setmetatable(p1, if p1.equals == nil then Module else Module1)
end

function Module2.peek(p1)
	-- upvalues: DynamicModule (copy), EvaluationModule (copy), Module1 (copy), Module (copy), NodeModule (copy)
	if p1.cache == nil then
		DynamicModule.cache(p1, EvaluationModule.call(assert(p1.initial)))
		p1.initial = nil
	end
	p1.refresh = nil
	setmetatable(p1, if p1.equals == nil then Module else Module1)
	
	return NodeModule.readCached(p1)
end

function Module2.set(p1, p2)
	-- upvalues: DynamicModule (copy), EvaluationModule (copy), Module1 (copy), Module (copy)
	if p1.cache == nil then
		DynamicModule.cache(p1, EvaluationModule.call(assert(p1.initial)))
		p1.initial = nil
	end
	p1.refresh = nil
	setmetatable(p1, if p1.equals == nil then Module else Module1)
	p1:set(p2)
end

NodeModule.adopt(Module)
NodeModule.adopt(Module1)
NodeModule.adopt(Module2)

return {
	cell = function(Value, Equals)
		-- upvalues: Module1 (copy), Module (copy)
		local config = { cache = nil, value = Value }
		config.cache = config
		
		if Equals == nil then
			return (setmetatable(config, Module))
		else
			config.equals = Equals
			
			return (setmetatable(config, Module1))
		end
	end,
	lazyCell = function(Initial, Equals)
		-- upvalues: establish (copy), Module2 (copy)
		return (setmetatable({ initial = Initial, refresh = establish, equals = Equals }, Module2))
	end,
	isValue = NodeModule.isNode,
	asValue = NodeModule.asValue,
	defaultEquals = same,
	compare = compare
}