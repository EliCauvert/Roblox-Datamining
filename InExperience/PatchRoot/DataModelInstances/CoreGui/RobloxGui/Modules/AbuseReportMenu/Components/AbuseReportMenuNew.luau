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

local function _() --[[ line: 101 | named "isInSelectInSceneExperiment" ]]
	-- upvalues: IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref)
	local ok, status = pcall(function() --[[ line: 103 ]]
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
		
		return status[fStringSelectInSceneIXPField]
	end
	return false
end

local function isInWHAM1707Experiment() --[[ line: 115 ]]
	-- upvalues: getFFlagWHAM1707ExperimentForceEnabledModule (ref), IXPService (ref), fStringEARReportMenuIXPLayer (ref), fStringWHAM1707IXPFieldModule (ref)
	if getFFlagWHAM1707ExperimentForceEnabledModule() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 121 ]]
		-- upvalues: IXPService (copy), fStringEARReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringEARReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringWHAM1707IXPFieldModule] ~= nil then
		IXPService:LogUserLayerExposure(fStringEARReportMenuIXPLayer)
		
		return status[fStringWHAM1707IXPFieldModule]
	end
	return false
end

local var37 = function(p0) --[[ line: 133 ]]
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), list (ref), list_1 (ref), createCleanupModule (ref), useReportAnythingWithScreenshotModule (ref), getMenuItemSizingsModule (ref), useTokens (ref), useLocalization (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707Experiment (ref), safetyService (ref), annotationModalModule (ref), modalBasedSelectorDialogControllerModule (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (ref), setTimeout (ref), reportAbuseAnalyticsModule (ref), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (ref), playersService (ref), isShowSelectInSceneReportMenuModule (ref), IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref), fFlagReportFocusNavIEMButtonsModule (ref), guiService (ref), fFlagIEMTabFocusNav (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reportAnythingAnalyticsModule (ref), reportTypes (ref), reportPersonMenuItemsContainerModule (ref), reportExperienceMenuItemsContainerModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), IEMReportScrollingFix (ref), segmentedControl (ref), reportModes (ref), selectInSceneReportMenuModule (ref), fFlagHighlightModePreciseSelectionEnabled (ref), getHighlightModeVariant (ref), reportTypeSelectorModule (ref), view (ref), text (ref), isShowUKOSAIllegalContentReportingLink (ref), fFlagMigrateAllOsaMessagingToCentralService (ref), isShowEUDSAIllegalContentReportingLink (ref), DSAReportLink (ref), OSAReportLink (ref), isShowGenericIllegalContentReportingLink (ref), genericReportLink (ref), fFlagAddTakeItDownReportLinkToSurfaces (ref), getTakeItDownReportLinkVisibility (ref), takeItDownReportLink (ref)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(1)
	local var42, var43 = reactModule.useState(1)
	local var44, var45 = reactModule.useState(nil)
	local var46, var47 = reactModule.useState(0)
	local var48, var49 = reactModule.useState(false)
	local var50, var51 = reactModule.useState(false)
	local var52, var53 = reactModule.useState(true)
	local var54 = reactModule.useRef(nil)
	local var55 = reactModule.useRef(nil)
	local var56, var57 = reactModule.useState({ width = 0, height = 0 })
	local var58 = var56.width < var56.height and var56.width < 700
	local var59, var60 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var61 = list[var40]
	local var62 = list_1[var42]
	local var63, var64 = useReportAnythingWithScreenshotModule(var38, p0.hideReportTab, p0.showReportTab, reactModule.useCallback(createCleanupModule(var59, var60, var45, var62), { var59, var42 }))
	local var65 = getMenuItemSizingsModule()
	local var66 = useTokens()
	local var67 = useLocalization(constantsModule.localizationKeys)
	reactModule.useEffect(function() --[[ line: 164 ]]
		-- upvalues: p0 (ref), var39 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var63 (ref), safetyService (copy), annotationModalModule (copy), modalBasedSelectorDialogControllerModule (copy), var45 (ref), var47 (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var64 (ref), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
		p0.registerOnReportTabDisplayed(function() --[[ line: 165 ]]
			-- upvalues: var39 (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var63 (copy), safetyService (copy)
			var39(true)
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() and var63.screenshotContentId ~= "" then
				safetyService:ReportMenuTabOpen()
			end
		end)
		p0.registerOnReportTabHidden(function() --[[ line: 174 ]]
			-- upvalues: var39 (copy), annotationModalModule (copy), modalBasedSelectorDialogControllerModule (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), safetyService (copy)
			var39(false)
			annotationModalModule.unmountAnnotationPage()
			modalBasedSelectorDialogControllerModule.unmountModalSelector()
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() then
				safetyService:ReportMenuTabClose()
			end
		end)
		p0.registerSetNextPlayerToReport(function(p1) --[[ line: 183 ]]
			-- upvalues: var45 (copy)
			var45(p1)
		end)
		p0.registerOnMenuWidthChange(function(p2) --[[ line: 186 ]]
			-- upvalues: var47 (copy)
			var47(p2)
		end)
		p0.registerOnSettingsHidden(function() --[[ line: 189 ]]
			-- upvalues: abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var64 (copy), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
			if abuseReportTabClearCapturedScreenshotOnCloseFix then
				setTimeout(function() --[[ line: 196 ]]
					-- upvalues: reportAbuseAnalyticsModule (copy), var64 (copy), constantsModule (copy)
					if reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
						var64({ type = constantsModule.ReportAnythingActions.ClearAll })
						
						return
					end
				end, fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
				
				return
			elseif reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
				var64({ type = constantsModule.ReportAnythingActions.ClearAll })
			end
		end)
	end, { var63 })
	reactModule.useEffect(function() --[[ line: 214 ]]
		-- upvalues: var38 (ref), var43 (ref), var41 (ref), var51 (ref), playersService (copy), var49 (ref)
		if not var38 then
			var43(0)
			var41(1)
			var51(false)
			
			return
		elseif #playersService:GetPlayers() <= 1 then
			var49(true)
			var43(2)
			
			return
		end
		var43(1)
		var49(false)
	end, { var38 })
	reactModule.useEffect(function() --[[ line: 234 ]]
		-- upvalues: var38 (ref), var60 (ref), constantsModule (copy), reportAbuseAnalyticsModule (copy), isShowSelectInSceneReportMenuModule (copy), IXPService (copy), fStringReportMenuIXPLayer (copy), fStringSelectInSceneIXPField (copy), var51 (ref), var57 (ref)
		local ok
		if var38 then
			var60({
				type = constantsModule.AnalyticsActions.SetMenuOpenedTimestamp,
				timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
			})
			reportAbuseAnalyticsModule:startAbuseReportSession("ReportPage")
			
			if isShowSelectInSceneReportMenuModule(var60) then
				local var82
				ok, status = pcall(function() --[[ line: 103 ]]
					-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
					return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
				end)
				
				if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
					IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
					var82 = status[fStringSelectInSceneIXPField]
				else
					var82 = false
				end
				if var82 then
					var51(true)
				end
			end
		end
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			ok = currentCamera.ViewportSize
			var57({ width = ok.X, height = ok.Y })
			var60({
				type = constantsModule.AnalyticsActions.SetViewportInformation,
				viewportSizeX = ok.X,
				viewportSizeY = ok.Y
			})
		end
	end, { var38, var46 })
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function() --[[ line: 268 ]]
			-- upvalues: var38 (ref), p0 (ref), guiService (copy), var53 (ref)
			if not var38 then return end
			local function _() --[[ line: 273 | named "isMenuSelected" ]]
				-- upvalues: p0 (copy), guiService (copy)
				local getSettingsHubRef = p0.getSettingsHubRef
				local var86 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var86 and var86.MenuContainer
				
				return guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))
			end
			
			local getSettingsHubRef = p0.getSettingsHubRef
			local var83 = getSettingsHubRef and getSettingsHubRef()
			local menuContainer = var83 and var83.MenuContainer
			var53(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			local var85 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 284 ]]
				-- upvalues: var53 (copy), p0 (copy), guiService (copy)
				local getSettingsHubRef = p0.getSettingsHubRef
				local var88 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var88 and var88.MenuContainer
				var53(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			end)
			
			return function() --[[ line: 288 ]]
				-- upvalues: var85 (ref)
				var85:Disconnect()
			end
		end, { var38, p0.getSettingsHubRef })
	end
	if fFlagIEMTabFocusNav then
		reactModule.useEffect(function() --[[ line: 296 ]]
			-- upvalues: var38 (ref), var54 (ref), p0 (ref)
			if not var38 then return end
			local var90 = if var54.current and var54.current.tabRefs then {
				var54.current.tabRefs[1].current:FindFirstChild("Tab"),
				var54.current.tabRefs[2].current:FindFirstChild("Tab")
			} else nil
			
			if p0.setFirstSelectableObjects and var90 then
				p0.setFirstSelectableObjects(var90)
			end
		end, { var38, var54, p0.setFirstSelectableObjects, var50 })
	end
	if not var38 then
		return nil
	end
	local var68 = nil
	local t = {
		onReportComplete = p0.onReportComplete,
		onDropdownMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule then p0.onDropdownMenuOpenChange else nil,
		reportAnythingAnalytics = reportAnythingAnalyticsModule,
		reportAnythingState = var63,
		reportAnythingDispatch = var64,
		hideReportTab = p0.hideReportTab,
		isReportTabVisible = var38,
		showReportSentPage = p0.showReportSentPage,
		analyticsState = var59,
		analyticsDispatch = var60,
		preselectedPlayer = var44,
		setPreselectedPlayer = var45,
		menuWidth = var46,
		viewportDimension = var56,
		setLastSelectableObjects = if fFlagReportFocusNavIEMButtonsModule then p0.setLastSelectableObjects else nil
	}
	
	if var62 == reportTypes.Person then
		var68 = reactModule.createElement(reportPersonMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var58 })
	elseif var62 == reportTypes.Experience then
		var68 = reactModule.createElement(reportExperienceMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var58 })
	end
	local var81
	local createElement = reactModule.createElement
	local var70 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		ref = var55,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, var65.TopPadding)
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
		isAutoFocusRoot = if fFlagReportFocusNavIEMButtonsModule then var52 else true,
		shouldRestoreFocus = if fFlagReportFocusNavIEMButtonsModule then false else true
	}
	local t_4 = {}
	local abuseReportMenuPlaceholderFrame = constantsModule.AbuseReportMenuPlaceholderFrame
	local createElement_2 = reactModule.createElement
	local var75 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local var78 = "Frame"
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
			PaddingTop = UDim.new(0, var65.ItemPadding),
			PaddingBottom = UDim.new(0, var65.ItemPadding)
		}),
		SelectInSceneToggleFrame = if var50 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			SelectInSceneToggle = reactModule.createElement(segmentedControl, {
				onTabActivated = function(p3) --[[ line: 400 ]]
					-- upvalues: var41 (ref)
					var41(p3)
				end,
				selectedTabIndex = var40,
				tabs = {
					{ tabName = var67.BuildAReport },
					{ tabName = var67.SelectInScene }
				},
				width = UDim.new(0, var46),
				ref = if fFlagIEMTabFocusNav then var54 else nil
			})
		}) else nil
	}
	
	if var61 == reportModes.SelectInScene then
		var81 = reactModule.createElement(selectInSceneReportMenuModule, {
			hideReportTab = p0.hideReportTab,
			variant = if fFlagHighlightModePreciseSelectionEnabled then getHighlightModeVariant() else nil
		})
	elseif var61 == reportModes.Classic then
		var81 = reactModule.createElement
		var81 = var81("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var65.ItemPadding)
			}),
			ReportTypeSelector = reactModule.createElement(reportTypeSelectorModule, {
				layoutOrder = 0,
				label = var67.ReportType,
				abuseType = var67[list_1[var42]],
				utilityProps = t,
				isSelectionDisabled = var48,
				menuWidth = var46,
				isSmallPortraitViewport = var58,
				onClickLeft = function() --[[ line: 443 ]]
					-- upvalues: var64 (ref), constantsModule (copy), var60 (ref), var43 (ref), var42 (ref), list_1 (copy)
					var64({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var60({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var43((var42 - 1 - 1) % #list_1 + 1)
				end,
				onClickRight = function() --[[ line: 453 ]]
					-- upvalues: var64 (ref), constantsModule (copy), var60 (ref), var43 (ref), var42 (ref), list_1 (copy)
					var64({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var60({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var43((var42 - 1 + 1) % #list_1 + 1)
				end
			}),
			MenuItemsContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, { MenuItems = var68 }),
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
						Text = if isShowUKOSAIllegalContentReportingLink() then var67.FooterInformation2 else var67.FooterInformation1,
						fontStyle = var66.Typography.BodySmall,
						textStyle = var66.Color.Content.Muted,
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
		var81 = nil
	end
	t_8.Menu = var81
	t_6.MenuLayoutFrame = createElement_3(var78, t_7, t_8)
	t_4[abuseReportMenuPlaceholderFrame] = createElement_2(var75, t_5, t_6)
	t_2.FocusNavigationCoreScriptsWrapper = createElement_1(focusRoot, t_3, t_4)
	
	return createElement(var70, t_1, t_2)
end

return function(p4) --[[ line: 537 ]]
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), constantsModule (ref), var37 (ref)
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			[constantsModule.AbuseReportMenuRootName] = reactModule.createElement(var37, p4)
		})
	})
end