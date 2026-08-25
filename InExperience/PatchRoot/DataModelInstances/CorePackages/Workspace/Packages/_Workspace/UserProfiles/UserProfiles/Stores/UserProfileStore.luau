local parent = script:FindFirstAncestor("UserProfiles").Parent
local lumberyakModule = require(parent.Lumberyak)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local userProfileStoreMaxLoggingLevel = game:DefineFastString("UserProfileStoreMaxLoggingLevel", lumberyakModule.Logger.Levels.Error)
local userProfileStoreHttpTimeout = game:DefineFastInt("UserProfileStoreHttpTimeout", 1500)
local userProfileStoreBatchSize = game:DefineFastInt("UserProfileStoreBatchSize", 50)
local userProfileStoreQueueProcessDelay = game:DefineFastInt("UserProfileStoreQueueProcessDelay", 1)
local fFlagEnableVerifiedBadgeStore = sharedFlagsModule.FFlagEnableVerifiedBadgeStore
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local userProfileModelModule = require(script.Parent.UserProfileModel)
local var8 = createComputed(function(_)
	-- upvalues: parent (ref), lumberyakModule (ref), userProfileStoreMaxLoggingLevel (ref), userProfileStoreHttpTimeout (ref), fFlagEnableVerifiedBadgeStore (ref), fFlagEnableBlackbirdCheck (ref), userProfileModelModule (ref), userProfileStoreBatchSize (ref), createSignal (ref), userProfileStoreQueueProcessDelay (ref), fFlagSduiExperienceDetailsSupport (ref)
	local urlBuilderModule = require(parent.UrlBuilder)
	local urlBuilder = urlBuilderModule.UrlBuilder
	local urlBase = urlBuilderModule.UrlBase
	local userProfileStore = lumberyakModule.Logger.new(nil, "UserProfileStore")
	userProfileStore:setContext({ prefix = "[UserProfileStore] " })
	userProfileStore:addSink({
		maxLevel = userProfileStoreMaxLoggingLevel,
		log = function(_, _, _) end
	})
	local httpService = game:GetService("HttpService")
	local var12 = urlBuilder.new({
		path = "user-profile-api/v1/user/profiles/get-profiles",
		base = urlBase.APIS
	})()
	local t = {
		USERNAME = "names.username",
		DISPLAY_NAME = "names.displayName",
		COMBINED_NAME = "names.combinedName",
		IN_EXPERIENCE_COMBINED_NAME = "names.inExperienceCombinedName",
		PLATFORM_NAME = "names.platformName",
		CONTACT_NAME = "names.contactName",
		ALIAS = "names.alias",
		PLATFORM_PROFILE_ID = "platformProfileId",
		IS_VERIFIED = if fFlagEnableVerifiedBadgeStore then "isVerified" else nil,
		HAS_ROBLOX_SUBSCRIPTION = if fFlagEnableBlackbirdCheck then "hasRobloxSubscription" else nil
	}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var17 = false
	
	local function _(p0)
		-- upvalues: t_1 (ref), userProfileStore (ref), userProfileModelModule (copy)
		local var22 = t_1[p0]
		
		if var22 == nil then
			userProfileStore:trace("Creating profile: {}", p0)
			local var23 = userProfileModelModule.create(p0)
			t_1[p0] = var23
			
			return var23
		end
		userProfileStore:trace("Found profile: {}", p0)
		
		return var22
	end
	
	local function performBatchFetch(p1, p2, p3, p4)
		-- upvalues: userProfileStore (ref), t_2 (ref), userProfileStoreBatchSize (copy), httpService (ref), var12 (ref), userProfileStoreHttpTimeout (ref), t_1 (ref), userProfileModelModule (copy), performBatchFetch (ref)
		if #p1 == 0 then
			userProfileStore:trace("No more ids to fetch. Setting result.")
			
			for i, v in ipairs(p3) do
				local t = {}
				local var25 = t_2[p2]
				
				for i_1, v_1 in v.userIds do
					local var27 = var25[v_1]
					
					if var27 then
						userProfileStore:trace("Found cached profile: {}", v_1)
						table.insert(t, var27)
					else
						userProfileStore:debug("Expected cached profile: {}", v_1)
					end
				end
				local t_3 = { status = if p4 then "success" else "failed", data = t }
				v.setResult(t_3)
				local callback = v.callback
				
				if callback ~= nil then
					callback(t_3)
				end
			end
			return
		else
			local t_3
			local _ = {}
			local t = {}
			
			if userProfileStoreBatchSize < #p1 then
				t_3 = {}
				
				for i = 1, userProfileStoreBatchSize do
					table.insert(t_3, p1[i])
				end
				for i_1 = userProfileStoreBatchSize + 1, #p1 do
					table.insert(t, p1[i_1])
				end
			else
				t_3 = p1
			end
			local var30 = httpService:JSONEncode({ userIds = t_3, fields = string.split(p2, ",") })
			userProfileStore:debug("Fetching: {}", var30)
			httpService:RequestInternal({
				Method = "POST",
				Priority = 0,
				Url = var12,
				Body = var30,
				Timeout = userProfileStoreHttpTimeout,
				CachePolicy = Enum.HttpCachePolicy.None,
				Headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				},
				RequestType = Enum.HttpRequestType.Default
			}):Start(function(p5, p6)
				-- upvalues: httpService (copy), userProfileStore (copy), var30 (ref), t_2 (copy), p2 (ref), t_1 (copy), userProfileModelModule (copy), performBatchFetch (copy), t (ref), p3 (ref), p4 (ref)
				if p5 == true then
					local body = p6.Body
					
					if body ~= nil then
						local _, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						
						if status ~= nil then
							userProfileStore:trace("Fetched: {}\nresponse: {}", var30, body)
							local profileDetails = status.profileDetails
							
							if profileDetails ~= nil then
								local var31 = t_2[p2]
								
								for i, v in ipairs(profileDetails) do
									local var34
									local var32 = tostring(v.userId)
									local var33 = t_1[var32]
									
									if var33 == nil then
										userProfileStore:trace("Creating profile: {}", var32)
										var33 = userProfileModelModule.create(var32)
										t_1[var32] = var33
										var34 = var33
									else
										userProfileStore:trace("Found profile: {}", var32)
										var34 = var33
									end
									if v then
										userProfileStore:trace("Updating profile: {}", var32)
										userProfileModelModule.update(var34, v)
									end
									var31[var32] = var34
								end
							end
						end
					end
				else
					userProfileStore:error("Error fetching")
				end
				performBatchFetch(t, p2, p3, if p5 == false then false else p4)
			end)
		end
	end
	
	local function processQueuedRequests()
		-- upvalues: t_3 (write), userProfileStore (ref), t_2 (ref), performBatchFetch (ref)
		for i, v in pairs(t_3) do
			userProfileStore:trace("Processing requests ({}) for fields: {}", #v, i)
			local t = {}
			local t_1 = {}
			local var37 = t_2[i]
			
			for i_1, v_1 in ipairs(v) do
				for i_2, v_2 in ipairs(v_1.userIds) do
					if t[v_2] == nil then
						t[v_2] = v_2
						
						if var37[v_2] == nil then
							table.insert(t_1, v_2)
						end
					end
				end
			end
			performBatchFetch(t_1, i, table.clone(v), true)
		end
		t_3 = {}
	end
	
	local function fetchByUserIds(p7, p8, p9)
		-- upvalues: t_2 (ref), t_1 (ref), userProfileStore (ref), userProfileModelModule (copy), createSignal (copy), t_3 (write), var17 (write), fFlagEnableBlackbirdCheck (copy), processQueuedRequests (ref), userProfileStoreQueueProcessDelay (copy)
		table.sort(p8)
		local joined = table.concat(p8, ",")
		local var39 = t_2[joined]
		
		if var39 == nil then
			var39 = {}
			t_2[joined] = var39
		end
		local t = {}
		local var41 = false
		
		for i, v in p7 do
			local var48 = var39[v]
			
			if var48 == nil and var41 == false then
				var41 = true
			end
			local var49 = var48
			
			if not var49 then
				local var50 = t_1[v]
				
				if var50 == nil then
					userProfileStore:trace("Creating profile: {}", v)
					var50 = userProfileModelModule.create(v)
					t_1[v] = var50
					var49 = var50
				else
					userProfileStore:trace("Found profile: {}", v)
					var49 = var50
				end
			end
			table.insert(t, var49)
		end
		if var41 == false then
			userProfileStore:trace("All requested profiles are cached. Calling back early")
			local t_4 = { status = "success", data = t }
			local var43 = createSignal(t_4)
			
			if p9 ~= nil then
				p9(t_4)
			end
			return var43
		else
			local t_4 = { status = "fetching", data = t }
			local var45, var46 = createSignal(t_4)
			local var47 = t_3[joined]
			
			if var47 == nil then
				var47 = {}
				t_3[joined] = var47
			end
			table.insert(var47, {
				userIds = p7,
				getResult = var45,
				setResult = var46,
				callback = p9
			})
			
			if not var17 then
				var17 = true
				
				if fFlagEnableBlackbirdCheck then
					task.defer(function()
						-- upvalues: processQueuedRequests (copy), var17 (copy)
						processQueuedRequests()
						var17 = false
					end)
				else
					task.delay(userProfileStoreQueueProcessDelay, function()
						-- upvalues: processQueuedRequests (copy), var17 (copy)
						processQueuedRequests()
						var17 = false
					end)
				end
			end
			if p9 ~= nil then
				p9(t_4)
			end
			return var45
		end
	end
	
	local function invalidateCachedProfiles(p10, p11)
		-- upvalues: t_2 (ref)
		table.sort(p10)
		local var51 = t_2[table.concat(p10, ",")]
		
		if var51 == nil then return end
		if p11 == nil then
			local _ = {}
			
			return
		end
		for i, v in p11 do
			var51[v] = nil
		end
	end
	
	return {
		fetchNamesByUserIds = function(p12, p13)
			-- upvalues: t (ref), fFlagEnableVerifiedBadgeStore (copy), fFlagEnableBlackbirdCheck (copy), fetchByUserIds (ref)
			local list = {
				t.COMBINED_NAME, t.DISPLAY_NAME, t.USERNAME, t.IN_EXPERIENCE_COMBINED_NAME,
				t.CONTACT_NAME, t.ALIAS, t.PLATFORM_NAME, t.PLATFORM_PROFILE_ID
			}
			
			if fFlagEnableVerifiedBadgeStore then
				table.insert(list, t.IS_VERIFIED)
			end
			if fFlagEnableBlackbirdCheck then
				table.insert(list, t.HAS_ROBLOX_SUBSCRIPTION)
			end
			return fetchByUserIds(p12, list, p13)
		end,
		updateFromHydration = if fFlagSduiExperienceDetailsSupport then function(p14)
			-- upvalues: t_1 (ref), userProfileStore (ref), userProfileModelModule (copy)
			for i, v in p14 do
				local var55
				local var53 = if v.userId ~= nil then i else tostring(v.userId)
				local var54 = t_1[var53]
				
				if var54 == nil then
					userProfileStore:trace("Creating profile: {}", var53)
					var54 = userProfileModelModule.create(var53)
					t_1[var53] = var54
					var55 = var54
				else
					userProfileStore:trace("Found profile: {}", var53)
					var55 = var54
				end
				userProfileModelModule.update(var55, {
					names = { username = v.username, displayName = v.displayName },
					isVerified = v.isVerified
				})
			end
		end else nil,
		getProfileByUserId = if fFlagSduiExperienceDetailsSupport then function(p15)
			-- upvalues: t_1 (ref)
			return t_1[p15]
		end else nil,
		invalidateCachedNamesForUserIds = function(p16)
			-- upvalues: t (ref), invalidateCachedProfiles (ref)
			invalidateCachedProfiles({
				t.COMBINED_NAME, t.DISPLAY_NAME, t.USERNAME, t.IN_EXPERIENCE_COMBINED_NAME,
				t.CONTACT_NAME, t.ALIAS, t.PLATFORM_NAME, t.PLATFORM_PROFILE_ID
			}, p16)
		end
	}
end)

return {
	get = function()
		-- upvalues: var8 (ref)
		return var8(false)
	end
}