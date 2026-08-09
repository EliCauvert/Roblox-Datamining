local parent = script.Parent.Parent
local foundationModule = require(parent.Parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local constantsModule = require(parent.Common.Constants)
local computeMobilePanelSizeModule = require(parent.Common.computeMobilePanelSize)
local useViewportSizeModule = require(parent.Hooks.useViewportSize)

return function(p0, p1) --[[ line: 22 | named "usePanelLayout" ]]
	-- upvalues: useViewportSizeModule (ref), useTokens (ref), constantsModule (ref), useScaledValue (ref), computeMobilePanelSizeModule (ref)
	local var16, maxValue
	local var4 = useViewportSizeModule()
	local var5 = useTokens()
	local scale = var5.Config.UI.Scale
	local var6 = constantsModule.HEADER_HEIGHT * scale
	local var7 = constantsModule.COLUMN_HEADER_HEIGHT * scale
	local var8 = constantsModule.ROW_HEIGHT * scale
	local var9 = constantsModule.ROW_PITCH * scale
	local var10 = constantsModule.STAT_COLUMN_WIDTH * scale
	local var11 = constantsModule.PEOPLE_MIN_WIDTH * scale
	local size200 = var5.Size.Size_200
	local var12 = useScaledValue(constantsModule.PANEL_SIZE_MIN_CAP)
	local var13 = useScaledValue(constantsModule.PANEL_SIZE_MAX_CAP)
	local var14 = if p0 then constantsModule.MOBILE_MAX_STAT_COLUMNS else constantsModule.DESKTOP_MAX_STAT_COLUMNS
	local minValue = math.min(p1, var14)
	local _ = nil
	local _ = nil
	
	if p0 then
		local var18 = computeMobilePanelSizeModule(var4, var12, var13)
		var16 = var18.X
		maxValue = var18.Y
	else
		var16 = 2 * size200 + var11 + minValue * var10
		maxValue = math.max(var4.Y * 0.5, var6 + var7 + 2 * var9)
	end
	return {
		panelWidth = var16,
		panelHeight = maxValue,
		headerHeight = var6,
		columnHeaderHeight = var7,
		rowHeight = var8,
		statWidth = var10,
		maxStatColumns = var14
	}
end