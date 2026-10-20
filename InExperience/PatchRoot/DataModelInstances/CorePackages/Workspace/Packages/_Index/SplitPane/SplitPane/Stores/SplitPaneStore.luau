local Parent = script:FindFirstAncestor("SplitPane").Parent
local SignalsModule = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local AppCompositionModule = require(Parent.AppComposition)
local DisplayModule = require(Parent.Display)
local SharedFlagsModule = require(Parent.SharedFlags)
local SplitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local GetTelemetrySnapshotModule = require(script.Parent.Parent.Telemetry.getTelemetrySnapshot)
local CreateCurrentScreenOrientationSignalModule = require(script.Parent.Parent.Utils.createCurrentScreenOrientationSignal)
local SupportPaneWidthRulesModule = require(script.Parent.Parent.Utils.supportPaneWidthRules)
local SplitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local GetRegionOverridesFunction = AppCompositionModule.getRegionOverrides
local RegionName = AppCompositionModule.RegionName
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local FFlagSplitPaneFixClassicThemeHeader = SharedFlagsModule.FFlagSplitPaneFixClassicThemeHeader
local FFlagEnableSplitPaneTelemetry = SharedFlagsModule.FFlagEnableSplitPaneTelemetry

local function _()
	-- upvalues: GetRegionOverridesFunction (copy), RegionName (copy)
	local RegionOverrides = if GetRegionOverridesFunction and RegionName then GetRegionOverridesFunction(RegionName.SupportRegion) else nil
	local WidthScale = if RegionOverrides and RegionOverrides.widthScale then RegionOverrides.widthScale else 0.33
	local MinWidth = if RegionOverrides and RegionOverrides.minWidth then RegionOverrides.minWidth else 0
	
	if RegionOverrides and RegionOverrides.maxWidth then
		return WidthScale, MinWidth, RegionOverrides.maxWidth
	else
		return WidthScale, MinWidth, 1e999
	end
end

local function evaluateShouldDefaultToCollapsed(p1)
	-- upvalues: SplitPaneVariantModule (copy), DisplayModule (copy), SupportPaneWidthRulesModule (copy)
	return if SplitPaneVariantModule.isPaneCollapsedByDefault() then true else SupportPaneWidthRulesModule.shouldDefaultToCollapsed((DisplayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)))
end

local Effect = nil
local v1 = nil

local function createSplitPaneStore()
	-- upvalues: GetRegionOverridesFunction (copy), RegionName (copy), v1 (ref), CreateCurrentScreenOrientationSignalModule (copy), DisplayModule (copy), SupportPaneWidthRulesModule (copy), SignalsModule (copy), evaluateShouldDefaultToCollapsed (copy), SupportPaneMode (copy), FFlagEnableSplitPaneTelemetry (copy), Effect (ref), FFlagSplitPaneFixClassicThemeHeader (copy), SignalsUtilsModule (copy), SplitPaneTelemetryModule (copy), GetTelemetrySnapshotModule (copy)
	local RegionOverrides = if GetRegionOverridesFunction and RegionName then GetRegionOverridesFunction(RegionName.SupportRegion) else nil
	local WidthScale = if RegionOverrides and RegionOverrides.widthScale then RegionOverrides.widthScale else 0.33
	local MinWidth = if RegionOverrides and RegionOverrides.minWidth then RegionOverrides.minWidth else 0
	local MaxWidth = if RegionOverrides and RegionOverrides.maxWidth then RegionOverrides.maxWidth else 1e999
	local Callback = nil
	local CurrentScreenOrientationSignalModule, CurrentScreenOrientationSignalModule2 = CreateCurrentScreenOrientationSignalModule()
	v1 = CurrentScreenOrientationSignalModule2
	Callback = CurrentScreenOrientationSignalModule
	
	local function evaluateBreakpointEnabled(p1)
		-- upvalues: DisplayModule (upval), Callback (ref), SupportPaneWidthRulesModule (upval)
		local DesignSpaceViewportWidth = DisplayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)
		local CallbackResult = Callback(p1)
		
		return (CallbackResult == Enum.ScreenOrientation.LandscapeLeft or CallbackResult == Enum.ScreenOrientation.LandscapeRight) and SupportPaneWidthRulesModule.isSplitEnabledForWidth(DesignSpaceViewportWidth)
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Computed = SignalsModule.createComputed(evaluateShouldDefaultToCollapsed)
	
	local function _(p1, p2)
		-- upvalues: Signal3 (copy), Signal1 (copy), Computed (copy), SupportPaneMode (upval)
		local SignalResult = Signal3(p1)
		
		if SignalResult ~= nil then
			return SignalResult
		end
		local SignalResult1 = Signal1(p1)
		
		if SignalResult1 ~= nil then
			return SignalResult1
		end
		if p2 == nil then
			p2 = Computed(p1)
		end
		return if p2 then SupportPaneMode.Collapsed else SupportPaneMode.Normal
	end
	
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: FFlagEnableSplitPaneTelemetry (upval), Signal3 (copy), Signal1 (copy), Computed (copy), SupportPaneMode (upval)
		if FFlagEnableSplitPaneTelemetry then
			local v2 = nil
			local SignalResult = Signal3(p1)
			
			if SignalResult ~= nil then
				return SignalResult
			end
			local SignalResult1 = Signal1(p1)
			
			if SignalResult1 ~= nil then
				return SignalResult1
			end
			if v2 == nil then
				v2 = Computed(p1)
			end
			return if v2 then SupportPaneMode.Collapsed else SupportPaneMode.Normal
		else
			local SignalResult1 = Signal3(p1)
			
			if SignalResult1 == nil then
				local SignalResult = Signal1(p1)
				
				return if SignalResult == nil then if Computed(p1) then SupportPaneMode.Collapsed else SupportPaneMode.Normal else SignalResult
			else
				return SignalResult1
			end
		end
	end)
	
	local function getSupportPaneMode(p1)
		-- upvalues: Computed1 (copy)
		return (Computed1(p1))
	end
	
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	
	if not FFlagEnableSplitPaneTelemetry then
		local ComputedResult = Computed(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: Computed (copy), ComputedResult (ref), Signal2_1 (copy)
			local ComputedResult1 = Computed(p1)
			
			if ComputedResult1 ~= ComputedResult then
				Signal2_1(nil)
			end
			ComputedResult = ComputedResult1
		end)
	end
	local Computed2 = SignalsModule.createComputed(function(p1)
		-- upvalues: DisplayModule (upval), WidthScale (copy), Signal (copy), MinWidth (copy), MaxWidth (copy)
		local DesignSpaceViewportWidth: number = DisplayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)
		
		return if DesignSpaceViewportWidth <= 0 then WidthScale else (Signal(p1) or math.clamp(DesignSpaceViewportWidth * WidthScale, MinWidth, MaxWidth)) / DesignSpaceViewportWidth
	end)
	local v2 = nil
	local v3 = nil
	
	if FFlagSplitPaneFixClassicThemeHeader then
		v2, v46 = SignalsModule.createSignal(nil)
	end
	local Signal5, Signal2_4 = SignalsModule.createSignal(false)
	local Callback1 = nil
	local SetIsTelemetrySessionInitialized = nil
	
	if FFlagEnableSplitPaneTelemetry then
		Callback1, SetIsTelemetrySessionInitialized = SignalsUtilsModule.createSessionScopedSignal(false)
	end
	local Computed3 = SignalsModule.createComputed(function(p1)
		-- upvalues: evaluateBreakpointEnabled (copy), Signal5 (copy)
		return evaluateBreakpointEnabled(p1) and Signal5(p1)
	end)
	local Computed4 = SignalsModule.createComputed(function(p1)
		-- upvalues: Computed3 (copy), Computed1 (copy)
		return if Computed3(p1) then Computed1(p1) else nil
	end)
	local Computed5 = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Computed4 (copy), SupportPaneMode (upval)
		local ComputedResult = Computed4(p1)
		
		return ComputedResult == nil or ComputedResult == SupportPaneMode.Collapsed
	end)
	local v4 = nil
	v4 = {
		getCurrentScreenOrientation = Callback,
		getIsTelemetrySessionInitialized = Callback1,
		setIsTelemetrySessionInitialized = SetIsTelemetrySessionInitialized,
		getSupportWidth = Signal,
		getSupportWidthFraction = Computed2,
		setSupportWidth = function(p1)
			-- upvalues: DisplayModule (upval), Signal2 (copy), MinWidth (copy), MaxWidth (copy)
			local PlatformScale: number = DisplayModule.GetDisplayStore(false).getPlatformScale(false)
			Signal2((math.clamp(p1 / (if PlatformScale and PlatformScale > 0 then PlatformScale else 1), MinWidth, MaxWidth)))
		end,
		resetSupportWidth = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end,
		getMinSupportWidth = function()
			-- upvalues: MinWidth (copy)
			return MinWidth
		end,
		getMaxSupportWidth = function()
			-- upvalues: MaxWidth (copy)
			return MaxWidth
		end,
		getContentRegionRect = if FFlagSplitPaneFixClassicThemeHeader then v2 else nil,
		setContentRegionRect = if FFlagSplitPaneFixClassicThemeHeader then v3 else nil,
		getIsBreakpointEnabled = SignalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitPaneActive = Computed3,
		getIsSplitEnabled = Computed3,
		getSupportPaneModeIfActive = Computed4,
		getIsSplitPaneCollapsedOrNotActive = Computed5,
		getIsSplitEligible = Signal5,
		setIsSplitEligible = Signal2_4,
		getSupportPaneMode = getSupportPaneMode,
		getTemporarySupportPaneMode = Signal3,
		getShouldDefaultToCollapsed = Computed,
		setSupportPaneMode = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		setTemporarySupportPaneMode = function(p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1)
		end,
		resetSupportPaneMode = function()
			-- upvalues: Signal2_1 (copy), Signal2_2 (copy)
			Signal2_1(nil)
			Signal2_2(nil)
		end,
		toggleSupportPaneMode = function(p1)
			-- upvalues: FFlagEnableSplitPaneTelemetry (upval), Computed5 (copy), SplitPaneTelemetryModule (upval), Computed4 (copy), Computed1 (copy), SupportPaneMode (upval), Signal3 (copy), Signal2_2 (copy), Signal2_1 (copy), Callback1 (ref), GetTelemetrySnapshotModule (upval), v4 (ref)
			local ComputedResult = if FFlagEnableSplitPaneTelemetry then Computed5(false) else nil
			local TelemetryStateFromMode = if FFlagEnableSplitPaneTelemetry then SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false)) else nil
			local Normal = if Computed1(false) == p1 then SupportPaneMode.Normal else p1
			
			if Signal3(false) == nil then
				Signal2_1(Normal)
			else
				Signal2_2(Normal)
			end
			if FFlagEnableSplitPaneTelemetry and Callback1(false) then
				local TelemetryStateFromMode1 = SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false))
				
				if TelemetryStateFromMode ~= TelemetryStateFromMode1 then
					SplitPaneTelemetryModule.logStateChanged(TelemetryStateFromMode1, SplitPaneTelemetryModule.Action.Toggle)
				end
				if ComputedResult ~= Computed5(false) then
					SplitPaneTelemetryModule.logSplitPaneViewChange(GetTelemetrySnapshotModule(v4, false), SplitPaneTelemetryModule.Action.Toggle)
				end
			end
		end,
		getSupportPaneEntryTarget = Signal4,
		setSupportPaneEntryTarget = Signal2_3
	}
	
	if FFlagEnableSplitPaneTelemetry then
		local ComputedResult1 = Computed(false)
		local EvaluateBreakpointEnabledResult = evaluateBreakpointEnabled(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: Computed (copy), ComputedResult1 (ref), evaluateBreakpointEnabled (copy), EvaluateBreakpointEnabledResult (ref), Signal3 (copy), Signal1 (copy), SupportPaneMode (upval), SplitPaneTelemetryModule (upval), v4 (ref), Signal2_1 (copy), Computed4 (copy), GetTelemetrySnapshotModule (upval)
			local ComputedResult = Computed(p1)
			local IsNotComputedResultMatch = ComputedResult ~= ComputedResult1
			local EvaluateBreakpointEnabledResult1 = evaluateBreakpointEnabled(p1)
			
			if IsNotComputedResultMatch or EvaluateBreakpointEnabledResult1 ~= EvaluateBreakpointEnabledResult then
				local ComputedResult2 = ComputedResult1
				local SignalResult = Signal3(false)
				local Collapsed = nil
				
				if SignalResult == nil then
					local SignalResult1 = Signal1(false)
					
					if SignalResult1 == nil then
						if ComputedResult2 == nil then
							ComputedResult2 = Computed(false)
						end
						Collapsed = if ComputedResult2 then SupportPaneMode.Collapsed else SupportPaneMode.Normal
					else
						Collapsed = SignalResult1
					end
				else
					Collapsed = SignalResult
				end
				local TelemetryStateFromMode = SplitPaneTelemetryModule.getTelemetryStateFromMode(if EvaluateBreakpointEnabledResult and v4.getIsSplitEligible(false) then Collapsed else nil)
				local NoEvaluateBreakpointEnabledResult: boolean = not EvaluateBreakpointEnabledResult or (not v4.getIsSplitEligible(false) or Collapsed == SupportPaneMode.Collapsed)
				
				if IsNotComputedResultMatch then
					Signal2_1(nil)
				end
				if v4.getIsTelemetrySessionInitialized(false) then
					local TelemetryStateFromMode1 = SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false))
					
					if TelemetryStateFromMode ~= TelemetryStateFromMode1 then
						SplitPaneTelemetryModule.logStateChanged(TelemetryStateFromMode1, SplitPaneTelemetryModule.Action.ViewportChanged)
					end
					if NoEvaluateBreakpointEnabledResult ~= v4.getIsSplitPaneCollapsedOrNotActive(false) then
						SplitPaneTelemetryModule.logSplitPaneViewChange(GetTelemetrySnapshotModule(v4, false), SplitPaneTelemetryModule.Action.ViewportChanged)
					end
				end
			end
			ComputedResult1 = ComputedResult
			EvaluateBreakpointEnabledResult = EvaluateBreakpointEnabledResult1
		end)
	end
	return v4
end

local v2 = nil

return {
	getStore = function()
		-- upvalues: v2 (ref), createSplitPaneStore (copy)
		if v2 == nil then
			v2 = createSplitPaneStore()
		end
		return v2
	end,
	isSplitEnabledNow = function()
		-- upvalues: v2 (ref), createSplitPaneStore (copy)
		if v2 == nil then
			v2 = createSplitPaneStore()
		end
		local v3 = v2
		
		return v3.getIsBreakpointEnabled(false) and v3.getIsSplitEligible(false)
	end
}