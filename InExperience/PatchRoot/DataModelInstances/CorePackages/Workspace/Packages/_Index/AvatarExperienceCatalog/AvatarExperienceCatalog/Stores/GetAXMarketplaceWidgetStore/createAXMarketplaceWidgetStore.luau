local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local SignalsModule = require(Parent.Signals)
local DebounceFunction = AvatarExperienceCommonModule.Utils.debounce
local GetBreakpointFromRowWidthModule = require(AvatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local GetCameraViewportSizeModule = require(AvatarExperienceCatalog.Utils.getCameraViewportSize)
local WidgetListBreakPointEnumModule = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMarketplaceBreakpointEstimateFix = AvatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointEstimateFix
local FFlagAXMarketplaceBreakpointMismatchCounter = AvatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter
local LANDSCAPEUIWIDTHPERCENTAGE = AvatarExperienceCommonModule.Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE
local CATALOGRESULTSHORIZONTALMARGIN = ConstantsModule.CATALOG_RESULTS_HORIZONTAL_MARGIN

local function getInitialScreenSizeEstimate()
	-- upvalues: AppCommonLibModule (copy), WidgetListBreakPointEnumModule (copy), LANDSCAPEUIWIDTHPERCENTAGE (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), GetBreakpointFromRowWidthModule (copy)
	if AppCommonLibModule.isSpatial() then
		return WidgetListBreakPointEnumModule.XSmall
	end
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera and CurrentCamera.ViewportSize then
		local ViewportSize = CurrentCamera.ViewportSize
		local IsYBelow = ViewportSize.Y < ViewportSize.X
		
		return GetBreakpointFromRowWidthModule(if IsYBelow then ViewportSize.X * LANDSCAPEUIWIDTHPERCENTAGE - CATALOGRESULTSHORIZONTALMARGIN * 2 - 10 else ViewportSize.X)
	else
		return WidgetListBreakPointEnumModule.Medium
	end
end

local function _()
	-- upvalues: FFlagEnableSplitPane (copy), Parent (copy)
	if FFlagEnableSplitPane then
		local Store = require(Parent.SplitPane).SplitPaneStore.getStore()
		
		return if Store.getIsBreakpointEnabled(false) then 1 - Store.getSupportWidthFraction(false) else nil
	else
		return nil
	end
end

local function getScreenSizeEstimate()
	-- upvalues: AppCommonLibModule (copy), WidgetListBreakPointEnumModule (copy), GetCameraViewportSizeModule (copy), Parent (copy), FFlagEnableSplitPane (copy), LANDSCAPEUIWIDTHPERCENTAGE (copy), CATALOGRESULTSHORIZONTALMARGIN (copy), GetBreakpointFromRowWidthModule (copy)
	if AppCommonLibModule.isSpatial() then
		return WidgetListBreakPointEnumModule.XSmall
	end
	local CameraViewportSizeModule = GetCameraViewportSizeModule()
	
	if CameraViewportSizeModule == nil then
		return WidgetListBreakPointEnumModule.Medium
	end
	local DisplayStore = require(Parent.Display).GetDisplayStore(false)
	local GuiInset = DisplayStore.getGuiInset(false)
	local XDelta = CameraViewportSizeModule.X - GuiInset.left - GuiInset.right
	local v1 = nil
	
	if FFlagEnableSplitPane then
		local Store = require(Parent.SplitPane).SplitPaneStore.getStore()
		v1 = if Store.getIsBreakpointEnabled(false) then 1 - Store.getSupportWidthFraction(false) else nil
	else
		v1 = nil
	end
	return GetBreakpointFromRowWidthModule(math.max((if v1 == nil then if CameraViewportSizeModule.Y < CameraViewportSizeModule.X then XDelta * LANDSCAPEUIWIDTHPERCENTAGE else XDelta else XDelta * v1) - CATALOGRESULTSHORIZONTALMARGIN * 2, 0), DisplayStore.getPlatformScale(false))
end

local _ = function(): string
	-- upvalues: GetCameraViewportSizeModule (copy)
	local CameraViewportSizeModule = GetCameraViewportSizeModule()
	
	return if CameraViewportSizeModule == nil then "Unknown" elseif CameraViewportSizeModule.Y < CameraViewportSizeModule.X then "Landscape" else "Portrait"
end

return function()
	-- upvalues: FFlagAXMarketplaceBreakpointMismatchCounter (copy), GetCameraViewportSizeModule (copy), FFlagAXMarketplaceBreakpointEstimateFix (copy), getScreenSizeEstimate (copy), getInitialScreenSizeEstimate (copy), SignalsModule (copy), DebounceFunction (copy), SendAXCounterV2Function (copy), ConstantsModule (copy)
	local HasCameraViewportSizeModule = if FFlagAXMarketplaceBreakpointMismatchCounter then GetCameraViewportSizeModule() ~= nil else nil
	local ScreenSizeEstimate = if FFlagAXMarketplaceBreakpointEstimateFix then getScreenSizeEstimate() else getInitialScreenSizeEstimate()
	local Signal, Signal2 = SignalsModule.createSignal(ScreenSizeEstimate)
	local Signal1, Signal2_1 = SignalsModule.createSignal(ScreenSizeEstimate)
	local Flag = false
	local Count = 0
	local v1 = nil
	local DebounceResult = DebounceFunction(function(p1)
		-- upvalues: Signal2_1 (copy)
		Signal2_1(p1)
	end, 0.8)
	
	return {
		getScreenSize = Signal,
		setScreenSize = function(p1)
			-- upvalues: FFlagAXMarketplaceBreakpointEstimateFix (upval), Flag (ref), Signal2 (copy), DebounceResult (copy)
			if FFlagAXMarketplaceBreakpointEstimateFix then
				Flag = true
			end
			Signal2(p1)
			DebounceResult(p1)
		end,
		getDebouncedScreenSize = Signal1,
		reportMeasuredBreakpoint = function(Measured, Source)
			-- upvalues: Signal1 (copy), SendAXCounterV2Function (upval), ConstantsModule (upval), GetCameraViewportSizeModule (upval), HasCameraViewportSizeModule (copy), FFlagAXMarketplaceBreakpointEstimateFix (upval)
			local SignalResult = Signal1(false)
			local MarketplaceBreakpointMeasured = ConstantsModule.COUNTERS.MarketplaceBreakpointMeasured
			local IsMeasuredMatch = Measured == SignalResult
			local CameraViewportSizeModule = GetCameraViewportSizeModule()
			SendAXCounterV2Function(MarketplaceBreakpointMeasured, {
				match = tostring(IsMeasuredMatch),
				fetched = SignalResult,
				measured = Measured,
				source = Source,
				orientation = if CameraViewportSizeModule == nil then "Unknown" elseif CameraViewportSizeModule.Y < CameraViewportSizeModule.X then "Landscape" else "Portrait",
				hadCameraAtCreation = tostring(HasCameraViewportSizeModule),
				estimateFix = tostring(FFlagAXMarketplaceBreakpointEstimateFix)
			})
		end,
		refreshEstimate = function()
			-- upvalues: Flag (ref), getScreenSizeEstimate (upval), FFlagAXMarketplaceBreakpointEstimateFix (upval), Signal1 (copy), Count (ref), v1 (ref), Signal2 (copy), Signal2_1 (copy)
			if Flag then return end
			local ScreenSizeEstimate = getScreenSizeEstimate()
			
			if FFlagAXMarketplaceBreakpointEstimateFix and Signal1(false) ~= ScreenSizeEstimate then
				Count += 1
				v1 = ScreenSizeEstimate
			end
			Signal2(ScreenSizeEstimate)
			Signal2_1(ScreenSizeEstimate)
		end,
		getEstimateWriteId = function()
			-- upvalues: Count (ref)
			return Count
		end,
		getEstimateWriteBreakpoint = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		wasScreenSizePublishedByEstimateWrite = function(Count1, p1): boolean
			-- upvalues: Count (ref), v1 (ref)
			return Count ~= Count1 and v1 == p1
		end
	}
end