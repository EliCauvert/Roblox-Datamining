local parent = script.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local signalsModule = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local createPersonStoreModule = require(parent.createPersonStore)
local peopleUtilityModule = require(parent.PeopleUtility)
local getFFlagPeoplePageEnablePersonSignalStore = require(parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function createPeopleListStore(p1)
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), createSignalMap (ref), peopleUtilityModule (ref), signalsModule (ref), cryoModule (ref), createPersonStoreModule (ref)
	p1 = p1 or game:GetService("Players")
	local players = p1:GetPlayers()
	local var1 = if getFFlagPeoplePageEnablePersonSignalStore() then {} else nil
	local var2 = if getFFlagPeoplePageEnablePersonSignalStore() then createSignalMap() else nil
	players = peopleUtilityModule.sortPeople(players)
	local var3, var4 = signalsModule.createSignal(players)
	local var5, var6 = signalsModule.createSignal({})
	local t = {}
	local t_1 = {}
	local var7 = cryoModule.List.map(players, function(p2)
		return p2.UserId
	end)
	
	local function fetchProfiles(p2)
		-- upvalues: t (write), peopleUtilityModule (copy), cryoModule (copy), var6 (ref)
		local t_1 = {}
		
		for i, v in p2 do
			local var8 = tostring(v)
			
			if not t[var8] then
				table.insert(t_1, var8)
			end
		end
		if #t_1 > 0 then
			t = cryoModule.Dictionary.join(t, peopleUtilityModule.getInExperienceCombinedName(t_1))
			var6(t)
		end
	end
	
	local function fetchPlatformData(p3)
		-- upvalues: t_1 (write), peopleUtilityModule (copy), cryoModule (copy)
		local t = {}
		
		for i, v in p3 do
			local var9 = tostring(v)
			
			if not t_1[var9] then
				table.insert(t, var9)
			end
		end
		if #t > 0 then
			t_1 = cryoModule.Dictionary.join(t_1, peopleUtilityModule.getPlatformData(t))
		end
	end
	
	local var10 = if getFFlagPeoplePageEnablePersonSignalStore() then function(p4)
		-- upvalues: var1 (ref), createPersonStoreModule (copy), var2 (ref), peopleUtilityModule (copy)
		if var1[p4.UserId] then
			return
		end
		local var11 = createPersonStoreModule(p4)
		var1[p4.UserId] = var11
		var2.setData(p4.UserId, { getPerson = var11.getPerson, getOrder = var11.getOrder }, false)
		peopleUtilityModule.sortPersonStores(var1)
	end else nil
	
	local function addPerson(p4)
		-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (copy), var10 (ref), players (write), peopleUtilityModule (copy), cryoModule (copy), var4 (ref), var7 (write), fetchProfiles (ref), fetchPlatformData (ref)
		if getFFlagPeoplePageEnablePersonSignalStore() then
			var10(p4)
		end
		local var11 = 1
		
		for i, v in players do
			if not peopleUtilityModule.comparePeople(p4, v) then
				var11 = i
				break
			end
			var11 = i + 1
		end
		local _ = nil
		players = if #players < var11 then cryoModule.List.join(players, { p4 }) elseif getFFlagPeoplePageEnablePersonSignalStore() and var11 == 1 then cryoModule.List.join({ p4 }, players) else cryoModule.List.join(cryoModule.List.getRange(players, 1, var11 - 1), { p4 }, cryoModule.List.getRange(players, var11, #players))
		var4(players)
		var7 = cryoModule.List.join(var7, { p4.UserId })
		fetchProfiles({ p4.UserId })
		fetchPlatformData({ p4.UserId })
	end
	
	local function removePerson(p5)
		-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (copy), var1 (ref), var2 (ref), cryoModule (copy), players (write), var4 (ref), var7 (write), t (write), t_1 (write), var6 (ref)
		if getFFlagPeoplePageEnablePersonSignalStore() and var1[p5.UserId] then
			var1[p5.UserId] = nil
			var2.removeData(p5.UserId, false)
		end
		local var12 = cryoModule.List.filter(players, function(p6)
			-- upvalues: p5 (ref)
			return p6 ~= p5
		end)
		
		if #var12 == #players then
			return
		end
		players = var12
		var4(players)
		local userId = p5.UserId
		var7 = cryoModule.List.filter(var7, function(p6)
			-- upvalues: userId (ref)
			return p6 ~= userId
		end)
		local var13 = tostring(userId)
		t[var13] = nil
		t_1[var13] = nil
		var6(t)
	end
	
	local function getProfile(p5)
		-- upvalues: t (write), fetchProfiles (ref)
		local var12 = tostring(p5)
		
		if not t[var12] then
			fetchProfiles({ p5 })
		end
		return t[var12]
	end
	
	local function getPlatformName(p5)
		-- upvalues: t_1 (write), fetchPlatformData (ref)
		local var12 = tostring(p5)
		
		if not t_1[var12] then
			fetchPlatformData({ p5 })
		end
		return t_1[var12].platformName
	end
	
	local function getPlatformProfileId(p5)
		-- upvalues: t_1 (write), fetchPlatformData (ref)
		local var12 = tostring(p5)
		
		if not t_1[var12] then
			fetchPlatformData({ p5 })
		end
		return t_1[var12].platformProfileId
	end
	
	fetchProfiles(var7)
	fetchPlatformData(var7)
	p1.PlayerAdded:Connect(addPerson)
	p1.PlayerRemoving:Connect(removePerson)
	
	if getFFlagPeoplePageEnablePersonSignalStore() then
		for i, v in p1:GetPlayers() do
			var10(v)
		end
	end
	return {
		people = var3,
		peopleSignalMap = if getFFlagPeoplePageEnablePersonSignalStore() then var2 else nil,
		peopleProfiles = var5,
		getProfile = getProfile,
		getPlatformName = getPlatformName,
		getPlatformProfileId = getPlatformProfileId
	}
end

return if getFFlagPeoplePageEnablePersonSignalStore() then createPeopleListStore else createPeopleListStore()