local parent = script:FindFirstAncestor("SplitPane").Parent
local signalsModule = require(parent.Signals)
local appCompositionModule = require(parent.AppComposition)
local appSplitViewModule = require(parent.AppSplitView)
local displayModule = require(parent.Display)
local createCurrentScreenOrientationSignalModule = require(script.Parent.Parent.Utils.createCurrentScreenOrientationSignal)
local supportPaneWidthRulesModule = require(script.Parent.Parent.Utils.supportPaneWidthRules)
local getRegionOverrides = appCompositionModule.getRegionOverrides
local regionName = appCompositionModule.RegionName
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode

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
	-- upvalues: displayModule (ref), supportPaneWidthRulesModule (ref)
	return supportPaneWidthRulesModule.shouldDefaultToCollapsed(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))
end

local var1 = nil
local var2 = nil

local function createSplitPaneStore()
	-- upvalues: getRegionOverrides (ref), regionName (ref), var2 (write), createCurrentScreenOrientationSignalModule (ref), displayModule (ref), supportPaneWidthRulesModule (ref), signalsModule (ref), evaluateShouldDefaultToCollapsed (ref), supportPaneMode (ref), var1 (write)
	local var3 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local _ = if var3 and var3.widthScale then var3.widthScale else 0.33
	local var4 = if var3 and var3.minWidth then var3.minWidth else 0
	local var5 = if var3 and var3.maxWidth then var3.maxWidth else 1e999
	var3 = nil
	local var6, var7 = createCurrentScreenOrientationSignalModule()
	var2 = var7
	var3 = var6
	
	local function evaluateBreakpointEnabled(p1)
		-- upvalues: displayModule (copy), var3 (write), supportPaneWidthRulesModule (copy)
		local var8 = var3(p1)
		
		return (if var8 ~= Enum.ScreenOrientation.LandscapeLeft then var8 == Enum.ScreenOrientation.LandscapeRight else true) and supportPaneWidthRulesModule.isSplitEnabledForWidth(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))
	end
	
	local var8, var9 = signalsModule.createSignal(nil)
	local var10, var11 = signalsModule.createSignal(nil)
	local var12, var13 = signalsModule.createSignal(nil)
	local var14 = signalsModule.createComputed(evaluateShouldDefaultToCollapsed)
	local var15 = signalsModule.createComputed(function(p1)
		-- upvalues: var12 (ref), var10 (ref), var14 (ref), supportPaneMode (copy)
		local var16 = var12(p1)
		
		if var16 ~= nil then
			return var16
		end
		local var17 = var10(p1)
		
		return if var17 == nil then if var14(p1) then supportPaneMode.Collapsed else supportPaneMode.Normal else var17
	end)
	
	local function getSupportPaneMode(p1)
		-- upvalues: var15 (ref)
		return var15(p1)
	end
	
	local var16 = var14(false)
	var1 = signalsModule.createEffect(function(p1)
		-- upvalues: var14 (ref), var16 (write), var11 (ref)
		local var17 = var14(p1)
		
		if var17 ~= var16 then
			var11(nil)
		end
		var16 = var17
	end)
	local var17, var18 = signalsModule.createSignal(false)
	local var19 = signalsModule.createComputed(function(p1)
		-- upvalues: evaluateBreakpointEnabled (ref), var17 (ref)
		return evaluateBreakpointEnabled(p1) and var17(p1)
	end)
	
	return {
		getSupportWidth = var8,
		setSupportWidth = function(value)
			-- upvalues: displayModule (copy), var9 (ref), var4 (ref), var5 (ref)
			local platformScale = displayModule.GetDisplayStore(false).getPlatformScale(false)
			var9(math.clamp(value / (if platformScale and platformScale > 0 then platformScale else 1), var4, var5))
		end,
		resetSupportWidth = function()
			-- upvalues: var9 (ref)
			var9(nil)
		end,
		getMinSupportWidth = function()
			-- upvalues: var4 (ref)
			return var4
		end,
		getMaxSupportWidth = function()
			-- upvalues: var5 (ref)
			return var5
		end,
		getIsBreakpointEnabled = signalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitPaneActive = var19,
		getIsSplitEnabled = var19,
		getIsSplitEligible = var17,
		setIsSplitEligible = var18,
		getSupportPaneMode = getSupportPaneMode,
		getShouldDefaultToCollapsed = var14,
		setSupportPaneMode = function(value)
			-- upvalues: var11 (ref)
			var11(value)
		end,
		setTemporarySupportPaneMode = function(value)
			-- upvalues: var13 (ref)
			var13(value)
		end,
		resetSupportPaneMode = function()
			-- upvalues: var11 (ref), var13 (ref)
			var11(nil)
			var13(nil)
		end,
		toggleSupportPaneMode = function(p1)
			-- upvalues: var15 (ref), supportPaneMode (copy), var12 (ref), var13 (ref), var11 (ref)
			local var20 = if var15(false) == p1 then supportPaneMode.Normal else p1
			
			if var12(false) == nil then
				var11(var20)
				
				return
			end
			var13(var20)
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