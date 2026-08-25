local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ trackers = {} }, t)
end

function t:toggle(p0)
	self[p0] = not self[p0]
	
	return self[p0]
end

function t:set(p1, p2)
	self.trackers[p1] = p2
end

function t:get(p3)
	return self.trackers[p3]
end

function t:reset(p4)
	self.trackers[p4] = nil
end

function t:startTime(p5)
	self.trackers[p5] = DateTime.now().UnixTimestampMillis
end

function t:finishTime(p6)
	if self.trackers[p6] then
		local var1 = DateTime.now().UnixTimestampMillis - self.trackers[p6]
		self.trackers[p6] = 0
		
		return var1
	end
	return 0
end

return t