local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local signalsModule = require(parent.Signals)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsCommentsIxpEnabled = sharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local fFlagMomentsEngagementMetricsFeatureModule = require(momentsCommon.Flags.FFlagMomentsEngagementMetricsFeature)
local getFFlagMomentsNonInfiniteScrollModule = require(momentsCommon.Flags.GetFFlagMomentsNonInfiniteScroll)
local getFIntMomentsNonInfiniteScrollLimitModule = require(momentsCommon.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getAppPolicyStore = require(parent.UniversalAppPolicy).GetAppPolicyStore

local function readInfiniteScrollPolicy()
	-- upvalues: getAppFeaturePolicies (ref)
	local ok, status = pcall(function()
		-- upvalues: getAppFeaturePolicies (copy)
		return getAppFeaturePolicies().getMomentsInfiniteScrollEnabled()
	end)
	
	return if ok then status ~= false else true
end

return function(p1)
	-- upvalues: getFFlagMomentsNonInfiniteScrollModule (ref), getFIntMomentsNonInfiniteScrollLimitModule (ref), fFlagGuacMomentsFeatureList (ref), createComputed (ref), getAppPolicyStore (ref), fFlagMomentsAutoplayAmpPolicy (ref), fFlagMomentsEngagementMetricsFeatureModule (ref), fFlagMomentsComments (ref), fFlagMomentsCommentsIxpEnabled (ref), readInfiniteScrollPolicy (ref), createSignal (ref)
	local var1
	local var2 = getFFlagMomentsNonInfiniteScrollModule()
	local maxValue = math.max(1, getFIntMomentsNonInfiniteScrollLimitModule())
	local var3 = if fFlagGuacMomentsFeatureList then createComputed(function(p2)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), "moments_access") ~= nil
	end) else nil
	local var4 = if fFlagGuacMomentsFeatureList then createComputed(function(p2)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), "influencer_content") ~= nil
	end) else nil
	local var5 = if fFlagGuacMomentsFeatureList and fFlagMomentsAutoplayAmpPolicy then createComputed(function(p2)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), "auto_play") ~= nil
	end) else nil
	local var6 = if fFlagMomentsEngagementMetricsFeatureModule and fFlagGuacMomentsFeatureList then createComputed(function(p2)
		-- upvalues: getAppPolicyStore (copy)
		return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), "engagement_metrics") ~= nil
	end) else nil
	
	local function _(p2)
		-- upvalues: createComputed (copy), getAppPolicyStore (copy)
		return createComputed(function(p3)
			-- upvalues: getAppPolicyStore (copy), p2 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p3).getMomentsFeatureList(), p2) ~= nil
		end)
	end
	
	local fFlagMomentsComments_1 = fFlagMomentsComments or fFlagMomentsCommentsIxpEnabled
	
	if fFlagMomentsComments_1 then
		local var7 = "comments_read"
		var1 = createComputed(function(p2)
			-- upvalues: getAppPolicyStore (copy), var7 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), var7) ~= nil
		end)
	else
		var1 = nil
	end
	local var8
	if fFlagMomentsComments_1 then
		local var9 = "comments_write"
		var8 = createComputed(function(p2)
			-- upvalues: getAppPolicyStore (copy), var9 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), var9) ~= nil
		end)
	else
		var8 = nil
	end
	local var10
	if fFlagMomentsComments_1 then
		local var11 = "comments_react"
		var10 = createComputed(function(p2)
			-- upvalues: getAppPolicyStore (copy), var11 (ref)
			return table.find(getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList(), var11) ~= nil
		end)
	else
		var10 = nil
	end
	local var12
	local _ = nil
	local _ = nil
	
	if fFlagGuacMomentsFeatureList then
		var12 = createComputed(function(p2)
			-- upvalues: var2 (ref), getAppPolicyStore (copy)
			if not var2 then
				return true
			end
			local momentsFeatureList = getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList()
			
			return next(momentsFeatureList) == nil or table.find(momentsFeatureList, "infinite_scroll") ~= nil
		end)
		
		local var13 = function(_) end
	else
		local var14, var15 = createSignal(if var2 then (p1 or readInfiniteScrollPolicy)() else true)
		var12 = createComputed(function(p2)
			-- upvalues: var2 (ref), var14 (ref)
			return if var2 then var14(p2) else true
		end)
		
		local var13 = function(p2)
			-- upvalues: var15 (ref)
			var15(p2)
		end
	end
	return {
		getHasMomentsAccess = var3,
		getIsInfluencerContentEnabled = var4,
		getIsAutoPlayEnabled = var5,
		getIsEngagementMetricsEnabled = var6,
		getCanReadComments = var1,
		getCanWriteComments = var8,
		getCanReactToComments = var10,
		getIsInfiniteScrollEnabled = var12,
		getMaxMomentsBeforeEndState = createComputed(function(_)
			-- upvalues: maxValue (ref)
			return maxValue
		end),
		setInfiniteScrollAllowedByPolicy = var13
	}
end