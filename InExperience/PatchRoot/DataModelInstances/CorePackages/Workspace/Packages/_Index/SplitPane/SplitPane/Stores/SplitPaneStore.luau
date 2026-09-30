local parent = script:FindFirstAncestor("SplitPane").Parent
local signalsModule = require(parent.Signals)
local appCompositionModule = require(parent.AppComposition)
local appSplitViewModule = require(parent.AppSplitView)
local displayModule = require(parent.Display)
local sharedFlagsModule = require(parent.SharedFlags)
local createCurrentScreenOrientationSignalModule = require(script.Parent.Parent.Utils.createCurrentScreenOrientationSignal)
local supportPaneWidthRulesModule = require(script.Parent.Parent.Utils.supportPaneWidthRules)
local splitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local getRegionOverrides = appCompositionModule.getRegionOverrides
local regionName = appCompositionModule.RegionName
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local fFlagSplitPaneFixClassicThemeHeader = sharedFlagsModule.FFlagSplitPaneFixClassicThemeHeader

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
	-- upvalues: getRegionOverrides (ref), regionName (ref), var2 (write), createCurrentScreenOrientationSignalModule (ref), displayModule (ref), supportPaneWidthRulesModule (ref), signalsModule (ref), evaluateShouldDefaultToCollapsed (ref), supportPaneMode (ref), var1 (write), fFlagSplitPaneFixClassicThemeHeader (ref)
	local var3 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var4 = if var3 and var3.widthScale then var3.widthScale else 0.33
	local var5 = if var3 and var3.minWidth then var3.minWidth else 0
	local var6 = if var3 and var3.maxWidth then var3.maxWidth else 1e999
	var3 = nil
	local var7, var8 = createCurrentScreenOrientationSignalModule()
	var2 = var8
	var3 = var7
	
	local function evaluateBreakpointEnabled(p1)
		-- upvalues: displayModule (copy), var3 (write), supportPaneWidthRulesModule (copy)
		local var9 = var3(p1)
		
		return (if var9 ~= Enum.ScreenOrientation.LandscapeLeft then var9 == Enum.ScreenOrientation.LandscapeRight else true) and supportPaneWidthRulesModule.isSplitEnabledForWidth(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))
	end
	
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13, var14 = signalsModule.createSignal(nil)
	local var15 = signalsModule.createComputed(evaluateShouldDefaultToCollapsed)
	local var16 = signalsModule.createComputed(function(p1)
		-- upvalues: var13 (ref), var11 (ref), var15 (ref), supportPaneMode (copy)
		local var17 = var13(p1)
		
		if var17 ~= nil then
			return var17
		end
		local var18 = var11(p1)
		
		return if var18 == nil then if var15(p1) then supportPaneMode.Collapsed else supportPaneMode.Normal else var18
	end)
	
	local function getSupportPaneMode(p1)
		-- upvalues: var16 (ref)
		return var16(p1)
	end
	
	local var17 = var15(false)
	var1 = signalsModule.createEffect(function(p1)
		-- upvalues: var15 (ref), var17 (write), var12 (ref)
		local var18 = var15(p1)
		
		if var18 ~= var17 then
			var12(nil)
		end
		var17 = var18
	end)
	local var18 = signalsModule.createComputed(function(p1)
		-- upvalues: displayModule (copy), var4 (ref), var9 (ref), var5 (ref), var6 (ref)
		local designSpaceViewportWidth = displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1)
		
		return if designSpaceViewportWidth <= 0 then var4 else (var9(p1) or math.clamp(designSpaceViewportWidth * var4, var5, var6)) / designSpaceViewportWidth
	end)
	local var19 = nil
	local var20 = nil
	
	if fFlagSplitPaneFixClassicThemeHeader then
		local var21, var22 = signalsModule.createSignal(nil)
		var19 = var21
		var20 = var22
	end
	local var23, var24 = signalsModule.createSignal(false)
	
	local function setSupportWidth(value)
		-- upvalues: displayModule (copy), var10 (ref), var5 (ref), var6 (ref)
		local platformScale = displayModule.GetDisplayStore(false).getPlatformScale(false)
		var10(math.clamp(value / (if platformScale and platformScale > 0 then platformScale else 1), var5, var6))
	end
	
	local var25 = signalsModule.createComputed(function(p1)
		-- upvalues: evaluateBreakpointEnabled (ref), var23 (ref)
		return evaluateBreakpointEnabled(p1) and var23(p1)
	end)
	local var26 = signalsModule.createComputed(function(p1)
		-- upvalues: var25 (ref), var16 (ref)
		return if var25(p1) then var16(p1) else nil
	end)
	
	return {
		getSupportWidth = var9,
		getSupportWidthFraction = var18,
		setSupportWidth = setSupportWidth,
		resetSupportWidth = function()
			-- upvalues: var10 (ref)
			var10(nil)
		end,
		getMinSupportWidth = function()
			-- upvalues: var5 (ref)
			return var5
		end,
		getMaxSupportWidth = function()
			-- upvalues: var6 (ref)
			return var6
		end,
		getContentRegionRect = if fFlagSplitPaneFixClassicThemeHeader then var19 else nil,
		setContentRegionRect = if fFlagSplitPaneFixClassicThemeHeader then var20 else nil,
		getIsBreakpointEnabled = signalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitPaneActive = var25,
		getIsSplitEnabled = var25,
		getSupportPaneModeIfActive = var26,
		getIsSplitPaneCollapsedOrNotActive = signalsModule.createComputed(function(p1)
			-- upvalues: var26 (ref), supportPaneMode (copy)
			local var27 = var26(p1)
			
			return if var27 ~= nil then var27 == supportPaneMode.Collapsed else true
		end),
		getIsSplitEligible = var23,
		setIsSplitEligible = var24,
		getSupportPaneMode = getSupportPaneMode,
		getShouldDefaultToCollapsed = var15,
		setSupportPaneMode = function(value)
			-- upvalues: var12 (ref)
			var12(value)
		end,
		setTemporarySupportPaneMode = function(value)
			-- upvalues: var14 (ref)
			var14(value)
		end,
		resetSupportPaneMode = function()
			-- upvalues: var12 (ref), var14 (ref)
			var12(nil)
			var14(nil)
		end,
		toggleSupportPaneMode = function(p1)
			-- upvalues: var16 (ref), supportPaneMode (copy), var13 (ref), var14 (ref), var12 (ref)
			local var27 = if var16(false) == p1 then supportPaneMode.Normal else p1
			
			if var13(false) == nil then
				var12(var27)
				
				return
			end
			var14(var27)
		end
	}
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