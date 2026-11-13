local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsAutoplayAmpPolicy = SharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local FFlagMomentsReactFeatureGate = SharedFlagsModule.FFlagMomentsReactFeatureGate
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local FFlagAXAvatarMomentsCreation = SharedFlagsModule.FFlagAXAvatarMomentsCreation
local FFlagMomentsEngagementMetricsFeatureModule = require(MomentsCommon.Flags.FFlagMomentsEngagementMetricsFeature)
local FFlagDebugForceEnableMomentsModule = require(MomentsCommon.Flags.FFlagDebugForceEnableMoments)
local FFlagMomentsParentTimeLimitModule = require(MomentsCommon.Flags.FFlagMomentsParentTimeLimit)
local GetFFlagMomentsNonInfiniteScrollModule = require(MomentsCommon.Flags.GetFFlagMomentsNonInfiniteScroll)
local GetFIntMomentsNonInfiniteScrollLimitModule = require(MomentsCommon.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local CreateComputedFunction = require(Parent.Signals).createComputed
local GetAppPolicyStoreFunction = require(Parent.UniversalAppPolicy).GetAppPolicyStore

return function()
	-- upvalues: GetFFlagMomentsNonInfiniteScrollModule (copy), GetFIntMomentsNonInfiniteScrollLimitModule (copy), CreateComputedFunction (copy), FFlagDebugForceEnableMomentsModule (copy), GetAppPolicyStoreFunction (copy), FFlagMomentsCreationFeatureGate (copy), FFlagAXAvatarMomentsCreation (copy), FFlagMomentsAutoplayAmpPolicy (copy), FFlagMomentsEngagementMetricsFeatureModule (copy), FFlagMomentsReactFeatureGate (copy), FFlagMomentsComments (copy), FFlagMomentsCommentsIxpEnabled (copy), FFlagMomentsParentTimeLimitModule (copy), MomentsCommon (copy)
	local FFlagMomentsNonInfiniteScrollModule = GetFFlagMomentsNonInfiniteScrollModule()
	local Largest = math.max(1, GetFIntMomentsNonInfiniteScrollLimitModule())
	
	local function _(Value)
		-- upvalues: CreateComputedFunction (upval), FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval)
		return CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value) ~= nil
		end)
	end
	
	local Value = "moments_access"
	local Computed = CreateComputedFunction(function(p1): boolean
		-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value (copy)
		return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value) ~= nil
	end)
	local Value1 = "influencer_content"
	local Computed1 = CreateComputedFunction(function(p1): boolean
		-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value1 (copy)
		return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value1) ~= nil
	end)
	local Computed2 = nil
	
	if FFlagMomentsCreationFeatureGate then
		local Value2 = "moments_creation"
		Computed2 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value2 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value2) ~= nil
		end)
	else
		Computed2 = nil
	end
	local Computed3 = nil
	if FFlagAXAvatarMomentsCreation then
		local Value3 = "avatar_creation"
		Computed3 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value3 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value3) ~= nil
		end)
	else
		Computed3 = nil
	end
	local Computed4 = nil
	if FFlagMomentsAutoplayAmpPolicy then
		local Value4 = "auto_play"
		Computed4 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value4 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value4) ~= nil
		end)
	else
		Computed4 = nil
	end
	local Computed5 = nil
	if FFlagMomentsEngagementMetricsFeatureModule then
		local Value5 = "engagement_metrics"
		Computed5 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value5 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value5) ~= nil
		end)
	else
		Computed5 = nil
	end
	local Computed6 = nil
	if FFlagMomentsReactFeatureGate then
		local Value6 = "moments_react"
		Computed6 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value6 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value6) ~= nil
		end)
	else
		Computed6 = nil
	end
	local FFlagMomentsComments1 = FFlagMomentsComments or FFlagMomentsCommentsIxpEnabled
	local Computed7 = nil
	
	if FFlagMomentsComments1 then
		local Value7 = "comments_read"
		Computed7 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value7 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value7) ~= nil
		end)
	else
		Computed7 = nil
	end
	local Computed8 = nil
	if FFlagMomentsComments1 then
		local Value8 = "comments_write"
		Computed8 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value8 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value8) ~= nil
		end)
	else
		Computed8 = nil
	end
	local Computed9 = nil
	if FFlagMomentsComments1 then
		local Value9 = "comments_react"
		Computed9 = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval), Value9 (copy)
			return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value9) ~= nil
		end)
	else
		Computed9 = nil
	end
	return {
		getHasMomentsAccess = Computed,
		getIsInfluencerContentEnabled = Computed1,
		getCanCreateMoments = Computed2,
		getCanCreateAvatarMoments = Computed3,
		getIsAutoPlayEnabled = Computed4,
		getIsEngagementMetricsEnabled = Computed5,
		getCanReactToMoments = Computed6,
		getCanReadComments = Computed7,
		getCanWriteComments = Computed8,
		getCanReactToComments = Computed9,
		getCanShowPersonalizedRecommendationsEntryPoint = CreateComputedFunction(function(p1)
			-- upvalues: GetAppPolicyStoreFunction (upval)
			return GetAppPolicyStoreFunction(false).getAppPolicy(p1).getShowInContextPersonalizedRecommendationsMomentsFeed()
		end),
		getIsInfiniteScrollEnabled = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagMomentsNonInfiniteScrollModule (copy), FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval)
			if not FFlagMomentsNonInfiniteScrollModule then
				return true
			elseif FFlagDebugForceEnableMomentsModule then
				return true
			else
				local MomentsFeatureList = GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList()
				
				return next(MomentsFeatureList) == nil or table.find(MomentsFeatureList, "infinite_scroll") ~= nil
			end
		end),
		getMaxMomentsBeforeEndState = CreateComputedFunction(function(_)
			-- upvalues: Largest (copy)
			return Largest
		end),
		getHasDailyLimit = if FFlagMomentsParentTimeLimitModule then CreateComputedFunction(function(p1): boolean
			-- upvalues: MomentsCommon (upval), GetAppPolicyStoreFunction (upval)
			return if require(MomentsCommon.Flags.FFlagDebugForceMomentsDailyLimit) then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "moments_daily_limit") ~= nil
		end) else nil
	}
end