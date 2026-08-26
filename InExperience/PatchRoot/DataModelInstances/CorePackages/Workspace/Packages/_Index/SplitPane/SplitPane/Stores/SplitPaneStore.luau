local parent = script:FindFirstAncestor("SplitPane").Parent
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local appCompositionModule = require(parent.AppComposition)
local appSplitViewModule = require(parent.AppSplitView)
local displayModule = require(parent.Display)
local breakpoint = foundationModule.Enums.Breakpoint
local getRegionOverrides = appCompositionModule.getRegionOverrides
local regionName = appCompositionModule.RegionName
local resolveBreakpoint = appCompositionModule.resolveBreakpoint
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local xLarge = breakpoint.XLarge
local t = {
	[breakpoint.XSmall] = 1,
	[breakpoint.Small] = 2,
	[breakpoint.Medium] = 3,
	[breakpoint.Large] = 4,
	[breakpoint.XLarge] = 5,
	[breakpoint.XXLarge] = 6
}

local function _(p1, p2)
	-- upvalues: t (ref)
	return (t[p2] or 0) <= (t[p1] or 0)
end

local _ = function()
	-- upvalues: getRegionOverrides (ref), regionName (ref)
	local var1 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var2 = if var1 and var1.minWidth then var1.minWidth else 0
	
	if var1 and var1.maxWidth then
		return var2, var1.maxWidth
	end
	return var2, 1e999
end

local function evaluateBreakpointEnabled(p1)
	-- upvalues: displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref)
	return (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))] or 0)
end

local function createSplitPaneStore()
	-- upvalues: getRegionOverrides (ref), regionName (ref), signalsModule (ref), supportPaneMode (ref), displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref), evaluateBreakpointEnabled (ref)
	local var1 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var2 = if var1 and var1.minWidth then var1.minWidth else 0
	local var3 = if var1 and var1.maxWidth then var1.maxWidth else 1e999
	var1, var14 = signalsModule.createSignal(nil)
	local var4, var5 = signalsModule.createSignal(supportPaneMode.Normal)
	local var6, var7 = signalsModule.createSignal(false)
	
	return {
		getSupportWidth = var1,
		setSupportWidth = function(value)
			-- upvalues: var14 (ref), var2 (ref), var3 (ref)
			var14(math.clamp(value, var2, var3))
		end,
		getMinSupportWidth = function()
			-- upvalues: var2 (ref)
			return var2
		end,
		getMaxSupportWidth = function()
			-- upvalues: var3 (ref)
			return var3
		end,
		getIsBreakpointEnabled = signalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitEnabled = signalsModule.createComputed(function(p1)
			-- upvalues: displayModule (copy), resolveBreakpoint (copy), xLarge (copy), t (copy), var6 (ref)
			return (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(p1).getDesignSpaceViewportWidth(p1))] or 0) and var6(p1)
		end),
		getIsSplitEligible = var6,
		setIsSplitEligible = var7,
		getSupportPaneMode = var4,
		setSupportPaneMode = var5,
		toggleSupportPaneMode = function(p1)
			-- upvalues: var5 (ref), var4 (ref), supportPaneMode (copy)
			var5(if var4(false) == p1 then supportPaneMode.Normal else p1)
		end
	}
end

local var1 = nil

return {
	getStore = function()
		-- upvalues: var1 (write), createSplitPaneStore (ref)
		if var1 == nil then
			var1 = createSplitPaneStore()
		end
		return var1
	end,
	isSplitEnabledNow = function()
		-- upvalues: displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref), var1 (write), createSplitPaneStore (ref)
		local var2 = (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(false).getDesignSpaceViewportWidth(false))] or 0)
		
		if var2 then
			if var1 == nil then
				var1 = createSplitPaneStore()
			end
			var2 = var1.getIsSplitEligible(false)
		end
		return var2
	end
}