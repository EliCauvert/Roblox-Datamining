local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local parent = script.Parent.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local coreScriptsRoactCommonModule = require(parent.CoreScriptsRoactCommon)
local createSignalMap = coreScriptsRoactCommonModule.Utilities.createSignalMap
local sortTableByValue = coreScriptsRoactCommonModule.Utilities.sortTableByValue
local createPlayerStoreModule = require(script.Parent.createPlayerStore)
local createTeamStoreModule = require(script.Parent.createTeamStore)
local _ = require(script.Parent.LeaderboardStoreTypes)
local filterNewPlayerListValueStat = game:DefineFastFlag("FilterNewPlayerListValueStat", false)
local playerListHideUnusedStats = game:DefineFastFlag("PlayerListHideUnusedStats", false)
local fFlagPlayerListFixLeaderstatsStacking = sharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local playerListSortByLowercaseUsername = game:DefineFastFlag("PlayerListSortByLowercaseUsername", false)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref), signalsModule (ref), createSignalMap (ref), createTeamStoreModule (ref)
	local tbl = setmetatable({ _leaderboardConnections = {} }, t)
	tbl._teamStores = {}
	tbl._playerStores = {}
	tbl._teamsService = p1
	tbl._playersService = p2
	local var1, var2 = signalsModule.createSignal({})
	tbl._getServerAddOrder = var1
	tbl._setServerAddOrder = var2
	tbl._serverAddOrderConnection = {}
	tbl._serverInstanceAddedConnection = nil
	tbl._serverAddOrderEffectCleanup = nil
	tbl._gameStatMetadata = {}
	tbl._topGameStatsOrder = createSignalMap()
	tbl._topGameStatsOrderSetter = {}
	tbl._topGameStatSortOrder = {}
	tbl._gameStatsUsage = {}
	tbl._virtualTeamList = createSignalMap()
	tbl._teamStores.Neutral = createTeamStoreModule("Neutral", p1)
	local neutral = tbl._teamStores.Neutral
	tbl._virtualTeamList.setData("Neutral", {
		name = neutral.getName,
		color = neutral.getColor,
		order = neutral.getOrder,
		stats = neutral.getStats,
		players = neutral.getPlayers
	}, false)
	tbl:_connectPlayers()
	tbl:_connectTeams()
	tbl:_updateServerAddOrder()
	
	return tbl
end

function t:destroy()
	for i, v in pairs(self._serverAddOrderConnection) do
		if v.Disconnect then
			v:Disconnect()
		end
	end
	self._serverAddOrderConnection = {}
	
	if self._serverAddOrderEffectCleanup then
		self._serverAddOrderEffectCleanup()
	end
	if self._serverInstanceAddedConnection then
		self._serverInstanceAddedConnection:Disconnect()
	end
	self._serverInstanceAddedConnection = nil
	
	for i, v_1 in pairs(self._leaderboardConnections) do
		if v_1.Disconnect then
			v_1:Disconnect()
		end
	end
	self._leaderboardConnections = {}
	
	for i, v_2 in pairs(self._teamStores) do
		v_2.destroy()
	end
	self._teamStores = {}
	
	for i, v_3 in pairs(self._playerStores) do
		v_3.destroy()
	end
	self._playerStores = {}
end

function t:getGameStatsList()
	return self._topGameStatsOrder
end

function t:getTeamList()
	return self._virtualTeamList
end

function t:getTeamPlayerList(p1, _)
	-- upvalues: createSignalMap (ref)
	local var1 = self._teamStores[p1]
	
	return if var1 then var1.getPlayers else createSignalMap()
end

function t:getPlayerEntry(p1, _)
	local var1 = self._playerStores[p1]
	
	return if var1 then var1.getPlayerEntry() else nil
end

function t:_updateTeamStats(p1, p2)
	local var1 = self._teamStores[p1]
	
	if var1 then
		var1.updateStat(p2, function(p3, p4, p5)
			-- upvalues: self (ref)
			local var2 = self._playerStores[p3]
			
			return if var2 then var2.getStatValue(p4, p5) else nil
		end)
	end
end

function t:_removeTeamStats(p1, p2)
	local var1 = self._teamStores[p1]
	
	if var1 then
		var1.removeStat(p2)
	end
end

function t:_updateAllTeamStats(p1)
	for i, v in pairs(self._teamStores) do
		self:_updateTeamStats(i, p1)
	end
end

function t:_removeAllTeamStats(p2)
	for i, v in pairs(self._teamStores) do
		self:_removeTeamStats(i, p2)
	end
end

function t:_shouldSortPlayers(_, p3)
	return if p3 then if p3 == self._topGameStatSortOrder[1] and self._gameStatMetadata[p3] and self._gameStatMetadata[p3].isNumber then true elseif self._gameStatMetadata[p3] and self._gameStatMetadata[p3].priority == 1e999 then true else self._topGameStatSortOrder[1] or not self._gameStatMetadata[p3] or not self._gameStatMetadata[p3].isNumber else true
end

function t:_sortPlayers(p3, p4)
	-- upvalues: sortTableByValue (ref)
	if not self:_shouldSortPlayers(p3, p4) then return end
	local var1 = self._teamStores[p3]
	
	if not var1 then return end
	for i, v in ipairs(sortTableByValue(var1.getPlayers.getAllData(false), self:_compareStatsValue(self._topGameStatSortOrder))) do
		local key = self._playerStores[v.key]
		
		if key then
			key.setOrder(i)
		end
	end
end

function t._compareStatsValue(p5, p6)
	-- upvalues: playerListSortByLowercaseUsername (ref)
	return function(p7, p8)
		-- upvalues: p6 (ref), p5 (ref), playerListSortByLowercaseUsername (copy)
		local var2 = p6[1]
		
		if var2 then
			local key = p5._playerStores[p7.key]
			local key_1 = p5._playerStores[p8.key]
			
			if not key then
				return false
			elseif not key_1 then
				return true
			end
			local data = key.getPlayerEntry().stats.getData(var2, false)
			
			if data == nil then
				return false
			end
			local data_1 = key_1.getPlayerEntry().stats.getData(var2, false)
			
			if data_1 == nil then
				return true
			end
			local var3 = data(false)
			local var4 = data_1(false)
			
			return if typeof(var3) == typeof(var4) and var3 ~= var4 then p5:_compareRawStatsValue(var3, var4) elseif playerListSortByLowercaseUsername then p7.key.DisplayName:lower() < p8.key.DisplayName:lower() else p7.key.Name < p8.key.Name
		end
	end
end

function t._compareRawStatsValue(_, p5, p6)
	return if p5 == nil or p6 == nil then p6 ~= nil else p6 < p5
end

local function _(p5)
	return p5:IsA("NumberValue") or (p5:IsA("IntValue") or (p5:IsA("DoubleConstrainedValue") or p5:IsA("IntConstrainedValue")))
end

local function compareGameStats(p5, p6)
	return p5.value.priority == nil and p6.value.priority == nil or (if p5.value.priority == nil then p6.value.priority < 0 elseif p6.value.priority == nil then p5.value.priority > 0 else p6.value.priority < p5.value.priority)
end

function t:_updateGameStatsToShow()
	-- upvalues: sortTableByValue (ref), compareGameStats (ref), playerListHideUnusedStats (ref), signalsModule (ref)
	local t = {}
	local var2 = sortTableByValue(self._gameStatMetadata, compareGameStats)
	self._topGameStatSortOrder = {}
	local var3 = 0
	
	for i, v in ipairs(var2) do
		if var3 >= 4 then break end
		if not playerListHideUnusedStats or self._gameStatMetadata[v.key].isUsed then
			local key = v.key
			t[key] = i
			
			if self._topGameStatsOrder.getData(key, false) == nil then
				local var4, var5 = signalsModule.createSignal(i)
				self._topGameStatsOrder.setData(key, { order = var4 }, false)
				self._topGameStatsOrderSetter[key] = var5
			else
				self._topGameStatsOrderSetter[key](i)
			end
			table.insert(self._topGameStatSortOrder, key)
			var3 += 1
		end
	end
	for i_1, v_1 in pairs(self._topGameStatsOrder.getAllData(false)) do
		if not t[i_1] then
			self._topGameStatsOrder.removeData(i_1, false)
			self._topGameStatsOrderSetter[i_1] = nil
		end
	end
end

function t:_updateGameStatOrder(p5, p6)
	local name = self._gameStatMetadata[p5.Name]
	p6 = p6 or 0
	
	if name then
		if p6 == nil then
			self._gameStatMetadata[p5.Name].hasPriority = false
		else
			self._gameStatMetadata[p5.Name].hasPriority = true
		end
	end
	if name.priority ~= p6 then
		self._gameStatMetadata[p5.Name].priority = p6
		self:_updateGameStatsToShow()
	end
end

function t:_updateServerAddOrder()
	-- upvalues: robloxReplicatedStorageService (ref), signalsModule (ref), filterNewPlayerListValueStat (ref), playerListHideUnusedStats (ref)
	local _ = {}
	local leaderstatsOrder = robloxReplicatedStorageService:GetAttribute("LeaderstatsOrder") or {}
	robloxReplicatedStorageService:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function()
		-- upvalues: leaderstatsOrder (write), robloxReplicatedStorageService (copy), self (ref)
		leaderstatsOrder = robloxReplicatedStorageService:GetAttribute("LeaderstatsOrder") or {}
		self._setServerAddOrder(leaderstatsOrder)
	end)
	local httpService = game:GetService("HttpService")
	
	local function decodeJSON(p5)
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p5)
	end
	
	local function _(p5)
		-- upvalues: decodeJSON (ref)
		local ok, status = pcall(decodeJSON, p5)
		
		return if ok then status else {}
	end
	
	self._serverInstanceAddedConnection = nil
	
	local function childAdded(p5)
		-- upvalues: self (ref), leaderstatsOrder (write), decodeJSON (ref)
		if p5.Name ~= "LeaderstatsOrder" then return end
		if self._serverInstanceAddedConnection then
			self._serverInstanceAddedConnection:Disconnect()
		end
		local ok, status = pcall(decodeJSON, p5.Value)
		leaderstatsOrder = if ok then status else {}
		self._serverAddOrderConnection[p5] = p5.Changed:Connect(function(p6)
			-- upvalues: leaderstatsOrder (copy), decodeJSON (copy), self (copy)
			local ok, status = pcall(decodeJSON, p6)
			leaderstatsOrder = if ok then status else {}
			self._setServerAddOrder(leaderstatsOrder)
		end)
	end
	
	self._serverInstanceAddedConnection = robloxReplicatedStorageService.ChildAdded:Connect(childAdded)
	
	for i, v in ipairs(robloxReplicatedStorageService:GetChildren()) do
		childAdded(v)
	end
	self._serverAddOrderEffectCleanup = signalsModule.createEffect(function(p5)
		-- upvalues: self (ref), filterNewPlayerListValueStat (copy), playerListHideUnusedStats (copy)
		local var6 = false
		
		for i, v in pairs(self._getServerAddOrder(p5)) do
			if not filterNewPlayerListValueStat or v ~= 0 then
				if self._gameStatMetadata[i] then
					if self._gameStatMetadata[i].hasPriority ~= true then
						self._gameStatMetadata[i].priority = v * -1
						var6 = true
					end
				elseif not playerListHideUnusedStats then
					self._gameStatMetadata[i] = { hasPriority = false, priority = v * -1 }
				end
			end
		end
		if var6 then
			self:_updateGameStatsToShow()
		end
	end)
end

function t:_updateGameStatPriority(p5)
	local var6 = nil
	local priority = p5:FindFirstChild("Priority")
	
	if priority and (priority:IsA("IntValue") or priority:IsA("NumberValue")) then
		var6 = priority.Value
	end
	local isPrimary = p5:FindFirstChild("IsPrimary")
	
	if isPrimary then
		if not isPrimary:IsA("BoolValue") then
			var6 = 1e999
		elseif isPrimary.Value then
			var6 = 1e999
		end
	end
	self:_updateGameStatOrder(p5, var6)
end

function t:_addGameStat(p5)
	-- upvalues: playerListHideUnusedStats (ref)
	if self._gameStatMetadata[p5.Name] == nil then
		self._gameStatMetadata[p5.Name] = {}
	end
	self._gameStatMetadata[p5.Name].isNumber = p5:IsA("NumberValue") or (p5:IsA("IntValue") or (p5:IsA("DoubleConstrainedValue") or p5:IsA("IntConstrainedValue")))
	self:_updateGameStatPriority(p5)
	
	if playerListHideUnusedStats and not self._gameStatMetadata[p5.Name].isUsed then
		self._gameStatMetadata[p5.Name].isUsed = true
		self:_updateGameStatsToShow()
	end
	self._gameStatsUsage[p5.Name] = if self._gameStatsUsage[p5.Name] then self._gameStatsUsage[p5.Name] + 1 else 1
	self:_updateAllTeamStats(p5.Name)
end

function t:_removeGameStat(p5)
	self._gameStatsUsage[p5.Name] = if self._gameStatsUsage[p5.Name] then self._gameStatsUsage[p5.Name] - 1 else 0
	
	if self._gameStatsUsage[p5.Name] <= 0 then
		self._gameStatsUsage[p5.Name] = nil
		self._topGameStatsOrder.removeData(p5.Name, false)
		self._topGameStatsOrderSetter[p5.Name] = nil
		self._gameStatMetadata[p5.Name] = nil
		self:_updateGameStatsToShow()
		self:_updateAllTeamStats(p5.Name)
		
		return
	end
	self:_updateGameStatPriority(p5)
end

if fFlagPlayerListFixLeaderstatsStacking then
	function t:_checkGameStatsExist()
		local t = {}
		
		for i, v in self._gameStatMetadata do
			t[i] = false
		end
		for i_1, v_1 in self._playerStores do
			local leaderstats = i_1:FindFirstChild("leaderstats")
			
			if leaderstats then
				for i_2, v_2 in t do
					if leaderstats:FindFirstChild(i_2) then
						t[i_2] = true
					end
				end
			end
		end
		for i_2, v_2 in t do
			if not v_2 then
				self._gameStatsUsage[i_2] = nil
				self._topGameStatsOrder.removeData(i_2, false)
				self._topGameStatsOrderSetter[i_2] = nil
				self._gameStatMetadata[i_2] = nil
				self:_updateGameStatsToShow()
				self:_updateAllTeamStats(i_2)
			end
		end
	end
end
function t._createPlayerStore(p5, p6)
	-- upvalues: createPlayerStoreModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref)
	return createPlayerStoreModule(p6, function(p7)
		-- upvalues: p5 (ref)
		p5:_addGameStat(p7)
	end, function(p7)
		-- upvalues: p5 (ref)
		p5:_removeGameStat(p7)
	end, function(p7, p8)
		-- upvalues: p5 (ref)
		p5:_updateTeamStats(p7, p8)
	end, function(p7, p8)
		-- upvalues: p5 (ref)
		p5:_sortPlayers(p7, p8)
	end, if fFlagPlayerListFixLeaderstatsStacking then function()
		-- upvalues: p5 (ref)
		p5:_checkGameStatsExist()
	end else nil)
end

function t:_createTeamStore(p5)
	-- upvalues: createTeamStoreModule (ref)
	return createTeamStoreModule(p5, self._teamsService)
end

function t:_getOrCreateTeamStore(p5)
	local var6 = self._teamStores[p5]
	
	if not var6 then
		var6 = self:_createTeamStore(p5)
		self._teamStores[p5] = var6
		
		if p5 ~= "Neutral" then
			self._virtualTeamList.setData(p5, {
				name = var6.getName,
				color = var6.getColor,
				order = var6.getOrder,
				stats = var6.getStats,
				players = var6.getPlayers
			}, false)
		end
	end
	return var6
end

function t:_addPlayerStore(p5)
	if self._playerStores[p5] then
		return
	end
	local var6 = if p5.Team then p5.Team else "Neutral"
	self:_getOrCreateTeamStore(var6).addPlayer(p5)
	self._playerStores[p5] = self:_createPlayerStore(p5)
	self:_connectPlayerTeamChange(p5)
	self:_sortPlayers(var6)
end

function t:_removePlayerStore(p5)
	local var6 = self._playerStores[p5]
	
	if not var6 then return end
	local team = var6.getTeam()
	local var7 = self._teamStores[team]
	
	if var7 then
		var7.removePlayer(p5)
	end
	local text = "PlayerTeamChanged_" .. p46.Name
	local var8 = self._leaderboardConnections[text]
	
	if var8 and var8.Disconnect then
		var8:Disconnect()
		self._leaderboardConnections[text] = nil
	end
	var6.destroy()
	self._playerStores[p5] = nil
	self:_sortPlayers(team)
end

function t:_connectPlayerTeamChange(p5)
	self._leaderboardConnections["PlayerTeamChanged_" .. p47.Name] = p5.Changed:Connect(function(p6)
		-- upvalues: self (ref), p5 (ref)
		if p6 == "Team" then
			local var6 = self._playerStores[p5]
			
			if not var6 then return end
			local team = var6.getTeam()
			local var7 = if p5.Team then p5.Team else "Neutral"
			local var8 = self._teamStores[team]
			
			if var8 then
				var8.removePlayer(p5)
			end
			self:_getOrCreateTeamStore(var7).addPlayer(p5)
			var6.setTeam(var7)
			self:_sortPlayers(team)
			self:_sortPlayers(var7)
		end
	end)
end

function t:_addTeamStore(p5)
	if self._teamStores[p5] then
		return
	end
	local var6 = self:_createTeamStore(p5)
	self._teamStores[p5] = var6
	self._virtualTeamList.setData(p5, {
		name = var6.getName,
		color = var6.getColor,
		order = var6.getOrder,
		stats = var6.getStats,
		players = var6.getPlayers
	}, false)
end

function t:_removeTeamStore(p5)
	local var6 = self._teamStores[p5]
	
	if not var6 then return end
	local neutralTOrCreateTeamStore = self:_getOrCreateTeamStore("Neutral")
	
	for i, v in pairs(var6.getPlayers.getAllData(false)) do
		var6.removePlayer(i)
		neutralTOrCreateTeamStore.addPlayer(i)
		local var7 = self._playerStores[i]
		
		if var7 then
			var7.setTeam("Neutral")
		end
	end
	var6.destroy()
	self._teamStores[p5] = nil
	self._virtualTeamList.removeData(p5, false)
end

function t:_connectTeams()
	self._leaderboardConnections.TeamAdded = self._teamsService.ChildAdded:Connect(function(p6)
		-- upvalues: self (ref)
		if p6:IsA("Team") then
			self:_addTeamStore(p6)
		end
	end)
	self._leaderboardConnections.TeamRemoved = self._teamsService.ChildRemoved:Connect(function(p6)
		-- upvalues: self (ref)
		if p6:IsA("Team") then
			self:_removeTeamStore(p6)
		end
	end)
	
	for i, v in pairs(self._teamsService:GetTeams()) do
		self:_addTeamStore(v)
	end
end

function t:_connectPlayers()
	self._leaderboardConnections.PlayerAdded = self._playersService.PlayerAdded:Connect(function(p6)
		-- upvalues: self (ref)
		self:_addPlayerStore(p6)
	end)
	self._leaderboardConnections.PlayerRemoving = self._playersService.PlayerRemoving:Connect(function(p6)
		-- upvalues: self (ref)
		self:_removePlayerStore(p6)
	end)
	
	for i, v in pairs(self._playersService:GetPlayers()) do
		self:_addPlayerStore(v)
	end
end

return t