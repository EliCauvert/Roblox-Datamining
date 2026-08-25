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

local function _(p0, p1)
	-- upvalues: t (ref)
	return (t[p1] or 0) <= (t[p0] or 0)
end

local _ = function()
	-- upvalues: getRegionOverrides (ref), regionName (ref)
	local var9 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var10 = if var9 and var9.minWidth then var9.minWidth else 0
	
	if var9 and var9.maxWidth then
		return var10, var9.maxWidth
	end
	return var10, 1e999
end

local function evaluateBreakpointEnabled(p2)
	-- upvalues: displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref)
	return (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(p2).getDesignSpaceViewportWidth(p2))] or 0)
end

local function createSplitPaneStore()
	-- upvalues: getRegionOverrides (ref), regionName (ref), signalsModule (ref), supportPaneMode (ref), displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref), evaluateBreakpointEnabled (ref)
	local var11 = if getRegionOverrides and regionName then getRegionOverrides(regionName.SupportRegion) else nil
	local var12 = if var11 and var11.minWidth then var11.minWidth else 0
	local var13 = if var11 and var11.maxWidth then var11.maxWidth else 1e999
	var11, var14 = signalsModule.createSignal(nil)
	local var15, var16 = signalsModule.createSignal(supportPaneMode.Normal)
	local var17, var18 = signalsModule.createSignal(false)
	
	return {
		getSupportWidth = var11,
		setSupportWidth = function(value)
			-- upvalues: var14 (ref), var12 (ref), var13 (ref)
			var14(math.clamp(value, var12, var13))
		end,
		getMinSupportWidth = function()
			-- upvalues: var12 (ref)
			return var12
		end,
		getMaxSupportWidth = function()
			-- upvalues: var13 (ref)
			return var13
		end,
		getIsBreakpointEnabled = signalsModule.createComputed(evaluateBreakpointEnabled),
		getIsSplitEnabled = signalsModule.createComputed(function(p3)
			-- upvalues: displayModule (copy), resolveBreakpoint (copy), xLarge (copy), t (copy), var17 (ref)
			return (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(p3).getDesignSpaceViewportWidth(p3))] or 0) and var17(p3)
		end),
		getIsSplitEligible = var17,
		setIsSplitEligible = var18,
		getSupportPaneMode = var15,
		setSupportPaneMode = var16,
		toggleSupportPaneMode = function(p4)
			-- upvalues: var16 (ref), var15 (ref), supportPaneMode (copy)
			var16(if var15(false) == p4 then supportPaneMode.Normal else p4)
		end
	}
end

local var8 = nil

return {
	getStore = function()
		-- upvalues: var8 (write), createSplitPaneStore (ref)
		if var8 == nil then
			var8 = createSplitPaneStore()
		end
		return var8
	end,
	isSplitEnabledNow = function()
		-- upvalues: displayModule (ref), resolveBreakpoint (ref), xLarge (ref), t (ref), var8 (write), createSplitPaneStore (ref)
		local var19 = (t[xLarge] or 0) <= (t[resolveBreakpoint(displayModule.GetDisplayStore(false).getDesignSpaceViewportWidth(false))] or 0)
		
		if var19 then
			if var8 == nil then
				var8 = createSplitPaneStore()
			end
			var19 = var8.getIsSplitEligible(false)
		end
		return var19
	end
}