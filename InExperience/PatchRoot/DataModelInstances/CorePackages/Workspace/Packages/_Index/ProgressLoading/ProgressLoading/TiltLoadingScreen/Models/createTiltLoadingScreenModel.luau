local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local httpModule = require(parent_1.Http)
local dataHydrationModule = require(parent_1.DataHydration)
local queueExperimentation = require(parent_1.SocialExperiments).QueueExperimentation
local cachedPolicyServiceModule = require(parent_1.CachedPolicyService)
local marketplaceGetMarketplaceAssetStoreModule = require(parent_1.DataHydration.MarketplaceGetMarketplaceAssetStore)
local loadingScreenTelemetryModule = require(parent.LoadingScreenTelemetry)
local sharedFlagsModule = require(parent_1.SharedFlags)
local constantsModule = require(tiltLoadingScreen.Constants)
local marketplaceService = game:GetService("MarketplaceService")
local httpService = game:GetService("HttpService")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local fFlagEnableLuaAppsFollowUserId = sharedFlagsModule.FFlagEnableLuaAppsFollowUserId
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local queuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local fFlagEnableLuaAppsFollowUserId_1 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and fFlagEnableLuaAppsFollowUserId
local placeJoinStateEnabledEngineFeature = game:GetEngineFeature("PlaceJoinStateEnabled")
local var1 = httpModule.NetworkLayers.requestInternalWrapper(httpService)

local function defaultFetchUniverseId(p1)
	-- upvalues: httpModule (ref), var1 (ref)
	local var2, var3 = var1(string.format("%suniverses/v1/places/%d/universe", httpModule.Url.APIS_URL, p1), "GET"):await()
	
	return if var2 and var3 and var3.responseBody then var3.responseBody.universeId else nil
end

local function defaultFetchProductInfo(p1)
	-- upvalues: marketplaceService (ref)
	return marketplaceService:GetProductInfoAsync(p1)
end

local function defaultFetchPlayerLocalizationChoice(p1)
	-- upvalues: var1 (ref), httpModule (ref)
	return var1(string.format("%sv1/user-localization-settings/player-choice/%s", httpModule.Url.GAME_INTERNATIONALIZATION_URL, p1), "GET"):andThen(function(p2)
		-- upvalues: p1 (ref)
		if not p2 or not p2.responseBody then
			error({
				errorType = "PlayerLocalizationChoiceResponseError",
				responseCode = p2 and p2.responseCode,
				errorMessage = if p2 then "Missing response body" else "No response",
				customFields = { universeId = p1 }
			})
		end
		local responseBody = p2.responseBody
		
		if responseBody.IsPlayerChoiceEnabled == nil then
			error({
				errorType = "PlayerLocalizationChoiceMissingKey",
				errorMessage = "Missing IsPlayerChoiceEnabled in response body",
				responseCode = p2.responseCode,
				customFields = { universeId = p1, responseBody = responseBody }
			})
		end
		return responseBody
	end)
end

local function _()
	-- upvalues: placeJoinStateEnabledEngineFeature (ref), queueExperimentation (ref), constantsModule (ref)
	return if placeJoinStateEnabledEngineFeature then if queueExperimentation.getIsAutoJoinNewServerEnabled() then constantsModule.AUTO_JOIN_TREATMENT elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then constantsModule.JOIN_NEW_SERVER_TREATMENT else nil else nil
end

return function(p1, p2)
	-- upvalues: experienceService (ref), guiService (ref), defaultFetchUniverseId (ref), defaultFetchProductInfo (ref), cachedPolicyServiceModule (ref), defaultFetchPlayerLocalizationChoice (ref), marketplaceGetMarketplaceAssetStoreModule (ref), createDataCache (ref), createDataResolver (ref), loadingScreenTelemetryModule (ref), signalsModule (ref), placeJoinStateEnabledEngineFeature (ref), queueExperimentation (ref), constantsModule (ref), fFlagEnableLuaAppsFollowUserId_1 (ref), queuePositionEnabledEngineFeature (ref), userInputService (ref)
	local var2, ok
	local var3 = if p2 and p2.dataModel then p2.dataModel else game
	local var4 = if p2 and p2.experienceService then p2.experienceService else experienceService
	local var5 = if p2 and p2.guiService then p2.guiService else guiService
	local var6 = if p2 then p2.fetchUniverseId else defaultFetchUniverseId
	local var7 = if p2 then p2.fetchProductInfo else defaultFetchProductInfo
	local var8 = if p2 then p2.fetchIsSubjectToChinaPolicies else function()
		-- upvalues: cachedPolicyServiceModule (copy)
		return cachedPolicyServiceModule:IsSubjectToChinaPolicies()
	end
	local var9 = if p2 then p2.fetchPlayerLocalizationChoice else defaultFetchPlayerLocalizationChoice
	
	local function _()
		-- upvalues: var5 (ref)
		if not var5.GetUiMessage then
			return ""
		end
		local ok, status = pcall(var5.GetUiMessage, var5)
		
		return if ok and type(status) == "string" then status else ""
	end
	
	local var10 = marketplaceGetMarketplaceAssetStoreModule(false)
	local var11 = createDataCache()
	local var12 = createDataResolver({
		supportsMultiGet = false,
		cache = var11,
		logError = function(p3)
			-- upvalues: loadingScreenTelemetryModule (copy)
			if type(p3) == "table" then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p3.responseCode, errorType = p3.errorType })
				
				return
			end
			loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
		end,
		fetchFn = function(p3)
			-- upvalues: var9 (ref)
			return var9(p3)
		end
	})
	local var13 = if p1 > 0 then p1 else var3.PlaceId
	local var14, var15 = signalsModule.createSignal(if var13 > 0 then var13 else 0)
	local var16, var17 = signalsModule.createSignal(if var3.GameId > 0 then var3.GameId else 0)
	local var18 = if not placeJoinStateEnabledEngineFeature then nil elseif queueExperimentation.getIsAutoJoinNewServerEnabled() then constantsModule.AUTO_JOIN_TREATMENT elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then constantsModule.JOIN_NEW_SERVER_TREATMENT else nil
	local var19 = signalsModule.createSignal(var18)
	local var20, var21 = signalsModule.createSignal("")
	local var22, var23 = signalsModule.createSignal(nil)
	local createSignal = signalsModule.createSignal
	
	if var5.GetUiMessage then
		ok, status = pcall(var5.GetUiMessage, var5)
		var2 = if ok and type(status) == "string" then status else ""
	else
		var2 = ""
	end
	createSignal, var44 = createSignal(var2)
	ok, var45 = signalsModule.createSignal(0)
	local var24, var25 = signalsModule.createSignal(false)
	local var26 = signalsModule.createComputed(function(p3)
		-- upvalues: var14 (ref), var10 (ref)
		local var27 = var14(p3)
		
		if var27 <= 0 then
			return nil
		end
		local var28 = var10.getMarketplaceAssetInfo(tostring(var27)).data(p3)
		
		return if var28 then {
			name = var28.name,
			creatorName = var28.creatorName,
			creatorHasVerifiedBadge = var28.creatorHasVerifiedBadge
		} else nil
	end)
	local var27 = false
	local var28 = signalsModule.createComputed(function(p3)
		-- upvalues: var16 (ref), var27 (write), loadingScreenTelemetryModule (copy), var12 (ref)
		local var29 = var16(p3)
		
		if var29 <= 0 then
			if not var27 then
				var27 = true
				loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
			end
			return nil
		else
			local var30 = var12.getAndFetchItem(tostring(var29)).data(p3)
			
			return if var30 then var30.IsPlayerChoiceEnabled else nil
		end
	end)
	local var29 = false
	local var30 = false
	local var31 = nil
	local var32 = nil
	local var33 = nil
	local var34 = nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	local var39 = false
	local var40 = false
	
	local _ = function(p3)
		if p3 and coroutine.status(p3) ~= "dead" then
			task.cancel(p3)
		end
	end
	
	local _ = function(p3)
		if p3 then
			p3:Disconnect()
		end
		return nil
	end
	
	local _ = function()
		-- upvalues: fFlagEnableLuaAppsFollowUserId_1 (copy), var4 (ref)
		if not fFlagEnableLuaAppsFollowUserId_1 or not var4.GetFollowUserId then
			return 0
		end
		local ok, status = pcall(var4.GetFollowUserId, var4)
		
		return if ok and type(status) == "number" then status else 0
	end
	
	local _ = function()
		-- upvalues: var4 (ref)
		if not var4.GetFollowUserId then
			return 0
		end
		local ok, status = pcall(var4.GetFollowUserId, var4)
		
		return if ok and type(status) == "number" then status else 0
	end
	
	local _ = function()
		-- upvalues: queuePositionEnabledEngineFeature (copy), var4 (ref)
		if not queuePositionEnabledEngineFeature or not var4.GetQueuePosition then
			return nil
		end
		local ok, status = pcall(var4.GetQueuePosition, var4)
		
		return if ok and type(status) == "number" then status else nil
	end
	
	local function updateQueuePosition()
		-- upvalues: var23 (ref), queuePositionEnabledEngineFeature (copy), var4 (ref)
		local var41
		if queuePositionEnabledEngineFeature and var4.GetQueuePosition then
			local ok, status = pcall(var4.GetQueuePosition, var4)
			var41 = if ok and type(status) == "number" then status else nil
		else
			var41 = nil
		end
		var23(var41)
	end
	
	local _ = function(p3)
		-- upvalues: var39 (write), constantsModule (copy), var14 (ref), var4 (ref), queueExperimentation (copy)
		if not var39 and p3 == constantsModule.QUEUED_STATE and var14(false) > 0 then
			local var41
			if var4.GetFollowUserId then
				local ok, status = pcall(var4.GetFollowUserId, var4)
				var41 = if ok and type(status) == "number" then status else 0
			else
				var41 = 0
			end
			if var41 <= 0 or not queueExperimentation.isInExperiment() then
				return
			else
				var39 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local function updateJoinState(p3)
		-- upvalues: var21 (ref), constantsModule (copy), var23 (ref), var39 (write), var14 (ref), var4 (ref), queueExperimentation (copy)
		if type(p3) ~= "string" then return end
		var21(p3)
		
		if p3 ~= constantsModule.QUEUED_STATE then
			var23(nil)
		end
		if not var39 and p3 == constantsModule.QUEUED_STATE and var14(false) > 0 then
			local var41
			if var4.GetFollowUserId then
				local ok, status = pcall(var4.GetFollowUserId, var4)
				var41 = if ok and type(status) == "number" then status else 0
			else
				var41 = 0
			end
			if var41 > 0 then
				if not queueExperimentation.isInExperiment() then return end
				var39 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local _ = function(p3)
		-- upvalues: var30 (write), var16 (ref), var17 (ref), var32 (write)
		if var30 or p3 <= 0 or var16(false) > 0 then return end
		var17(p3)
		
		if var32 then
			var32:Disconnect()
		end
		var32 = nil
	end
	
	local function watchUniverseId()
		-- upvalues: var32 (write), var30 (write), var16 (ref), var3 (ref), var17 (ref)
		local var41 = var32
		
		if var41 then
			var41:Disconnect()
		end
		var32 = nil
		
		if var30 or var16(false) > 0 then return end
		var32 = var3:GetPropertyChangedSignal("GameId"):Connect(function()
			-- upvalues: var3 (copy), var30 (copy), var16 (copy), var17 (copy), var32 (copy)
			local gameId = var3.GameId
			
			if not var30 and gameId > 0 then
				if var16(false) > 0 then return end
				var17(gameId)
				local var42 = var32
				
				if var42 then
					var42:Disconnect()
				end
				var32 = nil
			end
		end)
		local gameId = var3.GameId
		
		if not var30 and gameId > 0 then
			if var16(false) > 0 then return end
			var17(gameId)
			local var42 = var32
			
			if var42 then
				var42:Disconnect()
			end
			var32 = nil
		end
	end
	
	local _ = function(p3)
		-- upvalues: var16 (ref), var37 (write), var6 (ref), var30 (write), var14 (ref), var17 (ref), var32 (write)
		if var16(false) > 0 then return end
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var6 (copy), p3 (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
			local ok, status = pcall(var6, p3)
			
			if not var30 and p3 == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
				if var16(false) > 0 then return end
				var17(status)
				local var41 = var32
				
				if var41 then
					var41:Disconnect()
				end
				var32 = nil
			end
		end)
	end
	
	local _ = function(p3)
		-- upvalues: var36 (write), var7 (ref), var30 (write), var14 (ref), var10 (ref)
		if var36 and coroutine.status(var36) ~= "dead" then
			task.cancel(var36)
		end
		var36 = task.defer(function()
			-- upvalues: var7 (copy), p3 (ref), var30 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p3)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var30 or p3 ~= var14(false) then return end
			local var41
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var42 = tostring(p3)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				var41 = creator.HasVerifiedBadge == true
				var41 = nil
			else
				var41 = false
			end
			t.creatorHasVerifiedBadge = var41
			updateMarketplaceAssetInfo(var42, t)
		end)
	end
	
	local _ = function()
		-- upvalues: var38 (write), var8 (ref), var30 (write), var25 (ref)
		if var38 and coroutine.status(var38) ~= "dead" then
			task.cancel(var38)
		end
		var38 = task.defer(function()
			-- upvalues: var8 (copy), var30 (copy), var25 (copy)
			local ok, status = pcall(var8)
			
			if not var30 and ok and type(status) == "boolean" then
				var25(status)
			end
		end)
	end
	
	local _ = function(p3)
		-- upvalues: var36 (write), var7 (ref), var30 (write), var14 (ref), var10 (ref), var16 (ref), var37 (write), var6 (ref), var17 (ref), var32 (write)
		if p3 <= 0 then return end
		if var36 and coroutine.status(var36) ~= "dead" then
			task.cancel(var36)
		end
		var36 = task.defer(function()
			-- upvalues: var7 (copy), p3 (ref), var30 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p3)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var30 or p3 ~= var14(false) then return end
			local var41
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var42 = tostring(p3)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				local var41 = creator.HasVerifiedBadge == true
				var41 = nil
			else
				var41 = false
			end
			t.creatorHasVerifiedBadge = var41
			updateMarketplaceAssetInfo(var42, t)
		end)
		
		if var16(false) > 0 then return end
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var6 (copy), p3 (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
			local ok, status = pcall(var6, p3)
			
			if not var30 and p3 == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
				if var16(false) > 0 then return end
				var17(status)
				local var41 = var32
				
				if var41 then
					var41:Disconnect()
				end
				var32 = nil
			end
		end)
	end
	
	local _ = function(p3)
		-- upvalues: var30 (write), var14 (ref), var15 (ref), var31 (write), var36 (write), var7 (ref), var10 (ref), var16 (ref), var37 (write), var6 (ref), var17 (ref), var32 (write)
		if var30 or p3 <= 0 or var14(false) == p3 then return end
		var15(p3)
		local var41 = var31
		
		if var41 then
			var41:Disconnect()
		end
		var31 = nil
		
		if p3 <= 0 then return end
		if var36 and coroutine.status(var36) ~= "dead" then
			task.cancel(var36)
		end
		var36 = task.defer(function()
			-- upvalues: var7 (copy), p3 (ref), var30 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p3)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var30 or p3 ~= var14(false) then return end
			local var42
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var43 = tostring(p3)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				local var42 = creator.HasVerifiedBadge == true
				var42 = nil
			else
				var42 = false
			end
			t.creatorHasVerifiedBadge = var42
			updateMarketplaceAssetInfo(var43, t)
		end)
		
		if var16(false) > 0 then return end
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var6 (copy), p3 (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
			local ok, status = pcall(var6, p3)
			
			if not var30 and p3 == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
				if var16(false) > 0 then return end
				var17(status)
				local var42 = var32
				
				if var42 then
					var42:Disconnect()
				end
				var32 = nil
			end
		end)
	end
	
	return {
		getAssetInfo = var26,
		getFollowUserId = ok,
		getIsAutoTranslated = var28,
		getIsSubjectToChinaPolicies = var24,
		getJoinState = var20,
		getQueuePosition = var22,
		getQueueTreatment = var19,
		getServerStatusText = createSignal,
		getUniverseId = var16,
		launchExperience = function()
			-- upvalues: var14 (ref), var4 (ref)
			local var41 = var14(false)
			
			if var41 > 0 and var4.LaunchExperience then
				var4:LaunchExperience({ placeId = var41 })
			end
		end,
		logQueuedStateButtonClick = function(p3, p4)
			-- upvalues: var18 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId_1 (copy), ok (ref), var14 (ref), queuePositionEnabledEngineFeature (copy), var22 (ref), var16 (ref)
			if var18 then
				loadingScreenTelemetryModule.logQueuedStateButtonClick({
					buttonName = p3,
					joinTargetUserId = if fFlagEnableLuaAppsFollowUserId_1 then ok(false) else nil,
					placeId = var14(false),
					positionInQueue = if queuePositionEnabledEngineFeature then var22(false) else nil,
					timeElapsedMs = p4,
					universeId = var16(false)
				})
				
				return
			end
		end,
		showConnectionHealth = function()
			-- upvalues: var5 (ref), var40 (write)
			if var5.ShowStatsBasedOnInputString then
				var40 = true
				var5:ShowStatsBasedOnInputString("ConnectionHealth")
			end
		end,
		start = function()
			-- upvalues: var29 (write), var30 (write), var14 (ref), var31 (write), var3 (ref), var15 (ref), var36 (write), var7 (ref), var10 (ref), var16 (ref), var37 (write), var6 (ref), var17 (ref), var32 (write), watchUniverseId (ref), var38 (write), var8 (ref), var25 (ref), var45 (ref), fFlagEnableLuaAppsFollowUserId_1 (copy), var4 (ref), var5 (ref), var35 (write), var2 (ref), queueExperimentation (copy), var21 (ref), constantsModule (copy), var23 (ref), var39 (write), var33 (write), updateJoinState (ref), queuePositionEnabledEngineFeature (copy), var34 (write), updateQueuePosition (ref)
			if var29 or var30 then return end
			var29 = true
			
			if var14(false) <= 0 then
				var31 = var3:GetPropertyChangedSignal("PlaceId"):Connect(function()
					-- upvalues: var3 (copy), var30 (copy), var14 (copy), var15 (copy), var31 (copy), var36 (copy), var7 (copy), var10 (copy), var16 (copy), var37 (copy), var6 (copy), var17 (copy), var32 (copy)
					local placeId = var3.PlaceId
					
					if not var30 and placeId > 0 then
						if var14(false) == placeId then return end
						var15(placeId)
						local var41 = var31
						
						if var41 then
							var41:Disconnect()
						end
						var31 = nil
						
						if placeId <= 0 then return end
						if var36 and coroutine.status(var36) ~= "dead" then
							task.cancel(var36)
						end
						var36 = task.defer(function()
							-- upvalues: var7 (copy), placeId (ref), var30 (copy), var14 (copy), var10 (copy)
							local ok, status = pcall(var7, placeId)
							
							if not ok then
								print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
								
								return
							elseif var30 or placeId ~= var14(false) then return end
							local var42
							local creator = status.Creator
							local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
							local var43 = tostring(placeId)
							local t = {
								name = status.Name or "",
								creatorName = if creator then creator.Name or "" else ""
							}
							
							if creator then
								local var42 = creator.HasVerifiedBadge == true
								var42 = nil
							else
								var42 = false
							end
							t.creatorHasVerifiedBadge = var42
							updateMarketplaceAssetInfo(var43, t)
						end)
						
						if var16(false) > 0 then return end
						if var37 and coroutine.status(var37) ~= "dead" then
							task.cancel(var37)
						end
						var37 = task.defer(function()
							-- upvalues: var6 (copy), placeId (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
							local ok, status = pcall(var6, placeId)
							
							if not var30 and placeId == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
								if var16(false) > 0 then return end
								var17(status)
								local var42 = var32
								
								if var42 then
									var42:Disconnect()
								end
								var32 = nil
							end
						end)
					end
				end)
			end
			watchUniverseId()
			
			if var38 and coroutine.status(var38) ~= "dead" then
				task.cancel(var38)
			end
			local var41, ok_2
			var38 = task.defer(function()
				-- upvalues: var8 (copy), var30 (copy), var25 (copy)
				local ok, status = pcall(var8)
				
				if not var30 and ok and type(status) == "boolean" then
					var25(status)
				end
			end)
			
			if fFlagEnableLuaAppsFollowUserId_1 and var4.GetFollowUserId then
				ok_2, status = pcall(var4.GetFollowUserId, var4)
				var41 = if ok_2 and type(status) == "number" then status else 0
			else
				var41 = 0
			end
			local var42
			var45(var41)
			
			if var5.UiMessageChanged then
				var35 = var5.UiMessageChanged:Connect(function(p3, p4)
					-- upvalues: var2 (copy)
					if p3 == Enum.UiMessageType.UiMessageInfo and type(p4) == "string" then
						var2(p4)
					end
				end)
			end
			if var5.GetUiMessage then
				ok_2, status = pcall(var5.GetUiMessage, var5)
				var42 = if ok_2 and type(status) == "string" then status else ""
			else
				var42 = ""
			end
			var2(var42)
			
			if queueExperimentation.isInExperiment() then
				local status
				if var4.GetPlaceJoinState then
					local ok_2, status = pcall(var4.GetPlaceJoinState, var4)
					
					if ok_2 and type(status) == "string" then
						var21(status)
						
						if status ~= constantsModule.QUEUED_STATE then
							var23(nil)
						end
						if not var39 and status == constantsModule.QUEUED_STATE and var14(false) > 0 then
							if var4.GetFollowUserId then
								status, status_1 = pcall(var4.GetFollowUserId, var4)
								ok_2 = if status and type(status_1) == "number" then status_1 else 0
							else
								ok_2 = 0
							end
							if ok_2 > 0 and queueExperimentation.isInExperiment() then
								var39 = true
								queueExperimentation.logExposure()
							end
						end
					end
				end
				if var4.PlaceJoinStateChanged then
					var33 = var4.PlaceJoinStateChanged:Connect(updateJoinState)
				end
				if queuePositionEnabledEngineFeature and var4.QueuePositionChanged then
					var34 = var4.QueuePositionChanged:Connect(updateQueuePosition)
				end
				if queuePositionEnabledEngineFeature then
					local var43
					local var44 = var23
					
					if queuePositionEnabledEngineFeature and var4.GetQueuePosition then
						ok_2, status = pcall(var4.GetQueuePosition, var4)
						var43 = if ok_2 and type(status) == "number" then status else nil
					else
						var43 = nil
					end
					var44(var43)
				end
			end
			if var14(false) <= 0 then
				local placeId = var3.PlaceId
				
				if var30 or placeId <= 0 then return end
				if var14(false) == placeId then return end
				var15(placeId)
				ok_2 = var31
				
				if ok_2 then
					ok_2:Disconnect()
				end
				var31 = nil
				
				if placeId <= 0 then return end
				if var36 and coroutine.status(var36) ~= "dead" then
					task.cancel(var36)
				end
				var36 = task.defer(function()
					-- upvalues: var7 (copy), placeId (ref), var30 (copy), var14 (copy), var10 (copy)
					local ok, status = pcall(var7, placeId)
					
					if not ok then
						print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
						
						return
					elseif var30 or placeId ~= var14(false) then return end
					local var45
					local creator = status.Creator
					local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
					local var46 = tostring(placeId)
					local t = {
						name = status.Name or "",
						creatorName = if creator then creator.Name or "" else ""
					}
					
					if creator then
						local var45 = creator.HasVerifiedBadge == true
						var45 = nil
					else
						var45 = false
					end
					t.creatorHasVerifiedBadge = var45
					updateMarketplaceAssetInfo(var46, t)
				end)
				
				if var16(false) > 0 then return end
				if var37 and coroutine.status(var37) ~= "dead" then
					task.cancel(var37)
				end
				var37 = task.defer(function()
					-- upvalues: var6 (copy), placeId (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
					local ok, status = pcall(var6, placeId)
					
					if not var30 and placeId == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
						if var16(false) > 0 then return end
						var17(status)
						local var45 = var32
						
						if var45 then
							var45:Disconnect()
						end
						var32 = nil
					end
				end)
				
				return
			else
				local var45 = var14(false)
				
				if var45 <= 0 then return end
				local var46 = var36
				
				if var46 and coroutine.status(var46) ~= "dead" then
					task.cancel(var46)
				end
				var36 = task.defer(function()
					-- upvalues: var7 (copy), var45 (ref), var30 (copy), var14 (copy), var10 (copy)
					local ok, status = pcall(var7, var45)
					
					if not ok then
						print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
						
						return
					elseif var30 or var45 ~= var14(false) then return end
					local var47
					local creator = status.Creator
					local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
					local var48 = tostring(var45)
					local t = {
						name = status.Name or "",
						creatorName = if creator then creator.Name or "" else ""
					}
					
					if creator then
						local var47 = creator.HasVerifiedBadge == true
						var47 = nil
					else
						var47 = false
					end
					t.creatorHasVerifiedBadge = var47
					updateMarketplaceAssetInfo(var48, t)
				end)
				
				if var16(false) > 0 then return end
				local var47 = var37
				
				if var47 and coroutine.status(var47) ~= "dead" then
					task.cancel(var47)
				end
				var37 = task.defer(function()
					-- upvalues: var6 (copy), var45 (ref), var30 (copy), var14 (copy), var16 (copy), var17 (copy), var32 (copy)
					local ok, status = pcall(var6, var45)
					
					if not var30 and var45 == var14(false) and (ok and type(status) == "number") and (not var30 and status > 0) then
						if var16(false) > 0 then return end
						var17(status)
						local var48 = var32
						
						if var48 then
							var48:Disconnect()
						end
						var32 = nil
					end
				end)
			end
		end,
		destroy = function()
			-- upvalues: var30 (write), var31 (write), var32 (write), var33 (write), var34 (write), var35 (write), var36 (write), var37 (write), var38 (write), var12 (ref), var11 (ref), var40 (write), var5 (ref), userInputService (copy)
			if var30 then return end
			var30 = true
			
			if var31 then
				var31:Disconnect()
			end
			var31 = nil
			
			if var32 then
				var32:Disconnect()
			end
			var32 = nil
			
			if var33 then
				var33:Disconnect()
			end
			var33 = nil
			
			if var34 then
				var34:Disconnect()
			end
			var34 = nil
			local var41 = var35
			
			if var41 then
				var41:Disconnect()
			end
			var35 = nil
			local var42 = var36
			
			if var42 and coroutine.status(var42) ~= "dead" then
				task.cancel(var42)
			end
			local var43 = var37
			
			if var43 and coroutine.status(var43) ~= "dead" then
				task.cancel(var43)
			end
			local var44 = var38
			
			if var44 and coroutine.status(var44) ~= "dead" then
				task.cancel(var44)
			end
			var12.clear()
			var11.clear()
			var12.dispose()
			
			if var40 and var5.CloseStatsBasedOnInputString then
				local inputBeganConnection = nil
				inputBeganConnection = userInputService.InputBegan:Connect(function()
					-- upvalues: inputBeganConnection (write), var5 (copy)
					if inputBeganConnection then
						inputBeganConnection:Disconnect()
						inputBeganConnection = nil
					end
					var5:CloseStatsBasedOnInputString("ConnectionHealth")
				end)
			end
		end
	}
end