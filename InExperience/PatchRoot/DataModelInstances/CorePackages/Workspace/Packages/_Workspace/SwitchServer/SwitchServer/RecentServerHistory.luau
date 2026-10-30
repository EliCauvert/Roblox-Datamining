local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local SwitchServer = script:FindFirstAncestor("SwitchServer")
local FFlagUseMultipleServerIdsForSwitchServerModule = require(SwitchServer.Flags.FFlagUseMultipleServerIdsForSwitchServer)
local FIntSwitchServerMaxRecentServersModule = require(SwitchServer.Flags.FIntSwitchServerMaxRecentServers)
local FIntSwitchServerRecentServerWindowSecondsModule = require(SwitchServer.Flags.FIntSwitchServerRecentServerWindowSeconds)
local RecentServerHistoryModule = {}
RecentServerHistoryModule.__index = RecentServerHistoryModule

local function _(p1, p2): boolean
	-- upvalues: FIntSwitchServerRecentServerWindowSecondsModule (copy)
	return p2 - p1.joinedAt <= FIntSwitchServerRecentServerWindowSecondsModule
end

function RecentServerHistoryModule.new(_historyKey)
	-- upvalues: RecentServerHistoryModule (copy), MemStorageService (copy), HttpService (copy)
	local config = { _connections = {}, _historyKey = "", _history = {} }
	
	if _historyKey == nil or _historyKey == "" then
		return (setmetatable(config, RecentServerHistoryModule))
	end
	config._historyKey = _historyKey
	local self = setmetatable(config, RecentServerHistoryModule)
	
	local function initHistory()
		-- upvalues: MemStorageService (upval), config (copy), HttpService (upval), self (copy)
		local Item = MemStorageService:GetItem(config._historyKey)
		
		if Item and Item ~= "" then
			local Data = HttpService:JSONDecode(Item)
			
			if typeof(Data) == "table" then
				config._history = Data
			end
		end
		self:recordServer(tostring(game.PlaceId), (tostring(game.JobId)))
		self:writeHistory()
	end
	
	if game:IsLoaded() then
		initHistory()
		
		return self
	else
		table.insert(config._connections, game.Loaded:Connect(function()
			-- upvalues: initHistory (copy)
			initHistory()
		end))
		
		return self
	end
end

function RecentServerHistoryModule:recordServer(PlaceId, ServerId)
	-- upvalues: FIntSwitchServerMaxRecentServersModule (copy), FIntSwitchServerRecentServerWindowSecondsModule (copy)
	local Timestamp = os.time()
	local List = {}
	local config = { serverId = ServerId, joinedAt = Timestamp }
	
	if self._history.placeId ~= PlaceId then
		self._history = { placeId = PlaceId, serverEntries = { config } }
		
		return
	end
	table.insert(List, config)
	
	for _, serverEntry in self._history.serverEntries do
		if FIntSwitchServerMaxRecentServersModule <= #List then break end
		if Timestamp - serverEntry.joinedAt <= FIntSwitchServerRecentServerWindowSecondsModule then
			table.insert(List, serverEntry)
		end
	end
	self._history.serverEntries = List
end

function RecentServerHistoryModule:getRecentServerIds()
	-- upvalues: FIntSwitchServerRecentServerWindowSecondsModule (copy)
	local Timestamp = os.time()
	local List = {}
	
	if self._history.serverEntries then
		for _, serverEntry in self._history.serverEntries do
			if Timestamp - serverEntry.joinedAt <= FIntSwitchServerRecentServerWindowSecondsModule then
				table.insert(List, serverEntry.serverId)
			end
		end
	end
	local Text = tostring(game.JobId)
	
	if Text ~= "" and table.find(List, Text) == nil then
		table.insert(List, 1, Text)
	end
	return List
end

function RecentServerHistoryModule:writeHistory()
	-- upvalues: MemStorageService (copy), HttpService (copy)
	if self._historyKey ~= "" then
		MemStorageService:SetItem(self._historyKey, HttpService:JSONEncode(self._history))
		
		return
	end
end

function RecentServerHistoryModule:disconnect()
	for _, connection in self._connections do
		connection:Disconnect()
	end
	self._connections = {}
end

if FFlagUseMultipleServerIdsForSwitchServerModule then
	RecentServerHistoryModule.default = RecentServerHistoryModule.new("RecentServerHistory")
	
	return RecentServerHistoryModule
else
	RecentServerHistoryModule.default = RecentServerHistoryModule.new("")
	
	return RecentServerHistoryModule
end