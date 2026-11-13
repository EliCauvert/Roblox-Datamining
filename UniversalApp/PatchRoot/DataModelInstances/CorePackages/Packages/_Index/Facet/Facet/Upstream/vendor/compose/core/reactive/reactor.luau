--!native

local EvaluationModule = require("./evaluation")
local Stats = EvaluationModule.stats
local Cache = EvaluationModule.cache
local _ = require("./types")
local State = Stats.state

local function traceback(Err)
	return debug.traceback(tostring(Err), 2)
end

local function describeErrors(Entry)
	if #Entry == 1 then
		return Entry[1]
	end
	local List = {
		("Compose: %d errors while running watches:"):format(#Entry)
	}
	
	for i, value in Entry do
		table.insert(List, ("  [%d] %s"):format(i, value))
	end
	return table.concat(List, "\n")
end

local Reactors = {}
local Count = 0

local function _(p1)
	-- upvalues: Count (ref), Reactors (ref)
	for i = 1, Count do
		if Reactors[i] == p1 then return end
	end
	Count += 1
	Reactors[Count] = p1
end

local function rearm(Entry)
	-- upvalues: rearm (copy)
	local Kind = Entry.kind
	local IsKindMatch: boolean = Kind == 1 or Kind == 2
	
	if Entry.released or (if IsKindMatch then Entry.state == 3 else Entry.retry) then return end
	if IsKindMatch then
		Entry.state = 3
	else
		Entry.retry = true
	end
	if Entry.state == nil then
		local Entry1 = Entry[1]
		
		if Entry1 ~= nil and Entry1.refresh ~= nil then
			rearm(Entry1)
		end
		return
	else
		for i = 1, #Entry do
			local Entry2 = Entry[i]
			local Entry3 = if Entry2 == nil then nil else Entry2[1]
			
			if Entry3 ~= nil and Entry3.refresh ~= nil then
				rearm(Entry3)
			end
		end
	end
end

local _ = function(p2, p3)
	local Errors = p2.errors or {}
	p2.errors = Errors
	table.insert(Errors, p3)
end

local function runRest(p2)
	local Queue = p2.queue
	while p2.cursor < p2.count do
		local Smallest = math.min(p2.count, 1000000)
		while p2.cursor < Smallest do
			local NewCursor = p2.cursor + 1
			p2.cursor = NewCursor
			local QueueEntry = Queue[NewCursor]
			QueueEntry.queued = false
			local RunFunction: (any) -> () = QueueEntry.run
			
			if RunFunction then
				RunFunction(QueueEntry)
			end
		end
		if p2.cursor < 1000000 then continue end
		local Errors = p2.errors or {}
		p2.errors = Errors
		table.insert(Errors, (("Compose: watch cascade did not settle after %d runs. A watch is very likely writing to a cell it also reads; break the loop, or write inside a batch that ends."):format(1000000)))
		p2.abandoned = true
		
		return nil
	end
	return nil
end

local function runInRest(p3)
	-- upvalues: EvaluationModule (copy), Cache (copy)
	local Queue = p3.queue
	local EnterFrameResult, EnterFrameResult2, EnterFrameResult3 = EvaluationModule.enterFrame(nil)
	while p3.cursor < p3.count do
		local Smallest = math.min(p3.count, 1000000)
		while p3.cursor < Smallest do
			local NewCursor = p3.cursor + 1
			p3.cursor = NewCursor
			local QueueEntry = Queue[NewCursor]
			QueueEntry.queued = false
			local RunInFunction: (any, any) -> () = QueueEntry.runIn
			EnterFrameResult.consumer = EnterFrameResult2
			
			if Cache.frame == EnterFrameResult then
				Cache.consumer = EnterFrameResult2
			end
			if RunInFunction == nil then
				local RunFunction: (any) -> () = QueueEntry.run
				
				if RunFunction then
					RunFunction(QueueEntry)
				end
			else
				RunInFunction(QueueEntry, EnterFrameResult)
			end
		end
		if p3.cursor < 1000000 then continue end
		local Errors = p3.errors or {}
		p3.errors = Errors
		table.insert(Errors, (("Compose: watch cascade did not settle after %d runs. A watch is very likely writing to a cell it also reads; break the loop, or write inside a batch that ends."):format(1000000)))
		p3.abandoned = true
		EvaluationModule.leaveFrame(EnterFrameResult, EnterFrameResult2, EnterFrameResult3)
		
		return nil
	end
	EvaluationModule.leaveFrame(EnterFrameResult, EnterFrameResult2, EnterFrameResult3)
	
	return nil
end

local function drain(Reactor)
	-- upvalues: State (copy), Cache (copy), EvaluationModule (copy), traceback (copy), runInRest (copy), runRest (copy), Stats (copy), rearm (copy)
	Reactor.errors = nil
	Reactor.abandoned = false
	
	if Reactor.count == 0 and not State.enabled then
		Reactor.cursor = 0
		
		return nil
	end
	local NowOrNilResult = if State.enabled then State.recorder.nowOrNil() else nil
	local Frame = Cache.frame
	local SnapshotResult = nil
	local SnapshotResult2 = nil
	
	if Frame == nil or Cache.thread ~= coroutine.running() then
		SnapshotResult, SnapshotResult2 = EvaluationModule.snapshot()
	else
		SnapshotResult = Frame.consumer
		SnapshotResult2 = Frame.order
	end
	local QueueEntry = if Reactor.count == 1 and Reactor.cursor == 0 then Reactor.queue[1] else nil
	local QueueEntry1 = if QueueEntry == nil then nil else QueueEntry[1]
	local Listener = if QueueEntry == nil then nil else QueueEntry.listener
	
	if QueueEntry ~= nil and QueueEntry1 ~= nil and Listener ~= nil and QueueEntry1.refresh == nil and QueueEntry1.first == QueueEntry and rawget(QueueEntry, 4) == nil and (QueueEntry.version or 0) >= 0 and not State.enabled then
		Reactor.cursor = 1
		QueueEntry.queued = false
		
		if QueueEntry.version ~= QueueEntry1.version then
			QueueEntry.version = QueueEntry1.version
			local Success = nil
			local Result = nil
			
			if QueueEntry.subject == nil then
				Success, Result = xpcall(Listener, traceback, QueueEntry1.value)
			else
				Success, Result = xpcall(Listener, traceback, QueueEntry1.value, QueueEntry)
			end
			if not Success then
				EvaluationModule.leave(SnapshotResult, SnapshotResult2)
				local Errors = Reactor.errors or {}
				Reactor.errors = Errors
				table.insert(Errors, (tostring(Result)))
			end
		end
	end
	while not Reactor.abandoned and Reactor.cursor < Reactor.count do
		local QueueEntry2 = Reactor.queue[Reactor.cursor + 1]
		local Success1, Result1 = xpcall(if QueueEntry2 == nil or QueueEntry2.runIn == nil then runRest else runInRest, traceback, Reactor)
		
		if Success1 then continue end
		EvaluationModule.leave(SnapshotResult, SnapshotResult2)
		local Errors = Reactor.errors or {}
		Reactor.errors = Errors
		table.insert(Errors, (tostring(Result1)))
	end
	local Cursor: number = Reactor.cursor
	
	if State.enabled then
		Stats.bump("continuationPasses", Cursor)
		
		if NowOrNilResult ~= nil then
			local NowOrNilResult1 = State.recorder.nowOrNil()
			State.recorder.drain(Cursor, if NowOrNilResult1 == nil then 0 else NowOrNilResult1 - NowOrNilResult)
		end
	end
	local Queue = Reactor.queue
	
	if Reactor.abandoned then
		local ResumeFunction: () -> () = State.resume
		
		if ResumeFunction ~= nil then
			ResumeFunction()
		end
		for i2 = Cursor + 1, Reactor.count do
			rearm(Queue[i2])
		end
		for i = Reactor.count, 1, -1 do
			Queue[i].queued = false
			Queue[i] = nil
		end
	else
		local Count: number = Reactor.count
		
		if Count <= 16 then
			for i1 = 1, Count do
				Queue[i1] = nil
			end
		else
			table.clear(Queue)
		end
	end
	Reactor.count = 0
	Reactor.cursor = 0
	
	return Reactor.errors
end

local function finishBatch(p4, Success, ...)
	-- upvalues: drain (copy), describeErrors (copy)
	local DrainResult = drain(p4)
	p4.batching = false
	
	if not Success then
		error(select(1, ...), 0)
	end
	if DrainResult ~= nil then
		error(describeErrors(DrainResult), 0)
	end
	return ...
end

local function settle(p4)
	-- upvalues: State (copy), Stats (copy), drain (copy), describeErrors (copy)
	if p4.batching or p4.count == 0 then return end
	p4.batching = true
	
	if State.enabled then
		Stats.bump("drains")
	end
	local DrainResult = drain(p4)
	p4.batching = false
	
	if DrainResult ~= nil then
		error(describeErrors(DrainResult), 0)
	end
end

return {
	create = function()
		return {
			count = 0,
			cursor = 0,
			batching = false,
			errors = nil,
			abandoned = false,
			queue = {}
		}
	end,
	enqueue = function(p4)
		-- upvalues: State (copy), Stats (copy), Count (ref), Reactors (ref)
		local Reactor = p4.reactor
		
		if Reactor == nil then return end
		if not p4.queued then
			p4.queued = true
			local NewCount = Reactor.count + 1
			Reactor.count = NewCount
			Reactor.queue[NewCount] = p4
			
			if State.enabled then
				Stats.bump("watchSchedules")
				State.recorder.schedule(p4, false)
			end
			if not Reactor.batching then
				for i = 1, Count do
					if Reactors[i] == Reactor then return end
				end
				Count += 1
				Reactors[Count] = Reactor
			end
			return
		elseif State.enabled then
			Stats.bump("watchSchedulesCoalesced")
			State.recorder.schedule(p4, true)
		end
	end,
	runNow = function(Entry)
		-- upvalues: State (copy), traceback (copy), EvaluationModule (copy), drain (copy), describeErrors (copy)
		local Reactor = Entry.reactor
		local Run = Entry.run
		
		if Reactor == nil or Run == nil then return end
		if not Reactor.batching and Reactor.count <= 0 then
			Reactor.batching = true
			local Listener = Entry.listener
			local Entry1 = Entry[1]
			local NoEnabled: boolean = Listener ~= nil and (Entry1 ~= nil and (Entry1.refresh == nil and (Entry1.first == Entry and rawget(Entry, 4) == nil) and not State.enabled))
			local v1 = nil
			local v2 = 0
			local Success = nil
			local Result = nil
			
			if NoEnabled and Listener ~= nil and Entry1 ~= nil then
				Entry.version = Entry1.version
				local Value = Entry1.value
				
				if Entry.subject == nil then
					Success, Result = xpcall(Listener, traceback, Value)
				else
					Success, Result = xpcall(Listener, traceback, Value, Entry)
				end
			else
				v1, v71 = EvaluationModule.snapshot()
				Success, Result = xpcall(Run, traceback, Entry)
			end
			if not Success and not NoEnabled then
				EvaluationModule.leave(v1, v2)
			end
			local DrainResult = if Reactor.count > 0 then drain(Reactor) else nil
			Reactor.batching = false
			
			if not Success then
				if DrainResult == nil then
					DrainResult = { (tostring(Result)) }
				else
					table.insert(DrainResult, 1, (tostring(Result)))
				end
			end
			if DrainResult ~= nil then
				error(describeErrors(DrainResult), 0)
			end
			return
		elseif not Entry.queued then
			Entry.queued = true
			local NewCount = Reactor.count + 1
			Reactor.count = NewCount
			Reactor.queue[NewCount] = Entry
		end
	end,
	batch = function(p5, Callback)
		-- upvalues: State (copy), Stats (copy), finishBatch (copy), traceback (copy)
		if p5.batching then
			return Callback()
		end
		p5.batching = true
		
		if State.enabled then
			Stats.bump("drains")
		end
		return finishBatch(p5, xpcall(Callback, traceback))
	end,
	batchMethod = function(p5)
		-- upvalues: State (copy), Stats (copy), finishBatch (copy), traceback (copy)
		return function(_, Callback)
			-- upvalues: p5 (copy), State (upval), Stats (upval), finishBatch (upval), traceback (upval)
			if p5.batching then
				return Callback()
			end
			p5.batching = true
			
			if State.enabled then
				Stats.bump("drains")
			end
			return finishBatch(p5, xpcall(Callback, traceback))
		end
	end,
	settle = settle,
	settleTouched = function()
		-- upvalues: Count (ref), Reactors (ref), settle (copy)
		if Count == 0 then return end
		local Count1: number = Count
		Count = 0
		
		if Count1 == 1 then
			Reactors[1] = nil
			settle(Reactors[1])
			
			return
		end
		local Reactors1 = Reactors
		Reactors = {}
		local List = {}
		
		for i = 1, Count1 do
			Reactors1[i] = nil
			local Success, Result = pcall(settle, Reactors1[i])
			
			if not Success then
				table.insert(List, (tostring(Result)))
			end
		end
		if #List == 0 then return end
		if #List == 1 then
			error(List[1], 0)
		end
		local List1 = {
			("Compose: %d scheduling domains failed while settling one write:"):format(#List)
		}
		
		for i1, value in List do
			table.insert(List1, ("  [%d] %s"):format(i1, value))
		end
		error(table.concat(List1, "\n"), 0)
	end,
	pending = function(p5)
		return p5.count - p5.cursor
	end
}