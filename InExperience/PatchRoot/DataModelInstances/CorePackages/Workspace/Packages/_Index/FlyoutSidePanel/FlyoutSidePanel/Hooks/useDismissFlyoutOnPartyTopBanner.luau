local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local getDrawerVisibleStore = require(parent.Drawer).Stores.GetDrawerVisibleStore
local fFlagUseSignalsForAppTopBanner = require(parent.SharedFlags).FFlagUseSignalsForAppTopBanner
local var1 = if fFlagUseSignalsForAppTopBanner then require(parent.SignalsReact).useSignalState else nil
local var2 = if fFlagUseSignalsForAppTopBanner then require(parent.AppTopBanner).GetAppTopBannerStore else nil

return function() --[[ line: 18 | named "useDismissFlyoutOnPartyTopBanner" ]]
	-- upvalues: useSetDrawerVisible (ref), fFlagUseSignalsForAppTopBanner (ref), var1 (ref), var2 (ref), useSelector (ref), reactModule (ref), getDrawerVisibleStore (ref)
	local var3 = useSetDrawerVisible()
	local var4 = if fFlagUseSignalsForAppTopBanner then var1(var2(false).getExpanded) else useSelector(function(p0) --[[ line: 23 ]]
		return if p0.AppTopBanner then p0.AppTopBanner.expanded else false
	end)
	local var5 = reactModule.useRef(var4)
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: getDrawerVisibleStore (copy), var5 (ref), var4 (ref), var3 (ref)
		if getDrawerVisibleStore(false).getDrawerVisible() and var5.current and not var4 then
			var3(false)
		end
		var5.current = var4
	end, { var4, var3 })
end