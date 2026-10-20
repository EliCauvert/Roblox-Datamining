local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local FFlagUseMultipleServerIdsForSwitchServerModule = require(script:FindFirstAncestor("SwitchServer").Flags.FFlagUseMultipleServerIdsForSwitchServer)
local RecentServerHistoryModule = {}
RecentServerHistoryModule.__index = RecentServerHistoryModule

local function _(p1, p2): boolean
	return p2 - p1.joinedAt <= 300
end

function RecentServerHistoryModule.new(Local)
	-- upvalues: RecentServerHistoryModule (copy), MemStorageService (copy), HttpService (copy)
	local config = { _connections = {}, _historyKey = "", _history = {} }
	
	if Local == nil or Local == "" then
		return (setmetatable(config, RecentServerHistoryModule))
	end
	local self = setmetatable(config, RecentServerHistoryModule)
	
	local function initHistory()
		-- upvalues: config (copy), Local (copy), MemStorageService (upval), HttpService (upval), self (copy)
		config._historyKey = "RecentServerHistory" .. Local
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
	local Timestamp = os.time()
	local List = {}
	local config = { serverId = ServerId, joinedAt = Timestamp }
	
	if self._history.placeId ~= PlaceId then
		self._history = { placeId = PlaceId, serverEntries = { config } }
		
		return
	end
	for _, serverEntry in self._history.serverEntries do
		if Timestamp - serverEntry.joinedAt <= 300 then
			table.insert(List, serverEntry)
		end
	end
	table.insert(List, 1, config)
	self._history.serverEntries = List
end

function RecentServerHistoryModule:getRecentServerIds()
	local Timestamp = os.time()
	local List = {}
	
	if self._history.serverEntries then
		for _, serverEntry in self._history.serverEntries do
			if Timestamp - serverEntry.joinedAt <= 300 then
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

local _ = function(): string
	-- upvalues: Players (copy)
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	
	return if UserId == nil or UserId <= 0 then "Local" else tostring(UserId)
end

if FFlagUseMultipleServerIdsForSwitchServerModule then
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	RecentServerHistoryModule.default = RecentServerHistoryModule.new(if UserId == nil or UserId <= 0 then "Local" else tostring(UserId))
	
	return RecentServerHistoryModule
else
	RecentServerHistoryModule.default = RecentServerHistoryModule.new("")
	
	return RecentServerHistoryModule
end