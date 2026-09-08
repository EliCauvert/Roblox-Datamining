local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local constants = avatarExperienceCommonModule.Constants
local constantsModule = require(avatarExperienceCatalog.Constants)
local signalsModule = require(parent.Signals)
local debounce = avatarExperienceCommonModule.Utils.debounce
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local widgetListBreakPointEnumModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
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

return function()
	-- upvalues: getInitialScreenSizeEstimate (ref), signalsModule (ref), debounce (ref)
	local var1 = getInitialScreenSizeEstimate()
	local var2, var3 = signalsModule.createSignal(var1)
	local var4, var5 = signalsModule.createSignal(var1)
	local var6 = debounce(function(p1)
		-- upvalues: var5 (ref)
		var5(p1)
	end, 0.8)
	
	return {
		getScreenSize = var2,
		setScreenSize = function(p1)
			-- upvalues: var3 (ref), var6 (ref)
			var3(p1)
			var6(p1)
		end,
		getDebouncedScreenSize = var4
	}
end