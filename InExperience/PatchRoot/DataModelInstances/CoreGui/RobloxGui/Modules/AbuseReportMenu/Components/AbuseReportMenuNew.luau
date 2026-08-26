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

local function _()
	-- upvalues: IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref)
	local ok, status = pcall(function()
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
		
		return status[fStringSelectInSceneIXPField]
	end
	return false
end

local function isInWHAM1707Experiment()
	-- upvalues: getFFlagWHAM1707ExperimentForceEnabledModule (ref), IXPService (ref), fStringEARReportMenuIXPLayer (ref), fStringWHAM1707IXPFieldModule (ref)
	if getFFlagWHAM1707ExperimentForceEnabledModule() then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: IXPService (copy), fStringEARReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringEARReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringWHAM1707IXPFieldModule] ~= nil then
		IXPService:LogUserLayerExposure(fStringEARReportMenuIXPLayer)
		
		return status[fStringWHAM1707IXPFieldModule]
	end
	return false
end

local var1 = function(p1)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), list (ref), list_1 (ref), createCleanupModule (ref), useReportAnythingWithScreenshotModule (ref), getMenuItemSizingsModule (ref), useTokens (ref), useLocalization (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707Experiment (ref), safetyService (ref), annotationModalModule (ref), modalBasedSelectorDialogControllerModule (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (ref), setTimeout (ref), reportAbuseAnalyticsModule (ref), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (ref), playersService (ref), isShowSelectInSceneReportMenuModule (ref), IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref), fFlagReportFocusNavIEMButtonsModule (ref), guiService (ref), fFlagIEMTabFocusNav (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reportAnythingAnalyticsModule (ref), reportTypes (ref), reportPersonMenuItemsContainerModule (ref), reportExperienceMenuItemsContainerModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), IEMReportScrollingFix (ref), segmentedControl (ref), reportModes (ref), selectInSceneReportMenuModule (ref), fFlagHighlightModePreciseSelectionEnabled (ref), getHighlightModeVariant (ref), reportTypeSelectorModule (ref), view (ref), text (ref), isShowUKOSAIllegalContentReportingLink (ref), fFlagMigrateAllOsaMessagingToCentralService (ref), isShowEUDSAIllegalContentReportingLink (ref), DSAReportLink (ref), OSAReportLink (ref), isShowGenericIllegalContentReportingLink (ref), genericReportLink (ref), fFlagAddTakeItDownReportLinkToSurfaces (ref), getTakeItDownReportLinkVisibility (ref), takeItDownReportLink (ref)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(1)
	local var6, var7 = reactModule.useState(1)
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(0)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(true)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useState({ width = 0, height = 0 })
	local var22 = var20.width < var20.height and var20.width < 700
	local var23, var24 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var25 = list[var4]
	local var26 = list_1[var6]
	local var27, var28 = useReportAnythingWithScreenshotModule(var2, p1.hideReportTab, p1.showReportTab, reactModule.useCallback(createCleanupModule(var23, var24, var9, var26), { var23, var6 }))
	local var29 = getMenuItemSizingsModule()
	local var30 = useTokens()
	local var31 = useLocalization(constantsModule.localizationKeys)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var27 (ref), safetyService (copy), annotationModalModule (copy), modalBasedSelectorDialogControllerModule (copy), var9 (ref), var11 (ref), abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var28 (ref), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
		p1.registerOnReportTabDisplayed(function()
			-- upvalues: var3 (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), var27 (copy), safetyService (copy)
			var3(true)
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() and var27.screenshotContentId ~= "" then
				safetyService:ReportMenuTabOpen()
			end
		end)
		p1.registerOnReportTabHidden(function()
			-- upvalues: var3 (copy), annotationModalModule (copy), modalBasedSelectorDialogControllerModule (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707Experiment (copy), safetyService (copy)
			var3(false)
			annotationModalModule.unmountAnnotationPage()
			modalBasedSelectorDialogControllerModule.unmountModalSelector()
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707Experiment() then
				safetyService:ReportMenuTabClose()
			end
		end)
		p1.registerSetNextPlayerToReport(function(p2)
			-- upvalues: var9 (copy)
			var9(p2)
		end)
		p1.registerOnMenuWidthChange(function(p2)
			-- upvalues: var11 (copy)
			var11(p2)
		end)
		p1.registerOnSettingsHidden(function()
			-- upvalues: abuseReportTabClearCapturedScreenshotOnCloseFix (copy), setTimeout (copy), reportAbuseAnalyticsModule (copy), var28 (copy), constantsModule (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
			if abuseReportTabClearCapturedScreenshotOnCloseFix then
				setTimeout(function()
					-- upvalues: reportAbuseAnalyticsModule (copy), var28 (copy), constantsModule (copy)
					if reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
						var28({ type = constantsModule.ReportAnythingActions.ClearAll })
						
						return
					end
				end, fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
				
				return
			elseif reportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
				var28({ type = constantsModule.ReportAnythingActions.ClearAll })
			end
		end)
	end, { var27 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref), var5 (ref), var15 (ref), playersService (copy), var13 (ref)
		if not var2 then
			var7(0)
			var5(1)
			var15(false)
			
			return
		elseif #playersService:GetPlayers() <= 1 then
			var13(true)
			var7(2)
			
			return
		end
		var7(1)
		var13(false)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var24 (ref), constantsModule (copy), reportAbuseAnalyticsModule (copy), isShowSelectInSceneReportMenuModule (copy), IXPService (copy), fStringReportMenuIXPLayer (copy), fStringSelectInSceneIXPField (copy), var15 (ref), var21 (ref)
		local ok
		if var2 then
			var24({
				type = constantsModule.AnalyticsActions.SetMenuOpenedTimestamp,
				timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
			})
			reportAbuseAnalyticsModule:startAbuseReportSession("ReportPage")
			
			if isShowSelectInSceneReportMenuModule(var24) then
				local var32
				ok, status = pcall(function()
					-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
					return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
				end)
				
				if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
					IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
					var32 = status[fStringSelectInSceneIXPField]
				else
					var32 = false
				end
				if var32 then
					var15(true)
				end
			end
		end
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			ok = currentCamera.ViewportSize
			var21({ width = ok.X, height = ok.Y })
			var24({
				type = constantsModule.AnalyticsActions.SetViewportInformation,
				viewportSizeX = ok.X,
				viewportSizeY = ok.Y
			})
		end
	end, { var2, var10 })
	
	if fFlagReportFocusNavIEMButtonsModule then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), p1 (ref), guiService (copy), var17 (ref)
			if not var2 then return end
			local function _()
				-- upvalues: p1 (copy), guiService (copy)
				local getSettingsHubRef = p1.getSettingsHubRef
				local var32 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var32 and var32.MenuContainer
				
				return guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))
			end
			
			local getSettingsHubRef = p1.getSettingsHubRef
			local var32 = getSettingsHubRef and getSettingsHubRef()
			local menuContainer = var32 and var32.MenuContainer
			var17(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			local var33 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: var17 (copy), p1 (copy), guiService (copy)
				local getSettingsHubRef = p1.getSettingsHubRef
				local var34 = getSettingsHubRef and getSettingsHubRef()
				local menuContainer = var34 and var34.MenuContainer
				var17(not (guiService.SelectedCoreObject ~= nil and (menuContainer ~= nil and guiService.SelectedCoreObject:IsDescendantOf(menuContainer))))
			end)
			
			return function()
				-- upvalues: var33 (ref)
				var33:Disconnect()
			end
		end, { var2, p1.getSettingsHubRef })
	end
	if fFlagIEMTabFocusNav then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var18 (ref), p1 (ref)
			if not var2 then return end
			local var32 = if var18.current and var18.current.tabRefs then {
				var18.current.tabRefs[1].current:FindFirstChild("Tab"),
				var18.current.tabRefs[2].current:FindFirstChild("Tab")
			} else nil
			
			if p1.setFirstSelectableObjects and var32 then
				p1.setFirstSelectableObjects(var32)
			end
		end, { var2, var18, p1.setFirstSelectableObjects, var14 })
	end
	if not var2 then
		return nil
	end
	local var32 = nil
	local t = {
		onReportComplete = p1.onReportComplete,
		onDropdownMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule then p1.onDropdownMenuOpenChange else nil,
		reportAnythingAnalytics = reportAnythingAnalyticsModule,
		reportAnythingState = var27,
		reportAnythingDispatch = var28,
		hideReportTab = p1.hideReportTab,
		isReportTabVisible = var2,
		showReportSentPage = p1.showReportSentPage,
		analyticsState = var23,
		analyticsDispatch = var24,
		preselectedPlayer = var8,
		setPreselectedPlayer = var9,
		menuWidth = var10,
		viewportDimension = var20,
		setLastSelectableObjects = if fFlagReportFocusNavIEMButtonsModule then p1.setLastSelectableObjects else nil
	}
	
	if var26 == reportTypes.Person then
		var32 = reactModule.createElement(reportPersonMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var22 })
	elseif var26 == reportTypes.Experience then
		var32 = reactModule.createElement(reportExperienceMenuItemsContainerModule, { utilityProps = t, isSmallPortraitViewport = var22 })
	end
	local var33
	local createElement = reactModule.createElement
	local var34 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		ref = var19,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, var29.TopPadding)
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
		isAutoFocusRoot = if fFlagReportFocusNavIEMButtonsModule then var16 else true,
		shouldRestoreFocus = if fFlagReportFocusNavIEMButtonsModule then false else true
	}
	local t_4 = {}
	local abuseReportMenuPlaceholderFrame = constantsModule.AbuseReportMenuPlaceholderFrame
	local createElement_2 = reactModule.createElement
	local var35 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_6 = {}
	local createElement_3 = reactModule.createElement
	local var36 = "Frame"
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
			PaddingTop = UDim.new(0, var29.ItemPadding),
			PaddingBottom = UDim.new(0, var29.ItemPadding)
		}),
		SelectInSceneToggleFrame = if var14 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			SelectInSceneToggle = reactModule.createElement(segmentedControl, {
				onTabActivated = function(p2)
					-- upvalues: var5 (ref)
					var5(p2)
				end,
				selectedTabIndex = var4,
				tabs = {
					{ tabName = var31.BuildAReport },
					{ tabName = var31.SelectInScene }
				},
				width = UDim.new(0, var10),
				ref = if fFlagIEMTabFocusNav then var18 else nil
			})
		}) else nil
	}
	
	if var25 == reportModes.SelectInScene then
		var33 = reactModule.createElement(selectInSceneReportMenuModule, {
			hideReportTab = p1.hideReportTab,
			variant = if fFlagHighlightModePreciseSelectionEnabled then getHighlightModeVariant() else nil
		})
	elseif var25 == reportModes.Classic then
		var33 = reactModule.createElement
		var33 = var33("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var29.ItemPadding)
			}),
			ReportTypeSelector = reactModule.createElement(reportTypeSelectorModule, {
				layoutOrder = 0,
				label = var31.ReportType,
				abuseType = var31[list_1[var6]],
				utilityProps = t,
				isSelectionDisabled = var12,
				menuWidth = var10,
				isSmallPortraitViewport = var22,
				onClickLeft = function()
					-- upvalues: var28 (ref), constantsModule (copy), var24 (ref), var7 (ref), var6 (ref), list_1 (copy)
					var28({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var24({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var7((var6 - 1 - 1) % #list_1 + 1)
				end,
				onClickRight = function()
					-- upvalues: var28 (ref), constantsModule (copy), var24 (ref), var7 (ref), var6 (ref), list_1 (copy)
					var28({
						type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
					})
					var24({
						type = constantsModule.AnalyticsActions.IncrementExperiencePersonChanged
					})
					var7((var6 - 1 + 1) % #list_1 + 1)
				end
			}),
			MenuItemsContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, { MenuItems = var32 }),
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
						Text = if isShowUKOSAIllegalContentReportingLink() then var31.FooterInformation2 else var31.FooterInformation1,
						fontStyle = var30.Typography.BodySmall,
						textStyle = var30.Color.Content.Muted,
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
		var33 = nil
	end
	t_8.Menu = var33
	t_6.MenuLayoutFrame = createElement_3(var36, t_7, t_8)
	t_4[abuseReportMenuPlaceholderFrame] = createElement_2(var35, t_5, t_6)
	t_2.FocusNavigationCoreScriptsWrapper = createElement_1(focusRoot, t_3, t_4)
	
	return createElement(var34, t_1, t_2)
end

return function(p1)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), constantsModule (ref), var1 (ref)
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			[constantsModule.AbuseReportMenuRootName] = reactModule.createElement(var1, p1)
		})
	})
end