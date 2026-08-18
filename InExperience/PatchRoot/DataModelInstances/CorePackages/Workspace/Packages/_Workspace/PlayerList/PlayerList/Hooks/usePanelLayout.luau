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
local fFlagPlayerListReskinRowHeightModule = require(parent.Flags.FFlagPlayerListReskinRowHeight)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)

return function(p0, p1, p2) --[[ line: 31 | named "usePanelLayout" ]]
	-- upvalues: useViewportSizeModule (ref), useTokens (ref), fFlagPlayerListReskinHeightResponsivenessModule (ref), signalsReactModule (ref), panelContentHeightStoreModule (ref), constantsModule (ref), fFlagPlayerListReskinRowHeightModule (ref), useScaledValue (ref), computeMobilePanelSizeModule (ref), fFlagPlayerListTwoTabsModule (ref), computeDesktopPanelHeightModule (ref)
	local var23, maxValue
	local var10 = useViewportSizeModule()
	local var11 = useTokens()
	local scale = var11.Config.UI.Scale
	local var12 = if fFlagPlayerListReskinHeightResponsivenessModule then signalsReactModule.useSignalState(panelContentHeightStoreModule.getBodyContentHeight) else 0
	local var13 = constantsModule.HEADER_HEIGHT * scale
	local var14 = constantsModule.COLUMN_HEADER_HEIGHT * scale
	local var15 = if fFlagPlayerListReskinRowHeightModule then constantsModule.PLATFORM_ROW_HEIGHT * scale else constantsModule.ROW_HEIGHT * scale
	local var16 = constantsModule.ROW_PITCH * scale
	local var17 = constantsModule.STAT_COLUMN_WIDTH * scale
	local var18 = constantsModule.PEOPLE_MIN_WIDTH * scale
	local size200 = var11.Size.Size_200
	local var19 = useScaledValue(constantsModule.PANEL_SIZE_MIN_CAP)
	local var20 = useScaledValue(constantsModule.PANEL_SIZE_MAX_CAP)
	local var21 = if p0 then constantsModule.MOBILE_MAX_STAT_COLUMNS else constantsModule.DESKTOP_MAX_STAT_COLUMNS
	local var22 = var18 + math.min(p1, var21) * var17
	local _ = nil
	local _ = nil
	
	if p0 then
		local var26 = computeMobilePanelSizeModule(var10, var19, var20)
		var23 = var26.X
		maxValue = var26.Y
	else
		var23 = if p2 then 320 * scale else 2 * size200 + var22
		
		if fFlagPlayerListReskinHeightResponsivenessModule then
			local var25 = var13 + constantsModule.PANEL_HEADER_DIVIDER_HEIGHT * scale
			
			if fFlagPlayerListTwoTabsModule and p2 then
				var25 += constantsModule.PANEL_TABS_HEIGHT * scale
			end
			maxValue = computeDesktopPanelHeightModule(var10.Y, var25 + var12, var25 + var14 + constantsModule.DESKTOP_MIN_VISIBLE_ROWS * var16)
		else
			maxValue = math.max(var10.Y * 0.5, var13 + var14 + 2 * var16)
		end
	end
	return {
		panelWidth = var23,
		panelHeight = maxValue,
		headerHeight = var13,
		columnHeaderHeight = var14,
		rowHeight = var15,
		statWidth = var17,
		maxStatColumns = var21
	}
end