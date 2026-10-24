local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local FFlagEnableSplitPaneTelemetry = require(Parent.SharedFlags).FFlagEnableSplitPaneTelemetry
local FFlagEnableSplitPaneStackFallbackFix = require(Parent.SharedFlags).FFlagEnableSplitPaneStackFallbackFix
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local AppSplitViewModule = require(Parent.AppSplitView)
local ViewState = require(Parent.Navigation).ViewState
local SplitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local UseInitializeSplitPaneTelemetrySessionModule = require(script.Parent.useInitializeSplitPaneTelemetrySession)
local ComputeSplitEligibilityModule = require(script.Parent.Parent.Utils.computeSplitEligibility)
local SplitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local SupportPaneMode = AppSplitViewModule.Enums.SupportPaneMode
local SplitPaneSlot = AppSplitViewModule.Enums.SplitPaneSlot
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName

return function(Entry, p1: number)
	-- upvalues: SplitPaneStoreModule (copy), SignalsReactModule (copy), FFlagEnableSplitPaneStackFallbackFix (copy), ComputeSplitEligibilityModule (copy), ReactModule (copy), SplitPaneContextModule (copy), TempRnSwitchNavigatorName (copy), SplitPaneVariantModule (copy), SupportPaneMode (copy), SplitPaneSlot (copy), ViewState (copy), RoactNavigationModule (copy), FFlagEnableSplitPaneTelemetry (copy), UseInitializeSplitPaneTelemetrySessionModule (copy)
	local Store = SplitPaneStoreModule.getStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getIsBreakpointEnabled)
	local UseSignalStateResult1 = if FFlagEnableSplitPaneStackFallbackFix then SignalsReactModule.useSignalState(Store.getWasSplitPaneAvailable) else false
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(Store.getSupportPaneMode)
	local SplitEligibilityModule = ComputeSplitEligibilityModule(Entry)
	local SplitEligibilityModule1 = UseSignalStateResult and SplitEligibilityModule
	local HasRenderSupportContent = ReactModule.useContext(SplitPaneContextModule).renderSupportContent ~= nil
	local IsRouteNameMatch: boolean = Entry[1] ~= nil and (Entry[1].descriptor ~= nil and (Entry[1].descriptor.state ~= nil and Entry[1].descriptor.state.routeName == TempRnSwitchNavigatorName))
	local PaneIndices = {}
	local SplitPrimaryIndex: number? = nil
	local Flag = false
	local IsUseSignalStateResultMatch: boolean = SplitPaneVariantModule.isPaneCollapsedByDefault() and (not SplitPaneVariantModule.shouldAutoExpandOnSupportOpen() and UseSignalStateResult2 == SupportPaneMode.Collapsed)
	repeat
		if SplitEligibilityModule1 then
			for i = #Entry, 1, -1 do
				local Options = Entry[i].descriptor.options
				local SplitPaneEligibility = Options.splitPaneEligibility
				
				if IsUseSignalStateResultMatch and SplitPaneEligibility == SplitPaneSlot.Support then
					SplitPaneEligibility = nil
				end
				if SplitPaneEligibility == SplitPaneSlot.Support then
					table.insert(PaneIndices, 1, i)
				elseif (not Options.transparent and not Options.overlayEnabled or SplitPaneEligibility ~= nil) and #PaneIndices > 0 then
					SplitPrimaryIndex = i
					break
				end
			end
			break
		end
		if UseSignalStateResult or FFlagEnableSplitPaneStackFallbackFix and not UseSignalStateResult1 then break end
		for _, value in Entry do
			if value.descriptor.options.splitPaneEligibility == SplitPaneSlot.Support and value.viewState ~= ViewState.Closing then
				Flag = true
			else
				continue
			end
		end
		break
	until true
	local IsRouteActiveOnPane: boolean = SplitPrimaryIndex ~= nil and #PaneIndices > 0
	local Flag1: boolean = Flag or (IsRouteActiveOnPane or SplitEligibilityModule1 and (HasRenderSupportContent and p1 >= 1))
	local ContentTopCandidate: number? = nil
	
	if SplitEligibilityModule1 then
		for i1 = #Entry, 1, -1 do
			local Options = Entry[i1].descriptor.options
			local SplitPaneEligibility = Options.splitPaneEligibility
			
			if IsUseSignalStateResultMatch and SplitPaneEligibility == SplitPaneSlot.Support then
				SplitPaneEligibility = nil
			end
			if SplitPaneEligibility == SplitPaneSlot.Support or (Options.transparent or Options.overlayEnabled) and SplitPaneEligibility == nil then
				continue
			end
			ContentTopCandidate = i1
			break
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: IsRouteNameMatch (copy), Store (copy), SplitEligibilityModule (copy), Entry (copy), SplitPaneSlot (upval), RoactNavigationModule (upval)
		if not IsRouteNameMatch then return end
		local IsSplitEligible = Store.getIsSplitEligible(false)
		Store.setIsSplitEligible(SplitEligibilityModule)
		
		if not IsSplitEligible or SplitEligibilityModule then return end
		local Descriptor = Entry[1].descriptor
		
		if Descriptor == nil or Descriptor.navigation == nil then return end
		local Navigation = Descriptor.navigation
		
		for i = #Entry, 2, -1 do
			local Descriptor1 = Entry[i].descriptor
			local NoDescriptor = Descriptor1 == nil
			
			if not NoDescriptor then
				local SplitPaneEligibility = Descriptor1.options.splitPaneEligibility
				NoDescriptor = SplitPaneEligibility == nil or SplitPaneEligibility == SplitPaneSlot.Content
			end
			local NoKey: boolean = NoDescriptor
			local Key = nil
			
			if not NoKey then
				Key = if Descriptor1.state == nil then nil else Descriptor1.state.key or nil
				NoKey = Key == nil
			end
			if not NoKey then
				Navigation.dispatch(RoactNavigationModule.StackActions.pop({ prune = false, immediate = true, key = Key }))
			end
		end
	end, { IsRouteNameMatch, SplitEligibilityModule, Entry, Store })
	ReactModule.useEffect(function()
		-- upvalues: Flag1 (copy), IsRouteNameMatch (copy), Store (copy), Entry (copy), ViewState (upval), FFlagEnableSplitPaneStackFallbackFix (upval), UseSignalStateResult1 (copy), SplitPaneSlot (upval)
		if Flag1 then return end
		if IsRouteNameMatch then
			Store.setTemporarySupportPaneMode(nil)
		end
		for _, value in Entry do
			if value.viewState == ViewState.Closing and (not FFlagEnableSplitPaneStackFallbackFix or UseSignalStateResult1) and value.descriptor.options.splitPaneEligibility == SplitPaneSlot.Support then
				value.setClosed()
			end
		end
	end, {
		IsRouteNameMatch,
		Flag1,
		Entry,
		Store,
		UseSignalStateResult1
	})
	
	if FFlagEnableSplitPaneTelemetry then
		UseInitializeSplitPaneTelemetrySessionModule(IsRouteNameMatch)
	end
	return {
		isSplitLayoutEnabled = Flag1,
		isRouteActiveOnPane = IsRouteActiveOnPane,
		paneIndices = PaneIndices,
		contentTopCandidate = ContentTopCandidate,
		splitPrimaryIndex = SplitPrimaryIndex,
		supportPaneMode = UseSignalStateResult2,
		isRootAppStack = IsRouteNameMatch,
		isSplitEnabled = SplitEligibilityModule1,
		wasSplitPaneAvailable = UseSignalStateResult1
	}
end