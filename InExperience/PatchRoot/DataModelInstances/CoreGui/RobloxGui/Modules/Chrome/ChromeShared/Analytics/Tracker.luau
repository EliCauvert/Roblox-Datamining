local TrackerModule = {}
TrackerModule.__index = TrackerModule

function TrackerModule.new() --[[ Line: 16 ]]
	-- upvalues: TrackerModule (copy)
	return (setmetatable({ trackers = {} }, TrackerModule))
end

function TrackerModule:toggle(Key) --[[ Line: 24 ]]
	self[Key] = not self[Key]
	
	return self[Key]
end

function TrackerModule:set(p1, p2) --[[ Line: 29 ]]
	self.trackers[p1] = p2
end

function TrackerModule:get(p1) --[[ Line: 33 ]]
	return self.trackers[p1]
end

function TrackerModule:reset(p1) --[[ Line: 37 ]]
	self.trackers[p1] = nil
end

function TrackerModule:startTime(p1) --[[ Line: 41 ]]
	self.trackers[p1] = DateTime.now().UnixTimestampMillis
end

function TrackerModule:finishTime(p1) --[[ Line: 45 ]]
	if self.trackers[p1] then
		self.trackers[p1] = 0
		
		return DateTime.now().UnixTimestampMillis - self.trackers[p1]
	else
		return 0
	end
end

return TrackerModule