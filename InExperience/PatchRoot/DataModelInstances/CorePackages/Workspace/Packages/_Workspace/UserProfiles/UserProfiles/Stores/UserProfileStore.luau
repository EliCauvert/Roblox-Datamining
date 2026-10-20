local Parent = script:FindFirstAncestor("UserProfiles").Parent
local LumberyakModule = require(Parent.Lumberyak)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUserProfilePlatformProfile = SharedFlagsModule.FFlagUserProfilePlatformProfile
local PlatformProfileRequestModule = require(Parent.GraphQLServer.PlatformProfileRequest)
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local UserProfileStoreMaxLoggingLevel = game:DefineFastString("UserProfileStoreMaxLoggingLevel", LumberyakModule.Logger.Levels.Error)
local UserProfileStoreHttpTimeout = game:DefineFastInt("UserProfileStoreHttpTimeout", 1500)
local FIntUserProfileStoreBatchSize = SharedFlagsModule.FIntUserProfileStoreBatchSize
local UserProfileStoreQueueProcessDelay = game:DefineFastInt("UserProfileStoreQueueProcessDelay", 1)
local FFlagEnableVerifiedBadgeStore = SharedFlagsModule.FFlagEnableVerifiedBadgeStore
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local UserProfileModelModule = require(script.Parent.UserProfileModel)
local Computed = SignalsModule.createComputed(function(_)
	-- upvalues: Parent (copy), LumberyakModule (copy), UserProfileStoreMaxLoggingLevel (copy), UserProfileStoreHttpTimeout (copy), FFlagEnableVerifiedBadgeStore (copy), FFlagEnableBlackbirdCheck (copy), UserProfileModelModule (copy), FIntUserProfileStoreBatchSize (copy), FFlagUserProfilePlatformProfile (copy), PlatformProfileRequestModule (copy), CreateSignalFunction (copy), UserProfileStoreQueueProcessDelay (copy)
	local UrlBuilderModule = require(Parent.UrlBuilder)
	local UrlBuilder = UrlBuilderModule.UrlBuilder
	local UrlBase = UrlBuilderModule.UrlBase
	local UserProfileStore = LumberyakModule.Logger.new(nil, "UserProfileStore")
	UserProfileStore:setContext({ prefix = "[UserProfileStore] " })
	UserProfileStore:addSink({
		maxLevel = UserProfileStoreMaxLoggingLevel,
		log = function(_, _, _) end
	})
	local HttpService = game:GetService("HttpService")
	local Url = UrlBuilder.new({
		path = "user-profile-api/v1/user/profiles/get-profiles",
		base = UrlBase.APIS
	})()
	local config = {
		USERNAME = "names.username",
		DISPLAY_NAME = "names.displayName",
		COMBINED_NAME = "names.combinedName",
		IN_EXPERIENCE_COMBINED_NAME = "names.inExperienceCombinedName",
		PLATFORM_NAME = "names.platformName",
		CONTACT_NAME = "names.contactName",
		ALIAS = "names.alias",
		PLATFORM_PROFILE_ID = "platformProfileId",
		IS_VERIFIED = if FFlagEnableVerifiedBadgeStore then "isVerified" else nil,
		HAS_ROBLOX_SUBSCRIPTION = if FFlagEnableBlackbirdCheck then "hasRobloxSubscription" else nil
	}
	local CreateResults = {}
	local t = {}
	local t1 = {}
	local Flag = false
	
	local function _(Key)
		-- upvalues: CreateResults (copy), UserProfileStore (copy), UserProfileModelModule (upval)
		local CreateResult = CreateResults[Key]
		
		if CreateResult == nil then
			UserProfileStore:trace("Creating profile: {}", Key)
			local NewUserProfileModel = UserProfileModelModule.create(Key)
			CreateResults[Key] = NewUserProfileModel
			
			return NewUserProfileModel
		else
			UserProfileStore:trace("Found profile: {}", Key)
			
			return CreateResult
		end
	end
	
	local function performBatchFetch(p1, Text: string, List, p2)
		-- upvalues: UserProfileStore (copy), t (copy), FIntUserProfileStoreBatchSize (upval), FFlagUserProfilePlatformProfile (upval), PlatformProfileRequestModule (upval), HttpService (copy), Url (copy), UserProfileStoreHttpTimeout (copy), CreateResults (copy), UserProfileModelModule (upval), performBatchFetch (copy)
		if #p1 == 0 then
			UserProfileStore:trace("No more ids to fetch. Setting result.")
			
			for _, value in ipairs(List) do
				local Data = {}
				local Entry = t[Text]
				
				for _, userId in value.userIds do
					local Entry1 = Entry[userId]
					
					if Entry1 then
						UserProfileStore:trace("Found cached profile: {}", userId)
						table.insert(Data, Entry1)
					else
						UserProfileStore:debug("Expected cached profile: {}", userId)
					end
				end
				local config = { status = if p2 then "success" else "failed", data = Data }
				value.setResult(config)
				local CallbackFunction: (any) -> () = value.callback
				
				if CallbackFunction ~= nil then
					CallbackFunction(config)
				end
			end
			return
		else
			local List1 = {}
			local UserIds = nil
			
			if FIntUserProfileStoreBatchSize < #p1 then
				UserIds = {}
				
				for i = 1, FIntUserProfileStoreBatchSize do
					table.insert(UserIds, p1[i])
				end
				for i1 = FIntUserProfileStoreBatchSize + 1, #p1 do
					table.insert(List1, p1[i1])
				end
			else
				UserIds = p1
			end
			local Parts = string.split(Text, ",")
			local Json = HttpService:JSONEncode({
				userIds = UserIds,
				fields = Parts,
				includePlatformProfile = if FFlagUserProfilePlatformProfile and PlatformProfileRequestModule.hasPlatformFields(Parts) then true else nil
			})
			UserProfileStore:debug("Fetching: {}", Json)
			HttpService:RequestInternal({
				Method = "POST",
				Priority = 0,
				Url = Url,
				Body = Json,
				Timeout = UserProfileStoreHttpTimeout,
				CachePolicy = Enum.HttpCachePolicy.None,
				Headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				},
				RequestType = Enum.HttpRequestType.Default
			}):Start(function(Enabled, p3)
				-- upvalues: HttpService (upval), UserProfileStore (upval), Json (copy), FFlagUserProfilePlatformProfile (upval), PlatformProfileRequestModule (upval), Parts (copy), t (upval), Text (copy), CreateResults (upval), UserProfileModelModule (upval), performBatchFetch (upval), List1 (copy), List (copy), p2 (copy)
				if Enabled == true then
					local Body = p3.Body
					
					if Body ~= nil then
						local _, Result = pcall(function()
							-- upvalues: HttpService (upval), Body (copy)
							return HttpService:JSONDecode(Body)
						end)
						
						if Result ~= nil then
							UserProfileStore:trace("Fetched: {}\nresponse: {}", Json, Body)
							local ProfileDetails = Result.profileDetails
							
							if ProfileDetails ~= nil then
								if FFlagUserProfilePlatformProfile then
									ProfileDetails = PlatformProfileRequestModule.normalizeProfiles(ProfileDetails, Parts)
								end
								local Entry = t[Text]
								
								for _, profileDetail in ipairs(ProfileDetails) do
									local Text1 = tostring(profileDetail.userId)
									local CreateResult = CreateResults[Text1]
									local CreateResult1 = nil
									
									if CreateResult == nil then
										UserProfileStore:trace("Creating profile: {}", Text1)
										local NewUserProfileModel = UserProfileModelModule.create(Text1)
										CreateResults[Text1] = NewUserProfileModel
										CreateResult1 = NewUserProfileModel
									else
										UserProfileStore:trace("Found profile: {}", Text1)
										CreateResult1 = CreateResult
									end
									if profileDetail then
										UserProfileStore:trace("Updating profile: {}", Text1)
										UserProfileModelModule.update(CreateResult1, profileDetail)
									end
									Entry[Text1] = CreateResult1
								end
							end
						end
					end
				else
					UserProfileStore:error("Error fetching")
				end
				performBatchFetch(List1, Text, List, Enabled ~= false and p2)
			end)
		end
	end
	
	local function processQueuedRequests()
		-- upvalues: t1 (ref), UserProfileStore (copy), t (copy), performBatchFetch (copy)
		for i, value in pairs(t1) do
			UserProfileStore:trace("Processing requests ({}) for fields: {}", #value, i)
			local t2 = {}
			local List = {}
			local Entry = t[i]
			
			for _, value1 in ipairs(value) do
				for _, userId in ipairs(value1.userIds) do
					if t2[userId] == nil then
						t2[userId] = userId
						
						if Entry[userId] == nil then
							table.insert(List, userId)
						end
					end
				end
			end
			performBatchFetch(List, i, table.clone(value), true)
		end
		t1 = {}
	end
	
	local function fetchByUserIds(UserIds, List, Callback: (any) -> ())
		-- upvalues: t (copy), CreateResults (copy), UserProfileStore (copy), UserProfileModelModule (upval), CreateSignalFunction (upval), t1 (ref), Flag (ref), FFlagEnableBlackbirdCheck (upval), processQueuedRequests (copy), UserProfileStoreQueueProcessDelay (upval)
		table.sort(List)
		local Joined = table.concat(List, ",")
		local Entry = t[Joined]
		
		if Entry == nil then
			Entry = {}
			t[Joined] = Entry
		end
		local Data = {}
		local Enabled = false
		
		for _, userId in UserIds do
			local Entry1 = Entry[userId]
			
			if Entry1 == nil and Enabled == false then
				Enabled = true
			end
			local Entry2 = Entry1
			
			if not Entry2 then
				local CreateResult = CreateResults[userId]
				
				if CreateResult == nil then
					UserProfileStore:trace("Creating profile: {}", userId)
					local NewUserProfileModel = UserProfileModelModule.create(userId)
					CreateResults[userId] = NewUserProfileModel
					Entry2 = NewUserProfileModel
				else
					UserProfileStore:trace("Found profile: {}", userId)
					Entry2 = CreateResult
				end
			end
			table.insert(Data, Entry2)
		end
		if Enabled == false then
			UserProfileStore:trace("All requested profiles are cached. Calling back early")
			local config = { status = "success", data = Data }
			local Signal = CreateSignalFunction(config)
			
			if Callback ~= nil then
				Callback(config)
			end
			return Signal
		else
			local config1 = { status = "fetching", data = Data }
			local Signal1, Signal2 = CreateSignalFunction(config1)
			local Entry3 = t1[Joined]
			
			if Entry3 == nil then
				Entry3 = {}
				t1[Joined] = Entry3
			end
			table.insert(Entry3, {
				userIds = UserIds,
				getResult = Signal1,
				setResult = Signal2,
				callback = Callback
			})
			
			if not Flag then
				Flag = true
				
				if FFlagEnableBlackbirdCheck then
					task.defer(function()
						-- upvalues: processQueuedRequests (upval), Flag (upval)
						processQueuedRequests()
						Flag = false
					end)
				else
					task.delay(UserProfileStoreQueueProcessDelay, function()
						-- upvalues: processQueuedRequests (upval), Flag (upval)
						processQueuedRequests()
						Flag = false
					end)
				end
			end
			if Callback ~= nil then
				Callback(config1)
			end
			return Signal1
		end
	end
	
	local function getNameFields(p3)
		-- upvalues: config (copy), FFlagUserProfilePlatformProfile (upval), FFlagEnableVerifiedBadgeStore (upval), FFlagEnableBlackbirdCheck (upval)
		local List = {
			config.COMBINED_NAME, config.DISPLAY_NAME, config.USERNAME,
			config.IN_EXPERIENCE_COMBINED_NAME, config.CONTACT_NAME, config.ALIAS
		}
		
		if not FFlagUserProfilePlatformProfile or p3 then
			table.insert(List, config.PLATFORM_NAME)
			table.insert(List, config.PLATFORM_PROFILE_ID)
		end
		if FFlagEnableVerifiedBadgeStore then
			table.insert(List, config.IS_VERIFIED)
		end
		if FFlagEnableBlackbirdCheck then
			table.insert(List, config.HAS_ROBLOX_SUBSCRIPTION)
		end
		return List
	end
	
	local function invalidateCachedProfiles(List, List1)
		-- upvalues: t (copy)
		table.sort(List)
		local Entry = t[table.concat(List, ",")]
		
		if Entry == nil then return end
		if List1 == nil then return end
		for _, value in List1 do
			Entry[value] = nil
		end
	end
	
	return {
		fetchNamesByUserIds = function(UserIds, Callback, p3)
			-- upvalues: fetchByUserIds (copy), getNameFields (copy)
			return (fetchByUserIds(UserIds, getNameFields(p3), Callback))
		end,
		updateFromHydration = function(List)
			-- upvalues: CreateResults (copy), UserProfileStore (copy), UserProfileModelModule (upval)
			for i, value in List do
				local Text = if value.userId == nil then i else tostring(value.userId)
				local CreateResult = CreateResults[Text]
				local CreateResult1 = nil
				
				if CreateResult == nil then
					UserProfileStore:trace("Creating profile: {}", Text)
					local NewUserProfileModel = UserProfileModelModule.create(Text)
					CreateResults[Text] = NewUserProfileModel
					CreateResult1 = NewUserProfileModel
				else
					UserProfileStore:trace("Found profile: {}", Text)
					CreateResult1 = CreateResult
				end
				UserProfileModelModule.update(CreateResult1, {
					names = {
						username = value.username,
						displayName = value.displayName
					},
					isVerified = value.isVerified
				})
			end
		end,
		getProfileByUserId = function(p3)
			-- upvalues: CreateResults (copy)
			return CreateResults[p3]
		end,
		invalidateCachedNamesForUserIds = function(p3)
			-- upvalues: FFlagUserProfilePlatformProfile (upval), invalidateCachedProfiles (copy), getNameFields (copy), config (copy)
			if FFlagUserProfilePlatformProfile then
				invalidateCachedProfiles(getNameFields(false), p3)
				invalidateCachedProfiles(getNameFields(true), p3)
				
				return
			else
				invalidateCachedProfiles({
					config.COMBINED_NAME, config.DISPLAY_NAME, config.USERNAME,
					config.IN_EXPERIENCE_COMBINED_NAME, config.CONTACT_NAME, config.ALIAS,
					config.PLATFORM_NAME, config.PLATFORM_PROFILE_ID
				}, p3)
			end
		end
	}
end)

return {
	get = function()
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}