local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local constants = avatarExperienceCommonModule.Constants
local constantsModule = require(avatarExperienceCatalog.Constants)
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local signalsModule = require(parent.Signals)
local debounce = avatarExperienceCommonModule.Utils.debounce
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local getCameraViewportSizeModule = require(avatarExperienceCatalog.Utils.getCameraViewportSize)
local widgetListBreakPointEnumModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMarketplaceBreakpointEstimateFix = avatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointEstimateFix
local fFlagAXMarketplaceBreakpointMismatchCounter = avatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local LANDSCAPE_UI_WIDTH_PERCENTAGE = constants.LANDSCAPE_UI_WIDTH_PERCENTAGE
local CATALOG_RESULTS_HORIZONTAL_MARGIN = constantsModule.CATALOG_RESULTS_HORIZONTAL_MARGIN

local function getInitialScreenSizeEstimate()
	-- upvalues: appCommonLibModule (ref), widgetListBreakPointEnumModule (ref), LANDSCAPE_UI_WIDTH_PERCENTAGE (ref), CATALOG_RESULTS_HORIZONTAL_MARGIN (ref), getBreakpointFromRowWidthModule (ref)
	if appCommonLibModule.isSpatial() then
		return widgetListBreakPointEnumModule.XSmall
	end
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera and currentCamera.ViewportSize then
		local viewportSize = currentCamera.ViewportSize
		
		return getBreakpointFromRowWidthModule(if viewportSize.Y < viewportSize.X then viewportSize.X * LANDSCAPE_UI_WIDTH_PERCENTAGE - CATALOG_RESULTS_HORIZONTAL_MARGIN * 2 - 10 else viewportSize.X)
	end
	return widgetListBreakPointEnumModule.Medium
end

local function _()
	-- upvalues: fFlagEnableSplitPane (ref), parent (ref)
	if not fFlagEnableSplitPane then
		return nil
	end
	local store = require(parent.SplitPane).SplitPaneStore.getStore()
	
	return if store.getIsBreakpointEnabled(false) then 1 - store.getSupportWidthFraction(false) else nil
end

local function getScreenSizeEstimate()
	-- upvalues: appCommonLibModule (ref), widgetListBreakPointEnumModule (ref), getCameraViewportSizeModule (ref), parent (ref), fFlagEnableSplitPane (ref), LANDSCAPE_UI_WIDTH_PERCENTAGE (ref), CATALOG_RESULTS_HORIZONTAL_MARGIN (ref), getBreakpointFromRowWidthModule (ref)
	if appCommonLibModule.isSpatial() then
		return widgetListBreakPointEnumModule.XSmall
	end
	local var1 = getCameraViewportSizeModule()
	
	if var1 == nil then
		return widgetListBreakPointEnumModule.Medium
	end
	local var2
	local displayStore = require(parent.Display).GetDisplayStore(false)
	local guiInset = displayStore.getGuiInset(false)
	local var3 = var1.X - guiInset.left - guiInset.right
	local _ = nil
	
	if fFlagEnableSplitPane then
		local store = require(parent.SplitPane).SplitPaneStore.getStore()
		var2 = if not store.getIsBreakpointEnabled(false) then nil else 1 - store.getSupportWidthFraction(false)
	else
		var2 = nil
	end
	return getBreakpointFromRowWidthModule(math.max((if var2 ~= nil then if var1.Y < var1.X then var3 * LANDSCAPE_UI_WIDTH_PERCENTAGE else var3 else var3 * var2) - CATALOG_RESULTS_HORIZONTAL_MARGIN * 2, 0), displayStore.getPlatformScale(false))
end

local _ = function()
	-- upvalues: getCameraViewportSizeModule (ref)
	local var1 = getCameraViewportSizeModule()
	
	return if var1 == nil then "Unknown" elseif var1.Y < var1.X then "Landscape" else "Portrait"
end

return function()
	-- upvalues: fFlagAXMarketplaceBreakpointMismatchCounter (ref), getCameraViewportSizeModule (ref), fFlagAXMarketplaceBreakpointEstimateFix (ref), getScreenSizeEstimate (ref), getInitialScreenSizeEstimate (ref), signalsModule (ref), debounce (ref), sendAXCounterV2 (ref), constantsModule (ref)
	local var1
	if fFlagAXMarketplaceBreakpointMismatchCounter then
		var1 = getCameraViewportSizeModule() ~= nil
		var1 = nil
	else
		var1 = nil
	end
	local var2 = if fFlagAXMarketplaceBreakpointEstimateFix then getScreenSizeEstimate() else getInitialScreenSizeEstimate()
	local var3, var4 = signalsModule.createSignal(var2)
	local var5, var6 = signalsModule.createSignal(var2)
	local var7 = false
	local var8 = 0
	local var9 = nil
	local var10 = debounce(function(p1)
		-- upvalues: var6 (ref)
		var6(p1)
	end, 0.8)
	
	return {
		getScreenSize = var3,
		setScreenSize = function(p1)
			-- upvalues: fFlagAXMarketplaceBreakpointEstimateFix (copy), var7 (write), var4 (ref), var10 (ref)
			if fFlagAXMarketplaceBreakpointEstimateFix then
				var7 = true
			end
			var4(p1)
			var10(p1)
		end,
		getDebouncedScreenSize = var5,
		reportMeasuredBreakpoint = function(p1, p2)
			-- upvalues: var5 (ref), sendAXCounterV2 (copy), constantsModule (copy), getCameraViewportSizeModule (copy), var1 (ref), fFlagAXMarketplaceBreakpointEstimateFix (copy)
			local var11 = var5(false)
			local marketplaceBreakpointMeasured = constantsModule.COUNTERS.MarketplaceBreakpointMeasured
			local t = {
				match = tostring(p1 == var11),
				fetched = var11,
				measured = p1,
				source = p2
			}
			local var12 = getCameraViewportSizeModule()
			t.orientation = if var12 == nil then "Unknown" elseif var12.Y < var12.X then "Landscape" else "Portrait"
			t.hadCameraAtCreation = tostring(var1)
			t.estimateFix = tostring(fFlagAXMarketplaceBreakpointEstimateFix)
			sendAXCounterV2(marketplaceBreakpointMeasured, t)
		end,
		refreshEstimate = function()
			-- upvalues: var7 (write), getScreenSizeEstimate (copy), fFlagAXMarketplaceBreakpointEstimateFix (copy), var5 (ref), var8 (write), var9 (write), var4 (ref), var6 (ref)
			if var7 then return end
			local var11 = getScreenSizeEstimate()
			
			if fFlagAXMarketplaceBreakpointEstimateFix and var5(false) ~= var11 then
				var8 += 1
				var9 = var11
			end
			var4(var11)
			var6(var11)
		end,
		getEstimateWriteId = function()
			-- upvalues: var8 (write)
			return var8
		end,
		getEstimateWriteBreakpoint = function()
			-- upvalues: var9 (write)
			return var9
		end,
		wasScreenSizePublishedByEstimateWrite = function(p1, p2)
			-- upvalues: var8 (write), var9 (write)
			return var8 ~= p1 and var9 == p2
		end
	}
end