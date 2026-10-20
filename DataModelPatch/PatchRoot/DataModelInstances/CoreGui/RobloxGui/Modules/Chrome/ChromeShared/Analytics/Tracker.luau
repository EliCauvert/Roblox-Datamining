local TrackerModule = {}
TrackerModule.__index = TrackerModule

function TrackerModule.new()
	-- upvalues: TrackerModule (copy)
	return (setmetatable({ trackers = {} }, TrackerModule))
end

function TrackerModule:toggle(Key)
	self[Key] = not self[Key]
	
	return self[Key]
end

function TrackerModule:set(p1, p2)
	self.trackers[p1] = p2
end

function TrackerModule:get(p1)
	return self.trackers[p1]
end

function TrackerModule:reset(p1)
	self.trackers[p1] = nil
end

function TrackerModule:startTime(p1)
	self.trackers[p1] = DateTime.now().UnixTimestampMillis
end

function TrackerModule:finishTime(p1)
	if self.trackers[p1] then
		self.trackers[p1] = 0
		
		return DateTime.now().UnixTimestampMillis - self.trackers[p1]
	else
		return 0
	end
end

return TrackerModule