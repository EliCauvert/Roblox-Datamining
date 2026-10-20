local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Moments.Components.Feed.FeedTypes)
local GameGetPlayabilityStoreModule = require(Parent.DataHydration.GameGetPlayabilityStore)
local IsVideoEligibleForPlayabilityFunction = require(Parent.VideoUtils).isVideoEligibleForPlayability
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseVerticalPagerFunction = require(Moments.Components.VerticalPager.VerticalPagerContext).useVerticalPager
local config = {
	data = SignalsModule.createComputed(function()
		return nil
	end),
	status = SignalsModule.createComputed(function(): string
		return "Ready"
	end)
}

return function(p1)
	-- upvalues: UseVerticalPagerFunction (copy), GameGetPlayabilityStoreModule (copy), ReactModule (copy), config (copy), UseSignalStateFunction (copy), IsVideoEligibleForPlayabilityFunction (copy)
	local UseVerticalPagerResult = UseVerticalPagerFunction()
	local GameGetPlayabilityStoreModuleResult = GameGetPlayabilityStoreModule(false)
	local Text = tostring(p1.universeId or 0)
	local IsUniverseIdAbove: boolean = p1.universeId ~= nil and p1.universeId > 0
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsUniverseIdAbove (copy), config (upval), GameGetPlayabilityStoreModuleResult (copy), Text (copy)
		return if IsUniverseIdAbove then GameGetPlayabilityStoreModuleResult.getAndFetchPlayability(Text) else config
	end, {
		IsUniverseIdAbove,
		GameGetPlayabilityStoreModuleResult,
		Text
	})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.status)
	local IsVideoEligibleForPlayability = IsVideoEligibleForPlayabilityFunction(UseSignalStateResult1 == "Ready", UseSignalStateResult)
	local Eligible = nil
	Eligible = if IsUniverseIdAbove and UseSignalStateResult1 ~= "Failed" then if UseSignalStateResult1 == "Ready" then if IsVideoEligibleForPlayability then "Eligible" else "Ineligible" else "Loading" else "Ineligible"
	ReactModule.useEffect(function()
		-- upvalues: Eligible (ref), UseRefResult (copy), UseVerticalPagerResult (copy), p1 (copy)
		if Eligible ~= "Ineligible" or UseRefResult.current then return end
		for i, value in UseVerticalPagerResult.store.getItems(false) do
			if value.kind == "moment" and value.moment.momentId == p1.momentId then
				UseRefResult.current = true
				UseVerticalPagerResult.removeItem(i)
				break
			end
		end
	end, { UseVerticalPagerResult, p1.momentId, Eligible })
	
	return { status = Eligible }
end