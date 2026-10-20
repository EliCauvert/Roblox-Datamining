local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsAutoplayAmpPolicy = SharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsCommentsIxpEnabled = SharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local FFlagMomentsReactFeatureGate = SharedFlagsModule.FFlagMomentsReactFeatureGate
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local FFlagMomentsEngagementMetricsFeatureModule = require(MomentsCommon.Flags.FFlagMomentsEngagementMetricsFeature)
local FFlagDebugForceEnableMomentsModule = require(MomentsCommon.Flags.FFlagDebugForceEnableMoments)
local GetFFlagMomentsNonInfiniteScrollModule = require(MomentsCommon.Flags.GetFFlagMomentsNonInfiniteScroll)
local GetFIntMomentsNonInfiniteScrollLimitModule = require(MomentsCommon.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local CreateComputedFunction = require(Parent.Signals).createComputed
local GetAppPolicyStoreFunction = require(Parent.UniversalAppPolicy).GetAppPolicyStore

return function()
	-- upvalues: GetFFlagMomentsNonInfiniteScrollModule (copy), GetFIntMomentsNonInfiniteScrollLimitModule (copy), CreateComputedFunction (copy), FFlagDebugForceEnableMomentsModule (copy), GetAppPolicyStoreFunction (copy), FFlagMomentsCreationFeatureGate (copy), FFlagMomentsAutoplayAmpPolicy (copy), FFlagMomentsEngagementMetricsFeatureModule (copy), FFlagMomentsReactFeatureGate (copy), FFlagMomentsComments (copy), FFlagMomentsCommentsIxpEnabled (copy)
	local FFlagMomentsNonInfiniteScrollModule = GetFFlagMomentsNonInfiniteScrollModule()
	local Largest = math.max(1, GetFIntMomentsNonInfiniteScrollLimitModule())
	local Computed = CreateComputedFunction(function(p1): boolean
		-- upvalues: FFlagDebugForceEnableMomentsModule (upval), GetAppPolicyStoreFunction (upval)
		return if FFlagDebugForceEnableMomentsModule then true else table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "moments_access") ~= nil
	end)
	local Computed1 = CreateComputedFunction(function(p1): boolean
		-- upvalues: GetAppPolicyStoreFunction (upval)
		return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "influencer_content") ~= nil
	end)
	local Computed2 = if FFlagMomentsCreationFeatureGate then CreateComputedFunction(function(p1): boolean
		-- upvalues: GetAppPolicyStoreFunction (upval)
		return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "moments_creation") ~= nil
	end) else nil
	local Computed3 = if FFlagMomentsAutoplayAmpPolicy then CreateComputedFunction(function(p1): boolean
		-- upvalues: GetAppPolicyStoreFunction (upval)
		return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "auto_play") ~= nil
	end) else nil
	local Computed4 = if FFlagMomentsEngagementMetricsFeatureModule then CreateComputedFunction(function(p1): boolean
		-- upvalues: GetAppPolicyStoreFunction (upval)
		return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "engagement_metrics") ~= nil
	end) else nil
	local Computed5 = if FFlagMomentsReactFeatureGate then CreateComputedFunction(function(p1): boolean
		-- upvalues: GetAppPolicyStoreFunction (upval)
		return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), "moments_react") ~= nil
	end) else nil
	
	local function _(Value)
		-- upvalues: CreateComputedFunction (upval), GetAppPolicyStoreFunction (upval)
		return CreateComputedFunction(function(p1): boolean
			-- upvalues: GetAppPolicyStoreFunction (upval), Value (copy)
			return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value) ~= nil
		end)
	end
	
	local FFlagMomentsComments1 = FFlagMomentsComments or FFlagMomentsCommentsIxpEnabled
	local Computed6 = nil
	
	if FFlagMomentsComments1 then
		local Value = "comments_read"
		Computed6 = CreateComputedFunction(function(p1): boolean
			-- upvalues: GetAppPolicyStoreFunction (upval), Value (copy)
			return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value) ~= nil
		end)
	else
		Computed6 = nil
	end
	local Computed7 = nil
	if FFlagMomentsComments1 then
		local Value1 = "comments_write"
		Computed7 = CreateComputedFunction(function(p1): boolean
			-- upvalues: GetAppPolicyStoreFunction (upval), Value1 (copy)
			return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value1) ~= nil
		end)
	else
		Computed7 = nil
	end
	local Computed8 = nil
	if FFlagMomentsComments1 then
		local Value2 = "comments_react"
		Computed8 = CreateComputedFunction(function(p1): boolean
			-- upvalues: GetAppPolicyStoreFunction (upval), Value2 (copy)
			return table.find(GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList(), Value2) ~= nil
		end)
	else
		Computed8 = nil
	end
	return {
		getHasMomentsAccess = Computed,
		getIsInfluencerContentEnabled = Computed1,
		getCanCreateMoments = Computed2,
		getIsAutoPlayEnabled = Computed3,
		getIsEngagementMetricsEnabled = Computed4,
		getCanReactToMoments = Computed5,
		getCanReadComments = Computed6,
		getCanWriteComments = Computed7,
		getCanReactToComments = Computed8,
		getIsInfiniteScrollEnabled = CreateComputedFunction(function(p1): boolean
			-- upvalues: FFlagMomentsNonInfiniteScrollModule (copy), GetAppPolicyStoreFunction (upval)
			if FFlagMomentsNonInfiniteScrollModule then
				local MomentsFeatureList = GetAppPolicyStoreFunction(false).getAppPolicy(p1).getMomentsFeatureList()
				
				return next(MomentsFeatureList) == nil or table.find(MomentsFeatureList, "infinite_scroll") ~= nil
			else
				return true
			end
		end),
		getMaxMomentsBeforeEndState = CreateComputedFunction(function(_)
			-- upvalues: Largest (copy)
			return Largest
		end)
	}
end