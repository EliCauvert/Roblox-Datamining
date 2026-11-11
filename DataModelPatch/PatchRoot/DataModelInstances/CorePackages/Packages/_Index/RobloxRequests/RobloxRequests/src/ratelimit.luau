local RatelimitModule = {}
RatelimitModule.__index = RatelimitModule

local function _(p1)
	return p1
end

if not RatelimitModule.ratelimit then
	RatelimitModule.ratelimit = {}
end
function RatelimitModule.get(Id, Rate, Window_size)
	-- upvalues: RatelimitModule (copy)
	local self = setmetatable({}, RatelimitModule)
	
	if not RatelimitModule.ratelimit[Id] then
		RatelimitModule.ratelimit[Id] = {}
		RatelimitModule.ratelimit[Id].windows = {}
	end
	RatelimitModule.ratelimit[Id].window_size = Window_size
	RatelimitModule.ratelimit[Id].rate = Rate
	self.id = Id
	self.window_size = RatelimitModule.ratelimit[Id].window_size
	self.rate = RatelimitModule.ratelimit[Id].rate
	local _ = self.id
	
	return self
end

function RatelimitModule.window(p1): number
	return (math.floor(tick() / p1.window_size))
end

function RatelimitModule.progress(p1)
	return tick() % p1.window_size / p1.window_size
end

function RatelimitModule.increment(p1)
	-- upvalues: RatelimitModule (copy)
	local WindowResult = p1:window()
	
	if not RatelimitModule.ratelimit[p1.id].windows[WindowResult] then
		RatelimitModule.ratelimit[p1.id].windows[WindowResult] = 0
	end
	RatelimitModule.ratelimit[p1.id].windows[WindowResult] += 1
	
	return RatelimitModule.ratelimit[p1.id].windows[WindowResult]
end

function RatelimitModule.weighted(p1, p2)
	-- upvalues: RatelimitModule (copy)
	local ProgressResult: number = p1:progress()
	local WindowResult: number = p1:window()
	
	return ((RatelimitModule.ratelimit[p1.id].windows[WindowResult] or 0) + (p2 or 0)) * ProgressResult + (RatelimitModule.ratelimit[p1.id].windows[WindowResult - 1] or 0) * (1 - ProgressResult)
end

function RatelimitModule.consumption(p1)
	return p1:weighted() / p1.rate
end

function RatelimitModule.request(p1): boolean
	if p1.rate < p1:weighted(1) then
		return false
	else
		p1:increment()
		
		return true
	end
end

return RatelimitModule