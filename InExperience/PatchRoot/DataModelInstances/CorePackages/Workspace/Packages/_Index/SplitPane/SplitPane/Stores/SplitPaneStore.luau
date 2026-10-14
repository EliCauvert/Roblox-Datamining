local parent = script:FindFirstAncestor("SplitPane").Parent
local signalsModule = require(parent.Signals)
local signalsUtilsModule = require(parent.SignalsUtils)
local appCompositionModule = require(parent.AppComposition)
local appSplitViewModule = require(parent.AppSplitView)
local displayModule = require(parent.Display)
local sharedFlagsModule = require(parent.SharedFlags)
local splitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local getTelemetrySnapshotModule = require(script.Parent.Parent.Telemetry.getTelemetrySnapshot)
local createCurrentScreenOrientationSignalModule = require(script.Parent.Parent.Utils.createCurrentScreenOrientationSignal)
local supportPaneWidthRulesModule = require(script.Parent.Parent.Utils.supportPaneWidthRules)
local splitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local getRegionOverrides = appCompositionModule.getRegionOverrides
local regionName = appCompositionModule.RegionName
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local fFlagSplitPaneFixClassicThemeHeader = sharedFlagsModule.FFlagSplitPaneFixClassicThemeHeader
local fFlagEnableSplitPaneTelemetry = sharedFlagsModule.FFlagEnableSplitPaneTelemetry

local function _()
	-- upvalues: getRegionOverrides (ref), regionName (ref)
	local var1 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var2 = if var1 and var1.widthScale then var1.widthScale else 0.33
	local var3 = if var1 and var1.minWidth then var1.minWidth else 0
	
	if var1 and var1.maxWidth then
		return var2, var3, var1.maxWidth
	end
	return var2, var3, 1e999
end

local function evaluateShouldDefaultToCollapsed(p1)
	-- upvalues: splitPaneVariantModule (ref), displayModule (ref), supportPaneWidthRulesModule (ref)
	return if splitPaneVariantModule.isPaneCollapsedByDefault() then true else supportPaneWidthRulesModule.shouldDefaultToCollapsed(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))
end

local var1 = nil
local var2 = nil

local function createSplitPaneStore()
	-- upvalues: getRegionOverrides (ref), regionName (ref), var2 (write), createCurrentScreenOrientationSignalModule (ref), displayModule (ref), supportPaneWidthRulesModule (ref), signalsModule (ref), evaluateShouldDefaultToCollapsed (ref), supportPaneMode (ref), fFlagEnableSplitPaneTelemetry (ref), var1 (write), fFlagSplitPaneFixClassicThemeHeader (ref), signalsUtilsModule (ref), splitPaneTelemetryModule (ref), getTelemetrySnapshotModule (ref)
	local var3
	local var4 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var5 = if var4 and var4.widthScale then var4.widthScale else 0.33
	local var6 = if var4 and var4.minWidth then var4.minWidth else 0
	local var7 = if var4 and var4.maxWidth then var4.maxWidth else 1e999
	var4 = nil
	local var8, var9 = createCurrentScreenOrientationSignalModule()
	var2 = var9
	var4 = var8
	
	local function evaluateBreakpointEnabled(p1)
		-- upvalues: displayModule (copy), var4 (write), supportPaneWidthRulesModule (copy)
		local var10 = var4(p1)
		
		return (if var10 ~= Enum.ScreenOrientation.LandscapeLeft then var10 == Enum.ScreenOrientation.LandscapeRight else true) and supportPaneWidthRulesModule.isSplitEnabledForWidth(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))
	end
	
	local var10, var11 = signalsModule.createSignal(nil)
	local var12, var13 = signalsModule.createSignal(nil)
	local var14, var15 = signalsModule.createSignal(nil)
	local var16 = signalsModule.createComputed(evaluateShouldDefaultToCollapsed)
	
	local function _(p1, p2)
		-- upvalues: var14 (ref), var12 (ref), var16 (ref), supportPaneMode (copy)
		local var17 = var14(p1)
		
		if var17 ~= nil then
			return var17
		end
		local var18 = var12(p1)
		
		if var18 ~= nil then
			return var18
		elseif p2 == nil then
			p2 = var16(p1)
		end
		return if p2 then supportPaneMode.Collapsed else supportPaneMode.Normal
	end
	
	local var17 = signalsModule.createComputed(function(p1)
		-- upvalues: fFlagEnableSplitPaneTelemetry (copy), var14 (ref), var12 (ref), var16 (ref), supportPaneMode (copy)
		if fFlagEnableSplitPaneTelemetry then
			local var18 = nil
			local var19 = var14(p1)
			
			if var19 ~= nil then
				return var19
			end
			local var20 = var12(p1)
			
			if var20 ~= nil then
				return var20
			elseif var18 == nil then
				var18 = var16(p1)
			end
			return if var18 then supportPaneMode.Collapsed else supportPaneMode.Normal
		else
			local var21 = var14(p1)
			
			if var21 ~= nil then
				return var21
			end
			local var22 = var12(p1)
			
			return if var22 == nil then if var16(p1) then supportPaneMode.Collapsed else supportPaneMode.Normal else var22
		end
	end)
	
	local function getSupportPaneMode(p1)
		-- upvalues: var17 (ref)
		return var17(p1)
	end
	
	local var18, var19 = signalsModule.createSignal(nil)
	
	if not fFlagEnableSplitPaneTelemetry then
		var3 = var16(false)
		var1 = signalsModule.createEffect(function(p1)
			-- upvalues: var16 (ref), var3 (write), var13 (ref)
			local var20 = var16(p1)
			
			if var20 ~= var3 then
				var13(nil)
			end
			var3 = var20
		end)
	end
	var3 = signalsModule.createComputed(function(p1)
		-- upvalues: displayModule (copy), var5 (ref), var10 (ref), var6 (ref), var7 (ref)
		local designSpaceViewportWidth = displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)
		
		return if designSpaceViewportWidth <= 0 then var5 else (var10(p1) or math.clamp(designSpaceViewportWidth * var5, var6, var7)) / designSpaceViewportWidth
	end)
	local var20 = nil
	local var21 = nil
	
	if fFlagSplitPaneFixClassicThemeHeader then
		local var22, var23 = signalsModule.createSignal(nil)
		var20 = var22
		var21 = var23
	end
	local var24, var25 = signalsModule.createSignal(false)
	local var26 = nil
	local var27 = nil
	
	if fFlagEnableSplitPaneTelemetry then
		local var28, var29 = signalsUtilsModule.createSessionScopedSignal(false)
		var26 = var28
		var27 = var29
	end
	local function setSupportWidth(value)
		-- upvalues: displayModule (copy), var11 (ref), var6 (ref), var7 (ref)
		local platformScale = displayModule.GetDisplayStore(false).getPlatformScale(false)
		var11(math.clamp(value / (if platformScale and platformScale > 0 then platformScale else 1), var6, var7))
	end
	
	local var30 = signalsModule.createComputed(function(p1)
		-- upvalues: evaluateBreakpointEnabled (ref), var24 (ref)
		return evaluateBreakpointEnabled(p1) and var24(p1)
	end)
	local var31 = signalsModule.createComputed(function(p1)
		-- upvalues: var30 (ref), var17 (ref)
		return if var30(p1) then var17(p1) else nil
	end)
	local var32 = signalsModule.createComputed(function(p1)
		-- upvalues: var31 (ref), supportPaneMode (copy)
		local var33 = var31(p1)
		
		return if var33 ~= nil then var33 == supportPaneMode.Collapsed else true
	end)
	local t = nil
	t = {
		getCurrentScreenOrientation = var4,
		getIsTelemetrySessionInitialized = var26,
		setIsTelemetrySessionInitialized = var27,
		getSupportWidth = var10,
		getSupportWidthFraction = var3,
		setSupportWidth = setSupportWidth,
		resetSupportWidth = function()
			-- upvalues: var11 (ref)
			var11(nil)
		end,
		getMinSupportWidth = function()
			-- upvalues: var6 (ref)
			return var6
		end,
		getMaxSupportWidth = function()
			-- upvalues: var7 (ref)
			return var7
		end,
		getContentRegionRect = if fFlagSplitPaneFixClassicThemeHeader then var20 else nil,
		setContentRegionRect = if fFlagSplitPaneFixClassicThemeHeader then var21 else nil,
		getIsBreakpointEnabled = signalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitPaneActive = var30,
		getIsSplitEnabled = var30,
		getSupportPaneModeIfActive = var31,
		getIsSplitPaneCollapsedOrNotActive = var32,
		getIsSplitEligible = var24,
		setIsSplitEligible = var25,
		getSupportPaneMode = getSupportPaneMode,
		getTemporarySupportPaneMode = var14,
		getShouldDefaultToCollapsed = var16,
		setSupportPaneMode = function(value)
			-- upvalues: var13 (ref)
			var13(value)
		end,
		setTemporarySupportPaneMode = function(value)
			-- upvalues: var15 (ref)
			var15(value)
		end,
		resetSupportPaneMode = function()
			-- upvalues: var13 (ref), var15 (ref)
			var13(nil)
			var15(nil)
		end,
		toggleSupportPaneMode = function(p1)
			-- upvalues: fFlagEnableSplitPaneTelemetry (copy), var32 (ref), splitPaneTelemetryModule (copy), var31 (ref), var17 (ref), supportPaneMode (copy), var14 (ref), var15 (ref), var13 (ref), var26 (write), getTelemetrySnapshotModule (copy), t (write)
			local var33 = if fFlagEnableSplitPaneTelemetry then var32(false) else nil
			local var34 = if fFlagEnableSplitPaneTelemetry then splitPaneTelemetryModule.getTelemetryStateFromMode(var31(false)) else nil
			local var35 = if var17(false) == p1 then supportPaneMode.Normal else p1
			
			if var14(false) == nil then
				var13(var35)
			else
				var15(var35)
			end
			if fFlagEnableSplitPaneTelemetry and var26(false) then
				local telemetryStateFromMode = splitPaneTelemetryModule.getTelemetryStateFromMode(var31(false))
				
				if var34 ~= telemetryStateFromMode then
					splitPaneTelemetryModule.logStateChanged(telemetryStateFromMode, splitPaneTelemetryModule.Action.Toggle)
				end
				if var33 ~= var32(false) then
					splitPaneTelemetryModule.logSplitPaneViewChange(getTelemetrySnapshotModule(t, false), splitPaneTelemetryModule.Action.Toggle)
				end
			end
		end,
		getSupportPaneEntryTarget = var18,
		setSupportPaneEntryTarget = var19
	}
	
	if fFlagEnableSplitPaneTelemetry then
		local var33 = var16(false)
		local var34 = evaluateBreakpointEnabled(false)
		var1 = signalsModule.createEffect(function(p1)
			-- upvalues: var16 (ref), var33 (write), evaluateBreakpointEnabled (ref), var34 (write), var14 (ref), var12 (ref), supportPaneMode (copy), splitPaneTelemetryModule (copy), t (write), var13 (ref), var31 (ref), getTelemetrySnapshotModule (copy)
			local var35 = var16(p1)
			local var36 = var35 ~= var33
			local var37 = evaluateBreakpointEnabled(p1)
			
			if var36 or var37 ~= var34 then
				local var38
				local var39 = var33
				local var40 = var14(false)
				
				if var40 == nil then
					local var41 = var12(false)
					
					if var41 == nil then
						if var39 == nil then
							var39 = var16(false)
						end
						var38 = if var39 then supportPaneMode.Collapsed else supportPaneMode.Normal
					else
						var38 = var41
					end
				else
					var38 = var40
				end
				local getTelemetryStateFromMode = splitPaneTelemetryModule.getTelemetryStateFromMode
				getTelemetryStateFromMode = getTelemetryStateFromMode(if var34 and t.getIsSplitEligible(false) then var38 else nil)
				local var42 = not var34 or (not t.getIsSplitEligible(false) or var38 == supportPaneMode.Collapsed)
				
				if var36 then
					var13(nil)
				end
				if t.getIsTelemetrySessionInitialized(false) then
					local telemetryStateFromMode = splitPaneTelemetryModule.getTelemetryStateFromMode(var31(false))
					
					if getTelemetryStateFromMode ~= telemetryStateFromMode then
						splitPaneTelemetryModule.logStateChanged(telemetryStateFromMode, splitPaneTelemetryModule.Action.ViewportChanged)
					end
					if var42 ~= t.getIsSplitPaneCollapsedOrNotActive(false) then
						splitPaneTelemetryModule.logSplitPaneViewChange(getTelemetrySnapshotModule(t, false), splitPaneTelemetryModule.Action.ViewportChanged)
					end
				end
			end
			var33 = var35
			var34 = var37
		end)
	end
	return t
end

local var3 = nil

return {
	getStore = function()
		-- upvalues: var3 (write), createSplitPaneStore (ref)
		if var3 == nil then
			var3 = createSplitPaneStore()
		end
		return var3
	end,
	isSplitEnabledNow = function()
		-- upvalues: var3 (write), createSplitPaneStore (ref)
		if var3 == nil then
			var3 = createSplitPaneStore()
		end
		local var4 = var3
		
		return var4.getIsBreakpointEnabled(false) and var4.getIsSplitEligible(false)
	end
}