local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local getFFlagMomentsNonInfiniteScrollModule = require(moments.Flags.GetFFlagMomentsNonInfiniteScroll)
local getFIntMomentsNonInfiniteScrollLimitModule = require(moments.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function readInfiniteScrollPolicy()
	-- upvalues: parent (ref)
	local ok, status = pcall(function()
		-- upvalues: parent (copy)
		return require(parent.UniversalAppPolicy).getAppFeaturePolicies().getMomentsInfiniteScrollEnabled()
	end)
	
	return if ok then status ~= false else true
end

return function(p1)
	-- upvalues: getFFlagMomentsNonInfiniteScrollModule (ref), getFIntMomentsNonInfiniteScrollLimitModule (ref), readInfiniteScrollPolicy (ref), createSignal (ref), createComputed (ref)
	local var1 = getFFlagMomentsNonInfiniteScrollModule()
	local maxValue = math.max(1, getFIntMomentsNonInfiniteScrollLimitModule())
	local var2, var3 = createSignal(if var1 then (p1 or readInfiniteScrollPolicy)() else true)
	
	return {
		getIsInfiniteScrollEnabled = createComputed(function(p2)
			-- upvalues: var1 (ref), var2 (ref)
			return if var1 then var2(p2) else true
		end),
		getMaxMomentsBeforeEndState = createComputed(function(_)
			-- upvalues: maxValue (ref)
			return maxValue
		end),
		setInfiniteScrollAllowedByPolicy = function(value)
			-- upvalues: var3 (ref)
			var3(value)
		end
	}
end