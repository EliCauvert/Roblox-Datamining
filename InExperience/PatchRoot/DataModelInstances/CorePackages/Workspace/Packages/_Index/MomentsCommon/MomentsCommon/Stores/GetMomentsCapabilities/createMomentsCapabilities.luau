local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsCommentsIxpEnabled = sharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local fFlagMomentsEngagementMetricsFeatureModule = require(momentsCommon.Flags.FFlagMomentsEngagementMetricsFeature)
local fFlagDebugForceEnableMomentsModule = require(momentsCommon.Flags.FFlagDebugForceEnableMoments)
local getFFlagMomentsNonInfiniteScrollModule = require(momentsCommon.Flags.GetFFlagMomentsNonInfiniteScroll)
local getFIntMomentsNonInfiniteScrollLimitModule = require(momentsCommon.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local createComputed = signalsModule.createComputed
local getAppPolicyStore = require(parent.UniversalAppPolicy).GetAppPolicyStore

return function()
	-- upvalues: getFFlagMomentsNonInfiniteScrollModule (ref), getFIntMomentsNonInfiniteScrollLimitModule (ref), createComputed (ref), fFlagDebugForceEnableMomentsModule (ref), getAppPolicyStore (ref), fFlagMomentsAutoplayAmpPolicy (ref), fFlagMomentsEngagementMetricsFeatureModule (ref), fFlagMomentsComments (ref), fFlagMomentsCommentsIxpEnabled (ref)
	local var1
	local var2 = getFFlagMomentsNonInfiniteScrollModule()
	local maxValue = math.max(1, getFIntMomentsNonInfiniteScrollLimitModule())
	local var3 = createComputed(function(p1)
		-- upvalues: fFlagDebugForceEnableMomentsModule (copy), getAppPolicyStore (copy)
		return if fFlagDebugForceEnableMomentsModule then true else table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), "moments_access") ~= nil
	end)
	local var4 = createComputed(function(p1)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), "influencer_content") ~= nil
	end)
	local var5 = if fFlagMomentsAutoplayAmpPolicy then createComputed(function(p1)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), "auto_play") ~= nil
	end) else nil
	local var6 = if fFlagMomentsEngagementMetricsFeatureModule then createComputed(function(p1)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), "engagement_metrics") ~= nil
	end) else nil
	
	local function _(p1)
		-- upvalues: createComputed (copy), getAppPolicyStore (copy)
		return createComputed(function(p2)
			-- upvalues: getAppPolicyStore (copy), p1 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), p1) ~= nil
		end)
	end
	
	local fFlagMomentsComments_1 = fFlagMomentsComments or fFlagMomentsCommentsIxpEnabled
	
	if fFlagMomentsComments_1 then
		local var7 = "comments_read"
		var1 = createComputed(function(p1)
			-- upvalues: getAppPolicyStore (copy), var7 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), var7) ~= nil
		end)
	else
		var1 = nil
	end
	local var8
	if fFlagMomentsComments_1 then
		local var9 = "comments_write"
		var8 = createComputed(function(p1)
			-- upvalues: getAppPolicyStore (copy), var9 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), var9) ~= nil
		end)
	else
		var8 = nil
	end
	local var10
	if fFlagMomentsComments_1 then
		local var11 = "comments_react"
		var10 = createComputed(function(p1)
			-- upvalues: getAppPolicyStore (copy), var11 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList(), var11) ~= nil
		end)
	else
		var10 = nil
	end
	return {
		getHasMomentsAccess = var3,
		getIsInfluencerContentEnabled = var4,
		getIsAutoPlayEnabled = var5,
		getIsEngagementMetricsEnabled = var6,
		getCanReadComments = var1,
		getCanWriteComments = var8,
		getCanReactToComments = var10,
		getIsInfiniteScrollEnabled = createComputed(function(p1)
			-- upvalues: var2 (ref), getAppPolicyStore (copy)
			if not var2 then
				return true
			end
			local momentsFeatureList = getAppPolicyStore(false).getAppPolicy(p1).getMomentsFeatureList()
			
			return next(momentsFeatureList) == nil or table.find(momentsFeatureList, "infinite_scroll") ~= nil
		end),
		getMaxMomentsBeforeEndState = createComputed(function(_)
			-- upvalues: maxValue (ref)
			return maxValue
		end)
	}
end