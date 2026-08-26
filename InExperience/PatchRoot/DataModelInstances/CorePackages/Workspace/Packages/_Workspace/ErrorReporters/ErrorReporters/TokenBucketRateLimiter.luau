local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.maxTokens = p1.maxTokens
	tbl.refillRate = p1.refillRate
	tbl.refillIntervalSeconds = p1.refillIntervalSeconds
	tbl.currentTokens = p1.initialTokens or p1.maxTokens
	tbl.lastRefillTime = tick()
	
	if tbl.maxTokens < tbl.currentTokens then
		tbl.currentTokens = tbl.maxTokens
	end
	return tbl
end

function t:refill()
	local currentTime = tick()
	local var1 = currentTime - self.lastRefillTime
	
	if var1 < 0 then
		self.lastRefillTime = currentTime
		
		return
	end
	local floored = math.floor(var1 / self.refillIntervalSeconds)
	
	if floored > 0 then
		self.currentTokens = math.min(self.maxTokens, self.currentTokens + floored * self.refillRate)
		self.lastRefillTime += floored * self.refillIntervalSeconds
	end
end

function t:consume(p1)
	p1 = p1 or 1
	self:refill()
	
	if p1 <= self.currentTokens then
		self.currentTokens -= p1
		
		return true
	end
	return false
end

function t:getAvailableTokens()
	self:refill()
	
	return self.currentTokens
end

function t:getMaxTokens()
	return self.maxTokens
end

function t:hasTokensAvailable()
	return self:getAvailableTokens() > 0
end

function t:reset()
	self.currentTokens = self.maxTokens
	self.lastRefillTime = tick()
end

function t:toString()
	self:refill()
	
	return string.format("TokenBucketRateLimiter{tokens=%d/%d, refillRate=%d/%ds, nextRefillIn=%.1fs}", self.currentTokens, self.maxTokens, self.refillRate, self.refillIntervalSeconds, self.refillIntervalSeconds - (tick() - self.lastRefillTime) % self.refillIntervalSeconds)
end

return t