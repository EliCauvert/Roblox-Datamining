local messagingService = game:GetService("MessagingService")
local dataStoreService = game:GetService("DataStoreService")
local jsonModule = require(script.Parent.json)
local var3 = game:GetService("RunService"):IsStudio()

local function dlog(...)
	print("[http]", ...)
end

local t = { settings = {}, max_size = 1e999, data = {} }

function t.update_settings(value, p0)
	-- upvalues: t (ref)
	local var9
	local var7 = if type(value) == "table" then value else { value }
	local _ = {}
	local var8 = 0
	while var8 < #var7 do
		var8 += 1
		var9 = var7[var8]
		
		if var9:sub(1, 7) == "http://" then
			var7[var8] = var9:sub(8)
			var9 = var7[var8]
		elseif var9:sub(1, 8) == "https://" then
			var7[var8] = var9:sub(9)
			var9 = var7[var8]
		end
		if var9:sub(1, 2) == "*." then
			table.insert(var7, var9:sub(3))
		end
		if var9:find("/") then continue end
		table.insert(var7, var9 .. "/")
		table.insert(var7, var9 .. "/*")
	end
	for i, v in ipairs(var7) do
		t.settings[v] = p0
		
		if p0.cache_locally == false and not p0.cache_globally then
			t.settings[v] = nil
		end
	end
end

function t.cache_locally(p1, p2)
	-- upvalues: t (ref)
	p2 = p2 or {}
	p2.cache_globally = false
	t.update_settings(p1, p2)
end

function t.cache_globally(p3, p4)
	-- upvalues: t (ref)
	p4 = p4 or {}
	p4.cache_globally = true
	t.update_settings(p3, p4)
end

function t.should_cache(p5)
	-- upvalues: t (ref)
	p5 = p5:split("?")[1]
	
	for i, v in pairs(t.settings) do
		if p5:match(".*://" .. i:gsub("%*", ".*")) then
			return i
		end
	end
	return false
end

function t.is_cached(p6, p7)
	-- upvalues: t (ref)
	local var12 = t.should_cache(p6)
	local var13 = t.settings[var12]
	
	return if var12 then if t.data[p7] == nil then if t.settings[var12].cache_globally then t.global_cache_index[p7] else false else var13.expires and var13.expires < tick() - t.data[p7].timestamp else false
end

t.global_cache_index = {}
local t_1 = {}
local ok, status = pcall(function()
	-- upvalues: dataStoreService (ref)
	return dataStoreService:GetDataStore("HttpRequestsCache")
end)

if ok then
	local ok_1, status_1 = pcall(function()
		-- upvalues: status (ref)
		return status:GetAsync("index") or {}
	end)
	
	if ok_1 then
		t.global_cache_index = status_1
		t.global_cache_update_interval = 20
		coroutine.wrap(function()
			-- upvalues: t (ref), t_1 (write), status (ref), dlog (ref), var3 (ref), messagingService (ref), jsonModule (ref)
			while wait(t.global_cache_update_interval) do
				pcall(function()
					-- upvalues: t_1 (copy), status (copy), dlog (copy), t (copy), var3 (copy), messagingService (copy), jsonModule (copy)
					local var14 = 0
					
					for i, v in pairs(t_1) do
						status:SetAsync(i, v)
						var14 += 1
					end
					if var14 > 0 then
						dlog(("pushing %s requests to global cache index"):format(var14))
					end
					local t_2 = {}
					status:UpdateAsync("index", function(p8)
						-- upvalues: t_1 (copy), t_2 (ref), t (copy)
						p8 = p8 or {}
						
						for i, v in pairs(t_1) do
							table.insert(t_2, i)
							p8[i] = true
							t.global_cache_index[i] = true
						end
						return p8
					end)
					
					if not var3 then
						messagingService:PublishAsync("RequestsCacheIndex", jsonModule.enc(t_2))
					end
					t_1 = {}
				end)
			end
		end)()
		
		if not var3 then
			messagingService:SubscribeAsync("RequestsCacheIndex", function(p9)
				-- upvalues: jsonModule (ref), t (ref)
				for i, v in ipairs(jsonModule.dec(p9.Data)) do
					t.global_cache_index[v] = true
				end
			end)
		end
	end
end
function t.get_expire(p10)
	-- upvalues: t (ref)
	return t.settings[t.should_cache(p10)].expires or 1e999
end

function t.get_cached(p11, p12)
	-- upvalues: t (ref), ok (ref), dlog (ref), status (ref)
	local var17 = t.should_cache(p11)
	local var18 = t.data[p12]
	
	if var18 then
		return var18, "local"
	elseif ok and t.settings[var17].cache_globally then
		dlog("accessing datastore cache for", p12)
		
		return status:GetAsync(p12), "global"
	end
end

function t.update_cache(p13, p14, p15)
	-- upvalues: t (ref), ok (ref), dlog (ref), t_1 (write)
	print(("[http] %s added to cache"):format(p13))
	p15.timestamp = tick()
	t.data[p14] = p15
	
	if ok and t.settings[t.should_cache(p13)].cache_globally then
		dlog("queued", p14)
		t_1[p14] = p15
		
		return
	end
end

return t