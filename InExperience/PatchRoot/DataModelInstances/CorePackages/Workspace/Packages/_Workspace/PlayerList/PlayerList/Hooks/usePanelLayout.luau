local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local signalsReactModule = require(parent_1.SignalsReact)
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local constantsModule = require(parent.Common.Constants)
local computeMobilePanelSizeModule = require(parent.Common.computeMobilePanelSize)
local computeDesktopPanelHeightModule = require(parent.Common.computeDesktopPanelHeight)
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)
local layoutValuesContextModule = require(parent.Common.LayoutValuesContext)
local getDeviceBottomInsetModule = require(parent.Common.getDeviceBottomInset)
local useViewportSizeModule = require(parent.Hooks.useViewportSize)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)

return function(p0, p1, p2) --[[ line: 32 | named "usePanelLayout" ]]
	-- upvalues: useViewportSizeModule (ref), useTokens (ref), reactModule (ref), layoutValuesContextModule (ref), signalsReactModule (ref), panelContentHeightStoreModule (ref), constantsModule (ref), useScaledValue (ref), getDeviceBottomInsetModule (ref), computeMobilePanelSizeModule (ref), fFlagPlayerListTwoTabsModule (ref), computeDesktopPanelHeightModule (ref)
	local var25, var27
	local var11 = useViewportSizeModule()
	local var12 = useTokens()
	local scale = var12.Config.UI.Scale
	local topBarOffset = reactModule.useContext(layoutValuesContextModule).TopBarOffset or 0
	local var14 = signalsReactModule.useSignalState(panelContentHeightStoreModule.getBodyContentHeight)
	local var15 = constantsModule.HEADER_HEIGHT * scale
	local var16 = constantsModule.COLUMN_HEADER_HEIGHT * scale
	local var17 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var18 = constantsModule.ROW_PITCH * scale
	local var19 = constantsModule.STAT_COLUMN_WIDTH * scale
	local var20 = constantsModule.PEOPLE_MIN_WIDTH * scale
	local size200 = var12.Size.Size_200
	local var21 = useScaledValue(constantsModule.PANEL_SIZE_MIN_CAP)
	local var22 = useScaledValue(constantsModule.PANEL_SIZE_MAX_CAP)
	local var23 = if p0 then constantsModule.MOBILE_MAX_STAT_COLUMNS else constantsModule.DESKTOP_MAX_STAT_COLUMNS
	local var24 = var20 + math.min(p1, var23) * var19
	local _ = nil
	local _ = nil
	
	if p0 then
		local maxValue = math.max(constantsModule.MOBILE_EDGE_GAP, constantsModule.MOBILE_EDGE_GAP * scale)
		local var29 = computeMobilePanelSizeModule(var11, var21, var22, topBarOffset + maxValue + getDeviceBottomInsetModule() + maxValue)
		var25 = var29.X
		var27 = var29.Y
	else
		var25 = if p2 then 320 * scale else 2 * size200 + var24
		local var26 = var15 + constantsModule.PANEL_HEADER_DIVIDER_HEIGHT * scale
		
		if fFlagPlayerListTwoTabsModule and p2 then
			var26 += constantsModule.PANEL_TABS_HEIGHT * scale
		end
		var27 = computeDesktopPanelHeightModule(var11.Y, var26 + var14, var26 + var16 + constantsModule.DESKTOP_MIN_VISIBLE_ROWS * var18)
	end
	return {
		panelWidth = var25,
		panelHeight = var27,
		headerHeight = var15,
		columnHeaderHeight = var16,
		rowHeight = var17,
		statWidth = var19,
		maxStatColumns = var23
	}
end