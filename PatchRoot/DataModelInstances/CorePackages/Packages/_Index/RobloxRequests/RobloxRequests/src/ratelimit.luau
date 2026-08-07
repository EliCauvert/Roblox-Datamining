-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:04 2026 Pacific Standard Time.

local t = {}
t.__index = t

local function _(p0) --[[ line: 13 | named "log" ]]
	return p0
end

if not t.ratelimit then
	t.ratelimit = {}
end
function t.get(p1, p2, p3) --[[ line: 22 ]]
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

function t.window(p4) --[[ line: 44 ]]
	return math.floor(tick() / p4.window_size)
end

function t.progress(p5) --[[ line: 48 ]]
	return tick() % p5.window_size / p5.window_size
end

function t.increment(p6) --[[ line: 54 ]]
	-- upvalues: t (ref)
	local var2 = p6:window()
	
	if not t.ratelimit[p6.id].windows[var2] then
		t.ratelimit[p6.id].windows[var2] = 0
	end
	t.ratelimit[p6.id].windows[var2] += 1
	
	return t.ratelimit[p6.id].windows[var2]
end

function t.weighted(p7, p8) --[[ line: 70 ]]
	-- upvalues: t (ref)
	p8 = p8 or 0
	local var3 = p7:progress()
	local var4 = p7:window()
	
	return ((t.ratelimit[p7.id].windows[var4] or 0) + p8) * var3 + (t.ratelimit[p7.id].windows[var4 - 1] or 0) * (1 - var3)
end

function t.consumption(p9) --[[ line: 84 ]]
	return p9:weighted() / p9.rate
end

function t.request(p10) --[[ line: 90 ]]
	if p10.rate < p10:weighted(1) then
		return false
	end
	p10:increment()
	
	return true
end

return t