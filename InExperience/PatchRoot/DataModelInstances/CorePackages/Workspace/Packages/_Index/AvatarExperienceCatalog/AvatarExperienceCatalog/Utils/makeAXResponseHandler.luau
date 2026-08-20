local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local sendAXStat = avatarExperienceAnalyticsModule.sendAXStat
local analyticsService = avatarExperienceAnalyticsModule.AnalyticsService
local _ = require(parent.LuauPolyfill)
local fFlagAXSendModelMismatchCounterModule = require(avatarExperienceCatalog.Flags.FFlagAXSendModelMismatchCounter)

return function(p0, p1, p2) --[[ line: 11 | named "makeAXResponseHandler" ]]
	-- upvalues: sendAXStat (ref), fFlagAXSendModelMismatchCounterModule (ref), analyticsService (ref)
	local var3 = if p2 then p2.latencyCounter else nil
	local var4 = if p2 then p2.modelMismatchCounter else nil
	local var5 = if var3 then os.clock() else nil
	
	return p0:andThen(function(p3) --[[ line: 23 ]]
		-- upvalues: var3 (ref), var5 (ref), sendAXStat (copy), p1 (ref), fFlagAXSendModelMismatchCounterModule (copy), var4 (ref), analyticsService (copy)
		if var3 and var5 then
			sendAXStat({ statName = var3, deltaMs = (os.clock() - var5) * 1000 })
		end
		local var6, var7 = p1(if p3 then p3.responseBody else nil)
		
		if var7 then
			if fFlagAXSendModelMismatchCounterModule and var4 then
				analyticsService.EventStream:sendEventDeferred(var4, "marketplaceModelMismatchMetric", {})
			end
			warn(var7)
		end
		return var6
	end)
end