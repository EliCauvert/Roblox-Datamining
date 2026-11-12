local Parent = script:FindFirstAncestor("SplitPane").Parent
local SignalsModule = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local AppCompositionModule = require(Parent.AppComposition)
local DisplayModule = require(Parent.Display)
local SharedFlagsModule = require(Parent.SharedFlags)
local SplitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local GetTelemetrySnapshotModule = require(script.Parent.Parent.Telemetry.getTelemetrySnapshot)
local CreateSplitPanePreferenceModule = require(script.Parent.createSplitPanePreference)
local EnablePersistSplitPanePreferenceFeatureModule = require(script.Parent.Parent.Flags.EnablePersistSplitPanePreferenceFeature)
local CreateCurrentScreenOrientationSignalModule = require(script.Parent.Parent.Utils.createCurrentScreenOrientationSignal)
local SupportPaneWidthRulesModule = require(script.Parent.Parent.Utils.supportPaneWidthRules)
local SplitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local GetRegionOverridesFunction = AppCompositionModule.getRegionOverrides
local RegionName = AppCompositionModule.RegionName
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local FFlagSplitPaneFixClassicThemeHeader = SharedFlagsModule.FFlagSplitPaneFixClassicThemeHeader
local FFlagEnableSplitPaneTelemetry = SharedFlagsModule.FFlagEnableSplitPaneTelemetry
local FFlagEnableSplitPaneStackFallbackFix = SharedFlagsModule.FFlagEnableSplitPaneStackFallbackFix
local FFlagAXPauseSceneWhenSplitPaneCollapsed = SharedFlagsModule.FFlagAXPauseSceneWhenSplitPaneCollapsed

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
local Effect1 = nil

local function createSplitPaneStore()
	-- upvalues: GetRegionOverridesFunction (copy), RegionName (copy), v1 (ref), CreateCurrentScreenOrientationSignalModule (copy), DisplayModule (copy), SupportPaneWidthRulesModule (copy), SignalsModule (copy), evaluateShouldDefaultToCollapsed (copy), EnablePersistSplitPanePreferenceFeatureModule (copy), CreateSplitPanePreferenceModule (copy), SupportPaneMode (copy), FFlagEnableSplitPaneTelemetry (copy), Effect (ref), FFlagSplitPaneFixClassicThemeHeader (copy), FFlagAXPauseSceneWhenSplitPaneCollapsed (copy), SignalsUtilsModule (copy), FFlagEnableSplitPaneStackFallbackFix (copy), Effect1 (ref), SplitPaneTelemetryModule (copy), GetTelemetrySnapshotModule (copy)
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
	local Callback1 = nil
	local Callback3 = nil
	
	if EnablePersistSplitPanePreferenceFeatureModule then
		Callback1, Callback3 = CreateSplitPanePreferenceModule()
	end
	local function computeSupportPaneMode(p1, p2)
		-- upvalues: Signal3 (copy), Signal1 (copy), EnablePersistSplitPanePreferenceFeatureModule (upval), Callback1 (ref), SupportPaneMode (upval), Computed (copy)
		local SignalResult = Signal3(p1)
		
		if SignalResult ~= nil then
			return SignalResult
		end
		local SignalResult1 = Signal1(p1)
		
		if SignalResult1 ~= nil then
			return SignalResult1
		end
		if EnablePersistSplitPanePreferenceFeatureModule then
			local CallbackResult = Callback1(p1)
			
			if CallbackResult ~= nil then
				return if CallbackResult then SupportPaneMode.Collapsed else SupportPaneMode.Normal
			end
		end
		if p2 == nil then
			p2 = Computed(p1)
		end
		return if p2 then SupportPaneMode.Collapsed else SupportPaneMode.Normal
	end
	
	local Computed1 = SignalsModule.createComputed(function(p1)
		-- upvalues: FFlagEnableSplitPaneTelemetry (upval), computeSupportPaneMode (copy), Signal3 (copy), Signal1 (copy), EnablePersistSplitPanePreferenceFeatureModule (upval), Callback1 (ref), SupportPaneMode (upval), Computed (copy)
		if FFlagEnableSplitPaneTelemetry then
			return (computeSupportPaneMode(p1))
		end
		local SignalResult = Signal3(p1)
		
		if SignalResult ~= nil then
			return SignalResult
		end
		local SignalResult1 = Signal1(p1)
		
		if SignalResult1 ~= nil then
			return SignalResult1
		end
		if EnablePersistSplitPanePreferenceFeatureModule then
			local CallbackResult = Callback1(p1)
			
			if CallbackResult ~= nil then
				return if CallbackResult then SupportPaneMode.Collapsed else SupportPaneMode.Normal
			end
		end
		return if Computed(p1) then SupportPaneMode.Collapsed else SupportPaneMode.Normal
	end)
	
	local function getSupportPaneMode(p1)
		-- upvalues: Computed1 (copy)
		return (Computed1(p1))
	end
	
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	
	local function setSupportPaneTopRouteMatcher(p1)
		-- upvalues: Signal2_4 (copy)
		Signal2_4(function()
			-- upvalues: p1 (copy)
			return p1
		end)
	end
	
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	
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
		v2, v56 = SignalsModule.createSignal(nil)
	end
	local v4 = nil
	local v5 = nil
	
	if FFlagAXPauseSceneWhenSplitPaneCollapsed then
		v4, v58 = SignalsModule.createSignal(false)
	end
	local Signal7, Signal2_6 = SignalsModule.createSignal(false)
	local Callback2 = nil
	local SetIsTelemetrySessionInitialized = nil
	
	if FFlagEnableSplitPaneTelemetry then
		Callback2, SetIsTelemetrySessionInitialized = SignalsUtilsModule.createSessionScopedSignal(false)
	end
	local function setSupportWidth(p1)
		-- upvalues: DisplayModule (upval), Signal2 (copy), MinWidth (copy), MaxWidth (copy)
		local PlatformScale: number = DisplayModule.GetDisplayStore(false).getPlatformScale(false)
		Signal2((math.clamp(p1 / (if PlatformScale and PlatformScale > 0 then PlatformScale else 1), MinWidth, MaxWidth)))
	end
	
	local Computed3 = SignalsModule.createComputed(function(p1)
		-- upvalues: evaluateBreakpointEnabled (copy), Signal7 (copy)
		return evaluateBreakpointEnabled(p1) and Signal7(p1)
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
	
	local function GetWasSplitPaneAvailable(): boolean
		return false
	end
	
	if FFlagEnableSplitPaneStackFallbackFix then
		local Signal8, Signal2_7 = SignalsModule.createSignal(false)
		
		if evaluateBreakpointEnabled(false) then
			Signal2_7(true)
		end
		Effect1 = SignalsModule.createEffect(function(p1)
			-- upvalues: evaluateBreakpointEnabled (copy), Signal2_7 (copy)
			if evaluateBreakpointEnabled(p1) then
				Signal2_7(true)
			end
		end)
		GetWasSplitPaneAvailable = Signal8
	end
	local v6 = nil
	v6 = {
		getCurrentScreenOrientation = Callback,
		getIsTelemetrySessionInitialized = Callback2,
		setIsTelemetrySessionInitialized = SetIsTelemetrySessionInitialized,
		getSupportWidth = Signal,
		getSupportWidthFraction = Computed2,
		setSupportWidth = setSupportWidth,
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
		getWasSplitPaneAvailable = GetWasSplitPaneAvailable,
		getIsSplitPaneActive = Computed3,
		getIsSplitEnabled = Computed3,
		getSupportPaneModeIfActive = Computed4,
		getIsSplitPaneCollapsedOrNotActive = Computed5,
		getHasSupportRoute = if FFlagAXPauseSceneWhenSplitPaneCollapsed then v4 else nil,
		setHasSupportRoute = if FFlagAXPauseSceneWhenSplitPaneCollapsed then v5 else nil,
		getIsSplitEligible = Signal7,
		setIsSplitEligible = Signal2_6,
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
		toggleSupportPaneMode = function(Collapsed)
			-- upvalues: FFlagEnableSplitPaneTelemetry (upval), Computed5 (copy), SplitPaneTelemetryModule (upval), Computed4 (copy), Computed1 (copy), SupportPaneMode (upval), Signal3 (copy), Signal2_2 (copy), Signal2_1 (copy), EnablePersistSplitPanePreferenceFeatureModule (upval), Callback3 (ref), Callback2 (ref), GetTelemetrySnapshotModule (upval), v6 (ref)
			local ComputedResult = if FFlagEnableSplitPaneTelemetry then Computed5(false) else nil
			local TelemetryStateFromMode = if FFlagEnableSplitPaneTelemetry then SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false)) else nil
			local Normal = if Computed1(false) == Collapsed then SupportPaneMode.Normal else Collapsed
			
			if Signal3(false) == nil then
				Signal2_1(Normal)
			else
				Signal2_2(Normal)
			end
			if EnablePersistSplitPanePreferenceFeatureModule and (Collapsed == SupportPaneMode.Collapsed or Collapsed == SupportPaneMode.Normal) then
				Signal2_1(Normal)
				Callback3(Normal == SupportPaneMode.Collapsed)
			end
			if FFlagEnableSplitPaneTelemetry and Callback2(false) then
				local TelemetryStateFromMode1 = SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false))
				
				if TelemetryStateFromMode ~= TelemetryStateFromMode1 then
					SplitPaneTelemetryModule.logStateChanged(TelemetryStateFromMode1, SplitPaneTelemetryModule.Action.Toggle)
				end
				if ComputedResult ~= Computed5(false) then
					SplitPaneTelemetryModule.logSplitPaneViewChange(GetTelemetrySnapshotModule(v6, false), SplitPaneTelemetryModule.Action.Toggle)
				end
			end
		end,
		getSupportPaneEntryTarget = Signal4,
		setSupportPaneEntryTarget = Signal2_3,
		getSupportPaneTopRouteMatcher = Signal5,
		setSupportPaneTopRouteMatcher = setSupportPaneTopRouteMatcher,
		getSupportPaneTopRouteKey = Signal6,
		setSupportPaneTopRouteKey = Signal2_5
	}
	
	if FFlagEnableSplitPaneTelemetry then
		local ComputedResult1 = Computed(false)
		local EvaluateBreakpointEnabledResult = evaluateBreakpointEnabled(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: Computed (copy), ComputedResult1 (ref), evaluateBreakpointEnabled (copy), EvaluateBreakpointEnabledResult (ref), computeSupportPaneMode (copy), SplitPaneTelemetryModule (upval), v6 (ref), SupportPaneMode (upval), Signal2_1 (copy), Computed4 (copy), GetTelemetrySnapshotModule (upval)
			local ComputedResult = Computed(p1)
			local IsNotComputedResultMatch = ComputedResult ~= ComputedResult1
			local EvaluateBreakpointEnabledResult1 = evaluateBreakpointEnabled(p1)
			
			if IsNotComputedResultMatch or EvaluateBreakpointEnabledResult1 ~= EvaluateBreakpointEnabledResult then
				local SupportPaneMode1 = computeSupportPaneMode(false, ComputedResult1)
				local TelemetryStateFromMode = SplitPaneTelemetryModule.getTelemetryStateFromMode(if EvaluateBreakpointEnabledResult and v6.getIsSplitEligible(false) then SupportPaneMode1 else nil)
				local NoEvaluateBreakpointEnabledResult: boolean = not EvaluateBreakpointEnabledResult or (not v6.getIsSplitEligible(false) or SupportPaneMode1 == SupportPaneMode.Collapsed)
				
				if IsNotComputedResultMatch then
					Signal2_1(nil)
				end
				if v6.getIsTelemetrySessionInitialized(false) then
					local TelemetryStateFromMode1 = SplitPaneTelemetryModule.getTelemetryStateFromMode(Computed4(false))
					
					if TelemetryStateFromMode ~= TelemetryStateFromMode1 then
						SplitPaneTelemetryModule.logStateChanged(TelemetryStateFromMode1, SplitPaneTelemetryModule.Action.ViewportChanged)
					end
					if NoEvaluateBreakpointEnabledResult ~= v6.getIsSplitPaneCollapsedOrNotActive(false) then
						SplitPaneTelemetryModule.logSplitPaneViewChange(GetTelemetrySnapshotModule(v6, false), SplitPaneTelemetryModule.Action.ViewportChanged)
					end
				end
			end
			ComputedResult1 = ComputedResult
			EvaluateBreakpointEnabledResult = EvaluateBreakpointEnabledResult1
		end)
	end
	return v6
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