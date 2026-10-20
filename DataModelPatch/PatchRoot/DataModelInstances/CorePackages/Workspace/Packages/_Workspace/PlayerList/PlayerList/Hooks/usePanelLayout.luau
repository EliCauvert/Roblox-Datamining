local Parent = script.Parent.Parent
local FoundationModule = require(Parent.Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local ConstantsModule = require(Parent.Common.Constants)
local ComputeMobilePanelSizeModule = require(Parent.Common.computeMobilePanelSize)
local UseViewportSizeModule = require(Parent.Hooks.useViewportSize)

return function(p1, p2: number, p3)
	-- upvalues: UseViewportSizeModule (copy), UseTokensFunction (copy), ConstantsModule (copy), UseScaledValueFunction (copy), ComputeMobilePanelSizeModule (copy)
	local UseViewportSizeModuleResult = UseViewportSizeModule()
	local UseTokensResult = UseTokensFunction()
	local Scale: number = UseTokensResult.Config.UI.Scale
	local ScaledHEADERHEIGHT = ConstantsModule.HEADER_HEIGHT * Scale
	local ScaledCOLUMNHEADERHEIGHT = ConstantsModule.COLUMN_HEADER_HEIGHT * Scale
	local ScaledROWHEIGHT = ConstantsModule.ROW_HEIGHT * Scale
	local ScaledROWPITCH = ConstantsModule.ROW_PITCH * Scale
	local ScaledSTATCOLUMNWIDTH = ConstantsModule.STAT_COLUMN_WIDTH * Scale
	local ScaledPEOPLEMINWIDTH = ConstantsModule.PEOPLE_MIN_WIDTH * Scale
	local Size200: number = UseTokensResult.Size.Size_200
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.PANEL_SIZE_MIN_CAP)
	local UseScaledValueResult1 = UseScaledValueFunction(ConstantsModule.PANEL_SIZE_MAX_CAP)
	local MOBILEMAXSTATCOLUMNS = if p1 then ConstantsModule.MOBILE_MAX_STAT_COLUMNS else ConstantsModule.DESKTOP_MAX_STAT_COLUMNS
	local NewScaledPEOPLEMINWIDTH = ScaledPEOPLEMINWIDTH + math.min(p2, MOBILEMAXSTATCOLUMNS) * ScaledSTATCOLUMNWIDTH
	local Y = nil
	local X = nil
	
	if p1 then
		local MobilePanelSizeModule = ComputeMobilePanelSizeModule(UseViewportSizeModuleResult, UseScaledValueResult, UseScaledValueResult1)
		X = MobilePanelSizeModule.X
		Y = MobilePanelSizeModule.Y
	else
		X = if p3 then 320 * Scale else 2 * Size200 + NewScaledPEOPLEMINWIDTH
		Y = math.max(UseViewportSizeModuleResult.Y * 0.5, ScaledHEADERHEIGHT + ScaledCOLUMNHEADERHEIGHT + 2 * ScaledROWPITCH)
	end
	return {
		panelWidth = X,
		panelHeight = Y,
		headerHeight = ScaledHEADERHEIGHT,
		columnHeaderHeight = ScaledCOLUMNHEADERHEIGHT,
		rowHeight = ScaledROWHEIGHT,
		statWidth = ScaledSTATCOLUMNWIDTH,
		maxStatColumns = MOBILEMAXSTATCOLUMNS
	}
end