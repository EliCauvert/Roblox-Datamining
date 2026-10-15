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

return function(p1, p2, p3)
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
		logError = function(p4)
			-- upvalues: loadingScreenTelemetryModule (copy)
			if type(p4) == "table" then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p4.responseCode, errorType = p4.errorType })
				
				return
			end
			loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
		end,
		fetchFn = function(p4)
			-- upvalues: var9 (ref)
			return var9(p4)
		end
	})
	local var13 = if p3 == nil and p1 <= 0 then var3.PlaceId else p1
	local var14, var15 = signalsModule.createSignal(if var13 > 0 then var13 else 0)
	local var16 = if p3 ~= nil then var3.GameId else p3
	local var17, var18 = signalsModule.createSignal(if var16 > 0 then var16 else 0)
	local var19 = if p3 ~= nil then if not placeJoinStateEnabledEngineFeature then nil elseif queueExperimentation.getIsAutoJoinNewServerEnabled() then constantsModule.AUTO_JOIN_TREATMENT elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then constantsModule.JOIN_NEW_SERVER_TREATMENT else nil else nil
	local var20 = signalsModule.createSignal(var19)
	local var21, var22 = signalsModule.createSignal("")
	local var23, var24 = signalsModule.createSignal(nil)
	local createSignal = signalsModule.createSignal
	
	if p3 ~= nil then
		var2 = ""
	elseif var5.GetUiMessage then
		ok, status = pcall(var5.GetUiMessage, var5)
		var2 = if ok and type(status) == "string" then status else ""
	else
		var2 = ""
	end
	createSignal, var45 = createSignal(var2)
	ok, var46 = signalsModule.createSignal(0)
	local var25, var26 = signalsModule.createSignal(false)
	local var27 = signalsModule.createComputed(function(p4)
		-- upvalues: var14 (ref), var10 (ref)
		local var28 = var14(p4)
		
		if var28 <= 0 then
			return nil
		end
		local var29 = var10.getMarketplaceAssetInfo(tostring(var28)).data(p4)
		
		return if var29 then {
			name = var29.name,
			creatorName = var29.creatorName,
			creatorHasVerifiedBadge = var29.creatorHasVerifiedBadge
		} else nil
	end)
	local var28 = false
	local var29 = signalsModule.createComputed(function(p4)
		-- upvalues: var17 (ref), var28 (write), loadingScreenTelemetryModule (copy), var12 (ref)
		local var30 = var17(p4)
		
		if var30 <= 0 then
			if not var28 then
				var28 = true
				loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
			end
			return nil
		else
			local var31 = var12.getAndFetchItem(tostring(var30)).data(p4)
			
			return if var31 then var31.IsPlayerChoiceEnabled else nil
		end
	end)
	local var30 = false
	local var31 = false
	local var32 = nil
	local var33 = nil
	local var34 = nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	local var39 = nil
	local var40 = false
	local var41 = false
	
	local _ = function(p4)
		if p4 and coroutine.status(p4) ~= "dead" then
			task.cancel(p4)
		end
	end
	
	local _ = function(p4)
		if p4 then
			p4:Disconnect()
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
		-- upvalues: var24 (ref), queuePositionEnabledEngineFeature (copy), var4 (ref)
		local var42
		if queuePositionEnabledEngineFeature and var4.GetQueuePosition then
			local ok, status = pcall(var4.GetQueuePosition, var4)
			var42 = if ok and type(status) == "number" then status else nil
		else
			var42 = nil
		end
		var24(var42)
	end
	
	local _ = function(p4)
		-- upvalues: var40 (write), constantsModule (copy), var14 (ref), var4 (ref), queueExperimentation (copy)
		if not var40 and p4 == constantsModule.QUEUED_STATE and var14(false) > 0 then
			local var42
			if var4.GetFollowUserId then
				local ok, status = pcall(var4.GetFollowUserId, var4)
				var42 = if ok and type(status) == "number" then status else 0
			else
				var42 = 0
			end
			if var42 <= 0 or not queueExperimentation.isInExperiment() then
				return
			else
				var40 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local function updateJoinState(p4)
		-- upvalues: var22 (ref), constantsModule (copy), var24 (ref), var40 (write), var14 (ref), var4 (ref), queueExperimentation (copy)
		if type(p4) ~= "string" then return end
		var22(p4)
		
		if p4 ~= constantsModule.QUEUED_STATE then
			var24(nil)
		end
		if not var40 and p4 == constantsModule.QUEUED_STATE and var14(false) > 0 then
			local var42
			if var4.GetFollowUserId then
				local ok, status = pcall(var4.GetFollowUserId, var4)
				var42 = if ok and type(status) == "number" then status else 0
			else
				var42 = 0
			end
			if var42 > 0 then
				if not queueExperimentation.isInExperiment() then return end
				var40 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local _ = function(p4)
		-- upvalues: var31 (write), var17 (ref), var18 (ref), var33 (write)
		if var31 or p4 <= 0 or var17(false) > 0 then return end
		var18(p4)
		
		if var33 then
			var33:Disconnect()
		end
		var33 = nil
	end
	
	local function watchUniverseId()
		-- upvalues: var33 (write), var31 (write), var17 (ref), var3 (ref), var18 (ref)
		local var42 = var33
		
		if var42 then
			var42:Disconnect()
		end
		var33 = nil
		
		if var31 or var17(false) > 0 then return end
		var33 = var3:GetPropertyChangedSignal("GameId"):Connect(function()
			-- upvalues: var3 (copy), var31 (copy), var17 (copy), var18 (copy), var33 (copy)
			local gameId = var3.GameId
			
			if not var31 and gameId > 0 then
				if var17(false) > 0 then return end
				var18(gameId)
				local var43 = var33
				
				if var43 then
					var43:Disconnect()
				end
				var33 = nil
			end
		end)
		local gameId = var3.GameId
		
		if not var31 and gameId > 0 then
			if var17(false) > 0 then return end
			var18(gameId)
			local var43 = var33
			
			if var43 then
				var43:Disconnect()
			end
			var33 = nil
		end
	end
	
	local _ = function(p4)
		-- upvalues: var17 (ref), var38 (write), var6 (ref), var31 (write), var14 (ref), var18 (ref), var33 (write)
		if var17(false) > 0 then return end
		if var38 and coroutine.status(var38) ~= "dead" then
			task.cancel(var38)
		end
		var38 = task.defer(function()
			-- upvalues: var6 (copy), p4 (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
			local ok, status = pcall(var6, p4)
			
			if not var31 and p4 == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
				if var17(false) > 0 then return end
				var18(status)
				local var42 = var33
				
				if var42 then
					var42:Disconnect()
				end
				var33 = nil
			end
		end)
	end
	
	local _ = function(p4)
		-- upvalues: var37 (write), var7 (ref), var31 (write), var14 (ref), var10 (ref)
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var7 (copy), p4 (ref), var31 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p4)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var31 or p4 ~= var14(false) then return end
			local var42
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var43 = tostring(p4)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				var42 = creator.HasVerifiedBadge == true
				var42 = nil
			else
				var42 = false
			end
			t.creatorHasVerifiedBadge = var42
			updateMarketplaceAssetInfo(var43, t)
		end)
	end
	
	local _ = function()
		-- upvalues: var39 (write), var8 (ref), var31 (write), var26 (ref)
		if var39 and coroutine.status(var39) ~= "dead" then
			task.cancel(var39)
		end
		var39 = task.defer(function()
			-- upvalues: var8 (copy), var31 (copy), var26 (copy)
			local ok, status = pcall(var8)
			
			if not var31 and ok and type(status) == "boolean" then
				var26(status)
			end
		end)
	end
	
	local _ = function(p4)
		-- upvalues: var37 (write), var7 (ref), var31 (write), var14 (ref), var10 (ref), var17 (ref), var38 (write), var6 (ref), var18 (ref), var33 (write)
		if p4 <= 0 then return end
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var7 (copy), p4 (ref), var31 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p4)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var31 or p4 ~= var14(false) then return end
			local var42
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var43 = tostring(p4)
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
		
		if var17(false) > 0 then return end
		if var38 and coroutine.status(var38) ~= "dead" then
			task.cancel(var38)
		end
		var38 = task.defer(function()
			-- upvalues: var6 (copy), p4 (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
			local ok, status = pcall(var6, p4)
			
			if not var31 and p4 == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
				if var17(false) > 0 then return end
				var18(status)
				local var42 = var33
				
				if var42 then
					var42:Disconnect()
				end
				var33 = nil
			end
		end)
	end
	
	local _ = function(p4)
		-- upvalues: var31 (write), var14 (ref), var15 (ref), var32 (write), var37 (write), var7 (ref), var10 (ref), var17 (ref), var38 (write), var6 (ref), var18 (ref), var33 (write)
		if var31 or p4 <= 0 or var14(false) == p4 then return end
		var15(p4)
		local var42 = var32
		
		if var42 then
			var42:Disconnect()
		end
		var32 = nil
		
		if p4 <= 0 then return end
		if var37 and coroutine.status(var37) ~= "dead" then
			task.cancel(var37)
		end
		var37 = task.defer(function()
			-- upvalues: var7 (copy), p4 (ref), var31 (copy), var14 (copy), var10 (copy)
			local ok, status = pcall(var7, p4)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var31 or p4 ~= var14(false) then return end
			local var43
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
			local var44 = tostring(p4)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				local var43 = creator.HasVerifiedBadge == true
				var43 = nil
			else
				var43 = false
			end
			t.creatorHasVerifiedBadge = var43
			updateMarketplaceAssetInfo(var44, t)
		end)
		
		if var17(false) > 0 then return end
		if var38 and coroutine.status(var38) ~= "dead" then
			task.cancel(var38)
		end
		var38 = task.defer(function()
			-- upvalues: var6 (copy), p4 (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
			local ok, status = pcall(var6, p4)
			
			if not var31 and p4 == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
				if var17(false) > 0 then return end
				var18(status)
				local var43 = var33
				
				if var43 then
					var43:Disconnect()
				end
				var33 = nil
			end
		end)
	end
	
	return {
		getAssetInfo = var27,
		getFollowUserId = ok,
		getIsAutoTranslated = var29,
		getIsSubjectToChinaPolicies = var25,
		getJoinState = var21,
		getQueuePosition = var23,
		getQueueTreatment = var20,
		getServerStatusText = createSignal,
		getUniverseId = var17,
		launchExperience = function()
			-- upvalues: var14 (ref), var4 (ref)
			local var42 = var14(false)
			
			if var42 > 0 and var4.LaunchExperience then
				var4:LaunchExperience({ placeId = var42 })
			end
		end,
		logQueuedStateButtonClick = function(p4, p5)
			-- upvalues: var19 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId_1 (copy), ok (ref), var14 (ref), queuePositionEnabledEngineFeature (copy), var23 (ref), var17 (ref)
			if var19 then
				loadingScreenTelemetryModule.logQueuedStateButtonClick({
					buttonName = p4,
					joinTargetUserId = if fFlagEnableLuaAppsFollowUserId_1 then ok(false) else nil,
					placeId = var14(false),
					positionInQueue = if queuePositionEnabledEngineFeature then var23(false) else nil,
					timeElapsedMs = p5,
					universeId = var17(false)
				})
				
				return
			end
		end,
		showConnectionHealth = function()
			-- upvalues: var5 (ref), var41 (write)
			if var5.ShowStatsBasedOnInputString then
				var41 = true
				var5:ShowStatsBasedOnInputString("ConnectionHealth")
			end
		end,
		start = function()
			-- upvalues: var30 (write), var31 (write), p3 (ref), var39 (write), var8 (ref), var26 (ref), var14 (ref), var37 (write), var7 (ref), var10 (ref), var17 (ref), var38 (write), var6 (ref), var18 (ref), var33 (write), var32 (write), var3 (ref), var15 (ref), watchUniverseId (ref), var46 (ref), fFlagEnableLuaAppsFollowUserId_1 (copy), var4 (ref), var5 (ref), var36 (write), var2 (ref), queueExperimentation (copy), var22 (ref), constantsModule (copy), var24 (ref), var40 (write), var34 (write), updateJoinState (ref), queuePositionEnabledEngineFeature (copy), var35 (write), updateQueuePosition (ref)
			if var30 or var31 then return end
			var30 = true
			
			if p3 == nil then
				if var14(false) <= 0 then
					var32 = var3:GetPropertyChangedSignal("PlaceId"):Connect(function()
						-- upvalues: var3 (copy), var31 (copy), var14 (copy), var15 (copy), var32 (copy), var37 (copy), var7 (copy), var10 (copy), var17 (copy), var38 (copy), var6 (copy), var18 (copy), var33 (copy)
						local placeId = var3.PlaceId
						
						if not var31 and placeId > 0 then
							if var14(false) == placeId then return end
							var15(placeId)
							local var42 = var32
							
							if var42 then
								var42:Disconnect()
							end
							var32 = nil
							
							if placeId <= 0 then return end
							if var37 and coroutine.status(var37) ~= "dead" then
								task.cancel(var37)
							end
							var37 = task.defer(function()
								-- upvalues: var7 (copy), placeId (ref), var31 (copy), var14 (copy), var10 (copy)
								local ok, status = pcall(var7, placeId)
								
								if not ok then
									print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
									
									return
								elseif var31 or placeId ~= var14(false) then return end
								local var43
								local creator = status.Creator
								local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
								local var44 = tostring(placeId)
								local t = {
									name = status.Name or "",
									creatorName = if creator then creator.Name or "" else ""
								}
								
								if creator then
									local var43 = creator.HasVerifiedBadge == true
									var43 = nil
								else
									var43 = false
								end
								t.creatorHasVerifiedBadge = var43
								updateMarketplaceAssetInfo(var44, t)
							end)
							
							if var17(false) > 0 then return end
							if var38 and coroutine.status(var38) ~= "dead" then
								task.cancel(var38)
							end
							var38 = task.defer(function()
								-- upvalues: var6 (copy), placeId (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
								local ok, status = pcall(var6, placeId)
								
								if not var31 and placeId == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
									if var17(false) > 0 then return end
									var18(status)
									local var43 = var33
									
									if var43 then
										var43:Disconnect()
									end
									var33 = nil
								end
							end)
						end
					end)
				end
				watchUniverseId()
				local var42 = var39
				
				if var42 and coroutine.status(var42) ~= "dead" then
					task.cancel(var42)
				end
				local var43, ok_2
				var39 = task.defer(function()
					-- upvalues: var8 (copy), var31 (copy), var26 (copy)
					local ok, status = pcall(var8)
					
					if not var31 and ok and type(status) == "boolean" then
						var26(status)
					end
				end)
				
				if fFlagEnableLuaAppsFollowUserId_1 and var4.GetFollowUserId then
					ok_2, status = pcall(var4.GetFollowUserId, var4)
					var43 = if ok_2 and type(status) == "number" then status else 0
				else
					var43 = 0
				end
				local var44
				var46(var43)
				
				if var5.UiMessageChanged then
					var36 = var5.UiMessageChanged:Connect(function(p4, p5)
						-- upvalues: var2 (copy)
						if p4 == Enum.UiMessageType.UiMessageInfo and type(p5) == "string" then
							var2(p5)
						end
					end)
				end
				if var5.GetUiMessage then
					ok_2, status = pcall(var5.GetUiMessage, var5)
					var44 = if ok_2 and type(status) == "string" then status else ""
				else
					var44 = ""
				end
				var2(var44)
				
				if queueExperimentation.isInExperiment() then
					local status
					if var4.GetPlaceJoinState then
						local ok_2, status = pcall(var4.GetPlaceJoinState, var4)
						
						if ok_2 and type(status) == "string" then
							var22(status)
							
							if status ~= constantsModule.QUEUED_STATE then
								var24(nil)
							end
							if not var40 and status == constantsModule.QUEUED_STATE and var14(false) > 0 then
								if var4.GetFollowUserId then
									status, status_1 = pcall(var4.GetFollowUserId, var4)
									ok_2 = if status and type(status_1) == "number" then status_1 else 0
								else
									ok_2 = 0
								end
								if ok_2 > 0 and queueExperimentation.isInExperiment() then
									var40 = true
									queueExperimentation.logExposure()
								end
							end
						end
					end
					if var4.PlaceJoinStateChanged then
						var34 = var4.PlaceJoinStateChanged:Connect(updateJoinState)
					end
					if queuePositionEnabledEngineFeature and var4.QueuePositionChanged then
						var35 = var4.QueuePositionChanged:Connect(updateQueuePosition)
					end
					if queuePositionEnabledEngineFeature then
						local var45
						local var46 = var24
						
						if queuePositionEnabledEngineFeature and var4.GetQueuePosition then
							ok_2, status = pcall(var4.GetQueuePosition, var4)
							var45 = if ok_2 and type(status) == "number" then status else nil
						else
							var45 = nil
						end
						var46(var45)
					end
				end
				if var14(false) <= 0 then
					local placeId = var3.PlaceId
					
					if var31 or placeId <= 0 then return end
					if var14(false) == placeId then return end
					var15(placeId)
					ok_2 = var32
					
					if ok_2 then
						ok_2:Disconnect()
					end
					var32 = nil
					
					if placeId <= 0 then return end
					local var47 = var37
					
					if var47 and coroutine.status(var47) ~= "dead" then
						task.cancel(var47)
					end
					var37 = task.defer(function()
						-- upvalues: var7 (copy), placeId (ref), var31 (copy), var14 (copy), var10 (copy)
						local ok, status = pcall(var7, placeId)
						
						if not ok then
							print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
							
							return
						elseif var31 or placeId ~= var14(false) then return end
						local var48
						local creator = status.Creator
						local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
						local var49 = tostring(placeId)
						local t = {
							name = status.Name or "",
							creatorName = if creator then creator.Name or "" else ""
						}
						
						if creator then
							local var48 = creator.HasVerifiedBadge == true
							var48 = nil
						else
							var48 = false
						end
						t.creatorHasVerifiedBadge = var48
						updateMarketplaceAssetInfo(var49, t)
					end)
					
					if var17(false) > 0 then return end
					local var48 = var38
					
					if var48 and coroutine.status(var48) ~= "dead" then
						task.cancel(var48)
					end
					var38 = task.defer(function()
						-- upvalues: var6 (copy), placeId (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
						local ok, status = pcall(var6, placeId)
						
						if not var31 and placeId == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
							if var17(false) > 0 then return end
							var18(status)
							local var49 = var33
							
							if var49 then
								var49:Disconnect()
							end
							var33 = nil
						end
					end)
					
					return
				else
					local var49 = var14(false)
					
					if var49 <= 0 then return end
					local var50 = var37
					
					if var50 and coroutine.status(var50) ~= "dead" then
						task.cancel(var50)
					end
					var37 = task.defer(function()
						-- upvalues: var7 (copy), var49 (ref), var31 (copy), var14 (copy), var10 (copy)
						local ok, status = pcall(var7, var49)
						
						if not ok then
							print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
							
							return
						elseif var31 or var49 ~= var14(false) then return end
						local var51
						local creator = status.Creator
						local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
						local var52 = tostring(var49)
						local t = {
							name = status.Name or "",
							creatorName = if creator then creator.Name or "" else ""
						}
						
						if creator then
							local var51 = creator.HasVerifiedBadge == true
							var51 = nil
						else
							var51 = false
						end
						t.creatorHasVerifiedBadge = var51
						updateMarketplaceAssetInfo(var52, t)
					end)
					
					if var17(false) > 0 then return end
					local var51 = var38
					
					if var51 and coroutine.status(var51) ~= "dead" then
						task.cancel(var51)
					end
					var38 = task.defer(function()
						-- upvalues: var6 (copy), var49 (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
						local ok, status = pcall(var6, var49)
						
						if not var31 and var49 == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
							if var17(false) > 0 then return end
							var18(status)
							local var52 = var33
							
							if var52 then
								var52:Disconnect()
							end
							var33 = nil
						end
					end)
				end
			elseif var39 and coroutine.status(var39) ~= "dead" then
				task.cancel(var39)
			end
			var39 = task.defer(function()
				-- upvalues: var8 (copy), var31 (copy), var26 (copy)
				local ok, status = pcall(var8)
				
				if not var31 and ok and type(status) == "boolean" then
					var26(status)
				end
			end)
			local var52 = var14(false)
			
			if var52 <= 0 then return end
			if var37 and coroutine.status(var37) ~= "dead" then
				task.cancel(var37)
			end
			var37 = task.defer(function()
				-- upvalues: var7 (copy), var52 (ref), var31 (copy), var14 (copy), var10 (copy)
				local ok, status = pcall(var7, var52)
				
				if not ok then
					print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
					
					return
				elseif var31 or var52 ~= var14(false) then return end
				local var53
				local creator = status.Creator
				local updateMarketplaceAssetInfo = var10.updateMarketplaceAssetInfo
				local var54 = tostring(var52)
				local t = {
					name = status.Name or "",
					creatorName = if creator then creator.Name or "" else ""
				}
				
				if creator then
					local var53 = creator.HasVerifiedBadge == true
					var53 = nil
				else
					var53 = false
				end
				t.creatorHasVerifiedBadge = var53
				updateMarketplaceAssetInfo(var54, t)
			end)
			
			if var17(false) > 0 then return end
			if var38 and coroutine.status(var38) ~= "dead" then
				task.cancel(var38)
			end
			var38 = task.defer(function()
				-- upvalues: var6 (copy), var52 (ref), var31 (copy), var14 (copy), var17 (copy), var18 (copy), var33 (copy)
				local ok, status = pcall(var6, var52)
				
				if not var31 and var52 == var14(false) and (ok and type(status) == "number") and (not var31 and status > 0) then
					if var17(false) > 0 then return end
					var18(status)
					local var53 = var33
					
					if var53 then
						var53:Disconnect()
					end
					var33 = nil
				end
			end)
		end,
		destroy = function()
			-- upvalues: var31 (write), var32 (write), var33 (write), var34 (write), var35 (write), var36 (write), var37 (write), var38 (write), var39 (write), var12 (ref), var11 (ref), var41 (write), var5 (ref), userInputService (copy)
			if var31 then return end
			var31 = true
			
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
			
			if var35 then
				var35:Disconnect()
			end
			var35 = nil
			local var42 = var36
			
			if var42 then
				var42:Disconnect()
			end
			var36 = nil
			local var43 = var37
			
			if var43 and coroutine.status(var43) ~= "dead" then
				task.cancel(var43)
			end
			local var44 = var38
			
			if var44 and coroutine.status(var44) ~= "dead" then
				task.cancel(var44)
			end
			local var45 = var39
			
			if var45 and coroutine.status(var45) ~= "dead" then
				task.cancel(var45)
			end
			var12.clear()
			var11.clear()
			var12.dispose()
			
			if var41 and var5.CloseStatsBasedOnInputString then
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