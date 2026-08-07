local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local safetyService = game:GetService("SafetyService")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local reportTypeSelectorModule = require(abuseReportMenu.Components.ReportTypeSelector)
local constantsModule = require(abuseReportMenu.Components.Constants)
local reportModes = constantsModule.ReportModes
local reportTypes = constantsModule.ReportTypes
local selectInSceneReportMenuModule = require(abuseReportMenu.Components.SelectInSceneReportMenu)
local reportPersonMenuItemsContainerModule = require(abuseReportMenu.Components.Containers.ReportPersonMenuItemsContainer)
local reportExperienceMenuItemsContainerModule = require(abuseReportMenu.Components.Containers.ReportExperienceMenuItemsContainer)
local reportAnythingAnalyticsModule = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local reportAbuseAnalyticsModule = require(abuseReportMenu.Analytics.ReportAbuseAnalytics)
local annotationModalModule = require(abuseReportMenu.ReportAnything.Components.AnnotationModal)
local chatModalSelectorDialogControllerModule = require(abuseReportMenu.Components.ChatModalSelectorDialogController)
local modalBasedSelectorDialogControllerModule = require(abuseReportMenu.Components.ModalBasedSelectorDialogController)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local setTimeout = require(corePackagesService.Packages.LuauPolyfill).setTimeout
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useReportAnythingWithScreenshotModule = require(abuseReportMenu.Hooks.useReportAnythingWithScreenshot)
local getMenuItemSizingsModule = require(abuseReportMenu.Utility.getMenuItemSizings)
local analyticsReducerModule = require(abuseReportMenu.Reducers.analyticsReducer)
local createCleanupModule = require(abuseReportMenu.Components.createCleanup)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local dsaIllegalContentReportingModule = require(corePackagesService.Workspace.Packages.DsaIllegalContentReporting)
local isShowEUDSAIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowEUDSAIllegalContentReportingLink
local DSAReportLink = dsaIllegalContentReportingModule.DSAReportLink
local isShowUKOSAIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = dsaIllegalContentReportingModule.OSAReportLink
local isShowGenericIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink
local genericReportLink = dsaIllegalContentReportingModule.GenericReportLink
local getTakeItDownReportLinkVisibility = dsaIllegalContentReportingModule.getTakeItDownReportLinkVisibility
local takeItDownReportLink = dsaIllegalContentReportingModule.TakeItDownReportLink
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local isAbuseReportMenuOpenCloseSignalEnabledModule = require(abuseReportMenu.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule = require(abuseReportMenu.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local getFFlagWHAM1707ExperimentForceEnabledModule = require(abuseReportMenu.Flags.GetFFlagWHAM1707ExperimentForceEnabled)
local fStringWHAM1707IXPFieldModule = require(abuseReportMenu.Flags.FStringWHAM1707IXPField)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fStringReportMenuIXPLayer = sharedFlagsModule.FStringReportMenuIXPLayer
local fStringEARReportMenuIXPLayer = sharedFlagsModule.FStringEARReportMenuIXPLayer
local fStringSelectInSceneIXPField = sharedFlagsModule.FStringSelectInSceneIXPField
local fFlagHighlightModePreciseSelectionEnabled = sharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local abuseReportTabClearCapturedScreenshotOnCloseFix = game:DefineFastFlag("AbuseReportTabClearCapturedScreenshotOnCloseFix", false)
local fFlagMigrateAllOsaMessagingToCentralService = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService
local IEMReportScrollingFix = game:DefineFastFlag("IEMReportScrollingFix", false)
local fFlagReportFocusNavIEMButtonsModule = require(abuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local fFlagAddTakeItDownReportLinkToSurfaces = sharedFlagsModule.FFlagAddTakeItDownReportLinkToSurfaces
local isShowSelectInSceneReportMenuModule = require(abuseReportMenu.Utility.isShowSelectInSceneReportMenu)
local getHighlightModeVariant = require(corePackagesService.Workspace.Packages.InGameAssetReporting).getHighlightModeVariant
local segmentedControl = require(corePackagesService.Packages.UIBlox).App.Control.SegmentedControl
local list = { reportModes.Classic, reportModes.SelectInScene }
local list_1 = { reportTypes.Person, reportTypes.Experience }

local function _() --[[ line: 102 | named "isInSelectInSceneExperiment" ]]
	-- upvalues: IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref)
	local ok, status = pcall(function() --[[ line: 104 ]]
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
		
		return status[fStringSelectInSceneIXPField]
	end
	return false
end

local function isInWHAM1707Experiment() --[[ line: 116 ]]
	-- upvalues: getFFlagWHAM1707ExperimentForceEnabledModule (ref), IXPService (ref), fStringEARReportMenuIXPLayer (ref), fStringWHAM1707IXPFieldModule (ref)
	if getFFlagWHAM1707ExperimentForceEnabledModule() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 122 ]]
		-- upvalues: IXPService (copy), fStringEARReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringEARReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringWHAM1707IXPFieldModule] ~= nil then
		IXPService:LogUserLayerExposure(fStringEARReportMenuIXPLayer)
		
		return status[fStringWHAM1707IXPFieldModule]
	end
	return false
end

local var38 = function(p0) --[[ line: 134 ]]
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), list (ref), list_1 (ref), createCleanupModule (ref), useReportAnythingWithScreenshotModule (ref), getMenuItemSizingsModule (ref), useTokens (ref), useLocalization (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707Experiment (ref), safetyService (ref), annotationModalModule (ref), chatModalSelectorDialogControllerModule (ref), modalBasedSelectorDialogControllerModule (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (ref), setTimeout (ref), reportAbuseAnalyticsModule (ref), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (ref), playersService (ref), isShowSelectInSceneReportMenuModule (ref), IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref), fFlagReportFocusNavIEMButtonsModule (ref), guiService (ref), fFlagIEMTabFocusNav (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reportAnythingAnalyticsModule (ref), reportTypes (ref), reportPersonMenuItemsContainerModule (ref), reportExperienceMenuItemsContainerModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), IEMReportScrollingFix (ref), segmentedControl (ref), reportModes (ref), selectInSceneReportMenuModule (ref), fFlagHighlightModePreciseSelectionEnabled (ref), getHighlightModeVariant (ref), reportTypeSelectorModule (ref), view (ref), text (ref), isShowUKOSAIllegalContentReportingLink (ref), fFlagMigrateAllOsaMessagingToCentralService (ref), isShowEUDSAIllegalContentReportingLink (ref), DSAReportLink (ref), OSAReportLink (ref), isShowGenericIllegalContentReportingLink (ref), genericReportLink (ref), fFlagAddTakeItDownReportLinkToSurfaces (ref), getTakeItDownReportLinkVisibility (ref), takeItDownReportLink (ref)
	local var39, var40 = reactModule.useState(false)
	local var41, var42 = reactModule.useState(1)
	local var43, var44 = reactModule.useState(1)
	local var45, var46 = reactModule.useState(nil)
	local var47, var48 = reactModule.useState(0)
	local var49, var50 = reactModule.useState(false)
	local var51, var52 = reactModule.useState(false)
	local var53, var54 = reactModule.useState(true)
	local var55 = reactModule.useRef(nil)
	local var56 = reactModule.useRef(nil)
	local var57, var58 = reactModule.useState({ width = 0, height = 0 })
	local var59 = var57.width < var57.height and var57.width < 700
	local var60, var61 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var62 = list[var41]
	local var63 = list_1[var43]
	local var64, var65 = useReportAnythingWithScreenshotModule(var39, p0.hideReportTab, p0.showReportTab, reactModule.useCallback(createCleanupModule(var60, var61, var46, var63), { var60, var43 }))
	local var66 = getMenuItemSizingsModule()
	local var67 = useTokens()
	local var68 = useLocalization(constantsModule.localizationKeys)
	reactModule.useEffect(function() --[[ line: 165 ]]
		-- upvalues: p0 (ref), var40 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var64 (ref), safetyService (copy), annotationModalModule (copy), chatModalSelectorDialogControllerModule (copy), modalBasedSelectorDialogControllerModule (copy), var46 (ref), var48 (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var65 (ref), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
		p0.registerOnReportTabDisplayed(function() --[[ line: 166 ]]
			-- upvalues: var40 (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var64 (copy), safetyService (copy)
			var40(true)
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() and var64.screenshotContentId ~= "" then
				safetyService:ReportMenuTabOpen()
			end
		end)
		p0.registerOnReportTabHidden(function() --[[ line: 175 ]]
			-- upvalues: var40 (copy), annotationModalModule (copy), chatModalSelectorDialogControllerModule (copy), modalBasedSelectorDialogControllerModule (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), safetyService (copy)
			var40(false)
			annotationModalModule.unmountAnnotationPage()
			chatModalSelectorDialogControllerModule.unmountModalSelector()
			modalBasedSelectorDialogControllerModule.unmountModalSelector()
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() then
				safetyService:ReportMenuTabClose()
			end
		end)
		p0.registerSetNextPlayerToReport(function(p1) --[[ line: 185 ]]
			-- upvalues: var46 (copy)
			var46(p1)
		end)
		p0.registerOnMenuWidthChange(function(p2) --[[ line: 188 ]]
			-- upvalues: var48 (copy)
			var48(p2)
		end)
		p0.registerOnSettingsHidden(function() --[[ line: 191 ]]
			-- upvalues: abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var65 (copy), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
			if abuseReportTabClearCapturedScreenshotOnCloseFix then
				setTimeout(function() --[[ line: 198 ]]
					-- upvalues: reportAbuseAnalyticsModule (copy), var65 (copy), constantsModule (copy)
					if reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
						var65({ type = constantsModule.ReportAnythingActions.ClearAll })
						
						return
					end
				end, fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
				
				return
			elseif reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
				var65({ type = constantsModule.ReportAnythingActions.ClearAll })
			end
		end)
	end, { var64 })
	reactModule.useEffect(function() --[[ line: 216 ]]
		-- upvalues: var39 (ref), var44 (ref), var42 (ref), var52 (ref), playersService (copy), var50 (ref)
		if not var39 then
			var44(0)
			var42(1)
			var52(false)
			
			return
		elseif #playersService:GetPlayers() <= 1 then
			var50(true)
			var44(2)
			
			return
		end
		var44(1)
		var50(false)
	end, { var39 })
	reactModule.useEffect(function() --[[ line: 236 ]]
		-- upvalues: var39 (ref), var61 (ref), constantsModule (copy), reportAbuseAnalyticsModule (copy), isShowSelectInSceneReportMenuModule (copy), IXPService (copy), fStringReportMenuIXPLayer (copy), fStringSelectInSceneIXPField (copy), var52 (ref), var58 (ref)
		local ok
		if var39 then
			var61({
				type = constantsModule.AnalyticsActions.SetMenuOpenedTimestamp,
				timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
			})
			reportAbuseAnalyticsModule:startAbuseReportSession("ReportPage")
			
			if isShowSelectInSceneReportMenuModule(var61) then
				local var83
				ok, status = pcall(function() --[[ line: 104 ]]
					-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
					return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
				end)
				
				if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
					IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
					var83 = status[fStringSelectInSceneIXPField]
				else
					var83 = false
				end
				if var83 then
					var52(true)
				end
			end
		end
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			ok = currentCamera.ViewportSize
			var58({ width = ok.X, height = ok.Y })
			var61({
				type = constantsModule.AnalyticsActions.SetViewportInformation,
				viewportSizeX = ok.X,
				viewportSizeY = ok.Y
			})
		end
	end, { var39, var47 })
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function() --[[ line: 270 ]]
			-- upvalues: var39 (ref), p0 (ref), guiService (copy), var54 (ref)
			if not var39 then return end
			local function _() --[[ line: 275 | named "isMenuSelected" ]]
				-- upvalues: p0 (copy), guiService (copy)
				local getSettingsHubRef = p0.getSettingsHubRef
				local var87 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var87 and var87.MenuContainer
				
				return guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))
			end
			
			local getSettingsHubRef = p0.getSettingsHubRef
			local var84 = getSettingsHubRef and getSettingsHubRef()
			local menuContainer = var84 and var84.MenuContainer
			var54(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			local var86 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 286 ]]
				-- upvalues: var54 (copy), p0 (copy), guiService (copy)
				local getSettingsHubRef = p0.getSettingsHubRef
				local var89 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var89 and var89.MenuContainer
				var54(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			end)
			
			return function() --[[ line: 290 ]]
				-- upvalues: var86 (ref)
				var86:Disconnect()
			end
		end, { var39, p0.getSettingsHubRef })
	end
	if fFlagIEMTabFocusNav then
		reactModule.useEffect(function() --[[ line: 298 ]]
			-- upvalues: var39 (ref), var55 (ref), p0 (ref)
			if not var39 then return end
			local var91 = if var55.current and var55.current.tabRefs then {
				var55.current.tabRefs[1].current:FindFirstChild("Tab"),
				var55.current.tabRefs[2].current:FindFirstChild("Tab")
			} else nil
			
			if p0.setFirstSelectableObjects and var91 then
				p0.setFirstSelectableObjects(var91)
			end
		end, { var39, var55, p0.setFirstSelectableObjects, var51 })
	end
	if not var39 then
		return nil
	end
	local var69 = nil
	local t = {
		onReportComplete = p0.onReportComplete,
		onDropdownMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule then p0.onDropdownMenuOpenChange else nil,
		reportAnythingAnalytics = reportAnythingAnalyticsModule,
		reportAnythingState = var64,
		reportAnythingDispatch = var65,
		hideReportTab = p0.hideReportTab,
		isReportTabVisible = var39,
		showReportSentPage = p0.showReportSentPage,
		analyticsState = var60,
		analyticsDispatch = var61,
		preselectedPlayer = var45,
		setPreselectedPlayer = var46,
		menuWidth = var47,
		viewportDimension = var57,
		setLastSelectableObjects = if fFlagReportFocusNavIEMButtonsModule then p0.setLastSelectableObjects else nil
	}
	
	if var63 == reportTypes.Person then
		var69 = reactModule.createElement(reportPersonMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var59 })
	elseif var63 == reportTypes.Experience then
		var69 = reactModule.createElement(reportExperienceMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var59 })
	end
	local var82
	local createElement = reactModule.createElement
	local var71 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		ref = var56,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, var66.TopPadding)
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView,
		frameProps = {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		},
		isIsolated = if IEMReportScrollingFix then nil else true,
		isAutoFocusRoot = if fFlagReportFocusNavIEMButtonsModule then var53 else true,
		shouldRestoreFocus = if fFlagReportFocusNavIEMButtonsModule then false else true
	}
	local t_4 = {}
	local abuseReportMenuPlaceholderFrame = constantsModule.AbuseReportMenuPlaceholderFrame
	local createElement_2 = reactModule.createElement
	local var76 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local var79 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_8 = {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = 0,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var66.ItemPadding),
			PaddingBottom = UDim.new(0, var66.ItemPadding)
		}),
		SelectInSceneToggleFrame = if var51 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			SelectInSceneToggle = reactModule.createElement(segmentedControl, {
				onTabActivated = function(p3) --[[ line: 402 ]]
					-- upvalues: var42 (ref)
					var42(p3)
				end,
				selectedTabIndex = var41,
				tabs = {
					{ tabName = var68.BuildAReport },
					{ tabName = var68.SelectInScene }
				},
				width = UDim.new(0, var47),
				ref = if fFlagIEMTabFocusNav then var55 else nil
			})
		}) else nil
	}
	
	if var62 == reportModes.SelectInScene then
		var82 = reactModule.createElement(selectInSceneReportMenuModule, {
			hideReportTab = p0.hideReportTab,
			variant = if fFlagHighlightModePreciseSelectionEnabled then getHighlightModeVariant() else nil
		})
	elseif var62 == reportModes.Classic then
		var82 = reactModule.createElement
		var82 = var82("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var66.ItemPadding)
			}),
			ReportTypeSelector = reactModule.createElement(reportTypeSelectorModule, {
				layoutOrder = 0,
				label = var68.ReportType,
				abuseType = var68[list_1[var43]],
				utilityProps = t,
				isSelectionDisabled = var49,
				menuWidth = var47,
				isSmallPortraitViewport = var59,
				onClickLeft = function() --[[ line: 445 ]]
					-- upvalues: var65 (ref), constantsModule (copy), var61 (ref), var44 (ref), var43 (ref), list_1 (copy)
					var65({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var61({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var44((var43 - 1 - 1) % #list_1 + 1)
				end,
				onClickRight = function() --[[ line: 455 ]]
					-- upvalues: var65 (ref), constantsModule (copy), var61 (ref), var44 (ref), var43 (ref), list_1 (copy)
					var65({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var61({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var44((var43 - 1 + 1) % #list_1 + 1)
				end
			}),
			MenuItemsContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, { MenuItems = var69 }),
			FooterFrame = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				TextFrame = reactModule.createElement(view, {
					tag = "size-full col align-x-left gap-small padding-top-medium"
				}, {
					Divider = reactModule.createElement(view, {
						tag = "size-full-0 stroke-muted padding-top-medium",
						LayoutOrder = 1
					}),
					InfoText = reactModule.createElement(text, {
						TextWrapped = true,
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if isShowUKOSAIllegalContentReportingLink() then var68.FooterInformation2 else var68.FooterInformation1,
						fontStyle = var67.Typography.BodySmall,
						textStyle = var67.Color.Content.Muted,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			}),
			DSALinkFrame = if fFlagMigrateAllOsaMessagingToCentralService or not isShowEUDSAIllegalContentReportingLink() then nil else reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, { DSALink = reactModule.createElement(DSAReportLink) }),
			OSALinkFrame = if fFlagMigrateAllOsaMessagingToCentralService or not isShowUKOSAIllegalContentReportingLink() then nil else reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 3 }, { OSALink = reactModule.createElement(OSAReportLink) }),
			GenericIllegalContentReportLink = if fFlagMigrateAllOsaMessagingToCentralService and isShowGenericIllegalContentReportingLink() then reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 3 }, reactModule.createElement(genericReportLink)) else nil,
			TakeItDownReportLink = if fFlagAddTakeItDownReportLinkToSurfaces and getTakeItDownReportLinkVisibility() then reactModule.createElement(takeItDownReportLink, { layoutOrder = 4 }) else nil
		})
	else
		var82 = nil
	end
	t_8.Menu = var82
	t_6.MenuLayoutFrame = createElement_3(var79, t_7, t_8)
	t_4[abuseReportMenuPlaceholderFrame] = createElement_2(var76, t_5, t_6)
	t_2.FocusNavigationCoreScriptsWrapper = createElement_1(focusRoot, t_3, t_4)
	
	return createElement(var71, t_1, t_2)
end

return function(p4) --[[ line: 539 ]]
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), constantsModule (ref), var38 (ref)
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			[constantsModule.AbuseReportMenuRootName] = reactModule.createElement(var38, p4)
		})
	})
end