local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local verticalPagerContextModule = require(moments.Components.VerticalPager.VerticalPagerContext)
local _ = require(moments.Components.Feed.FeedTypes)
local gameGetPlayabilityStoreModule = require(parent.DataHydration.GameGetPlayabilityStore)
local isVideoEligibleForPlayability = require(parent.VideoUtils).isVideoEligibleForPlayability
local useSignalState = signalsReactModule.useSignalState
local useVerticalPager = verticalPagerContextModule.useVerticalPager
local t = {
	data = signalsModule.createComputed(function()
		return nil
	end),
	status = signalsModule.createComputed(function()
		return "Ready"
	end)
}

return function(p1)
	-- upvalues: useVerticalPager (ref), gameGetPlayabilityStoreModule (ref), reactModule (ref), t (ref), useSignalState (ref), isVideoEligibleForPlayability (ref)
	local var1 = useVerticalPager()
	local var2 = gameGetPlayabilityStoreModule(false)
	local var3 = tostring(p1.universeId or 0)
	local var4 = p1.universeId ~= nil and p1.universeId > 0
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), t (copy), var2 (ref), var3 (ref)
		return if var4 then var2.getAndFetchPlayability(var3) else t
	end, { var4, var2, var3 })
	local var7 = useSignalState(var6.status)
	local _ = nil
	local var8 = if var4 and var7 ~= "Failed" then if var7 ~= "Ready" then if isVideoEligibleForPlayability(var7 == "Ready", useSignalState(var6.data)) then "Eligible" else "Ineligible" else "Loading" else "Ineligible"
	reactModule.useEffect(function()
		-- upvalues: var8 (write), var5 (ref), var1 (ref), p1 (ref)
		if var8 ~= "Ineligible" or var5.current then return end
		for i, v in var1.store.getItems(false) do
			if v.kind == "moment" and v.moment.momentId == p1.momentId then
				var5.current = true
				var1.removeItem(i)
				
				return
			end
		end
	end, { var1, p1.momentId, var8 })
	
	return { status = var8 }
end