local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local playersService = game:GetService("Players")
local fFlagUseMultipleServerIdsForSwitchServerModule = require(script:FindFirstAncestor("SwitchServer").Flags.FFlagUseMultipleServerIdsForSwitchServer)
local t = {}
t.__index = t

local function _(p1, p2)
	return p2 - p1.joinedAt <= 300
end

function t.new(p1)
	-- upvalues: t (ref), memStorageService (ref), httpService (ref)
	local t_1 = { _connections = {}, _historyKey = "", _history = {} }
	
	if p1 == nil or p1 == "" then
		return setmetatable(t_1, t)
	end
	local tbl = setmetatable(t_1, t)
	
	local function initHistory()
		-- upvalues: t_1 (ref), p1 (ref), memStorageService (copy), httpService (copy), tbl (ref)
		t_1._historyKey = "RecentServerHistory" .. p2
		local historyKeyItem = memStorageService:GetItem(t_1._historyKey)
		
		if historyKeyItem and historyKeyItem ~= "" then
			local var1 = httpService:JSONDecode(historyKeyItem)
			
			if typeof(var1) == "table" then
				t_1._history = var1
			end
		end
		tbl:recordServer(tostring(game.PlaceId), tostring(game.JobId))
		tbl:writeHistory()
	end
	
	if game:IsLoaded() then
		initHistory()
		
		return tbl
	end
	table.insert(t_1._connections, game.Loaded:Connect(function()
		-- upvalues: initHistory (ref)
		initHistory()
	end))
	
	return tbl
end

function t:recordServer(p1, p2)
	local timestamp = os.time()
	local t = {}
	local t_1 = { serverId = p2, joinedAt = timestamp }
	
	if self._history.placeId ~= p1 then
		self._history = { placeId = p1, serverEntries = { t_1 } }
		
		return
	end
	for i, v in self._history.serverEntries do
		if timestamp - v.joinedAt <= 300 then
			table.insert(t, v)
		end
	end
	table.insert(t, 1, t_1)
	self._history.serverEntries = t
end

function t:getRecentServerIds()
	local timestamp = os.time()
	local t = {}
	
	if self._history.serverEntries then
		for i, v in self._history.serverEntries do
			if timestamp - v.joinedAt <= 300 then
				table.insert(t, v.serverId)
			end
		end
	end
	local var1 = tostring(game.JobId)
	
	if var1 ~= "" and table.find(t, var1) == nil then
		table.insert(t, 1, var1)
	end
	return t
end

function t:writeHistory()
	-- upvalues: memStorageService (ref), httpService (ref)
	if self._historyKey == "" then
		return
	end
	memStorageService:SetItem(self._historyKey, httpService:JSONEncode(self._history))
end

function t:disconnect()
	for i, v in self._connections do
		v:Disconnect()
	end
	self._connections = {}
end

local _ = function()
	-- upvalues: playersService (ref)
	local var2 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var2 == nil or var2 <= 0 then "Local" else tostring(var2)
end

if not fFlagUseMultipleServerIdsForSwitchServerModule then
	t.default = t.new("")
	
	return t
end
local var2 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
t.default = t.new(if var2 == nil or var2 <= 0 then "Local" else tostring(var2))

return t