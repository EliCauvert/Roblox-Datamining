local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CoreScriptsRoactCommonModule = require(Parent.CoreScriptsRoactCommon)
local CreateSignalMapFunction = CoreScriptsRoactCommonModule.Utilities.createSignalMap
local SortTableByValueFunction = CoreScriptsRoactCommonModule.Utilities.sortTableByValue
local CreatePlayerStoreModule = require(script.Parent.createPlayerStore)
local CreateTeamStoreModule = require(script.Parent.createTeamStore)
local _ = require(script.Parent.LeaderboardStoreTypes)
local FilterNewPlayerListValueStat = game:DefineFastFlag("FilterNewPlayerListValueStat", false)
local PlayerListHideUnusedStats = game:DefineFastFlag("PlayerListHideUnusedStats", false)
local FFlagPlayerListFixLeaderstatsStacking = require(Parent.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local PlayerListSortByLowercaseUsername = game:DefineFastFlag("PlayerListSortByLowercaseUsername", false)
local LeaderboardStore = {}
LeaderboardStore.__index = LeaderboardStore

function LeaderboardStore.new(_teamsService, _playersService) --[[ Line: 54 ]]
	-- upvalues: LeaderboardStore (copy), SignalsModule (copy), CreateSignalMapFunction (copy), CreateTeamStoreModule (copy)
	local self = setmetatable({ _leaderboardConnections = {} }, LeaderboardStore)
	self._teamStores = {}
	self._playerStores = {}
	self._teamsService = _teamsService
	self._playersService = _playersService
	self._getServerAddOrder, self._setServerAddOrder = SignalsModule.createSignal({})
	self._serverAddOrderConnection = {}
	self._serverInstanceAddedConnection = nil
	self._serverAddOrderEffectCleanup = nil
	self._gameStatMetadata = {}
	self._topGameStatsOrder = CreateSignalMapFunction()
	self._topGameStatsOrderSetter = {}
	self._topGameStatSortOrder = {}
	self._gameStatsUsage = {}
	self._virtualTeamList = CreateSignalMapFunction()
	self._teamStores.Neutral = CreateTeamStoreModule("Neutral", _teamsService)
	local Neutral = self._teamStores.Neutral
	self._virtualTeamList.setData("Neutral", {
		name = Neutral.getName,
		color = Neutral.getColor,
		order = Neutral.getOrder,
		stats = Neutral.getStats,
		players = Neutral.getPlayers
	}, false)
	self:_connectPlayers()
	self:_connectTeams()
	self:_updateServerAddOrder()
	
	return self
end

function LeaderboardStore:destroy() --[[ Line: 105 ]]
	for _, Connection in pairs(self._serverAddOrderConnection) do
		if Connection.Disconnect then
			Connection:Disconnect()
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
	
	for _, leaderboardConnection in pairs(self._leaderboardConnections) do
		if leaderboardConnection.Disconnect then
			leaderboardConnection:Disconnect()
		end
	end
	self._leaderboardConnections = {}
	
	for _, teamStore in pairs(self._teamStores) do
		teamStore.destroy()
	end
	self._teamStores = {}
	
	for _, playerStore in pairs(self._playerStores) do
		playerStore.destroy()
	end
	self._playerStores = {}
end

function LeaderboardStore:getGameStatsList() --[[ Line: 140 ]]
	return self._topGameStatsOrder
end

function LeaderboardStore:getTeamList() --[[ Line: 144 ]]
	return self._virtualTeamList
end

function LeaderboardStore:getTeamPlayerList(p1, _) --[[ Line: 148 ]]
	-- upvalues: CreateSignalMapFunction (copy)
	local TeamStore = self._teamStores[p1]
	
	return if TeamStore then TeamStore.getPlayers else CreateSignalMapFunction()
end

function LeaderboardStore:getPlayerEntry(p1, _) --[[ Line: 159 ]]
	local PlayerStore = self._playerStores[p1]
	
	return if PlayerStore then PlayerStore.getPlayerEntry() else nil
end

function LeaderboardStore:_updateTeamStats(p1, p2) --[[ Line: 170 ]]
	local TeamStore = self._teamStores[p1]
	
	if TeamStore then
		TeamStore.updateStat(p2, function(p3, p4, p5) --[[ Line: 173 ]]
			-- upvalues: self (copy)
			local PlayerStore = self._playerStores[p3]
			
			return if PlayerStore then PlayerStore.getStatValue(p4, p5) else nil
		end)
	end
end

function LeaderboardStore:_removeTeamStats(p1, p2) --[[ Line: 183 ]]
	local TeamStore = self._teamStores[p1]
	
	if TeamStore then
		TeamStore.removeStat(p2)
	end
end

function LeaderboardStore:_updateAllTeamStats(Name) --[[ Line: 190 ]]
	for i, _ in pairs(self._teamStores) do
		self:_updateTeamStats(i, Name)
	end
end

function LeaderboardStore:_removeAllTeamStats(p1) --[[ Line: 197 ]]
	for i, _ in pairs(self._teamStores) do
		self:_removeTeamStats(i, p1)
	end
end

function LeaderboardStore:_shouldSortPlayers(_, TopGameStatSortOrderEntry): boolean --[[ Line: 204 ]]
	if not TopGameStatSortOrderEntry then
		return true
	elseif TopGameStatSortOrderEntry == self._topGameStatSortOrder[1] and self._gameStatMetadata[TopGameStatSortOrderEntry] and self._gameStatMetadata[TopGameStatSortOrderEntry].isNumber then
		return true
	elseif self._gameStatMetadata[TopGameStatSortOrderEntry] and self._gameStatMetadata[TopGameStatSortOrderEntry].priority == 1e999 then
		return true
	elseif self._topGameStatSortOrder[1] or not self._gameStatMetadata[TopGameStatSortOrderEntry] or not self._gameStatMetadata[TopGameStatSortOrderEntry].isNumber then
		return false
	else
		return true
	end
end

function LeaderboardStore:_sortPlayers(Team, p2) --[[ Line: 233 ]]
	-- upvalues: SortTableByValueFunction (copy)
	if not self:_shouldSortPlayers(Team, p2) then return end
	local TeamStore = self._teamStores[Team]
	
	if not TeamStore then return end
	for i, value in ipairs((SortTableByValueFunction(TeamStore.getPlayers.getAllData(false), self:_compareStatsValue(self._topGameStatSortOrder)))) do
		local PlayerStore = self._playerStores[value.key]
		
		if PlayerStore then
			PlayerStore.setOrder(i)
		end
	end
end

function LeaderboardStore._compareStatsValue(p3, Entry) --[[ Line: 266 ]]
	-- upvalues: PlayerListSortByLowercaseUsername (copy)
	return function(p4, p5) --[[ Line: 267 ]]
		-- upvalues: Entry (copy), p3 (copy), PlayerListSortByLowercaseUsername (upval)
		local Entry1 = Entry[1]
		
		if Entry1 then
			local PlayerStore = p3._playerStores[p4.key]
			local PlayerStore1 = p3._playerStores[p5.key]
			
			if not PlayerStore then
				return false
			end
			if not PlayerStore1 then
				return true
			end
			local Data = PlayerStore.getPlayerEntry().stats.getData(Entry1, false)
			
			if Data == nil then
				return false
			end
			local Data1 = PlayerStore1.getPlayerEntry().stats.getData(Entry1, false)
			
			if Data1 == nil then
				return true
			end
			local DataResult = Data(false)
			local DataResult1 = Data1(false)
			
			if typeof(DataResult) == typeof(DataResult1) and DataResult ~= DataResult1 then
				return p3:_compareRawStatsValue(DataResult, DataResult1)
			elseif not PlayerListSortByLowercaseUsername then
				return p4.key.Name < p5.key.Name
			end
		end
		return p4.key.DisplayName:lower() < p5.key.DisplayName:lower()
	end
end

function LeaderboardStore:_compareRawStatsValue(p3, p4): boolean --[[ Line: 306 ]]
	return if p3 == nil or p4 == nil then p4 ~= nil else p4 < p3
end

local function _(Object) --[[ Line: 315 | Named "isGameStatValidNumber" ]]
	return Object:IsA("NumberValue") or (Object:IsA("IntValue") or (Object:IsA("DoubleConstrainedValue") or Object:IsA("IntConstrainedValue")))
end

local function compareGameStats(p3, p4): boolean --[[ Line: 322 ]]
	return p3.value.priority == nil and p4.value.priority == nil or (if p3.value.priority == nil then p4.value.priority < 0 elseif p4.value.priority == nil then p3.value.priority > 0 else p4.value.priority < p3.value.priority)
end

function LeaderboardStore:_updateGameStatsToShow() --[[ Line: 335 ]]
	-- upvalues: SortTableByValueFunction (copy), compareGameStats (copy), PlayerListHideUnusedStats (copy), SignalsModule (copy)
	local t = {}
	local SortTableByValueResult = SortTableByValueFunction(self._gameStatMetadata, compareGameStats)
	self._topGameStatSortOrder = {}
	local Count = 0
	
	for i, value in ipairs(SortTableByValueResult) do
		if Count >= 4 then break end
		if not PlayerListHideUnusedStats or self._gameStatMetadata[value.key].isUsed then
			local Key = value.key
			t[Key] = i
			
			if self._topGameStatsOrder.getData(Key, false) == nil then
				local Signal, Signal2 = SignalsModule.createSignal(i)
				self._topGameStatsOrder.setData(Key, { order = Signal }, false)
				self._topGameStatsOrderSetter[Key] = Signal2
			else
				self._topGameStatsOrderSetter[Key](i)
			end
			table.insert(self._topGameStatSortOrder, Key)
			Count += 1
		end
	end
	for i1, _ in pairs(self._topGameStatsOrder.getAllData(false)) do
		if not t[i1] then
			self._topGameStatsOrder.removeData(i1, false)
			self._topGameStatsOrderSetter[i1] = nil
		end
	end
end

function LeaderboardStore:_updateGameStatOrder(p3, p4) --[[ Line: 382 ]]
	local GameStatMeta = self._gameStatMetadata[p3.Name]
	local P42 = p4 or 0
	
	if GameStatMeta then
		if p4 == nil then
			self._gameStatMetadata[p3.Name].hasPriority = false
		else
			self._gameStatMetadata[p3.Name].hasPriority = true
		end
	end
	if GameStatMeta.priority ~= P42 then
		self._gameStatMetadata[p3.Name].priority = P42
		self:_updateGameStatsToShow()
	end
end

function LeaderboardStore:_updateServerAddOrder() --[[ Line: 399 ]]
	-- upvalues: RobloxReplicatedStorage (copy), SignalsModule (copy), FilterNewPlayerListValueStat (copy), PlayerListHideUnusedStats (copy)
	local LeaderstatsOrderAttribute = {}
	LeaderstatsOrderAttribute = RobloxReplicatedStorage:GetAttribute("LeaderstatsOrder") or {}
	RobloxReplicatedStorage:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function() --[[ Line: 405 ]]
		-- upvalues: LeaderstatsOrderAttribute (ref), RobloxReplicatedStorage (upval), self (copy)
		LeaderstatsOrderAttribute = RobloxReplicatedStorage:GetAttribute("LeaderstatsOrder") or {}
		self._setServerAddOrder(LeaderstatsOrderAttribute)
	end)
	local HttpService = game:GetService("HttpService")
	
	local function decodeJSON(Input) --[[ Line: 414 ]]
		-- upvalues: HttpService (copy)
		return HttpService:JSONDecode(Input)
	end
	
	local function _(p3) --[[ Line: 418 | Named "decodeAddOrder" ]]
		-- upvalues: decodeJSON (copy)
		local Success, Result = pcall(decodeJSON, p3)
		
		return Success and Result or {}
	end
	
	self._serverInstanceAddedConnection = nil
	
	local function childAdded(Child) --[[ Line: 425 ]]
		-- upvalues: self (copy), LeaderstatsOrderAttribute (ref), decodeJSON (copy)
		if Child.Name ~= "LeaderstatsOrder" then return end
		if self._serverInstanceAddedConnection then
			self._serverInstanceAddedConnection:Disconnect()
		end
		local Success, Result = pcall(decodeJSON, Child.Value)
		LeaderstatsOrderAttribute = Success and Result or {}
		self._serverAddOrderConnection[Child] = Child.Changed:Connect(function(p3) --[[ Line: 433 ]]
			-- upvalues: LeaderstatsOrderAttribute (upval), decodeJSON (upval), self (upval)
			local Success, Result = pcall(decodeJSON, p3)
			LeaderstatsOrderAttribute = Success and Result or {}
			self._setServerAddOrder(LeaderstatsOrderAttribute)
		end)
	end
	
	self._serverInstanceAddedConnection = RobloxReplicatedStorage.ChildAdded:Connect(childAdded)
	
	for _, child in ipairs(RobloxReplicatedStorage:GetChildren()) do
		childAdded(child)
	end
	self._serverAddOrderEffectCleanup = SignalsModule.createEffect(function(p3) --[[ Line: 446 ]]
		-- upvalues: self (copy), FilterNewPlayerListValueStat (upval), PlayerListHideUnusedStats (upval)
		local Flag = false
		
		for i, value in pairs((self._getServerAddOrder(p3))) do
			if not FilterNewPlayerListValueStat or value ~= 0 then
				if self._gameStatMetadata[i] then
					if self._gameStatMetadata[i].hasPriority ~= true then
						self._gameStatMetadata[i].priority = value * -1
						Flag = true
					end
				elseif not PlayerListHideUnusedStats then
					self._gameStatMetadata[i] = { hasPriority = false, priority = value * -1 }
				end
			end
		end
		if Flag then
			self:_updateGameStatsToShow()
		end
	end)
end

function LeaderboardStore:_updateGameStatPriority(Object) --[[ Line: 479 ]]
	local v1 = nil
	local Priority = Object:FindFirstChild("Priority")
	
	if Priority and (Priority:IsA("IntValue") or Priority:IsA("NumberValue")) then
		v1 = Priority.Value
	end
	local IsPrimary = Object:FindFirstChild("IsPrimary")
	
	if IsPrimary then
		if IsPrimary:IsA("BoolValue") then
			if IsPrimary.Value then
				v1 = 1e999
			end
		else
			v1 = 1e999
		end
	end
	self:_updateGameStatOrder(Object, v1)
end

function LeaderboardStore:_addGameStat(Object) --[[ Line: 499 ]]
	-- upvalues: PlayerListHideUnusedStats (copy)
	if self._gameStatMetadata[Object.Name] == nil then
		self._gameStatMetadata[Object.Name] = {}
	end
	self._gameStatMetadata[Object.Name].isNumber = Object:IsA("NumberValue") or (Object:IsA("IntValue") or (Object:IsA("DoubleConstrainedValue") or Object:IsA("IntConstrainedValue")))
	self:_updateGameStatPriority(Object)
	
	if PlayerListHideUnusedStats and not self._gameStatMetadata[Object.Name].isUsed then
		self._gameStatMetadata[Object.Name].isUsed = true
		self:_updateGameStatsToShow()
	end
	self._gameStatsUsage[Object.Name] = if self._gameStatsUsage[Object.Name] then self._gameStatsUsage[Object.Name] + 1 else 1
	self:_updateAllTeamStats(Object.Name)
end

function LeaderboardStore:_removeGameStat(p3) --[[ Line: 518 ]]
	self._gameStatsUsage[p3.Name] = if self._gameStatsUsage[p3.Name] then self._gameStatsUsage[p3.Name] - 1 else 0
	
	if self._gameStatsUsage[p3.Name] <= 0 then
		self._gameStatsUsage[p3.Name] = nil
		self._topGameStatsOrder.removeData(p3.Name, false)
		self._topGameStatsOrderSetter[p3.Name] = nil
		self._gameStatMetadata[p3.Name] = nil
		self:_updateGameStatsToShow()
		self:_updateAllTeamStats(p3.Name)
		
		return
	else
		self:_updateGameStatPriority(p3)
	end
end

if FFlagPlayerListFixLeaderstatsStacking then
	function LeaderboardStore:_checkGameStatsExist() --[[ Line: 539 ]]
		local t = {}
		
		for i, _ in self._gameStatMetadata do
			t[i] = false
		end
		for i1, _ in self._playerStores do
			local Leaderstats = i1:FindFirstChild("leaderstats")
			
			if Leaderstats then
				for ChildName, _ in t do
					if Leaderstats:FindFirstChild(ChildName) then
						t[ChildName] = true
					end
				end
			end
		end
		for i2, value in t do
			if not value then
				self._gameStatsUsage[i2] = nil
				self._topGameStatsOrder.removeData(i2, false)
				self._topGameStatsOrderSetter[i2] = nil
				self._gameStatMetadata[i2] = nil
				self:_updateGameStatsToShow()
				self:_updateAllTeamStats(i2)
			end
		end
	end
end
function LeaderboardStore._createPlayerStore(p3, Player) --[[ Line: 569 ]]
	-- upvalues: CreatePlayerStoreModule (copy), FFlagPlayerListFixLeaderstatsStacking (copy)
	return CreatePlayerStoreModule(Player, function(p4) --[[ Line: 572 ]]
		-- upvalues: p3 (copy)
		p3:_addGameStat(p4)
	end, function(p4) --[[ Line: 575 ]]
		-- upvalues: p3 (copy)
		p3:_removeGameStat(p4)
	end, function(p4, p5) --[[ Line: 578 ]]
		-- upvalues: p3 (copy)
		p3:_updateTeamStats(p4, p5)
	end, function(p4, p5) --[[ Line: 581 ]]
		-- upvalues: p3 (copy)
		p3:_sortPlayers(p4, p5)
	end, if FFlagPlayerListFixLeaderstatsStacking then function() --[[ Line: 585 ]]
		-- upvalues: p3 (copy)
		p3:_checkGameStatsExist()
	end else nil)
end

function LeaderboardStore:_createTeamStore(p3) --[[ Line: 592 ]]
	-- upvalues: CreateTeamStoreModule (copy)
	return CreateTeamStoreModule(p3, self._teamsService)
end

function LeaderboardStore:_getOrCreateTeamStore(Team) --[[ Line: 596 ]]
	local TeamStore = self._teamStores[Team]
	
	if not TeamStore then
		TeamStore = self:_createTeamStore(Team)
		self._teamStores[Team] = TeamStore
		
		if Team ~= "Neutral" then
			self._virtualTeamList.setData(Team, {
				name = TeamStore.getName,
				color = TeamStore.getColor,
				order = TeamStore.getOrder,
				stats = TeamStore.getStats,
				players = TeamStore.getPlayers
			}, false)
		end
	end
	return TeamStore
end

function LeaderboardStore:_addPlayerStore(Player: Player) --[[ Line: 616 ]]
	if not self._playerStores[Player] then
		local Team = if Player.Team then Player.Team else "Neutral"
		self:_getOrCreateTeamStore(Team).addPlayer(Player)
		self._playerStores[Player] = self:_createPlayerStore(Player)
		self:_connectPlayerTeamChange(Player)
		self:_sortPlayers(Team)
		
		return
	end
end

function LeaderboardStore:_removePlayerStore(p3) --[[ Line: 637 ]]
	local PlayerStore = self._playerStores[p3]
	
	if not PlayerStore then return end
	local Team = PlayerStore.getTeam()
	local TeamStore = self._teamStores[Team]
	
	if TeamStore then
		TeamStore.removePlayer(p3)
	end
	local Text = "PlayerTeamChanged_" .. p3.Name
	local LeaderboardConnection = self._leaderboardConnections[Text]
	
	if LeaderboardConnection and LeaderboardConnection.Disconnect then
		LeaderboardConnection:Disconnect()
		self._leaderboardConnections[Text] = nil
	end
	PlayerStore.destroy()
	self._playerStores[p3] = nil
	self:_sortPlayers(Team)
end

function LeaderboardStore:_connectPlayerTeamChange(Player: Player) --[[ Line: 666 ]]
	self._leaderboardConnections["PlayerTeamChanged_" .. Player.Name] = Player.Changed:Connect(function(p3) --[[ Line: 667 ]]
		-- upvalues: self (copy), Player (copy)
		if p3 == "Team" then
			local PlayerStore = self._playerStores[Player]
			
			if not PlayerStore then return end
			local Team = PlayerStore.getTeam()
			local Team1 = if Player.Team then Player.Team else "Neutral"
			local TeamStore = self._teamStores[Team]
			
			if TeamStore then
				TeamStore.removePlayer(Player)
			end
			self:_getOrCreateTeamStore(Team1).addPlayer(Player)
			PlayerStore.setTeam(Team1)
			self:_sortPlayers(Team)
			self:_sortPlayers(Team1)
		end
	end)
end

function LeaderboardStore:_addTeamStore(Team) --[[ Line: 699 ]]
	if not self._teamStores[Team] then
		local TeamStore = self:_createTeamStore(Team)
		self._teamStores[Team] = TeamStore
		self._virtualTeamList.setData(Team, {
			name = TeamStore.getName,
			color = TeamStore.getColor,
			order = TeamStore.getOrder,
			stats = TeamStore.getStats,
			players = TeamStore.getPlayers
		}, false)
		
		return
	end
end

function LeaderboardStore:_removeTeamStore(Team) --[[ Line: 717 ]]
	local TeamStore = self._teamStores[Team]
	
	if not TeamStore then return end
	local Neutral = self:_getOrCreateTeamStore("Neutral")
	
	for i, _ in pairs((TeamStore.getPlayers.getAllData(false))) do
		TeamStore.removePlayer(i)
		Neutral.addPlayer(i)
		local PlayerStore = self._playerStores[i]
		
		if PlayerStore then
			PlayerStore.setTeam("Neutral")
		end
	end
	TeamStore.destroy()
	self._teamStores[Team] = nil
	self._virtualTeamList.removeData(Team, false)
end

function LeaderboardStore:_connectTeams() --[[ Line: 749 ]]
	self._leaderboardConnections.TeamAdded = self._teamsService.ChildAdded:Connect(function(Child) --[[ Line: 750 ]]
		-- upvalues: self (copy)
		if Child:IsA("Team") then
			self:_addTeamStore(Child)
		end
	end)
	self._leaderboardConnections.TeamRemoved = self._teamsService.ChildRemoved:Connect(function(Child) --[[ Line: 757 ]]
		-- upvalues: self (copy)
		if Child:IsA("Team") then
			self:_removeTeamStore(Child)
		end
	end)
	
	for _, team in pairs(self._teamsService:GetTeams()) do
		self:_addTeamStore(team)
	end
end

function LeaderboardStore:_connectPlayers() --[[ Line: 772 ]]
	self._leaderboardConnections.PlayerAdded = self._playersService.PlayerAdded:Connect(function(Player) --[[ Line: 773 ]]
		-- upvalues: self (copy)
		self:_addPlayerStore(Player)
	end)
	self._leaderboardConnections.PlayerRemoving = self._playersService.PlayerRemoving:Connect(function(Player) --[[ Line: 778 ]]
		-- upvalues: self (copy)
		self:_removePlayerStore(Player)
	end)
	
	for _, player in pairs(self._playersService:GetPlayers()) do
		self:_addPlayerStore(player)
	end
end

return LeaderboardStore