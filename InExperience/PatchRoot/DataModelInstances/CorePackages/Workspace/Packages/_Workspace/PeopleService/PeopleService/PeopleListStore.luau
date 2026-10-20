local Parent = script.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local SignalsModule = require(Parent1.Signals)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local CreatePersonStoreModule = require(Parent.createPersonStore)
local PeopleUtilityModule = require(Parent.PeopleUtility)
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = require(Parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function createPeopleListStore(p1)
	-- upvalues: GetFFlagPeoplePageEnablePersonSignalStoreFunction (copy), CreateSignalMapFunction (copy), PeopleUtilityModule (copy), SignalsModule (copy), CryoModule (copy), CreatePersonStoreModule (copy)
	local P0 = p1 or game:GetService("Players")
	local T = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then {} else nil
	local SignalMap = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then CreateSignalMapFunction() else nil
	local SortPeopleResult = PeopleUtilityModule.sortPeople((P0:GetPlayers()))
	local Signal, Signal2 = SignalsModule.createSignal(SortPeopleResult)
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local JoinResult = {}
	local JoinResult1 = {}
	local MapResult = CryoModule.List.map(SortPeopleResult, function(Player)
		return Player.UserId
	end)
	
	local function fetchProfiles(MapResult)
		-- upvalues: JoinResult (ref), PeopleUtilityModule (upval), CryoModule (upval), Signal2_1 (copy)
		local List = {}
		
		for _, value in MapResult do
			local Text = tostring(value)
			
			if not JoinResult[Text] then
				table.insert(List, Text)
			end
		end
		if #List > 0 then
			JoinResult = CryoModule.Dictionary.join(JoinResult, (PeopleUtilityModule.getInExperienceCombinedName(List)))
			Signal2_1(JoinResult)
		end
	end
	
	local function fetchPlatformData(MapResult)
		-- upvalues: JoinResult1 (ref), PeopleUtilityModule (upval), CryoModule (upval)
		local List = {}
		
		for _, value in MapResult do
			local Text = tostring(value)
			
			if not JoinResult1[Text] then
				table.insert(List, Text)
			end
		end
		if #List > 0 then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, (PeopleUtilityModule.getPlatformData(List)))
		end
	end
	
	local Callback: (any) -> () = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then function(Player: Player)
		-- upvalues: T (copy), CreatePersonStoreModule (upval), SignalMap (copy), PeopleUtilityModule (upval)
		if not T[Player.UserId] then
			local PersonStoreModule = CreatePersonStoreModule(Player)
			T[Player.UserId] = PersonStoreModule
			SignalMap.setData(Player.UserId, {
				getPerson = PersonStoreModule.getPerson,
				getOrder = PersonStoreModule.getOrder
			}, false)
			PeopleUtilityModule.sortPersonStores(T)
			
			return
		end
	end else nil
	
	local function addPerson(Player: Player)
		-- upvalues: GetFFlagPeoplePageEnablePersonSignalStoreFunction (upval), Callback (copy), SortPeopleResult (ref), PeopleUtilityModule (upval), CryoModule (upval), Signal2 (copy), MapResult (ref), fetchProfiles (copy), fetchPlatformData (copy)
		if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then
			Callback(Player)
		end
		local v1 = 1
		
		for i, value in SortPeopleResult do
			if PeopleUtilityModule.comparePeople(Player, value) then
				v1 = i
				break
			else
				v1 = i + 1
				continue
			end
		end
		SortPeopleResult = if #SortPeopleResult < v1 then CryoModule.List.join(SortPeopleResult, { Player }) elseif GetFFlagPeoplePageEnablePersonSignalStoreFunction() and v1 == 1 then CryoModule.List.join({ Player }, SortPeopleResult) else CryoModule.List.join(CryoModule.List.getRange(SortPeopleResult, 1, v1 - 1), { Player }, CryoModule.List.getRange(SortPeopleResult, v1, #SortPeopleResult))
		Signal2(SortPeopleResult)
		MapResult = CryoModule.List.join(MapResult, { Player.UserId })
		fetchProfiles({ Player.UserId })
		fetchPlatformData({ Player.UserId })
	end
	
	local function removePerson(Player: Player)
		-- upvalues: GetFFlagPeoplePageEnablePersonSignalStoreFunction (upval), T (copy), SignalMap (copy), CryoModule (upval), SortPeopleResult (ref), Signal2 (copy), MapResult (ref), JoinResult (ref), JoinResult1 (ref), Signal2_1 (copy)
		if GetFFlagPeoplePageEnablePersonSignalStoreFunction() and T[Player.UserId] then
			T[Player.UserId] = nil
			SignalMap.removeData(Player.UserId, false)
		end
		local FilterResult = CryoModule.List.filter(SortPeopleResult, function(Player1): boolean
			-- upvalues: Player (copy)
			return Player1 ~= Player
		end)
		
		if #FilterResult ~= #SortPeopleResult then
			SortPeopleResult = FilterResult
			Signal2(SortPeopleResult)
			local UserId = Player.UserId
			MapResult = CryoModule.List.filter(MapResult, function(UserId1): boolean
				-- upvalues: UserId (copy)
				return UserId1 ~= UserId
			end)
			local Text = tostring(UserId)
			JoinResult[Text] = nil
			JoinResult1[Text] = nil
			Signal2_1(JoinResult)
			
			return
		end
	end
	
	local function getProfile(p2)
		-- upvalues: JoinResult (ref), fetchProfiles (copy)
		local Text = tostring(p2)
		
		if not JoinResult[Text] then
			fetchProfiles({ p2 })
		end
		return JoinResult[Text]
	end
	
	local function getPlatformName(p2)
		-- upvalues: JoinResult1 (ref), fetchPlatformData (copy)
		local Text = tostring(p2)
		
		if not JoinResult1[Text] then
			fetchPlatformData({ p2 })
		end
		return JoinResult1[Text].platformName
	end
	
	local function getPlatformProfileId(p2)
		-- upvalues: JoinResult1 (ref), fetchPlatformData (copy)
		local Text = tostring(p2)
		
		if not JoinResult1[Text] then
			fetchPlatformData({ p2 })
		end
		return JoinResult1[Text].platformProfileId
	end
	
	fetchProfiles(MapResult)
	fetchPlatformData(MapResult)
	P0.PlayerAdded:Connect(addPerson)
	P0.PlayerRemoving:Connect(removePerson)
	
	if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then
		for _, player in P0:GetPlayers() do
			Callback(player)
		end
	end
	return {
		people = Signal,
		peopleSignalMap = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then SignalMap else nil,
		peopleProfiles = Signal1,
		getProfile = getProfile,
		getPlatformName = getPlatformName,
		getPlatformProfileId = getPlatformProfileId
	}
end

return if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then createPeopleListStore else createPeopleListStore()