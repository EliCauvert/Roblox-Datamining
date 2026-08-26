local t = {}
t.__index = t

local function _(p1)
	return p1
end

if not t.ratelimit then
	t.ratelimit = {}
end
function t.get(p1, p2, p3)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	
	if not t.ratelimit[p1] then
		t.ratelimit[p1] = {}
		t.ratelimit[p1].windows = {}
	end
	t.ratelimit[p1].window_size = p3
	t.ratelimit[p1].rate = p2
	tbl.id = p1
	tbl.window_size = t.ratelimit[p1].window_size
	tbl.rate = t.ratelimit[p1].rate
	local _ = tbl.id
	
	return tbl
end

function t.window(p1)
	return math.floor(tick() / p1.window_size)
end

function t.progress(p1)
	return tick() % p1.window_size / p1.window_size
end

function t.increment(p1)
	-- upvalues: t (ref)
	local var1 = p1:window()
	
	if not t.ratelimit[p1.id].windows[var1] then
		t.ratelimit[p1.id].windows[var1] = 0
	end
	t.ratelimit[p1.id].windows[var1] += 1
	
	return t.ratelimit[p1.id].windows[var1]
end

function t.weighted(p1, p2)
	-- upvalues: t (ref)
	p2 = p2 or 0
	local var1 = p1:progress()
	local var2 = p1:window()
	
	return ((t.ratelimit[p1.id].windows[var2] or 0) + p2) * var1 + (t.ratelimit[p1.id].windows[var2 - 1] or 0) * (1 - var1)
end

function t.consumption(p1)
	return p1:weighted() / p1.rate
end

function t.request(p1)
	if p1.rate < p1:weighted(1) then
		return false
	end
	p1:increment()
	
	return true
end

return t