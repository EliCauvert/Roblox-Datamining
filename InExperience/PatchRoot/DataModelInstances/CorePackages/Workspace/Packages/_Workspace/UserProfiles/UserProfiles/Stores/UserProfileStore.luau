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
local var1 = createComputed(function(_)
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
	local var2 = urlBuilder.new({
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
	local var3 = false
	
	local function _(p1)
		-- upvalues: t_1 (ref), userProfileStore (ref), userProfileModelModule (copy)
		local var4 = t_1[p1]
		
		if var4 == nil then
			userProfileStore:trace("Creating profile: {}", p1)
			local var5 = userProfileModelModule.create(p1)
			t_1[p1] = var5
			
			return var5
		end
		userProfileStore:trace("Found profile: {}", p1)
		
		return var4
	end
	
	local function performBatchFetch(p1, p2, p3, p4)
		-- upvalues: userProfileStore (ref), t_2 (ref), userProfileStoreBatchSize (copy), httpService (ref), var2 (ref), userProfileStoreHttpTimeout (ref), t_1 (ref), userProfileModelModule (copy), performBatchFetch (ref)
		if #p1 == 0 then
			userProfileStore:trace("No more ids to fetch. Setting result.")
			
			for i, v in ipairs(p3) do
				local t = {}
				local var4 = t_2[p2]
				
				for i_1, v_1 in v.userIds do
					local var5 = var4[v_1]
					
					if var5 then
						userProfileStore:trace("Found cached profile: {}", v_1)
						table.insert(t, var5)
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
			local var6 = httpService:JSONEncode({ userIds = t_3, fields = string.split(p2, ",") })
			userProfileStore:debug("Fetching: {}", var6)
			httpService:RequestInternal({
				Method = "POST",
				Priority = 0,
				Url = var2,
				Body = var6,
				Timeout = userProfileStoreHttpTimeout,
				CachePolicy = Enum.HttpCachePolicy.None,
				Headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				},
				RequestType = Enum.HttpRequestType.Default
			}):Start(function(p5, p6)
				-- upvalues: httpService (copy), userProfileStore (copy), var6 (ref), t_2 (copy), p2 (ref), t_1 (copy), userProfileModelModule (copy), performBatchFetch (copy), t (ref), p3 (ref), p4 (ref)
				if p5 == true then
					local body = p6.Body
					
					if body ~= nil then
						local _, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						
						if status ~= nil then
							userProfileStore:trace("Fetched: {}\nresponse: {}", var6, body)
							local profileDetails = status.profileDetails
							
							if profileDetails ~= nil then
								local var7 = t_2[p2]
								
								for i, v in ipairs(profileDetails) do
									local var8
									local var9 = tostring(v.userId)
									local var10 = t_1[var9]
									
									if var10 == nil then
										userProfileStore:trace("Creating profile: {}", var9)
										var10 = userProfileModelModule.create(var9)
										t_1[var9] = var10
										var8 = var10
									else
										userProfileStore:trace("Found profile: {}", var9)
										var8 = var10
									end
									if v then
										userProfileStore:trace("Updating profile: {}", var9)
										userProfileModelModule.update(var8, v)
									end
									var7[var9] = var8
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
			local var7 = t_2[i]
			
			for i_1, v_1 in ipairs(v) do
				for i_2, v_2 in ipairs(v_1.userIds) do
					if t[v_2] == nil then
						t[v_2] = v_2
						
						if var7[v_2] == nil then
							table.insert(t_1, v_2)
						end
					end
				end
			end
			performBatchFetch(t_1, i, table.clone(v), true)
		end
		t_3 = {}
	end
	
	local function fetchByUserIds(p5, p6, p7)
		-- upvalues: t_2 (ref), t_1 (ref), userProfileStore (ref), userProfileModelModule (copy), createSignal (copy), t_3 (write), var3 (write), fFlagEnableBlackbirdCheck (copy), processQueuedRequests (ref), userProfileStoreQueueProcessDelay (copy)
		table.sort(p6)
		local joined = table.concat(p6, ",")
		local var8 = t_2[joined]
		
		if var8 == nil then
			var8 = {}
			t_2[joined] = var8
		end
		local t = {}
		local var9 = false
		
		for i, v in p5 do
			local var10 = var8[v]
			
			if var10 == nil and var9 == false then
				var9 = true
			end
			local var11 = var10
			
			if not var11 then
				local var12 = t_1[v]
				
				if var12 == nil then
					userProfileStore:trace("Creating profile: {}", v)
					var12 = userProfileModelModule.create(v)
					t_1[v] = var12
					var11 = var12
				else
					userProfileStore:trace("Found profile: {}", v)
					var11 = var12
				end
			end
			table.insert(t, var11)
		end
		if var9 == false then
			userProfileStore:trace("All requested profiles are cached. Calling back early")
			local t_4 = { status = "success", data = t }
			local var13 = createSignal(t_4)
			
			if p7 ~= nil then
				p7(t_4)
			end
			return var13
		else
			local t_4 = { status = "fetching", data = t }
			local var14, var15 = createSignal(t_4)
			local var16 = t_3[joined]
			
			if var16 == nil then
				var16 = {}
				t_3[joined] = var16
			end
			table.insert(var16, {
				userIds = p5,
				getResult = var14,
				setResult = var15,
				callback = p7
			})
			
			if not var3 then
				var3 = true
				
				if fFlagEnableBlackbirdCheck then
					task.defer(function()
						-- upvalues: processQueuedRequests (copy), var3 (copy)
						processQueuedRequests()
						var3 = false
					end)
				else
					task.delay(userProfileStoreQueueProcessDelay, function()
						-- upvalues: processQueuedRequests (copy), var3 (copy)
						processQueuedRequests()
						var3 = false
					end)
				end
			end
			if p7 ~= nil then
				p7(t_4)
			end
			return var14
		end
	end
	
	local function invalidateCachedProfiles(p8, p9)
		-- upvalues: t_2 (ref)
		table.sort(p8)
		local var17 = t_2[table.concat(p8, ",")]
		
		if var17 == nil then return end
		if p9 == nil then
			local _ = {}
			
			return
		end
		for i, v in p9 do
			var17[v] = nil
		end
	end
	
	return {
		fetchNamesByUserIds = function(p10, p11)
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
			return fetchByUserIds(p10, list, p11)
		end,
		updateFromHydration = if fFlagSduiExperienceDetailsSupport then function(p10)
			-- upvalues: t_1 (ref), userProfileStore (ref), userProfileModelModule (copy)
			for i, v in p10 do
				local var18
				local var19 = if v.userId ~= nil then i else tostring(v.userId)
				local var20 = t_1[var19]
				
				if var20 == nil then
					userProfileStore:trace("Creating profile: {}", var19)
					var20 = userProfileModelModule.create(var19)
					t_1[var19] = var20
					var18 = var20
				else
					userProfileStore:trace("Found profile: {}", var19)
					var18 = var20
				end
				userProfileModelModule.update(var18, {
					names = { username = v.username, displayName = v.displayName },
					isVerified = v.isVerified
				})
			end
		end else nil,
		getProfileByUserId = if fFlagSduiExperienceDetailsSupport then function(p11)
			-- upvalues: t_1 (ref)
			return t_1[p11]
		end else nil,
		invalidateCachedNamesForUserIds = function(p11)
			-- upvalues: t (ref), invalidateCachedProfiles (ref)
			invalidateCachedProfiles({
				t.COMBINED_NAME, t.DISPLAY_NAME, t.USERNAME, t.IN_EXPERIENCE_COMBINED_NAME,
				t.CONTACT_NAME, t.ALIAS, t.PLATFORM_NAME, t.PLATFORM_PROFILE_ID
			}, p11)
		end
	}
end)

return {
	get = function()
		-- upvalues: var1 (ref)
		return var1(false)
	end
}