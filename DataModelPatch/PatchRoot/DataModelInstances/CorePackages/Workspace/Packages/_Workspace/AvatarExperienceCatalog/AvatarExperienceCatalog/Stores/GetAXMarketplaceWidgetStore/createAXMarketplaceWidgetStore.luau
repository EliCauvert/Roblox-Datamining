local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local SignalsModule = require(Parent.Signals)
local DebounceFunction = AvatarExperienceCommonModule.Utils.debounce
local GetBreakpointFromRowWidthModule = require(AvatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local WidgetListBreakPointEnumModule = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local LANDSCAPEUIWIDTHPERCENTAGE = AvatarExperienceCommonModule.Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE
local CATALOGRESULTSHORIZONTALMARGIN = require(AvatarExperienceCatalog.Constants).CATALOG_RESULTS_HORIZONTAL_MARGIN

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

return function()
	-- upvalues: getInitialScreenSizeEstimate (copy), SignalsModule (copy), DebounceFunction (copy)
	local InitialScreenSizeEstimate = getInitialScreenSizeEstimate()
	local Signal, Signal2 = SignalsModule.createSignal(InitialScreenSizeEstimate)
	local Signal1, Signal2_1 = SignalsModule.createSignal(InitialScreenSizeEstimate)
	local DebounceResult = DebounceFunction(function(p1)
		-- upvalues: Signal2_1 (copy)
		Signal2_1(p1)
	end, 0.8)
	
	return {
		getScreenSize = Signal,
		setScreenSize = function(p1)
			-- upvalues: Signal2 (copy), DebounceResult (copy)
			Signal2(p1)
			DebounceResult(p1)
		end,
		getDebouncedScreenSize = Signal1
	}
end