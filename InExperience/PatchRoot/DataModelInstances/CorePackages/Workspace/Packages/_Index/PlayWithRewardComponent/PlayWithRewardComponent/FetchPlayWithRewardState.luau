local HttpService = game:GetService("HttpService")
local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local PlayWithRewardTelemetryModule = require(PlayWithRewardComponent.PlayWithRewardTelemetry)
local Parent = PlayWithRewardComponent.Parent
local PromiseModule = require(Parent.Promise)
local Logger = require(Parent.Loggers).Logger
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local PlayWithRewardStateModule = require(Parent.PlayWithRewardState)
local PlayWithRewardAdData = PlayWithRewardStateModule.PlayWithRewardAdData
local SetPlayWithRewardStateFunction = PlayWithRewardStateModule.SetPlayWithRewardState
local InterfaceResult = TModule.interface({
	AdAvailabilityResult = TModule.userdata,
	ProductId = TModule.optional(TModule.string),
	ProductName = TModule.optional(TModule.string),
	ProductImageAssetId = TModule.optional(TModule.string),
	ExperimentVariantData = TModule.optional(TModule.string)
})
local InterfaceResult1 = TModule.interface({ IsEligible = TModule.boolean })

local function _(p1): number
	return (os.clock() - p1) * 1000
end

local _ = function(AdService, p1, _)
	local AdAvailabilityNowForUniverseAsync = AdService:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p1), true)
	
	return if AdAvailabilityNowForUniverseAsync then AdAvailabilityNowForUniverseAsync else nil
end

local function fetchPlayWithRewardStateAsync(AdService, p1, _, Guid)
	-- upvalues: Logger (copy), PlayWithRewardTelemetryModule (copy), InterfaceResult (copy), MutedErrorFunction (copy), PlayWithRewardAdData (copy)
	if not AdService then
		Logger:warning(`AdService is not available. Cannot fetch Play with Reward data for universe ID {p1}.`)
		
		return nil
	end
	local ClockTime = os.clock()
	PlayWithRewardTelemetryModule.logPlayWithRewardAdRequested(Guid, p1)
	local AdAvailabilityNowForUniverseAsync = AdService:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(p1), true)
	local AdAvailabilityNowForUniverseAsync1 = if AdAvailabilityNowForUniverseAsync then AdAvailabilityNowForUniverseAsync else nil
	
	if AdAvailabilityNowForUniverseAsync1 == nil then
		Logger:warning(`Could not fetch Play with Reward ad for universe ID {p1}.`)
		PlayWithRewardTelemetryModule.logPlayWithRewardAdReceived(Guid, p1, false, nil, (os.clock() - ClockTime) * 1000, nil)
		
		return nil
	end
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(AdAvailabilityNowForUniverseAsync1)
	
	if InterfaceResultResult then
		local AdAvailabilityResult = AdAvailabilityNowForUniverseAsync1.AdAvailabilityResult
		local ProductId = AdAvailabilityNowForUniverseAsync1.ProductId
		local ProductName = AdAvailabilityNowForUniverseAsync1.ProductName
		local ProductImageAssetId = AdAvailabilityNowForUniverseAsync1.ProductImageAssetId
		local ExperimentVariantData = AdAvailabilityNowForUniverseAsync1.ExperimentVariantData
		PlayWithRewardTelemetryModule.logPlayWithRewardAdReceived(Guid, p1, true, tostring(AdAvailabilityResult), (os.clock() - ClockTime) * 1000, ProductId)
		
		return PlayWithRewardAdData.new(AdAvailabilityResult, ProductId, ProductName, ProductImageAssetId, ExperimentVariantData)
	else
		MutedErrorFunction(`PlayWithRewardAdData invalid: {tostring(InterfaceResultResult2)}`)
		PlayWithRewardTelemetryModule.logPlayWithRewardAdReceived(Guid, p1, false, nil, (os.clock() - ClockTime) * 1000, nil)
		
		return nil
	end
end

local function shouldShowShimmer(AdService, p2): boolean
	-- upvalues: Logger (copy), InterfaceResult1 (copy)
	if not AdService then
		Logger:warning(`AdService is not available. Cannot determine whether to show shimmer for universe ID {p2}.`)
		
		return false
	end
	local Success, Result = pcall(function()
		-- upvalues: AdService (copy)
		return AdService:GetUniversalAppAdsEligibility()
	end)
	
	if Success and Result then
		local InterfaceResultResult, _ = InterfaceResult1(Result)
		
		return if InterfaceResultResult and Result.IsEligible then true else false
	else
		return false
	end
end

return function(p3, p4, p5)
	-- upvalues: HttpService (copy), shouldShowShimmer (copy), PlayWithRewardTelemetryModule (copy), SetPlayWithRewardStateFunction (copy), PromiseModule (copy), fetchPlayWithRewardStateAsync (copy), Logger (copy)
	return function(p6)
		-- upvalues: HttpService (upval), shouldShowShimmer (upval), p3 (copy), p4 (copy), PlayWithRewardTelemetryModule (upval), SetPlayWithRewardStateFunction (upval), PromiseModule (upval), fetchPlayWithRewardStateAsync (upval), p5 (copy), Logger (upval)
		local Guid = HttpService:GenerateGUID(false)
		
		if shouldShowShimmer(p3, p4) then
			PlayWithRewardTelemetryModule.logPlayWithRewardShimmerShown(Guid, p4)
			p6:dispatch(SetPlayWithRewardStateFunction(Guid, p4, true, nil))
		end
		return PromiseModule.new(function(Callback1: () -> (), Callback: (any) -> ())
			-- upvalues: fetchPlayWithRewardStateAsync (upval), p3 (upval), p4 (upval), p5 (upval), Guid (copy), p6 (copy), SetPlayWithRewardStateFunction (upval)
			local Success, Result = pcall(function()
				-- upvalues: fetchPlayWithRewardStateAsync (upval), p3 (upval), p4 (upval), p5 (upval), Guid (upval)
				return fetchPlayWithRewardStateAsync(p3, p4, p5, Guid)
			end)
			
			if Success and Result then
				p6:dispatch(SetPlayWithRewardStateFunction(Guid, p4, false, Result))
				Callback1()
				
				return
			else
				p6:dispatch(SetPlayWithRewardStateFunction(Guid, p4, false, nil))
				Callback(Result)
			end
		end):catch(function(Err)
			-- upvalues: Logger (upval), p4 (upval)
			Logger:warning(`Promise for fetching Play With Reward data rejected for universe ID {p4}: {tostring(Err)}`)
		end)
	end
end