local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)
local loggerModule = require(crossExperience.Logger)
local t = {}
t.__index = t

local function _(p1)
	local var1 = nil
	
	if p1 then
		for i, v in pairs(p1) do
			var1 = i
			
			return var1
		end
	end
	return var1
end

function t.new(p2)
	-- upvalues: t (ref)
	local t_1 = { queues = {}, requiresEventsInOrder = p2 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:processNextEvent(p2, p3)
	-- upvalues: loggerModule (ref)
	local var2 = self.queues[p2]
	
	if not var2 then
		loggerModule:error("EventQueue: queue not found for origin {} abort processing", p2)
		
		return
	elseif var2.nextSequenceNumber == nil then
		local events = var2.events
		local var3 = nil
		
		if events then
			for i, v in pairs(events) do
				var3 = i
				break
			end
		end
		local var4 = var3
		
		if var4 ~= nil then
			loggerModule:info("EventQueue: sequence for {} at {}", p2, var4)
			var2.nextSequenceNumber = var4
		end
	end
	local nextSequenceNumber = var2.events[var2.nextSequenceNumber]
	
	if nextSequenceNumber then
		loggerModule:info("EventQueue: processing event {} seq {}", nextSequenceNumber.event.NOTIFY, nextSequenceNumber.params._seq)
		
		if not p3 then
			loggerModule:info("EventQueue: event originally delayed {} seq {} ", nextSequenceNumber.event.NOTIFY, nextSequenceNumber.params._seq)
		end
		nextSequenceNumber.callback(nextSequenceNumber.params)
		var2.events[var2.nextSequenceNumber] = nil
		var2.nextSequenceNumber += 1
		self:processNextEvent(p2)
		
		return
	elseif p3 then
		loggerModule:info("EventQueue: delaying processing event {} seq {} expecting {}", p3.event.NOTIFY, p3.params._seq, var2.nextSequenceNumber)
	end
end

function t:reset()
	self.queues = {}
end

function t:process(p4, p5, p6)
	-- upvalues: loggerModule (ref)
	if not p5 then
		loggerModule:error("EventQueue: invalid event {} params missing", p4.NOTIFY)
		
		return
	end
	local origin = p5._origin
	local seq = p5._seq
	
	if origin and seq and self.requiresEventsInOrder then
		if not self.queues[origin] then
			loggerModule:info("EventQueue: initiating queue {}", origin)
			self.queues[origin] = { nextSequenceNumber = nil, events = {} }
		end
		loggerModule:info("EventQueue: new event {} seq {} current seq {}", p4.NOTIFY, seq, self.queues[origin].nextSequenceNumber)
		local t = { event = p4, params = p5, callback = p6 }
		self.queues[origin].events[seq] = t
		self:processNextEvent(origin, t)
		
		return
	else
		loggerModule:info("EventQueue: event {} processing immediately", p4.NOTIFY)
		
		if p6 then
			p6(p5)
		end
	end
end

return t