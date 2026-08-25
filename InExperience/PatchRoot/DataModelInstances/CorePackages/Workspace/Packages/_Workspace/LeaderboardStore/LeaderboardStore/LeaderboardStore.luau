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

function t.new(p0, p1)
	-- upvalues: t (ref), signalsModule (ref), createSignalMap (ref), createTeamStoreModule (ref)
	local tbl = setmetatable({ _leaderboardConnections = {} }, t)
	tbl._teamStores = {}
	tbl._playerStores = {}
	tbl._teamsService = p0
	tbl._playersService = p1
	local var12, var13 = signalsModule.createSignal({})
	tbl._getServerAddOrder = var12
	tbl._setServerAddOrder = var13
	tbl._serverAddOrderConnection = {}
	tbl._serverInstanceAddedConnection = nil
	tbl._serverAddOrderEffectCleanup = nil
	tbl._gameStatMetadata = {}
	tbl._topGameStatsOrder = createSignalMap()
	tbl._topGameStatsOrderSetter = {}
	tbl._topGameStatSortOrder = {}
	tbl._gameStatsUsage = {}
	tbl._virtualTeamList = createSignalMap()
	tbl._teamStores.Neutral = createTeamStoreModule("Neutral", p0)
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

function t:getTeamPlayerList(p2, _)
	-- upvalues: createSignalMap (ref)
	local var14 = self._teamStores[p2]
	
	return if var14 then var14.getPlayers else createSignalMap()
end

function t:getPlayerEntry(p3, _)
	local var15 = self._playerStores[p3]
	
	return if var15 then var15.getPlayerEntry() else nil
end

function t:_updateTeamStats(p4, p5)
	local var16 = self._teamStores[p4]
	
	if var16 then
		var16.updateStat(p5, function(p6, p7, p8)
			-- upvalues: self (ref)
			local var17 = self._playerStores[p6]
			
			return if var17 then var17.getStatValue(p7, p8) else nil
		end)
	end
end

function t:_removeTeamStats(p9, p10)
	local var18 = self._teamStores[p9]
	
	if var18 then
		var18.removeStat(p10)
	end
end

function t:_updateAllTeamStats(p11)
	for i, v in pairs(self._teamStores) do
		self:_updateTeamStats(i, p11)
	end
end

function t:_removeAllTeamStats(p12)
	for i, v in pairs(self._teamStores) do
		self:_removeTeamStats(i, p12)
	end
end

function t:_shouldSortPlayers(_, p13)
	return if p13 then if p13 == self._topGameStatSortOrder[1] and self._gameStatMetadata[p13] and self._gameStatMetadata[p13].isNumber then true elseif self._gameStatMetadata[p13] and self._gameStatMetadata[p13].priority == 1e999 then true else self._topGameStatSortOrder[1] or not self._gameStatMetadata[p13] or not self._gameStatMetadata[p13].isNumber else true
end

function t:_sortPlayers(p14, p15)
	-- upvalues: sortTableByValue (ref)
	if not self:_shouldSortPlayers(p14, p15) then return end
	local var19 = self._teamStores[p14]
	
	if not var19 then return end
	for i, v in ipairs(sortTableByValue(var19.getPlayers.getAllData(false), self:_compareStatsValue(self._topGameStatSortOrder))) do
		local key = self._playerStores[v.key]
		
		if key then
			key.setOrder(i)
		end
	end
end

function t._compareStatsValue(p16, p17)
	-- upvalues: playerListSortByLowercaseUsername (ref)
	return function(p18, p19)
		-- upvalues: p17 (ref), p16 (ref), playerListSortByLowercaseUsername (copy)
		local var20 = p17[1]
		
		if var20 then
			local key = p16._playerStores[p18.key]
			local key_1 = p16._playerStores[p19.key]
			
			if not key then
				return false
			elseif not key_1 then
				return true
			end
			local data = key.getPlayerEntry().stats.getData(var20, false)
			
			if data == nil then
				return false
			end
			local data_1 = key_1.getPlayerEntry().stats.getData(var20, false)
			
			if data_1 == nil then
				return true
			end
			local var23 = data(false)
			local var24 = data_1(false)
			
			return if typeof(var23) == typeof(var24) and var23 ~= var24 then p16:_compareRawStatsValue(var23, var24) elseif playerListSortByLowercaseUsername then p18.key.DisplayName:lower() < p19.key.DisplayName:lower() else p18.key.Name < p19.key.Name
		end
	end
end

function t._compareRawStatsValue(_, p20, p21)
	return if p20 == nil or p21 == nil then p21 ~= nil else p21 < p20
end

local function _(p22)
	return p22:IsA("NumberValue") or (p22:IsA("IntValue") or (p22:IsA("DoubleConstrainedValue") or p22:IsA("IntConstrainedValue")))
end

local function compareGameStats(p23, p24)
	return p23.value.priority == nil and p24.value.priority == nil or (if p23.value.priority == nil then p24.value.priority < 0 elseif p24.value.priority == nil then p23.value.priority > 0 else p24.value.priority < p23.value.priority)
end

function t:_updateGameStatsToShow()
	-- upvalues: sortTableByValue (ref), compareGameStats (ref), playerListHideUnusedStats (ref), signalsModule (ref)
	local t = {}
	local var26 = sortTableByValue(self._gameStatMetadata, compareGameStats)
	self._topGameStatSortOrder = {}
	local var27 = 0
	
	for i, v in ipairs(var26) do
		if var27 >= 4 then break end
		if not playerListHideUnusedStats or self._gameStatMetadata[v.key].isUsed then
			local key = v.key
			t[key] = i
			
			if self._topGameStatsOrder.getData(key, false) == nil then
				local var28, var29 = signalsModule.createSignal(i)
				self._topGameStatsOrder.setData(key, { order = var28 }, false)
				self._topGameStatsOrderSetter[key] = var29
			else
				self._topGameStatsOrderSetter[key](i)
			end
			table.insert(self._topGameStatSortOrder, key)
			var27 += 1
		end
	end
	for i_1, v_1 in pairs(self._topGameStatsOrder.getAllData(false)) do
		if not t[i_1] then
			self._topGameStatsOrder.removeData(i_1, false)
			self._topGameStatsOrderSetter[i_1] = nil
		end
	end
end

function t:_updateGameStatOrder(p25, p26)
	local name = self._gameStatMetadata[p25.Name]
	p26 = p26 or 0
	
	if name then
		if p26 == nil then
			self._gameStatMetadata[p25.Name].hasPriority = false
		else
			self._gameStatMetadata[p25.Name].hasPriority = true
		end
	end
	if name.priority ~= p26 then
		self._gameStatMetadata[p25.Name].priority = p26
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
	
	local function decodeJSON(p27)
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p27)
	end
	
	local function _(p28)
		-- upvalues: decodeJSON (ref)
		local ok, status = pcall(decodeJSON, p28)
		
		return if ok then status else {}
	end
	
	self._serverInstanceAddedConnection = nil
	
	local function childAdded(p29)
		-- upvalues: self (ref), leaderstatsOrder (write), decodeJSON (ref)
		if p29.Name ~= "LeaderstatsOrder" then return end
		if self._serverInstanceAddedConnection then
			self._serverInstanceAddedConnection:Disconnect()
		end
		local ok, status = pcall(decodeJSON, p29.Value)
		leaderstatsOrder = if ok then status else {}
		self._serverAddOrderConnection[p29] = p29.Changed:Connect(function(p30)
			-- upvalues: leaderstatsOrder (copy), decodeJSON (copy), self (copy)
			local ok, status = pcall(decodeJSON, p30)
			leaderstatsOrder = if ok then status else {}
			self._setServerAddOrder(leaderstatsOrder)
		end)
	end
	
	self._serverInstanceAddedConnection = robloxReplicatedStorageService.ChildAdded:Connect(childAdded)
	
	for i, v in ipairs(robloxReplicatedStorageService:GetChildren()) do
		childAdded(v)
	end
	self._serverAddOrderEffectCleanup = signalsModule.createEffect(function(p31)
		-- upvalues: self (ref), filterNewPlayerListValueStat (copy), playerListHideUnusedStats (copy)
		local var35 = false
		
		for i, v in pairs(self._getServerAddOrder(p31)) do
			if not filterNewPlayerListValueStat or v ~= 0 then
				if self._gameStatMetadata[i] then
					if self._gameStatMetadata[i].hasPriority ~= true then
						self._gameStatMetadata[i].priority = v * -1
						var35 = true
					end
				elseif not playerListHideUnusedStats then
					self._gameStatMetadata[i] = { hasPriority = false, priority = v * -1 }
				end
			end
		end
		if var35 then
			self:_updateGameStatsToShow()
		end
	end)
end

function t:_updateGameStatPriority(p32)
	local var36 = nil
	local priority = p32:FindFirstChild("Priority")
	
	if priority and (priority:IsA("IntValue") or priority:IsA("NumberValue")) then
		var36 = priority.Value
	end
	local isPrimary = p32:FindFirstChild("IsPrimary")
	
	if isPrimary then
		if not isPrimary:IsA("BoolValue") then
			var36 = 1e999
		elseif isPrimary.Value then
			var36 = 1e999
		end
	end
	self:_updateGameStatOrder(p32, var36)
end

function t:_addGameStat(p33)
	-- upvalues: playerListHideUnusedStats (ref)
	if self._gameStatMetadata[p33.Name] == nil then
		self._gameStatMetadata[p33.Name] = {}
	end
	self._gameStatMetadata[p33.Name].isNumber = p33:IsA("NumberValue") or (p33:IsA("IntValue") or (p33:IsA("DoubleConstrainedValue") or p33:IsA("IntConstrainedValue")))
	self:_updateGameStatPriority(p33)
	
	if playerListHideUnusedStats and not self._gameStatMetadata[p33.Name].isUsed then
		self._gameStatMetadata[p33.Name].isUsed = true
		self:_updateGameStatsToShow()
	end
	self._gameStatsUsage[p33.Name] = if self._gameStatsUsage[p33.Name] then self._gameStatsUsage[p33.Name] + 1 else 1
	self:_updateAllTeamStats(p33.Name)
end

function t:_removeGameStat(p34)
	self._gameStatsUsage[p34.Name] = if self._gameStatsUsage[p34.Name] then self._gameStatsUsage[p34.Name] - 1 else 0
	
	if self._gameStatsUsage[p34.Name] <= 0 then
		self._gameStatsUsage[p34.Name] = nil
		self._topGameStatsOrder.removeData(p34.Name, false)
		self._topGameStatsOrderSetter[p34.Name] = nil
		self._gameStatMetadata[p34.Name] = nil
		self:_updateGameStatsToShow()
		self:_updateAllTeamStats(p34.Name)
		
		return
	end
	self:_updateGameStatPriority(p34)
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
function t._createPlayerStore(p35, p36)
	-- upvalues: createPlayerStoreModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref)
	return createPlayerStoreModule(p36, function(p37)
		-- upvalues: p35 (ref)
		p35:_addGameStat(p37)
	end, function(p38)
		-- upvalues: p35 (ref)
		p35:_removeGameStat(p38)
	end, function(p39, p40)
		-- upvalues: p35 (ref)
		p35:_updateTeamStats(p39, p40)
	end, function(p41, p42)
		-- upvalues: p35 (ref)
		p35:_sortPlayers(p41, p42)
	end, if fFlagPlayerListFixLeaderstatsStacking then function()
		-- upvalues: p35 (ref)
		p35:_checkGameStatsExist()
	end else nil)
end

function t:_createTeamStore(p43)
	-- upvalues: createTeamStoreModule (ref)
	return createTeamStoreModule(p43, self._teamsService)
end

function t:_getOrCreateTeamStore(p44)
	local var41 = self._teamStores[p44]
	
	if not var41 then
		var41 = self:_createTeamStore(p44)
		self._teamStores[p44] = var41
		
		if p44 ~= "Neutral" then
			self._virtualTeamList.setData(p44, {
				name = var41.getName,
				color = var41.getColor,
				order = var41.getOrder,
				stats = var41.getStats,
				players = var41.getPlayers
			}, false)
		end
	end
	return var41
end

function t:_addPlayerStore(p45)
	if self._playerStores[p45] then
		return
	end
	local var42 = if p45.Team then p45.Team else "Neutral"
	self:_getOrCreateTeamStore(var42).addPlayer(p45)
	self._playerStores[p45] = self:_createPlayerStore(p45)
	self:_connectPlayerTeamChange(p45)
	self:_sortPlayers(var42)
end

function t:_removePlayerStore(p46)
	local var43 = self._playerStores[p46]
	
	if not var43 then return end
	local team = var43.getTeam()
	local var45 = self._teamStores[team]
	
	if var45 then
		var45.removePlayer(p46)
	end
	local text = "PlayerTeamChanged_" .. p46.Name
	local var47 = self._leaderboardConnections[text]
	
	if var47 and var47.Disconnect then
		var47:Disconnect()
		self._leaderboardConnections[text] = nil
	end
	var43.destroy()
	self._playerStores[p46] = nil
	self:_sortPlayers(team)
end

function t:_connectPlayerTeamChange(p47)
	self._leaderboardConnections["PlayerTeamChanged_" .. p47.Name] = p47.Changed:Connect(function(p48)
		-- upvalues: self (ref), p47 (ref)
		if p48 == "Team" then
			local var48 = self._playerStores[p47]
			
			if not var48 then return end
			local team = var48.getTeam()
			local var50 = if p47.Team then p47.Team else "Neutral"
			local var51 = self._teamStores[team]
			
			if var51 then
				var51.removePlayer(p47)
			end
			self:_getOrCreateTeamStore(var50).addPlayer(p47)
			var48.setTeam(var50)
			self:_sortPlayers(team)
			self:_sortPlayers(var50)
		end
	end)
end

function t:_addTeamStore(p49)
	if self._teamStores[p49] then
		return
	end
	local var52 = self:_createTeamStore(p49)
	self._teamStores[p49] = var52
	self._virtualTeamList.setData(p49, {
		name = var52.getName,
		color = var52.getColor,
		order = var52.getOrder,
		stats = var52.getStats,
		players = var52.getPlayers
	}, false)
end

function t:_removeTeamStore(p50)
	local var53 = self._teamStores[p50]
	
	if not var53 then return end
	local neutralTOrCreateTeamStore = self:_getOrCreateTeamStore("Neutral")
	
	for i, v in pairs(var53.getPlayers.getAllData(false)) do
		var53.removePlayer(i)
		neutralTOrCreateTeamStore.addPlayer(i)
		local var55 = self._playerStores[i]
		
		if var55 then
			var55.setTeam("Neutral")
		end
	end
	var53.destroy()
	self._teamStores[p50] = nil
	self._virtualTeamList.removeData(p50, false)
end

function t:_connectTeams()
	self._leaderboardConnections.TeamAdded = self._teamsService.ChildAdded:Connect(function(p51)
		-- upvalues: self (ref)
		if p51:IsA("Team") then
			self:_addTeamStore(p51)
		end
	end)
	self._leaderboardConnections.TeamRemoved = self._teamsService.ChildRemoved:Connect(function(p52)
		-- upvalues: self (ref)
		if p52:IsA("Team") then
			self:_removeTeamStore(p52)
		end
	end)
	
	for i, v in pairs(self._teamsService:GetTeams()) do
		self:_addTeamStore(v)
	end
end

function t:_connectPlayers()
	self._leaderboardConnections.PlayerAdded = self._playersService.PlayerAdded:Connect(function(p53)
		-- upvalues: self (ref)
		self:_addPlayerStore(p53)
	end)
	self._leaderboardConnections.PlayerRemoving = self._playersService.PlayerRemoving:Connect(function(p54)
		-- upvalues: self (ref)
		self:_removePlayerStore(p54)
	end)
	
	for i, v in pairs(self._playersService:GetPlayers()) do
		self:_addPlayerStore(v)
	end
end

return t