local t = {}
t.__index = t

function t.new(p0) --[[ line: 36 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.maxTokens = p0.maxTokens
	tbl.refillRate = p0.refillRate
	tbl.refillIntervalSeconds = p0.refillIntervalSeconds
	tbl.currentTokens = p0.initialTokens or p0.maxTokens
	tbl.lastRefillTime = tick()
	
	if tbl.maxTokens < tbl.currentTokens then
		tbl.currentTokens = tbl.maxTokens
	end
	return tbl
end

function t:refill() --[[ line: 58 ]]
	local currentTime = tick()
	local var3 = currentTime - self.lastRefillTime
	
	if var3 < 0 then
		self.lastRefillTime = currentTime
		
		return
	end
	local floored = math.floor(var3 / self.refillIntervalSeconds)
	
	if floored > 0 then
		self.currentTokens = math.min(self.maxTokens, self.currentTokens + floored * self.refillRate)
		self.lastRefillTime += floored * self.refillIntervalSeconds
	end
end

function t:consume(p1) --[[ line: 93 ]]
	p1 = p1 or 1
	self:refill()
	
	if p1 <= self.currentTokens then
		self.currentTokens -= p1
		
		return true
	end
	return false
end

function t:getAvailableTokens() --[[ line: 113 ]]
	self:refill()
	
	return self.currentTokens
end

function t:getMaxTokens() --[[ line: 123 ]]
	return self.maxTokens
end

function t:hasTokensAvailable() --[[ line: 132 ]]
	return self:getAvailableTokens() > 0
end

function t:reset() --[[ line: 139 ]]
	self.currentTokens = self.maxTokens
	self.lastRefillTime = tick()
end

function t:toString() --[[ line: 149 ]]
	self:refill()
	
	return string.format("TokenBucketRateLimiter{tokens=%d/%d, refillRate=%d/%ds, nextRefillIn=%.1fs}", self.currentTokens, self.maxTokens, self.refillRate, self.refillIntervalSeconds, self.refillIntervalSeconds - (tick() - self.lastRefillTime) % self.refillIntervalSeconds)
end

return t