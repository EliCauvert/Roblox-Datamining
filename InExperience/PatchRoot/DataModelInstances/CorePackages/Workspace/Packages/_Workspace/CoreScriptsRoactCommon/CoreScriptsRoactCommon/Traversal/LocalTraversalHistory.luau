local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local useTeleportedPlacesBackHistory2EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local flagsModule = require(script.Parent.Flags)
local fFlagUseLocalTraversalHistory = flagsModule.FFlagUseLocalTraversalHistory
local fFlagUseTeleportTraversalHistory = flagsModule.FFlagUseTeleportTraversalHistory
local t = {}
t.__index = t

function t.new(p0) --[[ line: 51 ]]
	-- upvalues: signalsModule (ref), t (ref), memStorageService (ref), httpService (ref)
	local t_1 = { _connections = {}, _historyKey = "", _history = {} }
	local var11, var12 = signalsModule.createSignal({})
	t_1._historySignal = var11
	t_1._setHistorySignal = var12
	
	if p0 == nil or p0 == "" then
		return setmetatable(t_1, t)
	end
	local function initLocalHistory() --[[ line: 62 ]]
		-- upvalues: t_1 (ref), p0 (ref), memStorageService (copy), httpService (copy)
		t_1._historyKey = "TraversalHistory" .. p0
		local historyKeyItem = memStorageService:GetItem(t_1._historyKey)
		
		if historyKeyItem and historyKeyItem ~= "" then
			local var15 = httpService:JSONDecode(historyKeyItem)
			
			if typeof(var15) == "table" then
				t_1._history = var15
			end
		end
		table.insert(t_1._history, 1, {
			universeId = tostring(game.GameId),
			placeId = tostring(game.PlaceId)
		})
		memStorageService:SetItem(t_1._historyKey, httpService:JSONEncode(t_1._history))
		t_1._setHistorySignal(t_1._history)
	end
	
	table.insert(t_1._connections, game.Loaded:Connect(function() --[[ line: 82 ]]
		-- upvalues: initLocalHistory (ref)
		initLocalHistory()
	end))
	
	return setmetatable(t_1, t)
end

function t:addHistoryEntry(p1) --[[ line: 90 ]]
	table.insert(self._history, 1, p1)
	self._setHistorySignal(self._history)
end

function t:addHistoryEntries(p2) --[[ line: 95 ]]
	-- upvalues: cryoModule (ref)
	self._history = cryoModule.List.join(p2, self._history)
	self._setHistorySignal(self._history)
end

local function _(p3, p4) --[[ line: 101 | named "getNMostRecent" ]]
	if p4 == nil then
		return p3
	end
	local t = {}
	
	for i = 1, p4 do
		table.insert(t, p3[i])
	end
	return t
end

function t:getHistory(p5) --[[ line: 112 ]]
	local history = self._history
	
	if p5 == nil then
		return history
	end
	local t = {}
	
	for i = 1, p5 do
		table.insert(t, history[i])
	end
	return t
end

function t.getUniverseHistorySignal(value, p6) --[[ line: 115 ]]
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p7) --[[ line: 116 ]]
		-- upvalues: value (ref), p6 (ref)
		local var19
		local var18 = value._historySignal(p7)
		
		if p6 == nil then
			var19 = var18
		else
			local t = {}
			
			for i = 1, p6 do
				table.insert(t, var18[i])
			end
			var19 = t
		end
		local t = {}
		
		for i_1, v in var19 do
			table.insert(t, v.universeId)
		end
		return t
	end)
end

function t:getUniverseHistory(p8) --[[ line: 127 ]]
	-- upvalues: fFlagUseTeleportTraversalHistory (ref), useTeleportedPlacesBackHistory2EngineFeature (ref), teleportService (ref), cryoModule (ref)
	local t = {}
	
	if fFlagUseTeleportTraversalHistory and useTeleportedPlacesBackHistory2EngineFeature then
		local var23 = cryoModule.List.map(teleportService:TeleportedUniversesBackHistory(), tostring)
		
		if p8 == nil then
			return var23
		end
		local t_1 = {}
		
		for i = 1, p8 do
			table.insert(t_1, var23[i])
		end
		t = t_1
		
		return t
	else
		local var25
		local history = self._history
		
		if p8 == nil then
			var25 = history
		else
			local t_1 = {}
			
			for i_1 = 1, p8 do
				table.insert(t_1, history[i_1])
			end
			var25 = t_1
		end
		for i_2, v in var25 do
			table.insert(t, v.universeId)
		end
		return t
	end
end

function t:writeHistory() --[[ line: 143 ]]
	-- upvalues: memStorageService (ref), httpService (ref)
	memStorageService:SetItem(self._historyKey, httpService:JSONEncode(self._history))
end

function t:disconnect() --[[ line: 147 ]]
	for i, v in self._connections do
		v:Disconnect()
	end
	self._connections = {}
end

local _ = function() --[[ line: 154 | named "getDefaultId" ]]
	-- upvalues: playersService (ref)
	local var27 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var27 == nil or var27 <= 0 then "Local" else tostring(var27)
end

if not fFlagUseLocalTraversalHistory and not fFlagUseTeleportTraversalHistory then
	t.default = t.new("")
	
	return t
end
local var9 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
t.default = t.new(if var9 == nil or var9 <= 0 then "Local" else tostring(var9))

return t