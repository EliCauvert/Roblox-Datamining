local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local UseTeleportedPlacesBackHistory2EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local FlagsModule = require(script.Parent.Flags)
local FFlagUseLocalTraversalHistory = FlagsModule.FFlagUseLocalTraversalHistory
local FFlagUseTeleportTraversalHistory = FlagsModule.FFlagUseTeleportTraversalHistory
local LocalTraversalHistoryModule = {}
LocalTraversalHistoryModule.__index = LocalTraversalHistoryModule

function LocalTraversalHistoryModule.new(Local)
	-- upvalues: SignalsModule (copy), LocalTraversalHistoryModule (copy), MemStorageService (copy), HttpService (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local config = {
		_connections = {},
		_historyKey = "",
		_history = {},
		_historySignal = Signal,
		_setHistorySignal = Signal2
	}
	
	if Local == nil or Local == "" then
		return (setmetatable(config, LocalTraversalHistoryModule))
	else
		local function initLocalHistory()
			-- upvalues: config (copy), Local (copy), MemStorageService (upval), HttpService (upval)
			config._historyKey = "TraversalHistory" .. Local
			local Item = MemStorageService:GetItem(config._historyKey)
			
			if Item and Item ~= "" then
				local Data = HttpService:JSONDecode(Item)
				
				if typeof(Data) == "table" then
					config._history = Data
				end
			end
			table.insert(config._history, 1, {
				universeId = tostring(game.GameId),
				placeId = tostring(game.PlaceId)
			})
			MemStorageService:SetItem(config._historyKey, HttpService:JSONEncode(config._history))
			config._setHistorySignal(config._history)
		end
		
		table.insert(config._connections, game.Loaded:Connect(function()
			-- upvalues: initLocalHistory (copy)
			initLocalHistory()
		end))
		
		return (setmetatable(config, LocalTraversalHistoryModule))
	end
end

function LocalTraversalHistoryModule:addHistoryEntry(p1)
	table.insert(self._history, 1, p1)
	self._setHistorySignal(self._history)
end

function LocalTraversalHistoryModule:addHistoryEntries(p1)
	-- upvalues: CryoModule (copy)
	self._history = CryoModule.List.join(p1, self._history)
	self._setHistorySignal(self._history)
end

local function _(p1, p2)
	if p2 == nil then
		return p1
	end
	local List = {}
	
	for i = 1, p2 do
		table.insert(List, p1[i])
	end
	return List
end

function LocalTraversalHistoryModule:getHistory(p3)
	local History = self._history
	
	if p3 == nil then
		return History
	end
	local List = {}
	
	for i = 1, p3 do
		table.insert(List, History[i])
	end
	return List
end

function LocalTraversalHistoryModule.getUniverseHistorySignal(p4, p5)
	-- upvalues: SignalsModule (copy)
	return SignalsModule.createComputed(function(p6)
		-- upvalues: p4 (copy), p5 (copy)
		local HistorySignalResult = p4._historySignal(p6)
		local HistorySignalResult1 = nil
		
		if p5 == nil then
			HistorySignalResult1 = HistorySignalResult
		else
			local List = {}
			
			for i = 1, p5 do
				table.insert(List, HistorySignalResult[i])
			end
			HistorySignalResult1 = List
		end
		local List1 = {}
		
		for _, value in HistorySignalResult1 do
			table.insert(List1, value.universeId)
		end
		return List1
	end)
end

function LocalTraversalHistoryModule:getUniverseHistory(p7)
	-- upvalues: FFlagUseTeleportTraversalHistory (copy), UseTeleportedPlacesBackHistory2EngineFeature (copy), TeleportService (copy), CryoModule (copy)
	local List = {}
	
	if FFlagUseTeleportTraversalHistory and UseTeleportedPlacesBackHistory2EngineFeature then
		local MapResult = CryoModule.List.map(TeleportService:TeleportedUniversesBackHistory(), tostring)
		
		if p7 == nil then
			return MapResult
		end
		local List1 = {}
		
		for i = 1, p7 do
			table.insert(List1, MapResult[i])
		end
		List = List1
		
		return List
	else
		local History = self._history
		local History1 = nil
		
		if p7 == nil then
			History1 = History
		else
			local List2 = {}
			
			for i1 = 1, p7 do
				table.insert(List2, History[i1])
			end
			History1 = List2
		end
		for _, value in History1 do
			table.insert(List, value.universeId)
		end
		return List
	end
end

function LocalTraversalHistoryModule:writeHistory()
	-- upvalues: MemStorageService (copy), HttpService (copy)
	MemStorageService:SetItem(self._historyKey, HttpService:JSONEncode(self._history))
end

function LocalTraversalHistoryModule:disconnect()
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

if FFlagUseLocalTraversalHistory or FFlagUseTeleportTraversalHistory then
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	LocalTraversalHistoryModule.default = LocalTraversalHistoryModule.new(if UserId == nil or UserId <= 0 then "Local" else tostring(UserId))
	
	return LocalTraversalHistoryModule
else
	LocalTraversalHistoryModule.default = LocalTraversalHistoryModule.new("")
	
	return LocalTraversalHistoryModule
end