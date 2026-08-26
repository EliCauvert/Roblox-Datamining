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

function t.new(p1)
	-- upvalues: signalsModule (ref), t (ref), memStorageService (ref), httpService (ref)
	local t_1 = { _connections = {}, _historyKey = "", _history = {} }
	local var1, var2 = signalsModule.createSignal({})
	t_1._historySignal = var1
	t_1._setHistorySignal = var2
	
	if p1 == nil or p1 == "" then
		return setmetatable(t_1, t)
	end
	local function initLocalHistory()
		-- upvalues: t_1 (ref), p1 (ref), memStorageService (copy), httpService (copy)
		t_1._historyKey = "TraversalHistory" .. p0
		local historyKeyItem = memStorageService:GetItem(t_1._historyKey)
		
		if historyKeyItem and historyKeyItem ~= "" then
			local var3 = httpService:JSONDecode(historyKeyItem)
			
			if typeof(var3) == "table" then
				t_1._history = var3
			end
		end
		table.insert(t_1._history, 1, {
			universeId = tostring(game.GameId),
			placeId = tostring(game.PlaceId)
		})
		memStorageService:SetItem(t_1._historyKey, httpService:JSONEncode(t_1._history))
		t_1._setHistorySignal(t_1._history)
	end
	
	table.insert(t_1._connections, game.Loaded:Connect(function()
		-- upvalues: initLocalHistory (ref)
		initLocalHistory()
	end))
	
	return setmetatable(t_1, t)
end

function t:addHistoryEntry(p1)
	table.insert(self._history, 1, p1)
	self._setHistorySignal(self._history)
end

function t:addHistoryEntries(p1)
	-- upvalues: cryoModule (ref)
	self._history = cryoModule.List.join(p1, self._history)
	self._setHistorySignal(self._history)
end

local function _(p1, p2)
	if p2 == nil then
		return p1
	end
	local t = {}
	
	for i = 1, p2 do
		table.insert(t, p1[i])
	end
	return t
end

function t:getHistory(p3)
	local history = self._history
	
	if p3 == nil then
		return history
	end
	local t = {}
	
	for i = 1, p3 do
		table.insert(t, history[i])
	end
	return t
end

function t.getUniverseHistorySignal(value, p4)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p5)
		-- upvalues: value (ref), p4 (ref)
		local var1
		local var2 = value._historySignal(p5)
		
		if p4 == nil then
			var1 = var2
		else
			local t = {}
			
			for i = 1, p4 do
				table.insert(t, var2[i])
			end
			var1 = t
		end
		local t = {}
		
		for i_1, v in var1 do
			table.insert(t, v.universeId)
		end
		return t
	end)
end

function t:getUniverseHistory(p6)
	-- upvalues: fFlagUseTeleportTraversalHistory (ref), useTeleportedPlacesBackHistory2EngineFeature (ref), teleportService (ref), cryoModule (ref)
	local t = {}
	
	if fFlagUseTeleportTraversalHistory and useTeleportedPlacesBackHistory2EngineFeature then
		local var3 = cryoModule.List.map(teleportService:TeleportedUniversesBackHistory(), tostring)
		
		if p6 == nil then
			return var3
		end
		local t_1 = {}
		
		for i = 1, p6 do
			table.insert(t_1, var3[i])
		end
		t = t_1
		
		return t
	else
		local var4
		local history = self._history
		
		if p6 == nil then
			var4 = history
		else
			local t_1 = {}
			
			for i_1 = 1, p6 do
				table.insert(t_1, history[i_1])
			end
			var4 = t_1
		end
		for i_2, v in var4 do
			table.insert(t, v.universeId)
		end
		return t
	end
end

function t:writeHistory()
	-- upvalues: memStorageService (ref), httpService (ref)
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
	local var5 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var5 == nil or var5 <= 0 then "Local" else tostring(var5)
end

if not fFlagUseLocalTraversalHistory and not fFlagUseTeleportTraversalHistory then
	t.default = t.new("")
	
	return t
end
local var5 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
t.default = t.new(if var5 == nil or var5 <= 0 then "Local" else tostring(var5))

return t