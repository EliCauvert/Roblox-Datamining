local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local GetDrawerVisibleStoreFunction = require(Parent.Drawer).Stores.GetDrawerVisibleStore
local FFlagUseSignalsForAppTopBanner = require(Parent.SharedFlags).FFlagUseSignalsForAppTopBanner
local UseSignalState = if FFlagUseSignalsForAppTopBanner then require(Parent.SignalsReact).useSignalState else nil
local GetAppTopBannerStore = if FFlagUseSignalsForAppTopBanner then require(Parent.AppTopBanner).GetAppTopBannerStore else nil

return function() --[[ Line: 18 | Named "useDismissFlyoutOnPartyTopBanner" ]]
	-- upvalues: UseSetDrawerVisibleFunction (copy), FFlagUseSignalsForAppTopBanner (copy), UseSignalState (copy), GetAppTopBannerStore (copy), UseSelectorFunction (copy), ReactModule (copy), GetDrawerVisibleStoreFunction (copy)
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseSignalStateResult = if FFlagUseSignalsForAppTopBanner then UseSignalState(GetAppTopBannerStore(false).getExpanded) else UseSelectorFunction(function(p1) --[[ Line: 23 ]]
		return if p1.AppTopBanner then p1.AppTopBanner.expanded else false
	end)
	local UseRefResult = ReactModule.useRef(UseSignalStateResult)
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: GetDrawerVisibleStoreFunction (upval), UseRefResult (copy), UseSignalStateResult (copy), UseSetDrawerVisibleResult (copy)
		if GetDrawerVisibleStoreFunction(false).getDrawerVisible() and UseRefResult.current and not UseSignalStateResult then
			UseSetDrawerVisibleResult(false)
		end
		UseRefResult.current = UseSignalStateResult
	end, { UseSignalStateResult, UseSetDrawerVisibleResult })
end