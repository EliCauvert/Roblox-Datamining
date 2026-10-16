local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendAXStatFunction = AvatarExperienceAnalyticsModule.sendAXStat
local AnalyticsService = AvatarExperienceAnalyticsModule.AnalyticsService
local _ = require(Parent.LuauPolyfill)
local FFlagAXSendModelMismatchCounterModule = require(AvatarExperienceCatalog.Flags.FFlagAXSendModelMismatchCounter)

return function(Promise, Callback, p1) --[[ Line: 11 | Named "makeAXResponseHandler" ]]
	-- upvalues: SendAXStatFunction (copy), FFlagAXSendModelMismatchCounterModule (copy), AnalyticsService (copy)
	local LatencyCounter = if p1 then p1.latencyCounter else nil
	local ModelMismatchCounter = if p1 then p1.modelMismatchCounter else nil
	local ClockTime = if LatencyCounter then os.clock() else nil
	
	return (Promise:andThen(function(Result) --[[ Line: 23 ]]
		-- upvalues: LatencyCounter (copy), ClockTime (copy), SendAXStatFunction (upval), Callback (copy), FFlagAXSendModelMismatchCounterModule (upval), ModelMismatchCounter (copy), AnalyticsService (upval)
		if LatencyCounter and ClockTime then
			SendAXStatFunction({
				statName = LatencyCounter,
				deltaMs = (os.clock() - ClockTime) * 1000
			})
		end
		local CallbackResult, CallbackResult2 = Callback(if Result then Result.responseBody else nil)
		
		if CallbackResult2 then
			if FFlagAXSendModelMismatchCounterModule and ModelMismatchCounter then
				AnalyticsService.EventStream:sendEventDeferred(ModelMismatchCounter, "marketplaceModelMismatchMetric", {})
			end
			warn(CallbackResult2)
		end
		return CallbackResult
	end))
end