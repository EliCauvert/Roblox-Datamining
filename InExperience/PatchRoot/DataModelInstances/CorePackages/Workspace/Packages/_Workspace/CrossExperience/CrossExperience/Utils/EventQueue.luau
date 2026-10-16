local CrossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(CrossExperience.Types)
local LoggerModule = require(CrossExperience.Logger)
local EventQueueModule = {}
EventQueueModule.__index = EventQueueModule

local function _(List) --[[ Line: 40 | Named "getFirstKeyInTable" ]]
	local v1 = nil
	
	if List then
		for i, _ in pairs(List) do
			v1 = i
			
			return v1
		end
	end
	return v1
end

function EventQueueModule.new(RequiresEventsInOrder) --[[ Line: 51 ]]
	-- upvalues: EventQueueModule (copy)
	local config = {
		queues = {},
		requiresEventsInOrder = RequiresEventsInOrder
	}
	setmetatable(config, EventQueueModule)
	
	return config
end

function EventQueueModule:processNextEvent(Origin, p1) --[[ Line: 60 ]]
	-- upvalues: LoggerModule (copy)
	local Queue = self.queues[Origin]
	
	if not Queue then
		LoggerModule:error("EventQueue: queue not found for origin {} abort processing", Origin)
		
		return
	end
	if Queue.nextSequenceNumber == nil then
		local Events = Queue.events
		local v2 = nil
		
		if Events then
			for i, _ in pairs(Events) do
				v2 = i
				break
			end
		end
		local NextSequenceNumber = v2
		
		if NextSequenceNumber ~= nil then
			LoggerModule:info("EventQueue: sequence for {} at {}", Origin, NextSequenceNumber)
			Queue.nextSequenceNumber = NextSequenceNumber
		end
	end
	local Event = Queue.events[Queue.nextSequenceNumber]
	
	if Event then
		LoggerModule:info("EventQueue: processing event {} seq {}", Event.event.NOTIFY, Event.params._seq)
		
		if not p1 then
			LoggerModule:info("EventQueue: event originally delayed {} seq {} ", Event.event.NOTIFY, Event.params._seq)
		end
		Event.callback(Event.params)
		Queue.events[Queue.nextSequenceNumber] = nil
		Queue.nextSequenceNumber += 1
		self:processNextEvent(Origin)
		
		return
	elseif p1 then
		LoggerModule:info("EventQueue: delaying processing event {} seq {} expecting {}", p1.event.NOTIFY, p1.params._seq, Queue.nextSequenceNumber)
	end
end

function EventQueueModule:reset() --[[ Line: 98 ]]
	self.queues = {}
end

function EventQueueModule:process(Event, Params, Callback: (any) -> ()) --[[ Line: 102 ]]
	-- upvalues: LoggerModule (copy)
	if not Params then
		LoggerModule:error("EventQueue: invalid event {} params missing", Event.NOTIFY)
		
		return
	end
	local Origin = Params._origin
	local Seq = Params._seq
	
	if Origin and Seq and self.requiresEventsInOrder then
		if not self.queues[Origin] then
			LoggerModule:info("EventQueue: initiating queue {}", Origin)
			self.queues[Origin] = { nextSequenceNumber = nil, events = {} }
		end
		LoggerModule:info("EventQueue: new event {} seq {} current seq {}", Event.NOTIFY, Seq, self.queues[Origin].nextSequenceNumber)
		local config = { event = Event, params = Params, callback = Callback }
		self.queues[Origin].events[Seq] = config
		self:processNextEvent(Origin, config)
		
		return
	else
		LoggerModule:info("EventQueue: event {} processing immediately", Event.NOTIFY)
		
		if Callback then
			Callback(Params)
		end
	end
end

return EventQueueModule