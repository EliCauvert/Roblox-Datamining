local parent = script.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local signalsReactModule = require(parent_1.SignalsReact)
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local constantsModule = require(parent.Common.Constants)
local computeMobilePanelSizeModule = require(parent.Common.computeMobilePanelSize)
local computeDesktopPanelHeightModule = require(parent.Common.computeDesktopPanelHeight)
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)
local useViewportSizeModule = require(parent.Hooks.useViewportSize)
local fFlagPlayerListReskinHeightResponsivenessModule = require(parent.Flags.FFlagPlayerListReskinHeightResponsiveness)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)

return function(p0, p1, p2) --[[ line: 30 | named "usePanelLayout" ]]
	-- upvalues: useViewportSizeModule (ref), useTokens (ref), fFlagPlayerListReskinHeightResponsivenessModule (ref), signalsReactModule (ref), panelContentHeightStoreModule (ref), constantsModule (ref), useScaledValue (ref), computeMobilePanelSizeModule (ref), fFlagPlayerListTwoTabsModule (ref), computeDesktopPanelHeightModule (ref)
	local var22, maxValue
	local var9 = useViewportSizeModule()
	local var10 = useTokens()
	local scale = var10.Config.UI.Scale
	local var11 = if fFlagPlayerListReskinHeightResponsivenessModule then signalsReactModule.useSignalState(panelContentHeightStoreModule.getBodyContentHeight) else 0
	local var12 = constantsModule.HEADER_HEIGHT * scale
	local var13 = constantsModule.COLUMN_HEADER_HEIGHT * scale
	local var14 = constantsModule.ROW_HEIGHT * scale
	local var15 = constantsModule.ROW_PITCH * scale
	local var16 = constantsModule.STAT_COLUMN_WIDTH * scale
	local var17 = constantsModule.PEOPLE_MIN_WIDTH * scale
	local size200 = var10.Size.Size_200
	local var18 = useScaledValue(constantsModule.PANEL_SIZE_MIN_CAP)
	local var19 = useScaledValue(constantsModule.PANEL_SIZE_MAX_CAP)
	local var20 = if p0 then constantsModule.MOBILE_MAX_STAT_COLUMNS else constantsModule.DESKTOP_MAX_STAT_COLUMNS
	local var21 = var17 + math.min(p1, var20) * var16
	local _ = nil
	local _ = nil
	
	if p0 then
		local var25 = computeMobilePanelSizeModule(var9, var18, var19)
		var22 = var25.X
		maxValue = var25.Y
	else
		var22 = if p2 then 320 * scale else 2 * size200 + var21
		
		if fFlagPlayerListReskinHeightResponsivenessModule then
			local var24 = var12 + constantsModule.PANEL_HEADER_DIVIDER_HEIGHT * scale
			
			if fFlagPlayerListTwoTabsModule and p2 then
				var24 += constantsModule.PANEL_TABS_HEIGHT * scale
			end
			maxValue = computeDesktopPanelHeightModule(var9.Y, var24 + var11, var24 + var13 + constantsModule.DESKTOP_MIN_VISIBLE_ROWS * var15)
		else
			maxValue = math.max(var9.Y * 0.5, var12 + var13 + 2 * var15)
		end
	end
	return {
		panelWidth = var22,
		panelHeight = maxValue,
		headerHeight = var12,
		columnHeaderHeight = var13,
		rowHeight = var14,
		statWidth = var16,
		maxStatColumns = var20
	}
end