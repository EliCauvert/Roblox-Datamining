local parent = script.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local signalsModule = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local createPersonStoreModule = require(parent.createPersonStore)
local peopleUtilityModule = require(parent.PeopleUtility)
local getFFlagPeoplePageEnablePersonSignalStore = require(parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore

local function createPeopleListStore(p0) --[[ line: 36 ]]
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), createSignalMap (ref), peopleUtilityModule (ref), signalsModule (ref), cryoModule (ref), createPersonStoreModule (ref)
	p0 = p0 or game:GetService("Players")
	local players = p0:GetPlayers()
	local var7 = if getFFlagPeoplePageEnablePersonSignalStore() then {} else nil
	local var8 = if getFFlagPeoplePageEnablePersonSignalStore() then createSignalMap() else nil
	players = peopleUtilityModule.sortPeople(players)
	local var9, var10 = signalsModule.createSignal(players)
	local var11, var12 = signalsModule.createSignal({})
	local t = {}
	local t_1 = {}
	local var15 = cryoModule.List.map(players, function(p1) --[[ line: 62 ]]
		return p1.UserId
	end)
	
	local function fetchProfiles(p2) --[[ line: 67 ]]
		-- upvalues: t (write), peopleUtilityModule (copy), cryoModule (copy), var12 (ref)
		local t_1 = {}
		
		for i, v in p2 do
			local var25 = tostring(v)
			
			if not t[var25] then
				table.insert(t_1, var25)
			end
		end
		if #t_1 > 0 then
			t = cryoModule.Dictionary.join(t, peopleUtilityModule.getInExperienceCombinedName(t_1))
			var12(t)
		end
	end
	
	local function fetchPlatformData(p3) --[[ line: 90 ]]
		-- upvalues: t_1 (write), peopleUtilityModule (copy), cryoModule (copy)
		local t = {}
		
		for i, v in p3 do
			local var27 = tostring(v)
			
			if not t_1[var27] then
				table.insert(t, var27)
			end
		end
		if #t > 0 then
			t_1 = cryoModule.Dictionary.join(t_1, peopleUtilityModule.getPlatformData(t))
		end
	end
	
	local var18 = if getFFlagPeoplePageEnablePersonSignalStore() then function(p4) --[[ line: 112 ]]
		-- upvalues: var7 (ref), createPersonStoreModule (copy), var8 (ref), peopleUtilityModule (copy)
		if var7[p4.UserId] then
			return
		end
		local var28 = createPersonStoreModule(p4)
		var7[p4.UserId] = var28
		var8.setData(p4.UserId, { getPerson = var28.getPerson, getOrder = var28.getOrder }, false)
		peopleUtilityModule.sortPersonStores(var7)
	end else nil
	
	local function addPerson(p5) --[[ line: 130 ]]
		-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (copy), var18 (ref), players (write), peopleUtilityModule (copy), cryoModule (copy), var10 (ref), var15 (write), fetchProfiles (ref), fetchPlatformData (ref)
		if getFFlagPeoplePageEnablePersonSignalStore() then
			var18(p5)
		end
		local var29 = 1
		
		for i, v in players do
			if not peopleUtilityModule.comparePeople(p5, v) then
				var29 = i
				break
			end
			var29 = i + 1
		end
		local _ = nil
		players = if #players < var29 then cryoModule.List.join(players, { p5 }) elseif getFFlagPeoplePageEnablePersonSignalStore() and var29 == 1 then cryoModule.List.join({ p5 }, players) else cryoModule.List.join(cryoModule.List.getRange(players, 1, var29 - 1), { p5 }, cryoModule.List.getRange(players, var29, #players))
		var10(players)
		var15 = cryoModule.List.join(var15, { p5.UserId })
		fetchProfiles({ p5.UserId })
		fetchPlatformData({ p5.UserId })
	end
	
	local function removePerson(p6) --[[ line: 171 ]]
		-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (copy), var7 (ref), var8 (ref), cryoModule (copy), players (write), var10 (ref), var15 (write), t (write), t_1 (write), var12 (ref)
		if getFFlagPeoplePageEnablePersonSignalStore() and var7[p6.UserId] then
			var7[p6.UserId] = nil
			var8.removeData(p6.UserId, false)
		end
		local var30 = cryoModule.List.filter(players, function(p7) --[[ line: 180 ]]
			-- upvalues: p6 (ref)
			return p7 ~= p6
		end)
		
		if #var30 == #players then
			return
		end
		players = var30
		var10(players)
		local userId = p6.UserId
		var15 = cryoModule.List.filter(var15, function(p8) --[[ line: 195 ]]
			-- upvalues: userId (ref)
			return p8 ~= userId
		end)
		local var31 = tostring(userId)
		t[var31] = nil
		t_1[var31] = nil
		var12(t)
	end
	
	local function getProfile(p9) --[[ line: 207 ]]
		-- upvalues: t (write), fetchProfiles (ref)
		local var32 = tostring(p9)
		
		if not t[var32] then
			fetchProfiles({ p9 })
		end
		return t[var32]
	end
	
	local function getPlatformName(p10) --[[ line: 219 ]]
		-- upvalues: t_1 (write), fetchPlatformData (ref)
		local var33 = tostring(p10)
		
		if not t_1[var33] then
			fetchPlatformData({ p10 })
		end
		return t_1[var33].platformName
	end
	
	local function getPlatformProfileId(p11) --[[ line: 231 ]]
		-- upvalues: t_1 (write), fetchPlatformData (ref)
		local var34 = tostring(p11)
		
		if not t_1[var34] then
			fetchPlatformData({ p11 })
		end
		return t_1[var34].platformProfileId
	end
	
	fetchProfiles(var15)
	fetchPlatformData(var15)
	p0.PlayerAdded:Connect(addPerson)
	p0.PlayerRemoving:Connect(removePerson)
	
	if getFFlagPeoplePageEnablePersonSignalStore() then
		for i, v in p0:GetPlayers() do
			var18(v)
		end
	end
	return {
		people = var9,
		peopleSignalMap = if getFFlagPeoplePageEnablePersonSignalStore() then var8 else nil,
		peopleProfiles = var11,
		getProfile = getProfile,
		getPlatformName = getPlatformName,
		getPlatformProfileId = getPlatformProfileId
	}
end

return if getFFlagPeoplePageEnablePersonSignalStore() then createPeopleListStore else createPeopleListStore()