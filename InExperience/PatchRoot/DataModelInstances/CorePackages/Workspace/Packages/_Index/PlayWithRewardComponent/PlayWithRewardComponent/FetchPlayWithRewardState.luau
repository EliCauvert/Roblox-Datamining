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
local playWithRewardStateModule = require(parent.PlayWithRewardState)
local playWithRewardAdData = playWithRewardStateModule.PlayWithRewardAdData
local setPlayWithRewardState = playWithRewardStateModule.SetPlayWithRewardState
local luaAppPlayWithRewardBetaIxpVariantKey = game:DefineFastString("LuaAppPlayWithRewardBetaIxpVariantKey", "Variant")
local luaAppPlayWithRewardBetaIxpTreatmentValue = game:DefineFastString("LuaAppPlayWithRewardBetaIxpTreatmentValue", "Treatment")
local luaAppPlayWithRewardSkipIxpForShimmer = game:DefineFastFlag("LuaAppPlayWithRewardSkipIxpForShimmer", false)
local var1 = tModule.interface({
	AdAvailabilityResult = tModule.userdata,
	ProductId = tModule.optional(tModule.string),
	ProductName = tModule.optional(tModule.string),
	ProductImageAssetId = tModule.optional(tModule.string),
	ExperimentVariantData = tModule.optional(tModule.string)
})
local var2 = tModule.interface({ IsEligible = tModule.boolean })

local function _(p1)
	return (os.clock() - p1) * 1000
end

local _ = function(p1, p2, _)
	local rewardedVideoAdAvailabilityNowForUniverseAsync = p1:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p2), true)
	
	return rewardedVideoAdAvailabilityNowForUniverseAsync or nil
end

local function fetchPlayWithRewardStateAsync(p1, p2, _, p3)
	-- upvalues: logger (ref), playWithRewardTelemetryModule (ref), var1 (ref), mutedError (ref), playWithRewardAdData (ref)
	if not p1 then
		logger:warning(`AdService is not available. Cannot fetch Play with Reward data for universe ID {p2}.`)
		
		return nil
	end
	local processTime = os.clock()
	playWithRewardTelemetryModule.logPlayWithRewardAdRequested(p3, p2)
	local rewardedVideoAdAvailabilityNowForUniverseAsync = p1:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p2), true)
	local var3 = rewardedVideoAdAvailabilityNowForUniverseAsync or nil
	
	if var3 == nil then
		logger:warning(`Could not fetch Play with Reward ad for universe ID {p2}.`)
		playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p3, p2, false, nil, (os.clock() - processTime) * 1000, nil)
		
		return nil
	end
	local var4, var5 = var1(var3)
	
	if var4 then
		local adAvailabilityResult = var3.AdAvailabilityResult
		local productId = var3.ProductId
		local productName = var3.ProductName
		local productImageAssetId = var3.ProductImageAssetId
		local experimentVariantData = var3.ExperimentVariantData
		playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p3, p2, true, tostring(adAvailabilityResult), (os.clock() - processTime) * 1000, productId)
		
		return playWithRewardAdData.new(adAvailabilityResult, productId, productName, productImageAssetId, experimentVariantData)
	end
	mutedError(`PlayWithRewardAdData invalid: {tostring(var5)}`)
	playWithRewardTelemetryModule.logPlayWithRewardAdReceived(p3, p2, false, nil, (os.clock() - processTime) * 1000, nil)
	
	return nil
end

local function shouldShowShimmer(p4, p5)
	-- upvalues: logger (ref), var2 (ref), luaAppPlayWithRewardSkipIxpForShimmer (ref), userInputService (ref), IXPServiceWrapper (ref), appUserLayers (ref), luaAppPlayWithRewardBetaIxpVariantKey (ref), luaAppPlayWithRewardBetaIxpTreatmentValue (ref)
	if not p4 then
		logger:warning(`AdService is not available. Cannot determine whether to show shimmer for universe ID {p5}.`)
		
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: p4 (ref)
		return p4:GetUniversalAppAdsEligibility()
	end)
	
	if not ok or not status then
		return false
	end
	local var6, _ = var2(status)
	
	if var6 and status.IsEligible then
		if luaAppPlayWithRewardSkipIxpForShimmer then
			return true
		end
		local var7
		local var8 = if userInputService:GetPlatform() == Enum.Platform.Android then IXPServiceWrapper:GetLayerData(appUserLayers.AdsPlayWithRewardBetaAndroidLayer) else IXPServiceWrapper:GetLayerData(appUserLayers.AdsPlayWithRewardBetaLayer)
		
		if var8 and var8[luaAppPlayWithRewardBetaIxpVariantKey] then
			var7 = var8[luaAppPlayWithRewardBetaIxpVariantKey] == luaAppPlayWithRewardBetaIxpTreatmentValue
			var7 = nil
		else
			var7 = false
		end
		return var7
	end
end

return function(p6, p7, p8)
	-- upvalues: httpService (ref), shouldShowShimmer (ref), playWithRewardTelemetryModule (ref), setPlayWithRewardState (ref), promiseModule (ref), fetchPlayWithRewardStateAsync (ref), logger (ref)
	return function(p9)
		-- upvalues: httpService (copy), shouldShowShimmer (copy), p6 (ref), p7 (ref), playWithRewardTelemetryModule (copy), setPlayWithRewardState (copy), promiseModule (copy), fetchPlayWithRewardStateAsync (copy), p8 (ref), logger (copy)
		local var9 = httpService:GenerateGUID(false)
		
		if shouldShowShimmer(p6, p7) then
			playWithRewardTelemetryModule.logPlayWithRewardShimmerShown(var9, p7)
			p9:dispatch(setPlayWithRewardState(var9, p7, true, nil))
		end
		return promiseModule.new(function(p10, p11)
			-- upvalues: fetchPlayWithRewardStateAsync (copy), p6 (copy), p7 (copy), p8 (copy), var9 (ref), p9 (ref), setPlayWithRewardState (copy)
			local ok, status = pcall(function()
				-- upvalues: fetchPlayWithRewardStateAsync (copy), p6 (copy), p7 (copy), p8 (copy), var9 (copy)
				return fetchPlayWithRewardStateAsync(p6, p7, p8, var9)
			end)
			
			if ok and status then
				p9:dispatch(setPlayWithRewardState(var9, p7, false, status))
				p10()
				
				return
			end
			p9:dispatch(setPlayWithRewardState(var9, p7, false, nil))
			p11(status)
		end):catch(function(p10)
			-- upvalues: logger (copy), p7 (copy)
			logger:warning(`Promise for fetching Play With Reward data rejected for universe ID {p7}: {tostring(p10)}`)
		end)
	end
end