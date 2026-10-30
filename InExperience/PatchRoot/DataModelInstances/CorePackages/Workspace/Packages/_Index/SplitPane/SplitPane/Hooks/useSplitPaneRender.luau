local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SplitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local IsSupportPaneScreenModule = require(script.Parent.Parent.Utils.isSupportPaneScreen)
local SplitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local SplitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local FFlagEnableSplitPaneTelemetry = require(Parent.SharedFlags).FFlagEnableSplitPaneTelemetry
local FFlagAXPauseSceneWhenSplitPaneCollapsed = require(Parent.SharedFlags).FFlagAXPauseSceneWhenSplitPaneCollapsed
local FFlagFixSplitPaneGamepadLayoutJitter = require(Parent.SharedFlags).FFlagFixSplitPaneGamepadLayoutJitter
local FFlagSplitPaneAvatarOnlyAlwaysExpanded = require(Parent.SharedFlags).FFlagSplitPaneAvatarOnlyAlwaysExpanded
local SupportPaneInputRulesModule = require(script.Parent.Parent.Utils.supportPaneInputRules)
local UsePreferredInputFunction = require(Parent.Responsive).usePreferredInput
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName

local function resolveTemporarySupportPaneMode(Current: number, Count: number, p1, p2)
	-- upvalues: FFlagSplitPaneAvatarOnlyAlwaysExpanded (copy), SplitPaneVariantModule (copy), SupportPaneMode (copy), SupportPaneInputRulesModule (copy)
	local IsCountMatch: boolean = Current > 0 and Count == 0
	local IsCountAbove: boolean = Current == 0 and Count > 0
	local IsCountAbove1: boolean = not IsCountAbove and Count > 0
	
	if IsCountAbove then
		if FFlagSplitPaneAvatarOnlyAlwaysExpanded and SplitPaneVariantModule.isSupportPaneAlwaysExpanded() then
			return SupportPaneMode.Expanded, true
		else
			return if SplitPaneVariantModule.shouldAutoExpandOnSupportOpen() then SupportPaneInputRulesModule.resolveOpenedMode(p1) else SupportPaneInputRulesModule.resolveInputChangedMode(p1), true
		end
	elseif IsCountMatch then
		return nil, true
	elseif not p2 or not IsCountAbove1 then
		return nil, false
	elseif FFlagSplitPaneAvatarOnlyAlwaysExpanded and SplitPaneVariantModule.isSupportPaneAlwaysExpanded() then
		return SupportPaneMode.Expanded, true
	else
		return SupportPaneInputRulesModule.resolveInputChangedMode(p1), true
	end
end

return function(Entry, Tbl, List, p1)
	-- upvalues: SplitPaneStoreModule (copy), TempRnSwitchNavigatorName (copy), ReactModule (copy), UsePreferredInputFunction (copy), FFlagFixSplitPaneGamepadLayoutJitter (copy), FFlagSplitPaneAvatarOnlyAlwaysExpanded (copy), SplitPaneVariantModule (copy), SupportPaneMode (copy), SupportPaneInputRulesModule (copy), SignalsReactModule (copy), SplitPaneContextModule (copy), FFlagAXPauseSceneWhenSplitPaneCollapsed (copy), FFlagEnableSplitPaneTelemetry (copy), SplitPaneTelemetryModule (copy), resolveTemporarySupportPaneMode (copy), IsSupportPaneScreenModule (copy)
	local Store = SplitPaneStoreModule.getStore()
	local CountList: number = if p1 then #List else 0
	local IsRouteNameMatch: boolean = Entry[1] ~= nil and (Entry[1].descriptor ~= nil and (Entry[1].descriptor.state ~= nil and Entry[1].descriptor.state.routeName == TempRnSwitchNavigatorName))
	local UseRefResult = ReactModule.useRef(0)
	local UsePreferredInputResult = UsePreferredInputFunction()
	
	if FFlagFixSplitPaneGamepadLayoutJitter and IsRouteNameMatch then
		local Current: number = UseRefResult.current
		local IsCountListMatch: boolean = Current > 0 and CountList == 0
		local IsCountListAbove: boolean = Current == 0 and CountList > 0
		
		local Flag = nil
		local ResolveOpenedModeResult = nil
		if IsCountListAbove then
			if FFlagSplitPaneAvatarOnlyAlwaysExpanded and SplitPaneVariantModule.isSupportPaneAlwaysExpanded() then
				ResolveOpenedModeResult = SupportPaneMode.Expanded
				Flag = true
			else
				ResolveOpenedModeResult = if SplitPaneVariantModule.shouldAutoExpandOnSupportOpen() then SupportPaneInputRulesModule.resolveOpenedMode(UsePreferredInputResult) else SupportPaneInputRulesModule.resolveInputChangedMode(UsePreferredInputResult)
				Flag = true
			end
		elseif IsCountListMatch then
			ResolveOpenedModeResult = nil
			Flag = true
		else
			ResolveOpenedModeResult = nil
			Flag = false
		end
		if Flag then
			Store.setTemporarySupportPaneMode(ResolveOpenedModeResult)
		end
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getSupportPaneMode)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Store.getSupportWidth)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(Store.getIsBreakpointEnabled)
	local UseContextResult = ReactModule.useContext(SplitPaneContextModule)
	local Copy = table.clone(Tbl)
	local SupportSlotChildren = {}
	local OverlaySlotChildren = {}
	
	if p1 then
		for _, value1 in List do
			local Key = Entry[value1].descriptor.key
			local Entry1 = Copy[Key]
			
			if Entry1 ~= nil then
				Copy[Key] = nil
				SupportSlotChildren[Key] = Entry1
			end
		end
	end
	if UseSignalStateResult2 then
		local v1 = 0
		
		for i, value2 in Entry do
			local Options = value2.descriptor.options
			
			if Options ~= nil and Options.splitPaneEligibility ~= nil then
				v1 = i
			end
		end
		for i1, value3 in Entry do
			local Options = value3.descriptor.options
			local NoOptions = Options == nil or not Options.transparent or Options.overlayEnabled or Options.splitPaneEligibility ~= nil
			local Key = nil
			local Entry2 = nil
			
			if not NoOptions then
				Key = value3.descriptor.key
				Entry2 = Copy[Key]
				NoOptions = Entry2 == nil
			end
			if not NoOptions then
				Copy[Key] = nil
				
				if v1 < i1 then
					OverlaySlotChildren[Key] = Entry2
				end
			end
		end
	end
	if FFlagAXPauseSceneWhenSplitPaneCollapsed then
		ReactModule.useEffect(function()
			-- upvalues: IsRouteNameMatch (copy), Store (copy), CountList (copy)
			if IsRouteNameMatch then
				Store.setHasSupportRoute(CountList > 0)
			end
		end, { IsRouteNameMatch, CountList, Store })
		ReactModule.useEffect(function()
			-- upvalues: IsRouteNameMatch (copy), Store (copy)
			return function()
				-- upvalues: IsRouteNameMatch (upval), Store (upval)
				if IsRouteNameMatch then
					Store.setHasSupportRoute(false)
				end
			end
		end, { IsRouteNameMatch, Store })
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), CountList (copy), IsRouteNameMatch (copy), FFlagEnableSplitPaneTelemetry (upval), SplitPaneTelemetryModule (upval), resolveTemporarySupportPaneMode (upval), UsePreferredInputResult (copy), Store (copy)
		local Current = UseRefResult.current
		UseRefResult.current = CountList
		
		if not IsRouteNameMatch then return end
		if Current == 0 and CountList > 0 and FFlagEnableSplitPaneTelemetry then
			SplitPaneTelemetryModule.logSupportRouteOpened()
		end
		local ResolveTemporarySupportPaneModeResult, ResolveTemporarySupportPaneModeResult2 = resolveTemporarySupportPaneMode(Current, CountList, UsePreferredInputResult, true)
		
		if ResolveTemporarySupportPaneModeResult2 then
			Store.setTemporarySupportPaneMode(ResolveTemporarySupportPaneModeResult)
		end
	end, {
		IsRouteNameMatch,
		CountList,
		Store,
		UseSignalStateResult,
		UsePreferredInputResult
	})
	local Entry3 = if CountList > 0 then List[CountList] else nil
	local T = if Entry3 == nil then {} else Entry[Entry3].descriptor.options
	local Navigation = if Entry3 == nil then nil else Entry[Entry3].descriptor.navigation
	local HasEntry = Entry3 ~= nil
	local SupportRouteKeys = {}
	
	if p1 then
		for _, value in Entry do
			if IsSupportPaneScreenModule(value) then
				local State = value.descriptor.state
				
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