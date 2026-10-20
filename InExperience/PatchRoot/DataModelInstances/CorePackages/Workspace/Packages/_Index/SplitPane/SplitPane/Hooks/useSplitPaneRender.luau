local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.AppSplitView)
local SplitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local IsSupportPaneScreenModule = require(script.Parent.Parent.Utils.isSupportPaneScreen)
local SplitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local SplitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local FFlagEnableSplitPaneTelemetry = require(Parent.SharedFlags).FFlagEnableSplitPaneTelemetry
local SupportPaneInputRulesModule = require(script.Parent.Parent.Utils.supportPaneInputRules)
local UsePreferredInputFunction = require(Parent.Responsive).usePreferredInput
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName

return function(Entry, Tbl, List, p1)
	-- upvalues: SplitPaneStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), SplitPaneContextModule (copy), UsePreferredInputFunction (copy), TempRnSwitchNavigatorName (copy), FFlagEnableSplitPaneTelemetry (copy), SplitPaneTelemetryModule (copy), SplitPaneVariantModule (copy), SupportPaneInputRulesModule (copy), IsSupportPaneScreenModule (copy)
	local Store = SplitPaneStoreModule.getStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getSupportPaneMode)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Store.getSupportWidth)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(Store.getIsBreakpointEnabled)
	local UseContextResult = ReactModule.useContext(SplitPaneContextModule)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local CountList: number = if p1 then #List else 0
	local Copy = table.clone(Tbl)
	local SupportSlotChildren = {}
	local OverlaySlotChildren = {}
	
	if p1 then
		for _, value in List do
			local Key = Entry[value].descriptor.key
			local Entry1 = Copy[Key]
			
			if Entry1 ~= nil then
				Copy[Key] = nil
				SupportSlotChildren[Key] = Entry1
			end
		end
	end
	if UseSignalStateResult2 then
		local v1 = 0
		
		for i, value1 in Entry do
			local Options = value1.descriptor.options
			
			if Options ~= nil and Options.splitPaneEligibility ~= nil then
				v1 = i
			end
		end
		for i1, value2 in Entry do
			local Options = value2.descriptor.options
			local NoOptions = Options == nil or not Options.transparent or Options.overlayEnabled or Options.splitPaneEligibility ~= nil
			local Key = nil
			local Entry3 = nil
			
			if not NoOptions then
				Key = value2.descriptor.key
				Entry3 = Copy[Key]
				NoOptions = Entry3 == nil
			end
			if not NoOptions then
				Copy[Key] = nil
				
				if v1 < i1 then
					OverlaySlotChildren[Key] = Entry3
				end
			end
		end
	end
	local IsRouteNameMatch: boolean = Entry[1] ~= nil and (Entry[1].descriptor ~= nil and (Entry[1].descriptor.state ~= nil and Entry[1].descriptor.state.routeName == TempRnSwitchNavigatorName))
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), CountList (copy), IsRouteNameMatch (copy), FFlagEnableSplitPaneTelemetry (upval), SplitPaneTelemetryModule (upval), SplitPaneVariantModule (upval), Store (copy), SupportPaneInputRulesModule (upval), UsePreferredInputResult (copy)
		local Current: number = UseRefResult.current
		UseRefResult.current = CountList
		
		if not IsRouteNameMatch then return end
		local IsCountListMatch: boolean = Current > 0 and CountList == 0
		local IsCountListAbove: boolean = Current == 0 and CountList > 0
		local IsCountListAbove1: boolean = not IsCountListAbove and CountList > 0
		
		if IsCountListAbove then
			if FFlagEnableSplitPaneTelemetry then
				SplitPaneTelemetryModule.logSupportRouteOpened()
			end
			if SplitPaneVariantModule.shouldAutoExpandOnSupportOpen() then
				Store.setTemporarySupportPaneMode(SupportPaneInputRulesModule.resolveOpenedMode(UsePreferredInputResult))
				
				return
			else
				Store.setTemporarySupportPaneMode(SupportPaneInputRulesModule.resolveInputChangedMode(UsePreferredInputResult))
				
				return
			end
		elseif IsCountListMatch then
			Store.setTemporarySupportPaneMode(nil)
			
			return
		else
			if IsCountListAbove1 then
				Store.setTemporarySupportPaneMode(SupportPaneInputRulesModule.resolveInputChangedMode(UsePreferredInputResult))
			end
		end
	end, {
		IsRouteNameMatch,
		CountList,
		Store,
		UseSignalStateResult,
		UsePreferredInputResult
	})
	local Entry2 = if CountList > 0 then List[CountList] else nil
	local T = if Entry2 == nil then {} else Entry[Entry2].descriptor.options
	local Navigation = if Entry2 == nil then nil else Entry[Entry2].descriptor.navigation
	local HasEntry = Entry2 ~= nil
	local SupportRouteKeys = {}
	
	if p1 then
		for _, value3 in Entry do
			if IsSupportPaneScreenModule(value3) then
				local State = value3.descriptor.state
				
				if State ~= nil and State.key ~= nil then
					table.insert(SupportRouteKeys, State.key)
				end
			end
		end
	end
	return {
		primarySlotChildren = Copy,
		supportSlotChildren = SupportSlotChildren,
		overlaySlotChildren = OverlaySlotChildren,
		supportContentProps = {
			hostNavigation = Navigation,
			hasDetailOnTop = HasEntry,
			paneCount = CountList,
			splitPaneExpandable = T.splitPaneExpandable,
			splitPaneCollapsible = T.splitPaneCollapsible,
			supportRouteKeys = SupportRouteKeys
		},
		supportWidth = UseSignalStateResult1,
		supportMinWidth = Store.getMinSupportWidth(),
		supportMaxWidth = Store.getMaxSupportWidth(),
		onSupportPaneWidthChanged = Store.setSupportWidth,
		supportPaneMode = UseSignalStateResult,
		supportPaneResizable = UseContextResult.supportPaneResizable == true,
		supportResizerAbovePane = not (if T.splitPaneCollapsible == true then not (HasEntry and CountList > 1) else not HasEntry and not (HasEntry and CountList > 1)),
		isBreakpointEnabled = UseSignalStateResult2,
		isRootAppStack = IsRouteNameMatch,
		renderSupportContent = UseContextResult.renderSupportContent,
		onContentRegionRectChanged = UseContextResult.onContentRegionRectChanged
	}
end