local messagingService = game:GetService("MessagingService")
local dataStoreService = game:GetService("DataStoreService")
local jsonModule = require(script.Parent.json)
local var1 = game:GetService("RunService"):IsStudio()

local function dlog(...)
	print("[http]", ...)
end

local t = { settings = {}, max_size = 1e999, data = {} }

function t.update_settings(value, p1)
	-- upvalues: t (ref)
	local var2
	local var3 = if type(value) == "table" then value else { value }
	local _ = {}
	local var4 = 0
	while var4 < #var3 do
		var4 += 1
		var2 = var3[var4]
		
		if var2:sub(1, 7) == "http://" then
			var3[var4] = var2:sub(8)
			var2 = var3[var4]
		elseif var2:sub(1, 8) == "https://" then
			var3[var4] = var2:sub(9)
			var2 = var3[var4]
		end
		if var2:sub(1, 2) == "*." then
			table.insert(var3, var2:sub(3))
		end
		if var2:find("/") then continue end
		table.insert(var3, var2 .. "/")
		table.insert(var3, var2 .. "/*")
	end
	for i, v in ipairs(var3) do
		t.settings[v] = p1
		
		if p1.cache_locally == false and not p1.cache_globally then
			t.settings[v] = nil
		end
	end
end

function t.cache_locally(p2, p3)
	-- upvalues: t (ref)
	p3 = p3 or {}
	p3.cache_globally = false
	t.update_settings(p2, p3)
end

function t.cache_globally(p2, p3)
	-- upvalues: t (ref)
	p3 = p3 or {}
	p3.cache_globally = true
	t.update_settings(p2, p3)
end

function t.should_cache(p2)
	-- upvalues: t (ref)
	p2 = p2:split("?")[1]
	
	for i, v in pairs(t.settings) do
		if p2:match(".*://" .. i:gsub("%*", ".*")) then
			return i
		end
	end
	return false
end

function t.is_cached(p3, p4)
	-- upvalues: t (ref)
	local var5 = t.should_cache(p3)
	local var6 = t.settings[var5]
	
	return if var5 then if t.data[p4] == nil then if t.settings[var5].cache_globally then t.global_cache_index[p4] else false else var6.expires and var6.expires < tick() - t.data[p4].timestamp else false
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
			-- upvalues: t (ref), t_1 (write), status (ref), dlog (ref), var1 (ref), messagingService (ref), jsonModule (ref)
			while wait(t.global_cache_update_interval) do
				pcall(function()
					-- upvalues: t_1 (copy), status (copy), dlog (copy), t (copy), var1 (copy), messagingService (copy), jsonModule (copy)
					local var5 = 0
					
					for i, v in pairs(t_1) do
						status:SetAsync(i, v)
						var5 += 1
					end
					if var5 > 0 then
						dlog(("pushing %s requests to global cache index"):format(var5))
					end
					local t_2 = {}
					status:UpdateAsync("index", function(p3)
						-- upvalues: t_1 (copy), t_2 (ref), t (copy)
						p3 = p3 or {}
						
						for i, v in pairs(t_1) do
							table.insert(t_2, i)
							p3[i] = true
							t.global_cache_index[i] = true
						end
						return p3
					end)
					
					if not var1 then
						messagingService:PublishAsync("RequestsCacheIndex", jsonModule.enc(t_2))
					end
					t_1 = {}
				end)
			end
		end)()
		
		if not var1 then
			messagingService:SubscribeAsync("RequestsCacheIndex", function(p3)
				-- upvalues: jsonModule (ref), t (ref)
				for i, v in ipairs(jsonModule.dec(p3.Data)) do
					t.global_cache_index[v] = true
				end
			end)
		end
	end
end
function t.get_expire(p3)
	-- upvalues: t (ref)
	return t.settings[t.should_cache(p3)].expires or 1e999
end

function t.get_cached(p3, p4)
	-- upvalues: t (ref), ok (ref), dlog (ref), status (ref)
	local var5 = t.should_cache(p3)
	local var6 = t.data[p4]
	
	if var6 then
		return var6, "local"
	elseif ok and t.settings[var5].cache_globally then
		dlog("accessing datastore cache for", p4)
		
		return status:GetAsync(p4), "global"
	end
end

function t.update_cache(p3, p4, p5)
	-- upvalues: t (ref), ok (ref), dlog (ref), t_1 (write)
	print(("[http] %s added to cache"):format(p3))
	p5.timestamp = tick()
	t.data[p4] = p5
	
	if ok and t.settings[t.should_cache(p3)].cache_globally then
		dlog("queued", p4)
		t_1[p4] = p5
		
		return
	end
end

return t