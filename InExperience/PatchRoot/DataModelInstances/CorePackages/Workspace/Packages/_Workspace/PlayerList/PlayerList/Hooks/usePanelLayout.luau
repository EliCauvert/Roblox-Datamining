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

return function(p1, p2, p3)
	-- upvalues: useViewportSizeModule (ref), useTokens (ref), reactModule (ref), layoutValuesContextModule (ref), signalsReactModule (ref), panelContentHeightStoreModule (ref), constantsModule (ref), useScaledValue (ref), getDeviceBottomInsetModule (ref), computeMobilePanelSizeModule (ref), fFlagPlayerListTwoTabsModule (ref), computeDesktopPanelHeightModule (ref)
	local var1, var2
	local var3 = useViewportSizeModule()
	local var4 = useTokens()
	local scale = var4.Config.UI.Scale
	local topBarOffset = reactModule.useContext(layoutValuesContextModule).TopBarOffset or 0
	local var5 = signalsReactModule.useSignalState(panelContentHeightStoreModule.getBodyContentHeight)
	local var6 = constantsModule.HEADER_HEIGHT * scale
	local var7 = constantsModule.COLUMN_HEADER_HEIGHT * scale
	local var8 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var9 = constantsModule.ROW_PITCH * scale
	local var10 = constantsModule.STAT_COLUMN_WIDTH * scale
	local var11 = constantsModule.PEOPLE_MIN_WIDTH * scale
	local size200 = var4.Size.Size_200
	local var12 = useScaledValue(constantsModule.PANEL_SIZE_MIN_CAP)
	local var13 = useScaledValue(constantsModule.PANEL_SIZE_MAX_CAP)
	local var14 = if p1 then constantsModule.MOBILE_MAX_STAT_COLUMNS else constantsModule.DESKTOP_MAX_STAT_COLUMNS
	local var15 = var11 + math.min(p2, var14) * var10
	local _ = nil
	local _ = nil
	
	if p1 then
		local maxValue = math.max(constantsModule.MOBILE_EDGE_GAP, constantsModule.MOBILE_EDGE_GAP * scale)
		local var16 = computeMobilePanelSizeModule(var3, var12, var13, topBarOffset + maxValue + getDeviceBottomInsetModule() + maxValue)
		var1 = var16.X
		var2 = var16.Y
	else
		var1 = if p3 then 320 * scale else 2 * size200 + var15
		local var17 = var6 + constantsModule.PANEL_HEADER_DIVIDER_HEIGHT * scale
		
		if fFlagPlayerListTwoTabsModule and p3 then
			var17 += constantsModule.PANEL_TABS_HEIGHT * scale
		end
		var2 = computeDesktopPanelHeightModule(var3.Y, var17 + var5, var17 + var7 + constantsModule.DESKTOP_MIN_VISIBLE_ROWS * var9)
	end
	return {
		panelWidth = var1,
		panelHeight = var2,
		headerHeight = var6,
		columnHeaderHeight = var7,
		rowHeight = var8,
		statWidth = var10,
		maxStatColumns = var14
	}
end