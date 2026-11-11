local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local PresenceType = require(AppChat.Http.RoduxPresence).Enums.PresenceType
local config = {
	["1"] = {
		id = "1",
		username = "username1",
		displayName = "displayName1",
		combinedName = "combinedName1",
		alias = "alias1",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = PresenceType.Online
	},
	["2"] = {
		id = "2",
		username = "username2",
		displayName = "displayName2",
		combinedName = "combinedName2",
		alias = "alias2",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = PresenceType.InGame
	},
	["3"] = {
		id = "3",
		username = "username3",
		displayName = "displayName3",
		combinedName = "combinedName3",
		alias = "alias3",
		presenceText = "Offline",
		lastLocation = nil,
		presenceType = PresenceType.Offline
	},
	["4"] = {
		id = "4",
		username = "username4",
		displayName = "displayName4",
		combinedName = "combinedName4",
		alias = "alias4",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = PresenceType.Online
	},
	["1989"] = {
		id = "1989",
		username = "username",
		displayName = "Test Display Name",
		combinedName = "Test Primary Name",
		alias = "Test Primary Name",
		presenceText = "Online",
		lastLocation = "TestLocation",
		presenceType = PresenceType.Online
	},
	["1969"] = {
		id = "1969",
		username = "username",
		displayName = "ClementOrange",
		combinedName = "OrangeClement",
		alias = "OrangeClement",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = PresenceType.InGame
	},
	["1949"] = {
		id = "1949",
		username = "username",
		displayName = "PineAzure",
		combinedName = "AzurePine",
		alias = "AzurePine",
		presenceText = "Offline",
		lastLocation = nil,
		presenceType = PresenceType.Offline
	},
	["422502"] = {
		id = "422502",
		username = "username",
		displayName = "TestUserB",
		combinedName = "TestUserB",
		alias = "(alias)",
		presenceText = "Studio - Testing",
		lastLocation = "Studio - Testing",
		presenceType = PresenceType.InGame
	}
}

function createMockUserProfile(p1)
	-- upvalues: SignalsModule (copy)
	local CreateSignalFunction = SignalsModule.createSignal
	local Signal, _ = CreateSignalFunction(p1.username or "")
	local Signal1, _ = CreateSignalFunction(p1.displayName or "")
	local Signal2, _ = CreateSignalFunction(p1.combinedName or "")
	local Signal3, _ = CreateSignalFunction(p1.combinedName or "")
	local Signal4, _ = CreateSignalFunction(p1.combinedName or "")
	local Signal5, _ = CreateSignalFunction(p1.alias or "")
	local Signal6, _ = CreateSignalFunction("")
	
	return {
		userId = p1.id,
		names = {
			getUsername = Signal,
			getDisplayName = Signal1,
			getCombinedName = Signal2,
			getInExperienceCombinedName = Signal3,
			getPlatformName = Signal4,
			getAlias = Signal5
		},
		getPlatformProfileId = Signal6
	}
end

function createMockUserProfileStore()
	-- upvalues: config (copy), CryoModule (copy), SignalsModule (copy)
	local MockUserProfiles = {}
	
	for i, value in pairs(config) do
		MockUserProfiles[i] = createMockUserProfile(value)
	end
	return {
		fetchNamesByUserIds = function(p1)
			-- upvalues: CryoModule (upval), MockUserProfiles (copy), config (upval), SignalsModule (upval)
			return SignalsModule.createSignal({
				status = "success",
				data = CryoModule.List.filterMap(p1, function(Key)
					-- upvalues: MockUserProfiles (upval), config (upval)
					local MockUserProfile = MockUserProfiles[Key]
					
					if not MockUserProfile and config[Key] then
						MockUserProfile = createMockUserProfile(config[Key])
						MockUserProfiles[Key] = MockUserProfile
					end
					return MockUserProfile
				end)
			})
		end,
		invalidateCachedNamesForUserIds = function() end
	}
end

function createMockPresenceData()
	-- upvalues: config (copy)
	local t = {}
	
	for i, value in pairs(config) do
		t[i] = {
			userPresenceType = value.presenceType,
			lastLocation = value.lastLocation
		}
	end
	return t
end

function createMockApolloProfiles()
	-- upvalues: config (copy)
	local t = {}
	
	for i, value in pairs(config) do
		t[i] = {
			combinedName = value.combinedName,
			alias = value.alias,
			displayName = value.displayName,
			username = value.username,
			platformName = value.combinedName
		}
	end
	return t
end

function getUserProfilesFetchData()
	-- upvalues: CryoModule (copy), config (copy)
	return CryoModule.List.map(config, function(p1)
		return p1
	end)
end

return {
	USERS = config,
	createMockUserProfile = createMockUserProfile,
	createMockUserProfileStore = createMockUserProfileStore,
	createMockPresenceData = createMockPresenceData,
	createMockApolloProfiles = createMockApolloProfiles,
	getUserProfilesFetchData = getUserProfilesFetchData
}