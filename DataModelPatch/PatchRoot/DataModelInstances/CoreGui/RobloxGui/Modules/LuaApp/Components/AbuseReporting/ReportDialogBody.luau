local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ReportListTableModule = require(Modules.LuaApp.Components.AbuseReporting.ReportListTable)
local ReportSummaryPageModule = require(Modules.LuaApp.Components.AbuseReporting.ReportSummaryPage)
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local ReportDialogBodyLoadingModule = require(Modules.LuaApp.Components.AbuseReporting.ReportDialogBodyLoading)
local ReportTargetComponentModule = require(Modules.LuaApp.Components.AbuseReporting.ReportTargetComponent)
local ReportDataFetchStatusMessageModule = require(Modules.LuaApp.Components.AbuseReporting.ReportDataFetchStatusMessage)
local ConstantsModule = require(Modules.LuaApp.Components.AbuseReporting.Constants)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local IsSelectedDataDSAIllegalContentFunction = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent
local GetThumbnailDataModule = require(script.Parent.getThumbnailData)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local IsShowEUDSAIllegalContentReportingLinkFunction = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local GetFFlagLuafiedReportThumbnailFunction = SharedFlagsModule.GetFFlagLuafiedReportThumbnail
local GetFFlagLuafiedReportErrorStatesFunction = SharedFlagsModule.GetFFlagLuafiedReportErrorStates
local GetFFlagDSAIllegalContentReportingFunction = SharedFlagsModule.GetFFlagDSAIllegalContentReporting
local GetFFlagDSAVRSkipFrontendGeoCheckFunction = SharedFlagsModule.GetFFlagDSAVRSkipFrontendGeoCheck
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout

local function _(p1)
	-- upvalues: GetFFlagLuafiedReportErrorStatesFunction (copy)
	return GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUILoading
end

local _ = function(p1)
	-- upvalues: GetFFlagLuafiedReportErrorStatesFunction (copy)
	return GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUIError
end

local function getButtonsFromProps(p1, Text, Text1, p2, p3, BEDUIError)
	-- upvalues: ButtonType (copy)
	local List = {}
	
	if p2 then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.onBack()
				end,
				text = Text
			}
		})
	end
	if BEDUIError then
		table.insert(List, {
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.onClose()
				end,
				text = Text1
			}
		})
	end
	if p3 then
		table.insert(List, {
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.onSubmitReport()
				end,
				text = p1.BEDUIComponents and p1.BEDUIComponents.submission.buttonText or "",
				isDisabled = p1.loadingState.submitLoading
			}
		})
	end
	return List
end

local _ = function(p1, p2)
	return if p1.loadingState.submitLoading or p1.loadingState.BEDUILoading then p2.Color.Content.Default.Color3 else p2.Color.ActionAlert.Foreground.Color3
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseScreenSizeFunction (copy), IsSelectedDataDSAIllegalContentFunction (copy), GetFFlagDSAVRSkipFrontendGeoCheckFunction (copy), GetFFlagDSAIllegalContentReportingFunction (copy), IsShowEUDSAIllegalContentReportingLinkFunction (copy), UseSelectorFunction (copy), GetThumbnailDataModule (copy), GetFFlagLuafiedReportErrorStatesFunction (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), IxpUtilsModule (copy), VRPanelWidthIXP (copy), WithLocalizationFunction (copy), ReactModule (copy), FullPageModal (copy), UserInputService (copy), ConstantsModule (copy), VRConstants (copy), getButtonsFromProps (copy), GetFFlagLuafiedReportThumbnailFunction (copy), ReportTargetComponentModule (copy), ReportListTableModule (copy), ReportSummaryPageModule (copy), ReportDialogBodyLoadingModule (copy), ReportDataFetchStatusMessageModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local IsSelectedDataDSAIllegalContent = p1.BEDUIComponents ~= nil and (p1.BEDUIComponents.submission.text ~= nil and IsSelectedDataDSAIllegalContentFunction(p1.selectionData))
	local FFlagDSAIllegalContentReporting = if GetFFlagDSAVRSkipFrontendGeoCheckFunction() then IsSelectedDataDSAIllegalContent and GetFFlagDSAIllegalContentReportingFunction() else IsSelectedDataDSAIllegalContent and IsShowEUDSAIllegalContentReportingLinkFunction()
	local UseSelectorResult = UseSelectorFunction(GetThumbnailDataModule({ reportData = p1.reportData }))
	local Inverted: boolean = #p1.prevListNodes > 0 and not (GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUIError)
	local NoFFlagDSAIllegalContentReporting: boolean = p1.currentList == nil and #p1.selectionData > 0 and not FFlagDSAIllegalContentReporting
	local BEDUIError = GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUIError
	local DefaultColor3 = if p1.loadingState.submitLoading or p1.loadingState.BEDUILoading then UseDesignTokensResult.Color.Content.Default.Color3 else UseDesignTokensResult.Color.ActionAlert.Foreground.Color3
	local UseTestVariablesResult = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	
	return WithLocalizationFunction({
		backButtonText = "CommonUI.Controls.Action.Back",
		closeButtonText = "Feature.Friends.Action.Close"
	})(function(p2)
		-- upvalues: ReactModule (upval), FullPageModal (upval), UserInputService (upval), p1 (copy), ConstantsModule (upval), UseScreenSizeResult (copy), FFlagLuaAppForceVrAppPanelWidthRollout (upval), UseTestVariablesResult (copy), VRConstants (upval), Inverted (copy), NoFFlagDSAIllegalContentReporting (copy), BEDUIError (copy), getButtonsFromProps (upval), GetFFlagLuafiedReportThumbnailFunction (upval), GetFFlagLuafiedReportErrorStatesFunction (upval), ReportTargetComponentModule (upval), UseSelectorResult (copy), UseDesignTokensResult (copy), ReportListTableModule (upval), ReportSummaryPageModule (upval), ReportDialogBodyLoadingModule (upval), ReportDataFetchStatusMessageModule (upval), DefaultColor3 (copy)
		local CreateElementFunction2 = ReactModule.createElement
		local config = {
			distanceFromTop = if UserInputService.StatusBarSize then UserInputService.StatusBarSize.Y else 0,
			title = p1.BEDUIComponents and p1.BEDUIComponents.title.text or "",
			screenSize = if p1.reportSurface == ConstantsModule.BEDUI_SURFACES.VR or not UseScreenSizeResult then if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * UseTestVariablesResult, VRConstants.MainScreenResolution.Y) else UseScreenSizeResult,
			buttonStackProps = if Inverted or NoFFlagDSAIllegalContentReporting or BEDUIError then {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttons = getButtonsFromProps(p1, p2.backButtonText, p2.closeButtonText, Inverted, NoFFlagDSAIllegalContentReporting, BEDUIError)
			} else nil,
			onCloseClicked = function()
				-- upvalues: p1 (upval)
				p1.onClose()
				p1.onLogAbandon()
			end
		}
		local t = {}
		local CreateElementFunction1 = ReactModule.createElement
		local v1 = "Frame"
		local config1 = { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }
		local config2 = {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ReportTarget = if GetFFlagLuafiedReportThumbnailFunction() then if GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUIError then nil else ReactModule.createElement(ReportTargetComponentModule, {
				primaryText = UseSelectorResult.primaryText,
				secondaryText = UseSelectorResult.secondaryText,
				thumbnailUrl = UseSelectorResult.thumbnailUrl
			}) else nil
		}
		local CreateElementFunction = ReactModule.createElement
		local v2 = "Frame"
		local BEDUIError1 = GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUIError
		local config3 = {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, if BEDUIError1 then 0 else -UseDesignTokensResult.Size.Size_2800)
		}
		local t1 = {}
		local Element = nil
		
		if p1.currentList then
			Element = ReactModule.createElement(ReportListTableModule, { currentList = p1.currentList, onSelect = p1.onSelect })
		elseif #p1.selectionData > 0 then
			Element = ReactModule.createElement(ReportSummaryPageModule, {
				heading = p1.BEDUIComponents and p1.BEDUIComponents.submission.heading or "",
				selectionData = p1.selectionData,
				dsaText = p1.BEDUIComponents and p1.BEDUIComponents.submission.text or "",
				onSummaryPageMounted = p1.onSummaryPageMounted
			})
		else
			local BEDUILoading = GetFFlagLuafiedReportErrorStatesFunction() and p1.loadingState.BEDUILoading
			Element = if BEDUILoading then ReactModule.createElement(ReportDialogBodyLoadingModule, {}) else nil
		end
		t1.ReportCategoryTable = Element
		t1.ReportDataFetchStatusMessage = if GetFFlagLuafiedReportErrorStatesFunction() then ReactModule.createElement(ReportDataFetchStatusMessageModule, {
			statusPrimaryText = p1.loadingState.statusPrimaryText,
			statusSecondaryText = p1.loadingState.statusSecondaryText,
			BEDUIError = p1.loadingState.BEDUIError,
			submitError = p1.loadingState.submitError,
			color = DefaultColor3
		}) else nil
		config2.ReportContent = CreateElementFunction(v2, config3, t1)
		t.ViewFrame = CreateElementFunction1(v1, config1, config2)
		
		return CreateElementFunction2(FullPageModal, config, t)
	end)
end