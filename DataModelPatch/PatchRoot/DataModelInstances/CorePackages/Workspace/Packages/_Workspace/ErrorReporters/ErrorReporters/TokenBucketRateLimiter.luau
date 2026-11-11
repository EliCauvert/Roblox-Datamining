local TokenBucketRateLimiterModule = {}
TokenBucketRateLimiterModule.__index = TokenBucketRateLimiterModule

function TokenBucketRateLimiterModule.new(p1)
	-- upvalues: TokenBucketRateLimiterModule (copy)
	local self = setmetatable({}, TokenBucketRateLimiterModule)
	self.maxTokens = p1.maxTokens
	self.refillRate = p1.refillRate
	self.refillIntervalSeconds = p1.refillIntervalSeconds
	self.currentTokens = p1.initialTokens or p1.maxTokens
	self.lastRefillTime = tick()
	
	if self.maxTokens < self.currentTokens then
		self.currentTokens = self.maxTokens
	end
	return self
end

function TokenBucketRateLimiterModule:refill()
	local CurrentTime = tick()
	local CurrentTimeDelta = CurrentTime - self.lastRefillTime
	
	if CurrentTimeDelta < 0 then
		self.lastRefillTime = CurrentTime
		
		return
	end
	local Floored = math.floor(CurrentTimeDelta / self.refillIntervalSeconds)
	
	if Floored > 0 then
		self.currentTokens = math.min(self.maxTokens, self.currentTokens + Floored * self.refillRate)
		self.lastRefillTime += Floored * self.refillIntervalSeconds
	end
end

function TokenBucketRateLimiterModule:consume(p1): boolean
	local P3 = p1 or 1
	self:refill()
	
	if P3 <= self.currentTokens then
		self.currentTokens -= P3
		
		return true
	else
		return false
	end
end

function TokenBucketRateLimiterModule:getAvailableTokens()
	self:refill()
	
	return self.currentTokens
end

function TokenBucketRateLimiterModule:getMaxTokens()
	return self.maxTokens
end

function TokenBucketRateLimiterModule:hasTokensAvailable(): boolean
	return self:getAvailableTokens() > 0
end

function TokenBucketRateLimiterModule:reset()
	self.currentTokens = self.maxTokens
	self.lastRefillTime = tick()
end

function TokenBucketRateLimiterModule:toString(): string
	self:refill()
	
	return string.format("TokenBucketRateLimiter{tokens=%d/%d, refillRate=%d/%ds, nextRefillIn=%.1fs}", self.currentTokens, self.maxTokens, self.refillRate, self.refillIntervalSeconds, self.refillIntervalSeconds - (tick() - self.lastRefillTime) % self.refillIntervalSeconds)
end

return TokenBucketRateLimiterModule