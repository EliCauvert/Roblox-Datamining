local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local SignalsReactModule = require(Parent1.SignalsReact)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local ConstantsModule = require(Parent.Common.Constants)
local ComputeMobilePanelSizeModule = require(Parent.Common.computeMobilePanelSize)
local ComputeDesktopPanelHeightModule = require(Parent.Common.computeDesktopPanelHeight)
local PanelContentHeightStoreModule = require(Parent.Common.PanelContentHeightStore)
local LayoutValuesContextModule = require(Parent.Common.LayoutValuesContext)
local GetDeviceBottomInsetModule = require(Parent.Common.getDeviceBottomInset)
local UseViewportSizeModule = require(Parent.Hooks.useViewportSize)
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local FFlagPlayerListFixPlatformLeaderboardSizingModule = require(Parent.Flags.FFlagPlayerListFixPlatformLeaderboardSizing)

return function(p1, p2: number, p3) --[[ Line: 31 | Named "usePanelLayout" ]]
	-- upvalues: UseViewportSizeModule (copy), UseTokensFunction (copy), ReactModule (copy), LayoutValuesContextModule (copy), SignalsReactModule (copy), PanelContentHeightStoreModule (copy), ConstantsModule (copy), UseScaledValueFunction (copy), GetDeviceBottomInsetModule (copy), ComputeMobilePanelSizeModule (copy), FFlagPlayerListReskinModule (copy), FFlagPlayerListFixPlatformLeaderboardSizingModule (copy), ComputeDesktopPanelHeightModule (copy)
	local UseViewportSizeModuleResult = UseViewportSizeModule()
	local UseTokensResult = UseTokensFunction()
	local Scale = UseTokensResult.Config.UI.Scale
	local TopBarOffset = ReactModule.useContext(LayoutValuesContextModule).TopBarOffset or 0
	local UseSignalStateResult: number = SignalsReactModule.useSignalState(PanelContentHeightStoreModule.getBodyContentHeight)
	local ScaledHEADERHEIGHT = ConstantsModule.HEADER_HEIGHT * Scale
	local ScaledCOLUMNHEADERHEIGHT = ConstantsModule.COLUMN_HEADER_HEIGHT * Scale
	local ScaledPLATFORMROWHEIGHT = ConstantsModule.PLATFORM_ROW_HEIGHT * Scale
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
		local Largest = math.max(ConstantsModule.MOBILE_EDGE_GAP, ConstantsModule.MOBILE_EDGE_GAP * Scale)
		local MobilePanelSizeModule = ComputeMobilePanelSizeModule(UseViewportSizeModuleResult, UseScaledValueResult, UseScaledValueResult1, TopBarOffset + Largest + GetDeviceBottomInsetModule() + Largest)
		X = MobilePanelSizeModule.X
		Y = MobilePanelSizeModule.Y
	else
		X = if p3 then ConstantsModule.PLATFORM_PANEL_WIDTH * Scale else 2 * Size200 + NewScaledPEOPLEMINWIDTH
		local NewScaledHEADERHEIGHT = ScaledHEADERHEIGHT + ConstantsModule.PANEL_HEADER_DIVIDER_HEIGHT * Scale
		
		if FFlagPlayerListReskinModule and p3 then
			NewScaledHEADERHEIGHT += ConstantsModule.PANEL_TABS_HEIGHT * Scale
		end
		local NewNewScaledHEADERHEIGHT = NewScaledHEADERHEIGHT + UseSignalStateResult
		local NewScaledCOLUMNHEADERHEIGHT = ScaledCOLUMNHEADERHEIGHT + ConstantsModule.DESKTOP_MIN_VISIBLE_ROWS * ScaledROWPITCH
		
		if FFlagPlayerListFixPlatformLeaderboardSizingModule and p3 then
			NewScaledCOLUMNHEADERHEIGHT = math.max(NewScaledCOLUMNHEADERHEIGHT, ConstantsModule.PLATFORM_BODY_MIN_HEIGHT * Scale)
		end
		Y = ComputeDesktopPanelHeightModule(UseViewportSizeModuleResult.Y, NewNewScaledHEADERHEIGHT, NewScaledHEADERHEIGHT + NewScaledCOLUMNHEADERHEIGHT)
	end
	return {
		panelWidth = X,
		panelHeight = Y,
		headerHeight = ScaledHEADERHEIGHT,
		columnHeaderHeight = ScaledCOLUMNHEADERHEIGHT,
		rowHeight = ScaledPLATFORMROWHEIGHT,
		statWidth = ScaledSTATCOLUMNWIDTH,
		maxStatColumns = MOBILEMAXSTATCOLUMNS
	}
end