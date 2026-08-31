local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local sendAXStat = avatarExperienceAnalyticsModule.sendAXStat
local analyticsService = avatarExperienceAnalyticsModule.AnalyticsService
local _ = require(parent.LuauPolyfill)
local fFlagAXSendModelMismatchCounterModule = require(avatarExperienceCatalog.Flags.FFlagAXSendModelMismatchCounter)

return function(p1, p2, p3)
	-- upvalues: sendAXStat (ref), fFlagAXSendModelMismatchCounterModule (ref), analyticsService (ref)
	local var1 = if p3 then p3.latencyCounter else nil
	local var2 = if p3 then p3.modelMismatchCounter else nil
	local var3 = if var1 then os.clock() else nil
	
	return p1:andThen(function(p4)
		-- upvalues: var1 (ref), var3 (ref), sendAXStat (copy), p2 (ref), fFlagAXSendModelMismatchCounterModule (copy), var2 (ref), analyticsService (copy)
		if var1 and var3 then
			sendAXStat({ statName = var1, deltaMs = (os.clock() - var3) * 1000 })
		end
		local var4, var5 = p2(if p4 then p4.responseBody else nil)
		
		if var5 then
			if fFlagAXSendModelMismatchCounterModule and var2 then
				analyticsService.EventStream:sendEventDeferred(var2, "marketplaceModelMismatchMetric", {})
			end
			warn(var5)
		end
		return var4
	end)
end