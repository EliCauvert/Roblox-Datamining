local MessagingService = game:GetService("MessagingService")
local DataStoreService = game:GetService("DataStoreService")
local JsonModule = require(script.Parent.json)
local IsStudio = game:GetService("RunService"):IsStudio()

local function dlog(...) --[[ Line: 10 ]]
	print("[http]", ...)
end

local config = { settings = {}, max_size = 1e999, data = {} }

function config.update_settings(p1, p2) --[[ Line: 22 ]]
	-- upvalues: config (copy)
	local List = type(p1) == "table" and p1 or { p1 }
	local Count = 0
	while Count < #List do
		Count += 1
		local Entry = List[Count]
		
		if Entry:sub(1, 7) == "http://" then
			List[Count] = Entry:sub(8)
			Entry = List[Count]
		elseif Entry:sub(1, 8) == "https://" then
			List[Count] = Entry:sub(9)
			Entry = List[Count]
		end
		if Entry:sub(1, 2) == "*." then
			table.insert(List, Entry:sub(3))
		end
		if Entry:find("/") then continue end
		table.insert(List, Entry .. "/")
		table.insert(List, Entry .. "/*")
	end
	for _, value in ipairs(List) do
		config.settings[value] = p2
		
		if p2.cache_locally == false and not p2.cache_globally then
			config.settings[value] = nil
		end
	end
end

function config.cache_locally(p3, p4) --[[ Line: 59 ]]
	-- upvalues: config (copy)
	local P3 = p4 or {}
	P3.cache_globally = false
	config.update_settings(p3, P3)
end

function config.cache_globally(p3, p4) --[[ Line: 66 ]]
	-- upvalues: config (copy)
	local P5 = p4 or {}
	P5.cache_globally = true
	config.update_settings(p3, P5)
end

function config.should_cache(Text: string) --[[ Line: 77 ]]
	-- upvalues: config (copy)
	local v1 = Text:split("?")[1]
	
	for Text1, _ in pairs(config.settings) do
		if v1:match(".*://" .. Text1:gsub("%*", ".*")) then
			return Text1
		end
	end
	return false
end

function config.is_cached(p3, p4): boolean --[[ Line: 91 ]]
	-- upvalues: config (copy)
	local Should_cacheResult = config.should_cache(p3)
	local Setting = config.settings[Should_cacheResult]
	
	return if Should_cacheResult then if config.data[p4] == nil then if config.settings[Should_cacheResult].cache_globally and config.global_cache_index[p4] then true else false else not Setting.expires or Setting.expires >= tick() - config.data[p4].timestamp else false
end

config.global_cache_index = {}
local t = {}
local Success, Result = pcall(function() --[[ Line: 127 ]]
	-- upvalues: DataStoreService (copy)
	return DataStoreService:GetDataStore("HttpRequestsCache")
end)

if Success then
	local Success1, Result1 = pcall(function() --[[ Line: 132 ]]
		-- upvalues: Result (copy)
		return Result:GetAsync("index") or {}
	end)
	
	if Success1 then
		config.global_cache_index = Result1
		config.global_cache_update_interval = 20
		coroutine.wrap(function() --[[ Line: 140 ]]
			-- upvalues: config (copy), t (ref), Result (copy), dlog (copy), IsStudio (copy), MessagingService (copy), JsonModule (copy)
			while wait(config.global_cache_update_interval) do
				pcall(function() --[[ Line: 142 ]]
					-- upvalues: t (upval), Result (upval), dlog (upval), config (upval), IsStudio (upval), MessagingService (upval), JsonModule (upval)
					local Count = 0
					
					for Key, Data in pairs(t) do
						Result:SetAsync(Key, Data)
						Count += 1
					end
					if Count > 0 then
						dlog(("pushing %s requests to global cache index"):format(Count))
					end
					local List = {}
					Result:UpdateAsync("index", function(OldData) --[[ Line: 155 ]]
						-- upvalues: t (upval), List (copy), config (upval)
						local OldData1 = OldData or {}
						
						for i, _ in pairs(t) do
							table.insert(List, i)
							OldData1[i] = true
							config.global_cache_index[i] = true
						end
						return OldData1
					end)
					
					if not IsStudio then
						MessagingService:PublishAsync("RequestsCacheIndex", JsonModule.enc(List))
					end
					t = {}
				end)
			end
		end)()
		
		if not IsStudio then
			MessagingService:SubscribeAsync("RequestsCacheIndex", function(p3) --[[ Line: 177 ]]
				-- upvalues: JsonModule (copy), config (copy)
				for _, value in ipairs((JsonModule.dec(p3.Data))) do
					config.global_cache_index[value] = true
				end
			end)
		end
	end
end
function config.get_expire(p3) --[[ Line: 192 ]]
	-- upvalues: config (copy)
	return config.settings[config.should_cache(p3)].expires or 1e999
end

function config.get_cached(p3, p4) --[[ Line: 198 ]]
	-- upvalues: config (copy), Success (copy), dlog (copy), Result (copy)
	local Should_cacheResult = config.should_cache(p3)
	local Entry = config.data[p4]
	
	if Entry then
		return Entry, "local"
	elseif not Success or not config.settings[Should_cacheResult].cache_globally then return end
	dlog("accessing datastore cache for", p4)
	
	return Result:GetAsync(p4), "global"
end

function config.update_cache(p3, Key, p4) --[[ Line: 214 ]]
	-- upvalues: config (copy), Success (copy), dlog (copy), t (ref)
	print(("[http] %s added to cache"):format(p3))
	p4.timestamp = tick()
	config.data[Key] = p4
	local Should_cacheResult = config.should_cache(p3)
	
	if Success and config.settings[Should_cacheResult].cache_globally then
		dlog("queued", Key)
		t[Key] = p4
		
		return
	end
end

return config