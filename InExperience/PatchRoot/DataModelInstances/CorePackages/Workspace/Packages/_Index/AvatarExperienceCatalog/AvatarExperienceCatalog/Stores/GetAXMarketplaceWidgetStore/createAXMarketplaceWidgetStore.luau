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

local function getInitialScreenSizeEstimate() --[[ line: 54 ]]
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

return function() --[[ line: 79 | named "createAXMarketplaceWidgetStore" ]]
	-- upvalues: getInitialScreenSizeEstimate (ref), signalsModule (ref), debounce (ref)
	local var8 = getInitialScreenSizeEstimate()
	local var9, var10 = signalsModule.createSignal(var8)
	local var11, var12 = signalsModule.createSignal(var8)
	local var13 = debounce(function(p0) --[[ line: 86 ]]
		-- upvalues: var12 (ref)
		var12(p0)
	end, 0.8)
	
	return {
		getScreenSize = var9,
		setScreenSize = function(p1) --[[ line: 92 ]]
			-- upvalues: var10 (ref), var13 (ref)
			var10(p1)
			var13(p1)
		end,
		getDebouncedScreenSize = var11
	}
end