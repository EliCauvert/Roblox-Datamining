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
local playerListSortByLowercaseDisplayName = game:DefineFastFlag("PlayerListSortByLowercaseDisplayName", false)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 55 ]]
	-- upvalues: t (ref), signalsModule (ref), createSignalMap (ref), createTeamStoreModule (ref)
	local tbl = setmetatable({ _leaderboardConnections = {} }, t)
	tbl._teamStores = {}
	tbl._playerStores = {}
	tbl._teamsService = p0
	tbl._playersService = p1
	local var13, var14 = signalsModule.createSignal({})
	tbl._getServerAddOrder = var13
	tbl._setServerAddOrder = var14
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

function t:destroy() --[[ line: 106 ]]
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

function t:getGameStatsList() --[[ line: 141 ]]
	return self._topGameStatsOrder
end

function t:getTeamList() --[[ line: 145 ]]
	return self._virtualTeamList
end

function t:getTeamPlayerList(p2, _) --[[ line: 149 ]]
	-- upvalues: createSignalMap (ref)
	local var15 = self._teamStores[p2]
	
	return if var15 then var15.getPlayers else createSignalMap()
end

function t:getPlayerEntry(p3, _) --[[ line: 160 ]]
	local var16 = self._playerStores[p3]
	
	return if var16 then var16.getPlayerEntry() else nil
end

function t:_updateTeamStats(p4, p5) --[[ line: 171 ]]
	local var17 = self._teamStores[p4]
	
	if var17 then
		var17.updateStat(p5, function(p6, p7, p8) --[[ line: 174 ]]
			-- upvalues: self (ref)
			local var18 = self._playerStores[p6]
			
			return if var18 then var18.getStatValue(p7, p8) else nil
		end)
	end
end

function t:_removeTeamStats(p9, p10) --[[ line: 184 ]]
	local var19 = self._teamStores[p9]
	
	if var19 then
		var19.removeStat(p10)
	end
end

function t:_updateAllTeamStats(p11) --[[ line: 191 ]]
	for i, v in pairs(self._teamStores) do
		self:_updateTeamStats(i, p11)
	end
end

function t:_removeAllTeamStats(p12) --[[ line: 198 ]]
	for i, v in pairs(self._teamStores) do
		self:_removeTeamStats(i, p12)
	end
end

function t:_shouldSortPlayers(_, p13) --[[ line: 205 ]]
	return if p13 then if p13 == self._topGameStatSortOrder[1] and self._gameStatMetadata[p13] and self._gameStatMetadata[p13].isNumber then true elseif self._gameStatMetadata[p13] and self._gameStatMetadata[p13].priority == 1e999 then true else self._topGameStatSortOrder[1] or not self._gameStatMetadata[p13] or not self._gameStatMetadata[p13].isNumber else true
end

function t:_sortPlayers(p14, p15) --[[ line: 234 ]]
	-- upvalues: sortTableByValue (ref)
	if not self:_shouldSortPlayers(p14, p15) then return end
	local var20 = self._teamStores[p14]
	
	if not var20 then return end
	for i, v in ipairs(sortTableByValue(var20.getPlayers.getAllData(false), self:_compareStatsValue(self._topGameStatSortOrder))) do
		local key = self._playerStores[v.key]
		
		if key then
			key.setOrder(i)
		end
	end
end

function t._compareStatsValue(p16, p17) --[[ line: 267 ]]
	-- upvalues: playerListSortByLowercaseUsername (ref), playerListSortByLowercaseDisplayName (ref)
	return function(p18, p19) --[[ line: 268 ]]
		-- upvalues: p17 (ref), p16 (ref), playerListSortByLowercaseUsername (copy), playerListSortByLowercaseDisplayName (copy)
		local var21 = p17[1]
		
		if var21 then
			local key = p16._playerStores[p18.key]
			local key_1 = p16._playerStores[p19.key]
			
			if not key then
				return false
			elseif not key_1 then
				return true
			end
			local data = key.getPlayerEntry().stats.getData(var21, false)
			
			if data == nil then
				return false
			end
			local data_1 = key_1.getPlayerEntry().stats.getData(var21, false)
			
			if data_1 == nil then
				return true
			end
			local var24 = data(false)
			local var25 = data_1(false)
			
			return if typeof(var24) == typeof(var25) and var24 ~= var25 then p16:_compareRawStatsValue(var24, var25) elseif playerListSortByLowercaseUsername then if playerListSortByLowercaseDisplayName then p18.key.DisplayName:lower() < p19.key.DisplayName:lower() elseif playerListSortByLowercaseUsername then p18.key.Name:lower() < p19.key.Name:lower() else p18.key.Name < p19.key.Name else p18.key.Name < p19.key.Name
		end
	end
end

function t._compareRawStatsValue(_, p20, p21) --[[ line: 313 ]]
	return if p20 == nil or p21 == nil then p21 ~= nil else p21 < p20
end

local function _(p22) --[[ line: 322 | named "isGameStatValidNumber" ]]
	return p22:IsA("NumberValue") or (p22:IsA("IntValue") or (p22:IsA("DoubleConstrainedValue") or p22:IsA("IntConstrainedValue")))
end

local function compareGameStats(p23, p24) --[[ line: 329 ]]
	return p23.value.priority == nil and p24.value.priority == nil or (if p23.value.priority == nil then p24.value.priority < 0 elseif p24.value.priority == nil then p23.value.priority > 0 else p24.value.priority < p23.value.priority)
end

function t:_updateGameStatsToShow() --[[ line: 342 ]]
	-- upvalues: sortTableByValue (ref), compareGameStats (ref), playerListHideUnusedStats (ref), signalsModule (ref)
	local t = {}
	local var27 = sortTableByValue(self._gameStatMetadata, compareGameStats)
	self._topGameStatSortOrder = {}
	local var28 = 0
	
	for i, v in ipairs(var27) do
		if var28 >= 4 then break end
		if not playerListHideUnusedStats or self._gameStatMetadata[v.key].isUsed then
			local key = v.key
			t[key] = i
			
			if self._topGameStatsOrder.getData(key, false) == nil then
				local var29, var30 = signalsModule.createSignal(i)
				self._topGameStatsOrder.setData(key, { order = var29 }, false)
				self._topGameStatsOrderSetter[key] = var30
			else
				self._topGameStatsOrderSetter[key](i)
			end
			table.insert(self._topGameStatSortOrder, key)
			var28 += 1
		end
	end
	for i_1, v_1 in pairs(self._topGameStatsOrder.getAllData(false)) do
		if not t[i_1] then
			self._topGameStatsOrder.removeData(i_1, false)
			self._topGameStatsOrderSetter[i_1] = nil
		end
	end
end

function t:_updateGameStatOrder(p25, p26) --[[ line: 389 ]]
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

function t:_updateServerAddOrder() --[[ line: 406 ]]
	-- upvalues: robloxReplicatedStorageService (ref), signalsModule (ref), filterNewPlayerListValueStat (ref), playerListHideUnusedStats (ref)
	local _ = {}
	local leaderstatsOrder = robloxReplicatedStorageService:GetAttribute("LeaderstatsOrder") or {}
	robloxReplicatedStorageService:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function() --[[ line: 412 ]]
		-- upvalues: leaderstatsOrder (write), robloxReplicatedStorageService (copy), self (ref)
		leaderstatsOrder = robloxReplicatedStorageService:GetAttribute("LeaderstatsOrder") or {}
		self._setServerAddOrder(leaderstatsOrder)
	end)
	local httpService = game:GetService("HttpService")
	
	local function decodeJSON(p27) --[[ line: 421 ]]
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p27)
	end
	
	local function _(p28) --[[ line: 425 | named "decodeAddOrder" ]]
		-- upvalues: decodeJSON (ref)
		local ok, status = pcall(decodeJSON, p28)
		
		return if ok then status else {}
	end
	
	self._serverInstanceAddedConnection = nil
	
	local function childAdded(p29) --[[ line: 432 ]]
		-- upvalues: self (ref), leaderstatsOrder (write), decodeJSON (ref)
		if p29.Name ~= "LeaderstatsOrder" then return end
		if self._serverInstanceAddedConnection then
			self._serverInstanceAddedConnection:Disconnect()
		end
		local ok, status = pcall(decodeJSON, p29.Value)
		leaderstatsOrder = if ok then status else {}
		self._serverAddOrderConnection[p29] = p29.Changed:Connect(function(p30) --[[ line: 440 ]]
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
	self._serverAddOrderEffectCleanup = signalsModule.createEffect(function(p31) --[[ line: 453 ]]
		-- upvalues: self (ref), filterNewPlayerListValueStat (copy), playerListHideUnusedStats (copy)
		local var36 = false
		
		for i, v in pairs(self._getServerAddOrder(p31)) do
			if not filterNewPlayerListValueStat or v ~= 0 then
				if self._gameStatMetadata[i] then
					if self._gameStatMetadata[i].hasPriority ~= true then
						self._gameStatMetadata[i].priority = v * -1
						var36 = true
					end
				elseif not playerListHideUnusedStats then
					self._gameStatMetadata[i] = { hasPriority = false, priority = v * -1 }
				end
			end
		end
		if var36 then
			self:_updateGameStatsToShow()
		end
	end)
end

function t:_updateGameStatPriority(p32) --[[ line: 486 ]]
	local var37 = nil
	local priority = p32:FindFirstChild("Priority")
	
	if priority and (priority:IsA("IntValue") or priority:IsA("NumberValue")) then
		var37 = priority.Value
	end
	local isPrimary = p32:FindFirstChild("IsPrimary")
	
	if isPrimary then
		if not isPrimary:IsA("BoolValue") then
			var37 = 1e999
		elseif isPrimary.Value then
			var37 = 1e999
		end
	end
	self:_updateGameStatOrder(p32, var37)
end

function t:_addGameStat(p33) --[[ line: 506 ]]
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

function t:_removeGameStat(p34) --[[ line: 525 ]]
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
	function t:_checkGameStatsExist() --[[ line: 546 ]]
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
function t._createPlayerStore(p35, p36) --[[ line: 576 ]]
	-- upvalues: createPlayerStoreModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref)
	return createPlayerStoreModule(p36, function(p37) --[[ line: 579 ]]
		-- upvalues: p35 (ref)
		p35:_addGameStat(p37)
	end, function(p38) --[[ line: 582 ]]
		-- upvalues: p35 (ref)
		p35:_removeGameStat(p38)
	end, function(p39, p40) --[[ line: 585 ]]
		-- upvalues: p35 (ref)
		p35:_updateTeamStats(p39, p40)
	end, function(p41, p42) --[[ line: 588 ]]
		-- upvalues: p35 (ref)
		p35:_sortPlayers(p41, p42)
	end, if fFlagPlayerListFixLeaderstatsStacking then function() --[[ line: 592 ]]
		-- upvalues: p35 (ref)
		p35:_checkGameStatsExist()
	end else nil)
end

function t:_createTeamStore(p43) --[[ line: 599 ]]
	-- upvalues: createTeamStoreModule (ref)
	return createTeamStoreModule(p43, self._teamsService)
end

function t:_getOrCreateTeamStore(p44) --[[ line: 603 ]]
	local var42 = self._teamStores[p44]
	
	if not var42 then
		var42 = self:_createTeamStore(p44)
		self._teamStores[p44] = var42
		
		if p44 ~= "Neutral" then
			self._virtualTeamList.setData(p44, {
				name = var42.getName,
				color = var42.getColor,
				order = var42.getOrder,
				stats = var42.getStats,
				players = var42.getPlayers
			}, false)
		end
	end
	return var42
end

function t:_addPlayerStore(p45) --[[ line: 623 ]]
	if self._playerStores[p45] then
		return
	end
	local var43 = if p45.Team then p45.Team else "Neutral"
	self:_getOrCreateTeamStore(var43).addPlayer(p45)
	self._playerStores[p45] = self:_createPlayerStore(p45)
	self:_connectPlayerTeamChange(p45)
	self:_sortPlayers(var43)
end

function t:_removePlayerStore(p46) --[[ line: 644 ]]
	local var44 = self._playerStores[p46]
	
	if not var44 then return end
	local team = var44.getTeam()
	local var46 = self._teamStores[team]
	
	if var46 then
		var46.removePlayer(p46)
	end
	local text = "PlayerTeamChanged_" .. p46.Name
	local var48 = self._leaderboardConnections[text]
	
	if var48 and var48.Disconnect then
		var48:Disconnect()
		self._leaderboardConnections[text] = nil
	end
	var44.destroy()
	self._playerStores[p46] = nil
	self:_sortPlayers(team)
end

function t:_connectPlayerTeamChange(p47) --[[ line: 673 ]]
	self._leaderboardConnections["PlayerTeamChanged_" .. p47.Name] = p47.Changed:Connect(function(p48) --[[ line: 674 ]]
		-- upvalues: self (ref), p47 (ref)
		if p48 == "Team" then
			local var49 = self._playerStores[p47]
			
			if not var49 then return end
			local team = var49.getTeam()
			local var51 = if p47.Team then p47.Team else "Neutral"
			local var52 = self._teamStores[team]
			
			if var52 then
				var52.removePlayer(p47)
			end
			self:_getOrCreateTeamStore(var51).addPlayer(p47)
			var49.setTeam(var51)
			self:_sortPlayers(team)
			self:_sortPlayers(var51)
		end
	end)
end

function t:_addTeamStore(p49) --[[ line: 706 ]]
	if self._teamStores[p49] then
		return
	end
	local var53 = self:_createTeamStore(p49)
	self._teamStores[p49] = var53
	self._virtualTeamList.setData(p49, {
		name = var53.getName,
		color = var53.getColor,
		order = var53.getOrder,
		stats = var53.getStats,
		players = var53.getPlayers
	}, false)
end

function t:_removeTeamStore(p50) --[[ line: 724 ]]
	local var54 = self._teamStores[p50]
	
	if not var54 then return end
	local neutralTOrCreateTeamStore = self:_getOrCreateTeamStore("Neutral")
	
	for i, v in pairs(var54.getPlayers.getAllData(false)) do
		var54.removePlayer(i)
		neutralTOrCreateTeamStore.addPlayer(i)
		local var56 = self._playerStores[i]
		
		if var56 then
			var56.setTeam("Neutral")
		end
	end
	var54.destroy()
	self._teamStores[p50] = nil
	self._virtualTeamList.removeData(p50, false)
end

function t:_connectTeams() --[[ line: 756 ]]
	self._leaderboardConnections.TeamAdded = self._teamsService.ChildAdded:Connect(function(p51) --[[ line: 757 ]]
		-- upvalues: self (ref)
		if p51:IsA("Team") then
			self:_addTeamStore(p51)
		end
	end)
	self._leaderboardConnections.TeamRemoved = self._teamsService.ChildRemoved:Connect(function(p52) --[[ line: 764 ]]
		-- upvalues: self (ref)
		if p52:IsA("Team") then
			self:_removeTeamStore(p52)
		end
	end)
	
	for i, v in pairs(self._teamsService:GetTeams()) do
		self:_addTeamStore(v)
	end
end

function t:_connectPlayers() --[[ line: 779 ]]
	self._leaderboardConnections.PlayerAdded = self._playersService.PlayerAdded:Connect(function(p53) --[[ line: 780 ]]
		-- upvalues: self (ref)
		self:_addPlayerStore(p53)
	end)
	self._leaderboardConnections.PlayerRemoving = self._playersService.PlayerRemoving:Connect(function(p54) --[[ line: 785 ]]
		-- upvalues: self (ref)
		self:_removePlayerStore(p54)
	end)
	
	for i, v in pairs(self._playersService:GetPlayers()) do
		self:_addPlayerStore(v)
	end
end

return t