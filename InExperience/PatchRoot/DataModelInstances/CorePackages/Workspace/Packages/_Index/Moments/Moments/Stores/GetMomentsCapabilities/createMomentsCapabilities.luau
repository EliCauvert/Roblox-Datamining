local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local getFFlagMomentsNonInfiniteScrollModule = require(moments.Flags.GetFFlagMomentsNonInfiniteScroll)
local getFIntMomentsNonInfiniteScrollLimitModule = require(moments.Flags.GetFIntMomentsNonInfiniteScrollLimit)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function readInfiniteScrollPolicy() --[[ line: 54 ]]
	-- upvalues: parent (ref)
	local ok, status = pcall(function() --[[ line: 55 ]]
		-- upvalues: parent (copy)
		return require(parent.UniversalAppPolicy).getAppFeaturePolicies().getMomentsInfiniteScrollEnabled()
	end)
	
	return if ok then status ~= false else true
end

return function(p0) --[[ line: 67 | named "createMomentsCapabilities" ]]
	-- upvalues: getFFlagMomentsNonInfiniteScrollModule (ref), getFIntMomentsNonInfiniteScrollLimitModule (ref), readInfiniteScrollPolicy (ref), createSignal (ref), createComputed (ref)
	local var5 = getFFlagMomentsNonInfiniteScrollModule()
	local maxValue = math.max(1, getFIntMomentsNonInfiniteScrollLimitModule())
	local var7, var8 = createSignal(if var5 then (p0 or readInfiniteScrollPolicy)() else true)
	
	return {
		getIsInfiniteScrollEnabled = createComputed(function(p1) --[[ line: 81 ]]
			-- upvalues: var5 (ref), var7 (ref)
			return if var5 then var7(p1) else true
		end),
		getMaxMomentsBeforeEndState = createComputed(function(_) --[[ line: 89 ]]
			-- upvalues: maxValue (ref)
			return maxValue
		end),
		setInfiniteScrollAllowedByPolicy = function(value) --[[ line: 93 ]]
			-- upvalues: var8 (ref)
			var8(value)
		end
	}
end