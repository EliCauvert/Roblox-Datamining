local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ trackers = {} }, t)
end

function t:toggle(p1)
	self[p1] = not self[p1]
	
	return self[p1]
end

function t:set(p1, p2)
	self.trackers[p1] = p2
end

function t:get(p1)
	return self.trackers[p1]
end

function t:reset(p1)
	self.trackers[p1] = nil
end

function t:startTime(p1)
	self.trackers[p1] = DateTime.now().UnixTimestampMillis
end

function t:finishTime(p1)
	if self.trackers[p1] then
		local var1 = DateTime.now().UnixTimestampMillis - self.trackers[p1]
		self.trackers[p1] = 0
		
		return var1
	end
	return 0
end

return t