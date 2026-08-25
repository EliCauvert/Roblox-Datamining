local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local presenceType = require(appChat.Http.RoduxPresence).Enums.PresenceType
local t = {
	["1"] = {
		id = "1",
		username = "username1",
		displayName = "displayName1",
		combinedName = "combinedName1",
		alias = "alias1",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = presenceType.Online
	},
	["2"] = {
		id = "2",
		username = "username2",
		displayName = "displayName2",
		combinedName = "combinedName2",
		alias = "alias2",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = presenceType.InGame
	},
	["3"] = {
		id = "3",
		username = "username3",
		displayName = "displayName3",
		combinedName = "combinedName3",
		alias = "alias3",
		presenceText = "Offline",
		lastLocation = nil,
		presenceType = presenceType.Offline
	},
	["4"] = {
		id = "4",
		username = "username4",
		displayName = "displayName4",
		combinedName = "combinedName4",
		alias = "alias4",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = presenceType.Online
	},
	["1989"] = {
		id = "1989",
		username = "username",
		displayName = "Test Display Name",
		combinedName = "Test Primary Name",
		alias = "Test Primary Name",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = presenceType.Online
	},
	["1969"] = {
		id = "1969",
		username = "username",
		displayName = "ClementOrange",
		combinedName = "OrangeClement",
		alias = "OrangeClement",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = presenceType.InGame
	},
	["1949"] = {
		id = "1949",
		username = "username",
		displayName = "PineAzure",
		combinedName = "AzurePine",
		alias = "AzurePine",
		presenceText = "Offline",
		lastLocation = nil,
		presenceType = presenceType.Offline
	},
	["422502"] = {
		id = "422502",
		username = "username",
		displayName = "TestUserB",
		combinedName = "TestUserB",
		alias = "(alias)",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = presenceType.InGame
	}
}

function createMockUserProfile(p0)
	-- upvalues: signalsModule (ref)
	local createSignal = signalsModule.createSignal
	local var4, _ = createSignal(p0.username or "")
	local var5, _ = createSignal(p0.displayName or "")
	local var6, _ = createSignal(p0.combinedName or "")
	local var7, _ = createSignal(p0.combinedName or "")
	local var8, _ = createSignal(p0.combinedName or "")
	local var9, _ = createSignal(p0.alias or "")
	local var10, _ = createSignal("")
	
	return {
		userId = p0.id,
		names = {
			getUsername = var4,
			getDisplayName = var5,
			getCombinedName = var6,
			getInExperienceCombinedName = var7,
			getPlatformName = var8,
			getAlias = var9
		},
		getPlatformProfileId = var10
	}
end

function createMockUserProfileStore()
	-- upvalues: t (ref), cryoModule (ref), signalsModule (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		t_1[i] = createMockUserProfile(v)
	end
	return {
		fetchNamesByUserIds = function(p1)
			-- upvalues: cryoModule (copy), t_1 (ref), t (copy), signalsModule (copy)
			return signalsModule.createSignal({
				status = "success",
				data = cryoModule.List.filterMap(p1, function(p2)
					-- upvalues: t_1 (copy), t (copy)
					local var12 = t_1[p2]
					
					if not var12 and t[p2] then
						var12 = createMockUserProfile(t[p2])
						t_1[p2] = var12
					end
					return var12
				end)
			})
		end,
		invalidateCachedNamesForUserIds = function() end
	}
end

function createMockPresenceData()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		t_1[i] = {
			userPresenceType = v.presenceType,
			lastLocation = v.lastLocation
		}
	end
	return t_1
end

function createMockApolloProfiles()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		t_1[i] = {
			combinedName = v.combinedName,
			alias = v.alias,
			displayName = v.displayName,
			username = v.username,
			platformName = v.combinedName
		}
	end
	return t_1
end

function getUserProfilesFetchData()
	-- upvalues: cryoModule (ref), t (ref)
	return cryoModule.List.map(t, function(p3)
		return p3
	end)
end

return {
	USERS = t,
	createMockUserProfile = createMockUserProfile,
	createMockUserProfileStore = createMockUserProfileStore,
	createMockPresenceData = createMockPresenceData,
	createMockApolloProfiles = createMockApolloProfiles,
	getUserProfilesFetchData = getUserProfilesFetchData
}