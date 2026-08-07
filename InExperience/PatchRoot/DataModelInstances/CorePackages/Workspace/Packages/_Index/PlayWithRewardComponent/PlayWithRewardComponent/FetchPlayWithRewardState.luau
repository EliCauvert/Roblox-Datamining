local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local playWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local playWithRewardTelemetryModule = require(playWithRewardComponent.PlayWithRewardTelemetry)
local parent = playWithRewardComponent.Parent
local promiseModule = require(parent.Promise)
local logger = require(parent.Loggers).Logger
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local fFlagLuaAppRemovePlayWithRewardBetaAllowlist = require(parent.SharedFlags).FFlagLuaAppRemovePlayWithRewardBetaAllowlist
local playWithRewardStateModule = require(parent.PlayWithRewardState)
local playWithRewardAdData = playWithRewardStateModule.PlayWithRewardAdData
local setPlayWithRewardState = playWithRewardStateModule.SetPlayWithRewardState
local luaAppPlayWithRewardBetaUniverses = game:DefineFastString("LuaAppPlayWithRewardBetaUniverses", "")
local luaAppPlayWithRewardBetaIxpVariantKey = game:DefineFastString("LuaAppPlayWithRewardBetaIxpVariantKey", "Variant")
local luaAppPlayWithRewardBetaIxpTreatmentValue = game:DefineFastString("LuaAppPlayWithRewardBetaIxpTreatmentValue", "Treatment")
local luaAppPlayWithRewardSkipIxpForShimmer = game:DefineFastFlag("LuaAppPlayWithRewardSkipIxpForShimmer", false)
local luaAppPlayWithRewardUsePlatformSpecificLayerValueForShimmer = game:DefineFastFlag("LuaAppPlayWithRewardUsePlatformSpecificLayerValueForShimmer", false)

local function isUniverseIdInPlayWithRewardBetaAllowList(x, y) --[[ line: 31 ]]
	local var17 = x:gsub("^%s+", ""):gsub("%s+$", "")
	
	return if var17 == "" or y == "" or y:find(",", 1, true) ~= nil then false else ("," .. var17 .. ","):find("," .. y .. ",", 1, true) ~= nil
end

local var13 = tModule.interface({
	AdAvailabilityResult = tModule.userdata,
	ProductId = tModule.optional(tModule.string),
	ProductName = tModule.optional(tModule.string),
	ProductImageAssetId = tModule.optional(tModule.string),
	ExperimentVariantData = tModule.optional(tModule.string)
})
local var14 = tModule.interface({ IsEligible = tModule.boolean })

local function _(p0) --[[ line: 54 | named "getDurationSinceStartFetchMs" ]]
	return (os.clock() - p0) * 1000
end

local _ = function(p1, p2, _) --[[ line: 58 | named "fetchAd" ]]
	local rewardedVideoAdAvailabilityNowForUniverseAsync = p1:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p2), true)
	
	return rewardedVideoAdAvailabilityNowForUniverseAsync or nil
end

local function fetchPlayWithRewardStateAsync(p3, p4, _, p5) --[[ line: 69 ]]
	-- upvalues: logger (ref), playWithRewardTelemetryModule (ref), var13 (ref), mutedError (ref), playWithRewardAdData (ref)
	if not p3 then
		logger:warning(`AdService is not available. Cannot fetch Play with Reward data for universe ID {p4}.`)
		
		return nil
	end
	local processTime = os.clock()
	playWithRewardTelemetryModule.logPlayWithRewardAdRequested(p5, p4)
	local rewardedVideoAdAvailabilityNowForUniverseAsync = p3:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p4), true)
	local var21 = rewardedVideoAdAvailabilityNowForUniverseAsync or nil
	
	if var21 == nil then
		logger:warning(`Could not fetch Play with Reward ad for universe ID {p4}.`)
		playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p5, p4, false, nil, (os.clock() - processTime) * 1000, nil)
		
		return nil
	end
	local var22, var23 = var13(var21)
	
	if var22 then
		local adAvailabilityResult = var21.AdAvailabilityResult
		local productId = var21.ProductId
		local productName = var21.ProductName
		local productImageAssetId = var21.ProductImageAssetId
		local experimentVariantData = var21.ExperimentVariantData
		playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p5, p4, true, tostring(adAvailabilityResult), (os.clock() - processTime) * 1000, productId)
		
		return playWithRewardAdData.new(adAvailabilityResult, productId, productName, productImageAssetId, experimentVariantData)
	end
	mutedError(`PlayWithRewardAdData invalid: {tostring(var23)}`)
	playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p5, p4, false, nil, (os.clock() - processTime) * 1000, nil)
	
	return nil
end

local function shouldShowShimmer(p6, p7) --[[ line: 134 ]]
	-- upvalues: logger (ref), var14 (ref), luaAppPlayWithRewardSkipIxpForShimmer (ref), luaAppPlayWithRewardUsePlatformSpecificLayerValueForShimmer (ref), userInputService (ref), IXPServiceWrapper (ref), appUserLayers (ref), luaAppPlayWithRewardBetaIxpVariantKey (ref), luaAppPlayWithRewardBetaIxpTreatmentValue (ref)
	if not p6 then
		logger:warning(`AdService is not available. Cannot determine whether to show shimmer for universe ID {p7}.`)
		
		return false
	end
	local ok, status = pcall(function() --[[ line: 141 ]]
		-- upvalues: p6 (ref)
		return p6:GetUniversalAppAdsEligibility()
	end)
	
	if not ok or not status then
		return false
	end
	local var24, _ = var14(status)
	
	if var24 and status.IsEligible then
		if luaAppPlayWithRewardSkipIxpForShimmer then
			return true
		end
		local var26
		local var25 = if luaAppPlayWithRewardUsePlatformSpecificLayerValueForShimmer and userInputService:GetPlatform() == Enum.Platform.Android then IXPServiceWrapper:GetLayerData(appUserLayers.AdsPlayWithRewardBetaAndroidLayer) else IXPServiceWrapper:GetLayerData(appUserLayers.AdsPlayWithRewardBetaLayer)
		
		if var25 and var25[luaAppPlayWithRewardBetaIxpVariantKey] then
			var26 = var25[luaAppPlayWithRewardBetaIxpVariantKey] == luaAppPlayWithRewardBetaIxpTreatmentValue
			var26 = nil
		else
			var26 = false
		end
		return var26
	end
end

return function(p8, p9, p10) --[[ line: 167 | named "FetchPlayWithRewardState" ]]
	-- upvalues: fFlagLuaAppRemovePlayWithRewardBetaAllowlist (ref), isUniverseIdInPlayWithRewardBetaAllowList (ref), luaAppPlayWithRewardBetaUniverses (ref), promiseModule (ref), httpService (ref), shouldShowShimmer (ref), playWithRewardTelemetryModule (ref), setPlayWithRewardState (ref), fetchPlayWithRewardStateAsync (ref), logger (ref)
	return function(p11) --[[ line: 168 ]]
		-- upvalues: fFlagLuaAppRemovePlayWithRewardBetaAllowlist (copy), isUniverseIdInPlayWithRewardBetaAllowList (copy), luaAppPlayWithRewardBetaUniverses (copy), p9 (ref), promiseModule (copy), httpService (copy), shouldShowShimmer (copy), p8 (ref), playWithRewardTelemetryModule (copy), setPlayWithRewardState (copy), fetchPlayWithRewardStateAsync (copy), p10 (ref), logger (copy)
		if not fFlagLuaAppRemovePlayWithRewardBetaAllowlist and not isUniverseIdInPlayWithRewardBetaAllowList(luaAppPlayWithRewardBetaUniverses, p9) then
			return promiseModule.resolve()
		end
		local var27 = httpService:GenerateGUID(false)
		
		if shouldShowShimmer(p8, p9) then
			playWithRewardTelemetryModule.logPlayWithRewardShimmerShown(var27, p9)
			p11:dispatch(setPlayWithRewardState(var27, p9, true, nil))
		end
		return promiseModule.new(function(p13, p14) --[[ line: 180 ]]
			-- upvalues: fetchPlayWithRewardStateAsync (copy), p8 (copy), p9 (copy), p10 (copy), var27 (ref), p11 (ref), setPlayWithRewardState (copy)
			local ok, status = pcall(function() --[[ line: 181 ]]
				-- upvalues: fetchPlayWithRewardStateAsync (copy), p8 (copy), p9 (copy), p10 (copy), var27 (copy)
				return fetchPlayWithRewardStateAsync(p8, p9, p10, var27)
			end)
			
			if ok and status then
				p11:dispatch(setPlayWithRewardState(var27, p9, false, status))
				p13()
				
				return
			end
			p11:dispatch(setPlayWithRewardState(var27, p9, false, nil))
			p14(status)
		end):catch(function(p12) --[[ line: 191 ]]
			-- upvalues: logger (copy), p9 (copy)
			logger:warning(`Promise for fetching Play With Reward data rejected for universe ID {p9}: {tostring(p12)}`)
		end)
	end
end