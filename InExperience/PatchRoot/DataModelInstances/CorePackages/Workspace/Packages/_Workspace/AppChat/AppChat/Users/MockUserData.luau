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

function createMockUserProfile(p1)
	-- upvalues: signalsModule (ref)
	local createSignal = signalsModule.createSignal
	local var1, _ = createSignal(p1.username or "")
	local var2, _ = createSignal(p1.displayName or "")
	local var3, _ = createSignal(p1.combinedName or "")
	local var4, _ = createSignal(p1.combinedName or "")
	local var5, _ = createSignal(p1.combinedName or "")
	local var6, _ = createSignal(p1.alias or "")
	local var7, _ = createSignal("")
	
	return {
		userId = p1.id,
		names = {
			getUsername = var1,
			getDisplayName = var2,
			getCombinedName = var3,
			getInExperienceCombinedName = var4,
			getPlatformName = var5,
			getAlias = var6
		},
		getPlatformProfileId = var7
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
					local var1 = t_1[p2]
					
					if not var1 and t[p2] then
						var1 = createMockUserProfile(t[p2])
						t_1[p2] = var1
					end
					return var1
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
	return cryoModule.List.map(t, function(p1)
		return p1
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