local crossExperience = script:FindFirstAncestor("CrossExperience")
local _ = require(crossExperience.Types)
local loggerModule = require(crossExperience.Logger)
local t = {}
t.__index = t

local function _(p0) --[[ line: 40 | named "getFirstKeyInTable" ]]
	local var3 = nil
	
	if p0 then
		for i, v in pairs(p0) do
			var3 = i
			
			return var3
		end
	end
	return var3
end

function t.new(p1) --[[ line: 51 ]]
	-- upvalues: t (ref)
	local t_1 = { queues = {}, requiresEventsInOrder = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:processNextEvent(p2, p3) --[[ line: 60 ]]
	-- upvalues: loggerModule (ref)
	local var5 = self.queues[p2]
	
	if not var5 then
		loggerModule:error("EventQueue: queue not found for origin {} abort processing", p2)
		
		return
	elseif var5.nextSequenceNumber == nil then
		local events = var5.events
		local var6 = nil
		
		if events then
			for i, v in pairs(events) do
				var6 = i
				break
			end
		end
		local var7 = var6
		
		if var7 ~= nil then
			loggerModule:info("EventQueue: sequence for {} at {}", p2, var7)
			var5.nextSequenceNumber = var7
		end
	end
	local nextSequenceNumber = var5.events[var5.nextSequenceNumber]
	
	if nextSequenceNumber then
		loggerModule:info("EventQueue: processing event {} seq {}", nextSequenceNumber.event.NOTIFY, nextSequenceNumber.params._seq)
		
		if not p3 then
			loggerModule:info("EventQueue: event originally delayed {} seq {} ", nextSequenceNumber.event.NOTIFY, nextSequenceNumber.params._seq)
		end
		nextSequenceNumber.callback(nextSequenceNumber.params)
		var5.events[var5.nextSequenceNumber] = nil
		var5.nextSequenceNumber += 1
		self:processNextEvent(p2)
		
		return
	elseif p3 then
		loggerModule:info("EventQueue: delaying processing event {} seq {} expecting {}", p3.event.NOTIFY, p3.params._seq, var5.nextSequenceNumber)
	end
end

function t:reset() --[[ line: 98 ]]
	self.queues = {}
end

function t:process(p4, p5, p6) --[[ line: 102 ]]
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