local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local signalsModule = require(parent.Signals)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
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
	-- upvalues: getFFlagMomentsNonInfiniteScrollModule (ref), getFIntMomentsNonInfiniteScrollLimitModule (ref), fFlagGuacMomentsFeatureList (ref), createComputed (ref), getAppPolicyStore (ref), fFlagMomentsAutoplayAmpPolicy (ref), readInfiniteScrollPolicy (ref), createSignal (ref)
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
	local _ = nil
	local _ = nil
	
	if fFlagGuacMomentsFeatureList then
		var1 = createComputed(function(p2)
			-- upvalues: var2 (ref), getAppPolicyStore (copy)
			if not var2 then
				return true
			end
			local momentsFeatureList = getAppPolicyStore(false).getAppPolicy(p2).getMomentsFeatureList()
			
			return next(momentsFeatureList) == nil or table.find(momentsFeatureList, "infinite_scroll") ~= nil
		end)
		
		local var6 = function(_) end
	else
		local var7, var8 = createSignal(if var2 then (p1 or readInfiniteScrollPolicy)() else true)
		var1 = createComputed(function(p2)
			-- upvalues: var2 (ref), var7 (ref)
			return if var2 then var7(p2) else true
		end)
		
		local var6 = function(p2)
			-- upvalues: var8 (ref)
			var8(p2)
		end
	end
	return {
		getHasMomentsAccess = var3,
		getIsInfluencerContentEnabled = var4,
		getIsAutoPlayEnabled = var5,
		getIsInfiniteScrollEnabled = var1,
		getMaxMomentsBeforeEndState = createComputed(function(_)
			-- upvalues: maxValue (ref)
			return maxValue
		end),
		setInfiniteScrollAllowedByPolicy = var6
	}
end