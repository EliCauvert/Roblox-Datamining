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
local var17 = httpModule.NetworkLayers.requestInternalWrapper(httpService)

local function defaultFetchUniverseId(p0)
	-- upvalues: httpModule (ref), var17 (ref)
	local var21, var22 = var17(string.format("%suniverses/v1/places/%d/universe", httpModule.Url.APIS_URL, p0), "GET"):await()
	
	return if var21 and var22 and var22.responseBody then var22.responseBody.universeId else nil
end

local function defaultFetchProductInfo(p1)
	-- upvalues: marketplaceService (ref)
	return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:GetProductInfoAsync(p1) else marketplaceService:GetProductInfo(p1)
end

local function defaultFetchPlayerLocalizationChoice(p2)
	-- upvalues: var17 (ref), httpModule (ref)
	return var17(string.format("%sv1/user-localization-settings/player-choice/%s", httpModule.Url.GAME_INTERNATIONALIZATION_URL, p2), "GET"):andThen(function(p3)
		-- upvalues: p2 (ref)
		if not p3 or not p3.responseBody then
			error({
				errorType = "PlayerLocalizationChoiceResponseError",
				responseCode = p3 and p3.responseCode,
				errorMessage = if p3 then "Missing response body" else "No response",
				customFields = { universeId = p2 }
			})
		end
		local responseBody = p3.responseBody
		
		if responseBody.IsPlayerChoiceEnabled == nil then
			error({
				errorType = "PlayerLocalizationChoiceMissingKey",
				errorMessage = "Missing IsPlayerChoiceEnabled in response body",
				responseCode = p3.responseCode,
				customFields = { universeId = p2, responseBody = responseBody }
			})
		end
		return responseBody
	end)
end

local function _()
	-- upvalues: placeJoinStateEnabledEngineFeature (ref), queueExperimentation (ref), constantsModule (ref)
	return if placeJoinStateEnabledEngineFeature then if queueExperimentation.getIsAutoJoinNewServerEnabled() then constantsModule.AUTO_JOIN_TREATMENT elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then constantsModule.JOIN_NEW_SERVER_TREATMENT else nil else nil
end

return function(p4, p5)
	-- upvalues: experienceService (ref), guiService (ref), defaultFetchUniverseId (ref), defaultFetchProductInfo (ref), cachedPolicyServiceModule (ref), defaultFetchPlayerLocalizationChoice (ref), marketplaceGetMarketplaceAssetStoreModule (ref), createDataCache (ref), createDataResolver (ref), loadingScreenTelemetryModule (ref), signalsModule (ref), placeJoinStateEnabledEngineFeature (ref), queueExperimentation (ref), constantsModule (ref), fFlagEnableLuaAppsFollowUserId_1 (ref), queuePositionEnabledEngineFeature (ref), userInputService (ref)
	local var44, ok
	local var23 = if p5 and p5.dataModel then p5.dataModel else game
	local var24 = if p5 and p5.experienceService then p5.experienceService else experienceService
	local var25 = if p5 and p5.guiService then p5.guiService else guiService
	local var26 = if p5 then p5.fetchUniverseId else defaultFetchUniverseId
	local var27 = if p5 then p5.fetchProductInfo else defaultFetchProductInfo
	local var28 = if p5 then p5.fetchIsSubjectToChinaPolicies else function()
		-- upvalues: cachedPolicyServiceModule (copy)
		return cachedPolicyServiceModule:IsSubjectToChinaPolicies()
	end
	local var29 = if p5 then p5.fetchPlayerLocalizationChoice else defaultFetchPlayerLocalizationChoice
	
	local function _()
		-- upvalues: var25 (ref)
		if not var25.GetUiMessage then
			return ""
		end
		local ok, status = pcall(var25.GetUiMessage, var25)
		
		return if ok and type(status) == "string" then status else ""
	end
	
	local var30 = marketplaceGetMarketplaceAssetStoreModule(false)
	local var31 = createDataCache()
	local var32 = createDataResolver({
		supportsMultiGet = false,
		cache = var31,
		logError = function(p6)
			-- upvalues: loadingScreenTelemetryModule (copy)
			if type(p6) == "table" then
				loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ responseCode = p6.responseCode, errorType = p6.errorType })
				
				return
			end
			loadingScreenTelemetryModule.countPlayerLocalizationChoiceFailed({ errorType = "PlayerLocalizationChoiceFetchError" })
		end,
		fetchFn = function(p7)
			-- upvalues: var29 (ref)
			return var29(p7)
		end
	})
	local var33 = if p4 > 0 then p4 else var23.PlaceId
	local var34, var35 = signalsModule.createSignal(if var33 > 0 then var33 else 0)
	local var36, var37 = signalsModule.createSignal(if var23.GameId > 0 then var23.GameId else 0)
	local var38 = if not placeJoinStateEnabledEngineFeature then nil elseif queueExperimentation.getIsAutoJoinNewServerEnabled() then constantsModule.AUTO_JOIN_TREATMENT elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then constantsModule.JOIN_NEW_SERVER_TREATMENT else nil
	local var39 = signalsModule.createSignal(var38)
	local var40, var41 = signalsModule.createSignal("")
	local var42, var43 = signalsModule.createSignal(nil)
	local createSignal = signalsModule.createSignal
	
	if var25.GetUiMessage then
		ok, status = pcall(var25.GetUiMessage, var25)
		var44 = if ok and type(status) == "string" then status else ""
	else
		var44 = ""
	end
	createSignal, var44 = createSignal(var44)
	ok, var45 = signalsModule.createSignal(0)
	local var46, var47 = signalsModule.createSignal(false)
	local var48 = signalsModule.createComputed(function(p8)
		-- upvalues: var34 (ref), var30 (ref)
		local var66 = var34(p8)
		
		if var66 <= 0 then
			return nil
		end
		local var67 = var30.getMarketplaceAssetInfo(tostring(var66)).data(p8)
		
		return if var67 then {
			name = var67.name,
			creatorName = var67.creatorName,
			creatorHasVerifiedBadge = var67.creatorHasVerifiedBadge
		} else nil
	end)
	local var49 = false
	local var50 = signalsModule.createComputed(function(p9)
		-- upvalues: var36 (ref), var49 (write), loadingScreenTelemetryModule (copy), var32 (ref)
		local var68 = var36(p9)
		
		if var68 <= 0 then
			if not var49 then
				var49 = true
				loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
			end
			return nil
		else
			local var69 = var32.getAndFetchItem(tostring(var68)).data(p9)
			
			return if var69 then var69.IsPlayerChoiceEnabled else nil
		end
	end)
	local var51 = false
	local var52 = false
	local var53 = nil
	local var54 = nil
	local var55 = nil
	local var56 = nil
	local var57 = nil
	local var58 = nil
	local var59 = nil
	local var60 = nil
	local var61 = false
	local var62 = false
	
	local _ = function(p10)
		if p10 and coroutine.status(p10) ~= "dead" then
			task.cancel(p10)
		end
	end
	
	local _ = function(p11)
		if p11 then
			p11:Disconnect()
		end
		return nil
	end
	
	local _ = function()
		-- upvalues: fFlagEnableLuaAppsFollowUserId_1 (copy), var24 (ref)
		if not fFlagEnableLuaAppsFollowUserId_1 or not var24.GetFollowUserId then
			return 0
		end
		local ok, status = pcall(var24.GetFollowUserId, var24)
		
		return if ok and type(status) == "number" then status else 0
	end
	
	local _ = function()
		-- upvalues: var24 (ref)
		if not var24.GetFollowUserId then
			return 0
		end
		local ok, status = pcall(var24.GetFollowUserId, var24)
		
		return if ok and type(status) == "number" then status else 0
	end
	
	local _ = function()
		-- upvalues: queuePositionEnabledEngineFeature (copy), var24 (ref)
		if not queuePositionEnabledEngineFeature or not var24.GetQueuePosition then
			return nil
		end
		local ok, status = pcall(var24.GetQueuePosition, var24)
		
		return if ok and type(status) == "number" then status else nil
	end
	
	local function updateQueuePosition()
		-- upvalues: var43 (ref), queuePositionEnabledEngineFeature (copy), var24 (ref)
		local var70
		if queuePositionEnabledEngineFeature and var24.GetQueuePosition then
			local ok, status = pcall(var24.GetQueuePosition, var24)
			var70 = if ok and type(status) == "number" then status else nil
		else
			var70 = nil
		end
		var43(var70)
	end
	
	local _ = function(p12)
		-- upvalues: var61 (write), constantsModule (copy), var34 (ref), var24 (ref), queueExperimentation (copy)
		if not var61 and p12 == constantsModule.QUEUED_STATE and var34(false) > 0 then
			local var71
			if var24.GetFollowUserId then
				local ok, status = pcall(var24.GetFollowUserId, var24)
				var71 = if ok and type(status) == "number" then status else 0
			else
				var71 = 0
			end
			if var71 <= 0 or not queueExperimentation.isInExperiment() then
				return
			else
				var61 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local function updateJoinState(p13)
		-- upvalues: var41 (ref), constantsModule (copy), var43 (ref), var61 (write), var34 (ref), var24 (ref), queueExperimentation (copy)
		if type(p13) ~= "string" then return end
		var41(p13)
		
		if p13 ~= constantsModule.QUEUED_STATE then
			var43(nil)
		end
		if not var61 and p13 == constantsModule.QUEUED_STATE and var34(false) > 0 then
			local var72
			if var24.GetFollowUserId then
				local ok, status = pcall(var24.GetFollowUserId, var24)
				var72 = if ok and type(status) == "number" then status else 0
			else
				var72 = 0
			end
			if var72 > 0 then
				if not queueExperimentation.isInExperiment() then return end
				var61 = true
				queueExperimentation.logExposure()
			end
		end
	end
	
	local _ = function(p14)
		-- upvalues: var52 (write), var36 (ref), var37 (ref), var54 (write)
		if var52 or p14 <= 0 or var36(false) > 0 then return end
		var37(p14)
		
		if var54 then
			var54:Disconnect()
		end
		var54 = nil
	end
	
	local function watchUniverseId()
		-- upvalues: var54 (write), var52 (write), var36 (ref), var23 (ref), var37 (ref)
		local var73 = var54
		
		if var73 then
			var73:Disconnect()
		end
		var54 = nil
		
		if var52 or var36(false) > 0 then return end
		var54 = var23:GetPropertyChangedSignal("GameId"):Connect(function()
			-- upvalues: var23 (copy), var52 (copy), var36 (copy), var37 (copy), var54 (copy)
			local gameId = var23.GameId
			
			if not var52 and gameId > 0 then
				if var36(false) > 0 then return end
				var37(gameId)
				local var75 = var54
				
				if var75 then
					var75:Disconnect()
				end
				var54 = nil
			end
		end)
		local gameId = var23.GameId
		
		if not var52 and gameId > 0 then
			if var36(false) > 0 then return end
			var37(gameId)
			local var74 = var54
			
			if var74 then
				var74:Disconnect()
			end
			var54 = nil
		end
	end
	
	local _ = function(p15)
		-- upvalues: var36 (ref), var59 (write), var26 (ref), var52 (write), var34 (ref), var37 (ref), var54 (write)
		if var36(false) > 0 then return end
		if var59 and coroutine.status(var59) ~= "dead" then
			task.cancel(var59)
		end
		var59 = task.defer(function()
			-- upvalues: var26 (copy), p15 (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
			local ok, status = pcall(var26, p15)
			
			if not var52 and p15 == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
				if var36(false) > 0 then return end
				var37(status)
				local var76 = var54
				
				if var76 then
					var76:Disconnect()
				end
				var54 = nil
			end
		end)
	end
	
	local _ = function(p16)
		-- upvalues: var58 (write), var27 (ref), var52 (write), var34 (ref), var30 (ref)
		if var58 and coroutine.status(var58) ~= "dead" then
			task.cancel(var58)
		end
		var58 = task.defer(function()
			-- upvalues: var27 (copy), p16 (ref), var52 (copy), var34 (copy), var30 (copy)
			local ok, status = pcall(var27, p16)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var52 or p16 ~= var34(false) then return end
			local var79
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
			local var77 = tostring(p16)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				var79 = creator.HasVerifiedBadge == true
				var79 = nil
			else
				var79 = false
			end
			t.creatorHasVerifiedBadge = var79
			updateMarketplaceAssetInfo(var77, t)
		end)
	end
	
	local _ = function()
		-- upvalues: var60 (write), var28 (ref), var52 (write), var47 (ref)
		if var60 and coroutine.status(var60) ~= "dead" then
			task.cancel(var60)
		end
		var60 = task.defer(function()
			-- upvalues: var28 (copy), var52 (copy), var47 (copy)
			local ok, status = pcall(var28)
			
			if not var52 and ok and type(status) == "boolean" then
				var47(status)
			end
		end)
	end
	
	local _ = function(p17)
		-- upvalues: var58 (write), var27 (ref), var52 (write), var34 (ref), var30 (ref), var36 (ref), var59 (write), var26 (ref), var37 (ref), var54 (write)
		if p17 <= 0 then return end
		if var58 and coroutine.status(var58) ~= "dead" then
			task.cancel(var58)
		end
		var58 = task.defer(function()
			-- upvalues: var27 (copy), p17 (ref), var52 (copy), var34 (copy), var30 (copy)
			local ok, status = pcall(var27, p17)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var52 or p17 ~= var34(false) then return end
			local var79
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
			local var77 = tostring(p17)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				local var79 = creator.HasVerifiedBadge == true
				var79 = nil
			else
				var79 = false
			end
			t.creatorHasVerifiedBadge = var79
			updateMarketplaceAssetInfo(var77, t)
		end)
		
		if var36(false) > 0 then return end
		if var59 and coroutine.status(var59) ~= "dead" then
			task.cancel(var59)
		end
		var59 = task.defer(function()
			-- upvalues: var26 (copy), p17 (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
			local ok, status = pcall(var26, p17)
			
			if not var52 and p17 == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
				if var36(false) > 0 then return end
				var37(status)
				local var76 = var54
				
				if var76 then
					var76:Disconnect()
				end
				var54 = nil
			end
		end)
	end
	
	local _ = function(p18)
		-- upvalues: var52 (write), var34 (ref), var35 (ref), var53 (write), var58 (write), var27 (ref), var30 (ref), var36 (ref), var59 (write), var26 (ref), var37 (ref), var54 (write)
		if var52 or p18 <= 0 or var34(false) == p18 then return end
		var35(p18)
		local var80 = var53
		
		if var80 then
			var80:Disconnect()
		end
		var53 = nil
		
		if p18 <= 0 then return end
		if var58 and coroutine.status(var58) ~= "dead" then
			task.cancel(var58)
		end
		var58 = task.defer(function()
			-- upvalues: var27 (copy), p18 (ref), var52 (copy), var34 (copy), var30 (copy)
			local ok, status = pcall(var27, p18)
			
			if not ok then
				print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
				
				return
			elseif var52 or p18 ~= var34(false) then return end
			local var79
			local creator = status.Creator
			local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
			local var77 = tostring(p18)
			local t = {
				name = status.Name or "",
				creatorName = if creator then creator.Name or "" else ""
			}
			
			if creator then
				local var79 = creator.HasVerifiedBadge == true
				var79 = nil
			else
				var79 = false
			end
			t.creatorHasVerifiedBadge = var79
			updateMarketplaceAssetInfo(var77, t)
		end)
		
		if var36(false) > 0 then return end
		if var59 and coroutine.status(var59) ~= "dead" then
			task.cancel(var59)
		end
		var59 = task.defer(function()
			-- upvalues: var26 (copy), p18 (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
			local ok, status = pcall(var26, p18)
			
			if not var52 and p18 == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
				if var36(false) > 0 then return end
				var37(status)
				local var76 = var54
				
				if var76 then
					var76:Disconnect()
				end
				var54 = nil
			end
		end)
	end
	
	return {
		getAssetInfo = var48,
		getFollowUserId = ok,
		getIsAutoTranslated = var50,
		getIsSubjectToChinaPolicies = var46,
		getJoinState = var40,
		getQueuePosition = var42,
		getQueueTreatment = var39,
		getServerStatusText = createSignal,
		getUniverseId = var36,
		launchExperience = function()
			-- upvalues: var34 (ref), var24 (ref)
			local var81 = var34(false)
			
			if var81 > 0 and var24.LaunchExperience then
				var24:LaunchExperience({ placeId = var81 })
			end
		end,
		logQueuedStateButtonClick = function(p19, p20)
			-- upvalues: var38 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId_1 (copy), ok (ref), var34 (ref), queuePositionEnabledEngineFeature (copy), var42 (ref), var36 (ref)
			if var38 then
				loadingScreenTelemetryModule.logQueuedStateButtonClick({
					buttonName = p19,
					joinTargetUserId = if fFlagEnableLuaAppsFollowUserId_1 then ok(false) else nil,
					placeId = var34(false),
					positionInQueue = if queuePositionEnabledEngineFeature then var42(false) else nil,
					timeElapsedMs = p20,
					universeId = var36(false)
				})
				
				return
			end
		end,
		showConnectionHealth = function()
			-- upvalues: var25 (ref), var62 (write)
			if var25.ShowStatsBasedOnInputString then
				var62 = true
				var25:ShowStatsBasedOnInputString("ConnectionHealth")
			end
		end,
		start = function()
			-- upvalues: var51 (write), var52 (write), var34 (ref), var53 (write), var23 (ref), var35 (ref), var58 (write), var27 (ref), var30 (ref), var36 (ref), var59 (write), var26 (ref), var37 (ref), var54 (write), watchUniverseId (ref), var60 (write), var28 (ref), var47 (ref), var45 (ref), fFlagEnableLuaAppsFollowUserId_1 (copy), var24 (ref), var25 (ref), var57 (write), var44 (ref), queueExperimentation (copy), var41 (ref), constantsModule (copy), var43 (ref), var61 (write), var55 (write), updateJoinState (ref), queuePositionEnabledEngineFeature (copy), var56 (write), updateQueuePosition (ref)
			if var51 or var52 then return end
			var51 = true
			
			if var34(false) <= 0 then
				var53 = var23:GetPropertyChangedSignal("PlaceId"):Connect(function()
					-- upvalues: var23 (copy), var52 (copy), var34 (copy), var35 (copy), var53 (copy), var58 (copy), var27 (copy), var30 (copy), var36 (copy), var59 (copy), var26 (copy), var37 (copy), var54 (copy)
					local placeId = var23.PlaceId
					
					if not var52 and placeId > 0 then
						if var34(false) == placeId then return end
						var35(placeId)
						local var89 = var53
						
						if var89 then
							var89:Disconnect()
						end
						var53 = nil
						
						if placeId <= 0 then return end
						if var58 and coroutine.status(var58) ~= "dead" then
							task.cancel(var58)
						end
						var58 = task.defer(function()
							-- upvalues: var27 (copy), placeId (ref), var52 (copy), var34 (copy), var30 (copy)
							local ok, status = pcall(var27, placeId)
							
							if not ok then
								print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
								
								return
							elseif var52 or placeId ~= var34(false) then return end
							local var79
							local creator = status.Creator
							local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
							local var77 = tostring(placeId)
							local t = {
								name = status.Name or "",
								creatorName = if creator then creator.Name or "" else ""
							}
							
							if creator then
								local var79 = creator.HasVerifiedBadge == true
								var79 = nil
							else
								var79 = false
							end
							t.creatorHasVerifiedBadge = var79
							updateMarketplaceAssetInfo(var77, t)
						end)
						
						if var36(false) > 0 then return end
						if var59 and coroutine.status(var59) ~= "dead" then
							task.cancel(var59)
						end
						var59 = task.defer(function()
							-- upvalues: var26 (copy), placeId (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
							local ok, status = pcall(var26, placeId)
							
							if not var52 and placeId == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
								if var36(false) > 0 then return end
								var37(status)
								local var76 = var54
								
								if var76 then
									var76:Disconnect()
								end
								var54 = nil
							end
						end)
					end
				end)
			end
			watchUniverseId()
			
			if var60 and coroutine.status(var60) ~= "dead" then
				task.cancel(var60)
			end
			local var82, ok_2
			var60 = task.defer(function()
				-- upvalues: var28 (copy), var52 (copy), var47 (copy)
				local ok, status = pcall(var28)
				
				if not var52 and ok and type(status) == "boolean" then
					var47(status)
				end
			end)
			
			if fFlagEnableLuaAppsFollowUserId_1 and var24.GetFollowUserId then
				ok_2, status = pcall(var24.GetFollowUserId, var24)
				var82 = if ok_2 and type(status) == "number" then status else 0
			else
				var82 = 0
			end
			local var83
			var45(var82)
			
			if var25.UiMessageChanged then
				var57 = var25.UiMessageChanged:Connect(function(p21, p22)
					-- upvalues: var44 (copy)
					if p21 == Enum.UiMessageType.UiMessageInfo and type(p22) == "string" then
						var44(p22)
					end
				end)
			end
			if var25.GetUiMessage then
				ok_2, status = pcall(var25.GetUiMessage, var25)
				var83 = if ok_2 and type(status) == "string" then status else ""
			else
				var83 = ""
			end
			var44(var83)
			
			if queueExperimentation.isInExperiment() then
				local status
				if var24.GetPlaceJoinState then
					local ok_2, status = pcall(var24.GetPlaceJoinState, var24)
					
					if ok_2 and type(status) == "string" then
						var41(status)
						
						if status ~= constantsModule.QUEUED_STATE then
							var43(nil)
						end
						if not var61 and status == constantsModule.QUEUED_STATE and var34(false) > 0 then
							if var24.GetFollowUserId then
								status, status_1 = pcall(var24.GetFollowUserId, var24)
								ok_2 = if status and type(status_1) == "number" then status_1 else 0
							else
								ok_2 = 0
							end
							if ok_2 > 0 and queueExperimentation.isInExperiment() then
								var61 = true
								queueExperimentation.logExposure()
							end
						end
					end
				end
				if var24.PlaceJoinStateChanged then
					var55 = var24.PlaceJoinStateChanged:Connect(updateJoinState)
				end
				if queuePositionEnabledEngineFeature and var24.QueuePositionChanged then
					var56 = var24.QueuePositionChanged:Connect(updateQueuePosition)
				end
				if queuePositionEnabledEngineFeature then
					local var85
					local var84 = var43
					
					if queuePositionEnabledEngineFeature and var24.GetQueuePosition then
						ok_2, status = pcall(var24.GetQueuePosition, var24)
						var85 = if ok_2 and type(status) == "number" then status else nil
					else
						var85 = nil
					end
					var84(var85)
				end
			end
			if var34(false) <= 0 then
				local placeId = var23.PlaceId
				
				if var52 or placeId <= 0 then return end
				if var34(false) == placeId then return end
				var35(placeId)
				ok_2 = var53
				
				if ok_2 then
					ok_2:Disconnect()
				end
				var53 = nil
				
				if placeId <= 0 then return end
				if var58 and coroutine.status(var58) ~= "dead" then
					task.cancel(var58)
				end
				var58 = task.defer(function()
					-- upvalues: var27 (copy), placeId (ref), var52 (copy), var34 (copy), var30 (copy)
					local ok, status = pcall(var27, placeId)
					
					if not ok then
						print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
						
						return
					elseif var52 or placeId ~= var34(false) then return end
					local var79
					local creator = status.Creator
					local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
					local var77 = tostring(placeId)
					local t = {
						name = status.Name or "",
						creatorName = if creator then creator.Name or "" else ""
					}
					
					if creator then
						local var79 = creator.HasVerifiedBadge == true
						var79 = nil
					else
						var79 = false
					end
					t.creatorHasVerifiedBadge = var79
					updateMarketplaceAssetInfo(var77, t)
				end)
				
				if var36(false) > 0 then return end
				if var59 and coroutine.status(var59) ~= "dead" then
					task.cancel(var59)
				end
				var59 = task.defer(function()
					-- upvalues: var26 (copy), placeId (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
					local ok, status = pcall(var26, placeId)
					
					if not var52 and placeId == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
						if var36(false) > 0 then return end
						var37(status)
						local var76 = var54
						
						if var76 then
							var76:Disconnect()
						end
						var54 = nil
					end
				end)
				
				return
			else
				local var86 = var34(false)
				
				if var86 <= 0 then return end
				local var87 = var58
				
				if var87 and coroutine.status(var87) ~= "dead" then
					task.cancel(var87)
				end
				var58 = task.defer(function()
					-- upvalues: var27 (copy), var86 (ref), var52 (copy), var34 (copy), var30 (copy)
					local ok, status = pcall(var27, var86)
					
					if not ok then
						print(string.format("LoadingScreen:GetGameProductInfo: %s", tostring(status)))
						
						return
					elseif var52 or var86 ~= var34(false) then return end
					local var79
					local creator = status.Creator
					local updateMarketplaceAssetInfo = var30.updateMarketplaceAssetInfo
					local var77 = tostring(var86)
					local t = {
						name = status.Name or "",
						creatorName = if creator then creator.Name or "" else ""
					}
					
					if creator then
						local var79 = creator.HasVerifiedBadge == true
						var79 = nil
					else
						var79 = false
					end
					t.creatorHasVerifiedBadge = var79
					updateMarketplaceAssetInfo(var77, t)
				end)
				
				if var36(false) > 0 then return end
				local var88 = var59
				
				if var88 and coroutine.status(var88) ~= "dead" then
					task.cancel(var88)
				end
				var59 = task.defer(function()
					-- upvalues: var26 (copy), var86 (ref), var52 (copy), var34 (copy), var36 (copy), var37 (copy), var54 (copy)
					local ok, status = pcall(var26, var86)
					
					if not var52 and var86 == var34(false) and (ok and type(status) == "number") and (not var52 and status > 0) then
						if var36(false) > 0 then return end
						var37(status)
						local var76 = var54
						
						if var76 then
							var76:Disconnect()
						end
						var54 = nil
					end
				end)
			end
		end,
		destroy = function()
			-- upvalues: var52 (write), var53 (write), var54 (write), var55 (write), var56 (write), var57 (write), var58 (write), var59 (write), var60 (write), var32 (ref), var31 (ref), var62 (write), var25 (ref), userInputService (copy)
			if var52 then return end
			var52 = true
			
			if var53 then
				var53:Disconnect()
			end
			var53 = nil
			
			if var54 then
				var54:Disconnect()
			end
			var54 = nil
			
			if var55 then
				var55:Disconnect()
			end
			var55 = nil
			
			if var56 then
				var56:Disconnect()
			end
			var56 = nil
			local var90 = var57
			
			if var90 then
				var90:Disconnect()
			end
			var57 = nil
			local var91 = var58
			
			if var91 and coroutine.status(var91) ~= "dead" then
				task.cancel(var91)
			end
			local var92 = var59
			
			if var92 and coroutine.status(var92) ~= "dead" then
				task.cancel(var92)
			end
			local var93 = var60
			
			if var93 and coroutine.status(var93) ~= "dead" then
				task.cancel(var93)
			end
			var32.clear()
			var31.clear()
			var32.dispose()
			
			if var62 and var25.CloseStatsBasedOnInputString then
				local inputBeganConnection = nil
				inputBeganConnection = userInputService.InputBegan:Connect(function()
					-- upvalues: inputBeganConnection (write), var25 (copy)
					if inputBeganConnection then
						inputBeganConnection:Disconnect()
						inputBeganConnection = nil
					end
					var25:CloseStatsBasedOnInputString("ConnectionHealth")
				end)
			end
		end
	}
end