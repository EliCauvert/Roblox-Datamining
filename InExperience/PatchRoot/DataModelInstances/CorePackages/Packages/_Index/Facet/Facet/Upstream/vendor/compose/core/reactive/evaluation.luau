--!native

local _ = require("./types")

local function _()
	return {
		cellWrites = 0,
		cellWritesSuppressed = 0,
		notifications = 0,
		formulaRecomputations = 0,
		formulaRecomputationsSuppressed = 0,
		watchRuns = 0,
		watchSchedules = 0,
		watchSchedulesCoalesced = 0,
		drains = 0,
		continuationPasses = 0
	}
end

local function ignore(...) end

local config = {
	cellWrites = 0,
	cellWritesSuppressed = 0,
	notifications = 0,
	formulaRecomputations = 0,
	formulaRecomputationsSuppressed = 0,
	watchRuns = 0,
	watchSchedules = 0,
	watchSchedulesCoalesced = 0,
	drains = 0,
	continuationPasses = 0
}
local State = {
	enabled = false,
	resume = nil,
	recorder = {
		write = ignore,
		wake = ignore,
		edge = ignore,
		recompute = ignore,
		suppressedRecompute = ignore,
		schedule = ignore,
		enterRun = ignore,
		hostWrite = ignore,
		drain = ignore,
		naming = ignore,
		born = ignore,
		nowOrNil = function()
			return nil
		end
	}
}
local Stats = {
	state = State,
	setEnabled = function(Enabled)
		-- upvalues: State (copy)
		local ResumeFunction: () -> () = State.resume
		
		if Enabled and ResumeFunction ~= nil then
			ResumeFunction()
		end
		State.enabled = Enabled
	end,
	read = function()
		-- upvalues: config (ref)
		return table.clone(config)
	end,
	reset = function()
		-- upvalues: config (ref)
		config = {
			cellWrites = 0,
			cellWritesSuppressed = 0,
			notifications = 0,
			formulaRecomputations = 0,
			formulaRecomputationsSuppressed = 0,
			watchRuns = 0,
			watchSchedules = 0,
			watchSchedulesCoalesced = 0,
			drains = 0,
			continuationPasses = 0
		}
	end,
	bump = function(Key, p1)
		-- upvalues: config (ref)
		local config1 = config
		config1[Key] += if p1 == nil then 1 else p1
	end
}
local Frames = {}
require("../weak").keys(Frames)
local Cache = {
	thread = nil,
	frame = nil,
	consumer = nil,
	active = 0,
	order = 0
}

local function contextOn(CurrentThread)
	-- upvalues: Cache (copy), Frames (copy)
	if Cache.active == 0 then
		return nil, 0, nil
	end
	if CurrentThread == Cache.thread then
		local Frame = Cache.frame
		
		if Frame ~= nil and Frame.order > 0 then
			return Frame.consumer, Frame.order, CurrentThread
		end
	end
	local Frame1 = Frames[CurrentThread]
	
	if Frame1 ~= nil and Frame1.order > 0 then
		return Frame1.consumer, Frame1.order, CurrentThread
	end
	local Cache1 = nil
	local v1 = nil
	
	for i, frame in Frames do
		if frame.order > 0 and coroutine.status(i) == "normal" and (Cache1 == nil or Cache1.order < frame.order) then
			Cache1 = frame
			v1 = i
		end
	end
	if Cache1 == nil then
		return nil, 0, nil
	else
		return Cache1.consumer, Cache1.order, v1
	end
end

local function frame()
	-- upvalues: Cache (copy), Frames (copy)
	local CurrentThread = coroutine.running()
	local Frame = Cache.frame
	
	if CurrentThread == Cache.thread and Frame ~= nil then
		return Frame
	end
	local Frame1 = Frames[CurrentThread]
	local Cache1 = nil
	
	if Frame1 == nil then
		local Thread = Cache.thread
		
		if Frame == nil or Frame.order ~= 0 or Thread == nil then
			Cache1 = { consumer = nil, order = 0 }
		else
			Frames[Thread] = nil
			Cache1 = Frame
		end
		Frames[CurrentThread] = Cache1
	else
		Cache1 = Frame1
	end
	Cache.thread = CurrentThread
	Cache.frame = Cache1
	Cache.consumer = if Cache1.order > 0 then Cache1.consumer else nil
	
	return Cache1
end

local Validation = { validating = false }
local v2 = nil

return {
	stats = Stats,
	call = function(Callback, ...)
		-- upvalues: Validation (copy), v2 (ref)
		if Validation.validating then
			local V11 = v2 or require("./yield-check")
			v2 = V11
			
			return V11(Callback, ...)
		else
			return Callback(...)
		end
	end,
	validation = Validation,
	setValidating = function(Validating)
		-- upvalues: Stats (copy), Validation (copy)
		local ResumeFunction: () -> () = Stats.state.resume
		
		if Validating and ResumeFunction ~= nil then
			ResumeFunction()
		end
		Validation.validating = Validating
	end,
	cache = Cache,
	frame = frame,
	context = function()
		-- upvalues: contextOn (copy)
		return (contextOn(coroutine.running()))
	end,
	contextOn = contextOn,
	enterFrame = function(Consumer)
		-- upvalues: Cache (copy), frame (copy)
		local Frame = if coroutine.running() == Cache.thread then Cache.frame else nil
		local FrameResult = if Frame == nil then frame() else Frame
		local Consumer1 = FrameResult.consumer
		local Order = FrameResult.order
		
		if Order == 0 then
			Cache.active += 1
		end
		local NewOrder = Cache.order + 1
		Cache.order = NewOrder
		FrameResult.consumer = Consumer
		FrameResult.order = NewOrder
		Cache.consumer = Consumer
		
		return FrameResult, Consumer1, Order
	end,
	leaveFrame = function(Cache1, Consumer, Order: number)
		-- upvalues: Cache (copy)
		Cache1.consumer = Consumer
		Cache1.order = Order
		
		if Cache.frame == Cache1 then
			Cache.consumer = if Order > 0 then Consumer else nil
		end
		if Order == 0 then
			Cache.active -= 1
		end
	end,
	snapshot = function()
		-- upvalues: Cache (copy), frame (copy)
		local Frame = Cache.frame
		local FrameResult = if Frame == nil or coroutine.running() ~= Cache.thread then frame() else Frame
		
		return FrameResult.consumer, FrameResult.order
	end,
	leave = function(Consumer, Order: number)
		-- upvalues: Cache (copy), frame (copy)
		local Frame = if coroutine.running() == Cache.thread then Cache.frame else nil
		local FrameResult = if Frame == nil then frame() else Frame
		
		if Order == 0 and FrameResult.order > 0 then
			Cache.active -= 1
		end
		FrameResult.consumer = Consumer
		FrameResult.order = Order
		Cache.consumer = if Order > 0 then Consumer else nil
	end
}