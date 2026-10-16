local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local SafetyService = game:GetService("SafetyService")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local ReportTypeSelectorModule = require(AbuseReportMenu.Components.ReportTypeSelector)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ReportModes = ConstantsModule.ReportModes
local ReportTypes = ConstantsModule.ReportTypes
local SelectInSceneReportMenuModule = require(AbuseReportMenu.Components.SelectInSceneReportMenu)
local ReportPersonMenuItemsContainerModule = require(AbuseReportMenu.Components.Containers.ReportPersonMenuItemsContainer)
local ReportExperienceMenuItemsContainerModule = require(AbuseReportMenu.Components.Containers.ReportExperienceMenuItemsContainer)
local ReportAnythingAnalyticsModule = require(AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local ReportAbuseAnalyticsModule = require(AbuseReportMenu.Analytics.ReportAbuseAnalytics)
local AnnotationModalModule = require(AbuseReportMenu.ReportAnything.Components.AnnotationModal)
local ModalBasedSelectorDialogControllerModule = require(AbuseReportMenu.Components.ModalBasedSelectorDialogController)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local SetTimeoutFunction = require(CorePackages.Packages.LuauPolyfill).setTimeout
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseReportAnythingWithScreenshotModule = require(AbuseReportMenu.Hooks.useReportAnythingWithScreenshot)
local GetMenuItemSizingsModule = require(AbuseReportMenu.Utility.getMenuItemSizings)
local AnalyticsReducerModule = require(AbuseReportMenu.Reducers.analyticsReducer)
local CreateCleanupModule = require(AbuseReportMenu.Components.createCleanup)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local DsaIllegalContentReportingModule = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting)
local IsShowEUDSAIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowEUDSAIllegalContentReportingLink
local DSAReportLink = DsaIllegalContentReportingModule.DSAReportLink
local IsShowUKOSAIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = DsaIllegalContentReportingModule.OSAReportLink
local IsShowGenericIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink
local GenericReportLink = DsaIllegalContentReportingModule.GenericReportLink
local GetTakeItDownReportLinkVisibilityFunction = DsaIllegalContentReportingModule.getTakeItDownReportLinkVisibility
local TakeItDownReportLink = DsaIllegalContentReportingModule.TakeItDownReportLink
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local IsAbuseReportMenuOpenCloseSignalEnabledModule = require(AbuseReportMenu.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule = require(AbuseReportMenu.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FStringReportMenuIXPLayer = SharedFlagsModule.FStringReportMenuIXPLayer
local FStringSelectInSceneIXPField = SharedFlagsModule.FStringSelectInSceneIXPField
local FFlagHighlightModePreciseSelectionEnabled = SharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local AbuseReportTabClearCapturedScreenshotOnCloseFix = game:DefineFastFlag("AbuseReportTabClearCapturedScreenshotOnCloseFix", false)
local FFlagMigrateAllOsaMessagingToCentralService = require(CorePackages.Workspace.Packages.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService
local IEMReportScrollingFix = game:DefineFastFlag("IEMReportScrollingFix", false)
local FFlagReportFocusNavIEMButtonsModule = require(AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons)
local FFlagIEMTabFocusNav = SharedFlagsModule.FFlagIEMTabFocusNav
local FFlagAddTakeItDownReportLinkToSurfaces = SharedFlagsModule.FFlagAddTakeItDownReportLinkToSurfaces
local IsShowSelectInSceneReportMenuModule = require(AbuseReportMenu.Utility.isShowSelectInSceneReportMenu)
local GetHighlightModeVariantFunction = require(CorePackages.Workspace.Packages.InGameAssetReporting).getHighlightModeVariant
local SegmentedControl = require(CorePackages.Packages.UIBlox).App.Control.SegmentedControl
local list = { ReportModes.Classic, ReportModes.SelectInScene }
local list1 = { ReportTypes.Person, ReportTypes.Experience }

local function _() --[[ Line: 98 | Named "isInSelectInSceneExperiment" ]]
	-- upvalues: IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy)
	local Success, Result = pcall(function() --[[ Line: 100 ]]
		-- upvalues: IXPService (upval), FStringReportMenuIXPLayer (upval)
		return IXPService:GetUserLayerVariables(FStringReportMenuIXPLayer)
	end)
	
	if Success and Result and Result[FStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(FStringReportMenuIXPLayer)
		
		return Result[FStringSelectInSceneIXPField]
	else
		return false
	end
end

local function v55(p1) --[[ Line: 112 ]]
	-- upvalues: ReactModule (copy), AnalyticsReducerModule (copy), ConstantsModule (copy), list (copy), list1 (copy), CreateCleanupModule (copy), UseReportAnythingWithScreenshotModule (copy), GetMenuItemSizingsModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), IsAbuseReportMenuOpenCloseSignalEnabledModule (copy), SafetyService (copy), AnnotationModalModule (copy), ModalBasedSelectorDialogControllerModule (copy), AbuseReportTabClearCapturedScreenshotOnCloseFix (copy), SetTimeoutFunction (copy), ReportAbuseAnalyticsModule (copy), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy), Players (copy), IsShowSelectInSceneReportMenuModule (copy), IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy), FFlagReportFocusNavIEMButtonsModule (copy), GuiService (copy), FFlagIEMTabFocusNav (copy), FFlagHideShortcutsOnReportDropdownModule (copy), ReportAnythingAnalyticsModule (copy), ReportTypes (copy), ReportPersonMenuItemsContainerModule (copy), ReportExperienceMenuItemsContainerModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), IEMReportScrollingFix (copy), SegmentedControl (copy), ReportModes (copy), SelectInSceneReportMenuModule (copy), FFlagHighlightModePreciseSelectionEnabled (copy), GetHighlightModeVariantFunction (copy), ReportTypeSelectorModule (copy), View (copy), Text (copy), IsShowUKOSAIllegalContentReportingLinkFunction (copy), FFlagMigrateAllOsaMessagingToCentralService (copy), IsShowEUDSAIllegalContentReportingLinkFunction (copy), DSAReportLink (copy), OSAReportLink (copy), IsShowGenericIllegalContentReportingLinkFunction (copy), GenericReportLink (copy), FFlagAddTakeItDownReportLinkToSurfaces (copy), GetTakeItDownReportLinkVisibilityFunction (copy), TakeItDownReportLink (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(0)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState({ width = 0, height = 0 })
	local IsWidthBelow: boolean = UseStateResult9.width < UseStateResult9.height and UseStateResult9.width < 700
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AnalyticsReducerModule, ConstantsModule.AnalyticsInitialState)
	local Entry = list[UseStateResult1]
	local Entry1 = list1[UseStateResult3]
	local UseReportAnythingWithScreenshotModuleResult, UseReportAnythingWithScreenshotModuleResult2 = UseReportAnythingWithScreenshotModule(UseStateResult, p1.hideReportTab, p1.showReportTab, (ReactModule.useCallback(CreateCleanupModule(UseReducerResult, UseReducerResult2, UseStateResult2_3, Entry1), { UseReducerResult, UseStateResult3 })))
	local MenuItemSizingsModule = GetMenuItemSizingsModule()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	ReactModule.useEffect(function() --[[ Line: 143 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), UseReportAnythingWithScreenshotModuleResult (copy), SafetyService (upval), AnnotationModalModule (upval), ModalBasedSelectorDialogControllerModule (upval), UseStateResult2_3 (copy), UseStateResult2_4 (copy), AbuseReportTabClearCapturedScreenshotOnCloseFix (upval), SetTimeoutFunction (upval), ReportAbuseAnalyticsModule (upval), UseReportAnythingWithScreenshotModuleResult2 (copy), ConstantsModule (upval), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (upval)
		p1.registerOnReportTabDisplayed(function() --[[ Line: 144 ]]
			-- upvalues: UseStateResult2 (upval), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), UseReportAnythingWithScreenshotModuleResult (upval), SafetyService (upval)
			UseStateResult2(true)
			
			if IsAbuseReportMenuOpenCloseSignalEnabledModule() and UseReportAnythingWithScreenshotModuleResult.screenshotContentId ~= "" then
				SafetyService:ReportMenuTabOpen()
			end
		end)
		p1.registerOnReportTabHidden(function() --[[ Line: 153 ]]
			-- upvalues: UseStateResult2 (upval), AnnotationModalModule (upval), ModalBasedSelectorDialogControllerModule (upval), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), SafetyService (upval)
			UseStateResult2(false)
			AnnotationModalModule.unmountAnnotationPage()
			ModalBasedSelectorDialogControllerModule.unmountModalSelector()
			
			if IsAbuseReportMenuOpenCloseSignalEnabledModule() then
				SafetyService:ReportMenuTabClose()
			end
		end)
		p1.registerSetNextPlayerToReport(function(p2) --[[ Line: 162 ]]
			-- upvalues: UseStateResult2_3 (upval)
			UseStateResult2_3(p2)
		end)
		p1.registerOnMenuWidthChange(function(p2) --[[ Line: 165 ]]
			-- upvalues: UseStateResult2_4 (upval)
			UseStateResult2_4(p2)
		end)
		p1.registerOnSettingsHidden(function() --[[ Line: 168 ]]
			-- upvalues: AbuseReportTabClearCapturedScreenshotOnCloseFix (upval), SetTimeoutFunction (upval), ReportAbuseAnalyticsModule (upval), UseReportAnythingWithScreenshotModuleResult2 (upval), ConstantsModule (upval), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (upval)
			if AbuseReportTabClearCapturedScreenshotOnCloseFix then
				SetTimeoutFunction(function() --[[ Line: 175 ]]
					-- upvalues: ReportAbuseAnalyticsModule (upval), UseReportAnythingWithScreenshotModuleResult2 (upval), ConstantsModule (upval)
					if ReportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
						UseReportAnythingWithScreenshotModuleResult2({ type = ConstantsModule.ReportAnythingActions.ClearAll })
						
						return
					end
				end, FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
				
				return
			end
			if ReportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() == "" then
				UseReportAnythingWithScreenshotModuleResult2({ type = ConstantsModule.ReportAnythingActions.ClearAll })
			end
		end)
	end, { UseReportAnythingWithScreenshotModuleResult })
	ReactModule.useEffect(function() --[[ Line: 193 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseStateResult2_6 (copy), Players (upval), UseStateResult2_5 (copy)
		if not UseStateResult then
			UseStateResult2_2(0)
			UseStateResult2_1(1)
			UseStateResult2_6(false)
			
			return
		end
		if #Players:GetPlayers() <= 1 then
			UseStateResult2_5(true)
			UseStateResult2_2(2)
			
			return
		else
			UseStateResult2_2(1)
			UseStateResult2_5(false)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 213 ]]
		-- upvalues: UseStateResult (copy), UseReducerResult2 (copy), ConstantsModule (upval), ReportAbuseAnalyticsModule (upval), IsShowSelectInSceneReportMenuModule (upval), IXPService (upval), FStringReportMenuIXPLayer (upval), FStringSelectInSceneIXPField (upval), UseStateResult2_6 (copy), UseStateResult2_8 (copy)
		if UseStateResult then
			UseReducerResult2({
				type = ConstantsModule.AnalyticsActions.SetMenuOpenedTimestamp,
				timestamp = math.floor(workspace:GetServerTimeNow() * 1000)
			})
			ReportAbuseAnalyticsModule:startAbuseReportSession("ReportPage")
			
			if IsShowSelectInSceneReportMenuModule(UseReducerResult2) then
				local Success, Result = pcall(function() --[[ Line: 100 ]]
					-- upvalues: IXPService (upval), FStringReportMenuIXPLayer (upval)
					return IXPService:GetUserLayerVariables(FStringReportMenuIXPLayer)
				end)
				local v1 = nil
				
				if Success and Result and Result[FStringSelectInSceneIXPField] ~= nil then
					IXPService:LogUserLayerExposure(FStringReportMenuIXPLayer)
					v1 = Result[FStringSelectInSceneIXPField]
				else
					v1 = false
				end
				if v1 then
					UseStateResult2_6(true)
				end
			end
		end
		local CurrentCamera = game.Workspace.CurrentCamera
		
		if CurrentCamera ~= nil then
			local ViewportSize = CurrentCamera.ViewportSize
			UseStateResult2_8({ width = ViewportSize.X, height = ViewportSize.Y })
			UseReducerResult2({
				type = ConstantsModule.AnalyticsActions.SetViewportInformation,
				viewportSizeX = ViewportSize.X,
				viewportSizeY = ViewportSize.Y
			})
		end
	end, { UseStateResult, UseStateResult5 })
	
	if FFlagReportFocusNavIEMButtonsModule then
		ReactModule.useEffect(function() --[[ Line: 247 ]]
			-- upvalues: UseStateResult (copy), p1 (copy), GuiService (upval), UseStateResult2_7 (copy)
			if not UseStateResult then return end
			local function _() --[[ Line: 252 | Named "isMenuSelected" ]]
				-- upvalues: p1 (upval), GuiService (upval)
				local GetSettingsHubRefFunction = p1.getSettingsHubRef
				local SettingsHubRef = GetSettingsHubRefFunction and GetSettingsHubRefFunction()
				local MenuContainer = SettingsHubRef and SettingsHubRef.MenuContainer
				
				return GuiService.SelectedCoreObject ~= nil and (MenuContainer ~= nil and GuiService.SelectedCoreObject:IsDescendantOf(MenuContainer))
			end
			
			local GetSettingsHubRefFunction = p1.getSettingsHubRef
			local SettingsHubRef = GetSettingsHubRefFunction and GetSettingsHubRefFunction()
			local MenuContainer = SettingsHubRef and SettingsHubRef.MenuContainer
			UseStateResult2_7(not (GuiService.SelectedCoreObject ~= nil and (MenuContainer ~= nil and GuiService.SelectedCoreObject:IsDescendantOf(MenuContainer))))
			local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 263 ]]
				-- upvalues: UseStateResult2_7 (upval), p1 (upval), GuiService (upval)
				local GetSettingsHubRefFunction = p1.getSettingsHubRef
				local SettingsHubRef = GetSettingsHubRefFunction and GetSettingsHubRefFunction()
				local MenuContainer = SettingsHubRef and SettingsHubRef.MenuContainer
				UseStateResult2_7(not (GuiService.SelectedCoreObject ~= nil and (MenuContainer ~= nil and GuiService.SelectedCoreObject:IsDescendantOf(MenuContainer))))
			end)
			
			return function() --[[ Line: 267 ]]
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { UseStateResult, p1.getSettingsHubRef })
	end
	if FFlagIEMTabFocusNav then
		ReactModule.useEffect(function() --[[ Line: 275 ]]
			-- upvalues: UseStateResult (copy), UseRefResult (copy), p1 (copy)
			if not UseStateResult then return end
			local List = if UseRefResult.current and UseRefResult.current.tabRefs then {
				UseRefResult.current.tabRefs[1].current:FindFirstChild("Tab"),
				UseRefResult.current.tabRefs[2].current:FindFirstChild("Tab")
			} else nil
			
			if p1.setFirstSelectableObjects and List then
				p1.setFirstSelectableObjects(List)
			end
		end, {
			UseStateResult,
			UseRefResult,
			p1.setFirstSelectableObjects,
			UseStateResult7
		})
	end
	if not UseStateResult then
		return nil
	end
	local Element = nil
	local UtilityProps = {
		onReportComplete = p1.onReportComplete,
		onDropdownMenuOpenChange = if FFlagHideShortcutsOnReportDropdownModule then p1.onDropdownMenuOpenChange else nil,
		reportAnythingAnalytics = ReportAnythingAnalyticsModule,
		reportAnythingState = UseReportAnythingWithScreenshotModuleResult,
		reportAnythingDispatch = UseReportAnythingWithScreenshotModuleResult2,
		hideReportTab = p1.hideReportTab,
		isReportTabVisible = UseStateResult,
		showReportSentPage = p1.showReportSentPage,
		analyticsState = UseReducerResult,
		analyticsDispatch = UseReducerResult2,
		preselectedPlayer = UseStateResult4,
		setPreselectedPlayer = UseStateResult2_3,
		menuWidth = UseStateResult5,
		viewportDimension = UseStateResult9,
		setLastSelectableObjects = if FFlagReportFocusNavIEMButtonsModule then p1.setLastSelectableObjects else nil
	}
	
	if Entry1 == ReportTypes.Person then
		Element = ReactModule.createElement(ReportPersonMenuItemsContainerModule, {
			utilityProps = UtilityProps,
			isSmallPortraitViewport = IsWidthBelow
		})
	elseif Entry1 == ReportTypes.Experience then
		Element = ReactModule.createElement(ReportExperienceMenuItemsContainerModule, {
			utilityProps = UtilityProps,
			isSmallPortraitViewport = IsWidthBelow
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseRefResult1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, MenuItemSizingsModule.TopPadding)
	}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView,
			frameProps = {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			},
			isIsolated = not IEMReportScrollingFix or nil,
			isAutoFocusRoot = not FFlagReportFocusNavIEMButtonsModule or UseStateResult8,
			shouldRestoreFocus = not FFlagReportFocusNavIEMButtonsModule
		}, {
			[ConstantsModule.AbuseReportMenuPlaceholderFrame] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1)
			}, {
				MenuLayoutFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = 0,
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					Padding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, MenuItemSizingsModule.ItemPadding),
						PaddingBottom = UDim.new(0, MenuItemSizingsModule.ItemPadding)
					}),
					SelectInSceneToggleFrame = if UseStateResult7 then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						AutomaticSize = Enum.AutomaticSize.XY,
						Position = UDim2.new(0.5, 0, 0, 0),
						AnchorPoint = Vector2.new(0.5, 0)
					}, {
						SelectInSceneToggle = ReactModule.createElement(SegmentedControl, {
							onTabActivated = function(p2) --[[ Line: 379 ]]
								-- upvalues: UseStateResult2_1 (copy)
								UseStateResult2_1(p2)
							end,
							selectedTabIndex = UseStateResult1,
							tabs = {
								{ tabName = UseLocalizationResult.BuildAReport },
								{ tabName = UseLocalizationResult.SelectInScene }
							},
							width = UDim.new(0, UseStateResult5),
							ref = if FFlagIEMTabFocusNav then UseRefResult else nil
						})
					}) else nil,
					Menu = if Entry == ReportModes.SelectInScene then ReactModule.createElement(SelectInSceneReportMenuModule, {
						hideReportTab = p1.hideReportTab,
						variant = if FFlagHighlightModePreciseSelectionEnabled then GetHighlightModeVariantFunction() else nil
					}) elseif Entry == ReportModes.Classic then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, MenuItemSizingsModule.ItemPadding)
						}),
						ReportTypeSelector = ReactModule.createElement(ReportTypeSelectorModule, {
							layoutOrder = 0,
							label = UseLocalizationResult.ReportType,
							abuseType = UseLocalizationResult[list1[UseStateResult3]],
							utilityProps = UtilityProps,
							isSelectionDisabled = UseStateResult6,
							menuWidth = UseStateResult5,
							isSmallPortraitViewport = IsWidthBelow,
							onClickLeft = function() --[[ Line: 422 ]]
								-- upvalues: UseReportAnythingWithScreenshotModuleResult2 (copy), ConstantsModule (upval), UseReducerResult2 (copy), UseStateResult2_2 (copy), UseStateResult3 (copy), list1 (upval)
								UseReportAnythingWithScreenshotModuleResult2({
									type = ConstantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
								})
								UseReducerResult2({
									type = ConstantsModule.AnalyticsActions.IncrementExperiencePersonChanged
								})
								UseStateResult2_2((UseStateResult3 - 1 - 1) % #list1 + 1)
							end,
							onClickRight = function() --[[ Line: 432 ]]
								-- upvalues: UseReportAnythingWithScreenshotModuleResult2 (copy), ConstantsModule (upval), UseReducerResult2 (copy), UseStateResult2_2 (copy), UseStateResult3 (copy), list1 (upval)
								UseReportAnythingWithScreenshotModuleResult2({
									type = ConstantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
								})
								UseReducerResult2({
									type = ConstantsModule.AnalyticsActions.IncrementExperiencePersonChanged
								})
								UseStateResult2_2((UseStateResult3 - 1 + 1) % #list1 + 1)
							end
						}),
						MenuItemsContainer = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, 0)
						}, { MenuItems = Element }),
						FooterFrame = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
							TextFrame = ReactModule.createElement(View, {
								tag = "size-full col align-x-left gap-small padding-top-medium"
							}, {
								Divider = ReactModule.createElement(View, {
									tag = "size-full-0 stroke-muted padding-top-medium",
									LayoutOrder = 1
								}),
								InfoText = ReactModule.createElement(Text, {
									TextWrapped = true,
									tag = "auto-xy",
									LayoutOrder = 2,
									Text = if IsShowUKOSAIllegalContentReportingLinkFunction() then UseLocalizationResult.FooterInformation2 else UseLocalizationResult.FooterInformation1,
									fontStyle = UseTokensResult.Typography.BodySmall,
									textStyle = UseTokensResult.Color.Content.Muted,
									TextXAlignment = Enum.TextXAlignment.Left
								})
							})
						}),
						DSALinkFrame = if FFlagMigrateAllOsaMessagingToCentralService or not IsShowEUDSAIllegalContentReportingLinkFunction() then nil else ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, 0)
						}, { DSALink = ReactModule.createElement(DSAReportLink) }),
						OSALinkFrame = if FFlagMigrateAllOsaMessagingToCentralService or not IsShowUKOSAIllegalContentReportingLinkFunction() then nil else ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 3 }, { OSALink = ReactModule.createElement(OSAReportLink) }),
						GenericIllegalContentReportLink = if FFlagMigrateAllOsaMessagingToCentralService and IsShowGenericIllegalContentReportingLinkFunction() then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 3 }, ReactModule.createElement(GenericReportLink)) else nil,
						TakeItDownReportLink = if FFlagAddTakeItDownReportLinkToSurfaces and GetTakeItDownReportLinkVisibilityFunction() then ReactModule.createElement(TakeItDownReportLink, { layoutOrder = 4 }) else nil
					}) else nil
				})
			})
		})
	})
end

return function(p1) --[[ Line: 516 ]]
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), CoreScriptsRootProvider (copy), LocalizationProvider (copy), ConstantsModule (copy), v55 (copy)
	return ReactModule.createElement(CoreScriptsRootProvider, {}, {
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			[ConstantsModule.LegacyAbuseReportMenuRootName] = ReactModule.createElement(v55, p1)
		})
	})
end