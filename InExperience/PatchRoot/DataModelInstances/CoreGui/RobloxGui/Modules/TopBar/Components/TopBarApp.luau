local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("Players")
local VRService = game:GetService("VRService")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local FFlagCoreUiMigrateUIBloxToFoundation = SharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local FFlagEnableTeamTestLua = SharedFlagsModule.FFlagEnableTeamTestLua
local Images = UIBloxModule.App.ImageSet.Images
local CloseIngame = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/controls/close-ingame" else Images["icons/controls/close-ingame"]
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
local BuildModeLaunchModule = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local SongbirdModule = require(CorePackages.Workspace.Packages.Songbird)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local Stores = CoreGuiCommonModule.Stores
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local Presentation = script.Parent.Presentation
local BuildPillMenuPortalHost = BuildExperienceModule.BuildPillMenuPortalHost
local MenuIconModule = require(Presentation.MenuIcon)
local ChatIconModule = require(Presentation.ChatIcon)
local MoreMenuModule = require(Presentation.MoreMenu)
local HealthBarModule = require(Presentation.HealthBar)
local HurtOverlayModule = require(Presentation.HurtOverlay)
local GamepadNavigationDialogModule = require(Presentation.GamepadNavigationDialog)
local HeadsetMenuModule = require(Presentation.HeadsetMenu)
local HeadsetDisconnectDialog = CoreGuiCommonModule.Components.HeadsetDisconnectDialog
local PlaytestModeTooltipModule = require(Presentation.PlaytestModeTooltip)
local UnpublishedPlaytestModeTooltip = BuildExperienceModule.UnpublishedPlaytestModeTooltip
local TraversalBackButtonModule = require(script.Parent.TraversalBackButton)
local Chrome = script.Parent.Parent.Parent.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local PlaytestModeThemeProviderModule = require(Chrome.ChromeShared.Unibar.PlaytestModeThemeProvider)
local FFlagEnablePlaytestModeUnibar = SharedFlagsModule.FFlagEnablePlaytestModeUnibar
local FFlagEnableUISelector = CoreGuiCommonModule.Flags.FFlagEnableUISelector
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode
local FIntAddUILessModeVariant = SharedFlagsModule.FIntAddUILessModeVariant
local UILessTooltipDuration = game:DefineFastInt("UILessTooltipDuration", 10)
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarSignalizeScreenSize = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local FFlagAddTraversalBackButton = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalBackButton
local UseNewHeadsetDisconnectDialog = game:DefineFastFlag("UseNewHeadsetDisconnectDialog", false)
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagEnableInExperienceShop1 = InExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and FFlagEnableInExperienceShop
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local ShopGlobalIcon = InExperienceShopModule.ShopGlobalIcon
local FFlagTopBarShopIconV2Module = require(script.Parent.Parent.Flags.FFlagTopBarShopIconV2)
local ShopIconModule = if FFlagTopBarShopIconV2Module then require(Presentation.ShopIcon) else nil
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagShowGameAgeRating = SharedFlagsModule.FFlagShowGameAgeRating
local FFlagExperienceAgeRatingBadge = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local FFlagShowGameAgeRating1 = FFlagExperienceAgeRatingBadge and FFlagShowGameAgeRating
local ExperienceAgeRatingBadgeModule = require(CorePackages.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local ExperienceAgeRatingPolicyModule = require(script.Parent.Parent.ExperienceAgeRatingPolicy)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagShowSwitchServerButton1 = IsSideSheetEnabledModule and (FFlagShowSwitchServerButton or IsPioneerLaunchFunction())
local SwitchServerModule = require(CorePackages.Workspace.Packages.SwitchServer)
local SwitchServerConfirmation = SwitchServerModule.SwitchServerConfirmation
local GetSwitchServerStoreFunction = SwitchServerModule.GetSwitchServerStore
local UnibarModule = nil
local KeepOutAreasHandlerModule = nil
local AnalyticsModule = nil

if EnabledFunction() then
	UnibarModule = require(Chrome.ChromeShared.Unibar)
end
if game:GetEngineFeature("InGameChromeSignalAPI") then
	KeepOutAreasHandlerModule = require(Chrome.ChromeShared.Service.KeepOutAreasHandler)
	
	if EnabledFunction() then
		AnalyticsModule = require(Chrome.ChromeShared.Analytics)
	end
end
local LocalStoreModule = nil
local ConstantsModule1 = nil
local Callback = nil

if EnabledFunction() then
	LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
	ConstantsModule1 = require(Chrome.ChromeShared.Unibar.Constants)
	
	if FFlagEnableInExperienceShop1 then
		Callback = require(Chrome.Integrations.CommonIcon)
	end
end
local EnabledResult = FFlagTopBarShopIconV2Module and (FFlagAddTraversalBackButton and EnabledFunction())
local ConnectionModule = require(script.Parent.Connection)
local Parent = Presentation.Parent.Parent
local ConstantsModule2 = require(Parent.Constants)
local SetScreenSizeModule = require(Parent.Actions.SetScreenSize)
local SetKeepOutAreaModule = require(Parent.Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Parent.Actions.RemoveKeepOutArea)
local MenuIconContextModule = if EnabledFunction() and (FFlagEnableConsoleExpControls or FFlagExperienceAgeRatingBadge) then require(script.Parent.MenuIconContext) else nil
local GamepadMenuModule = nil
local GamepadConnectorModule = nil
local FFlagAddMenuNavigationToggleDialog = nil
local MenuNavigationToggleDialogModule = nil

if EnabledFunction() and FFlagEnableConsoleExpControls then
	GamepadConnectorModule = require(script.Parent.GamepadConnector)
	FFlagAddMenuNavigationToggleDialog = SharedFlagsModule.FFlagAddMenuNavigationToggleDialog
	MenuNavigationToggleDialogModule = require(Presentation.GamepadMenu.MenuNavigationToggleDialog)
else
	GamepadMenuModule = require(Presentation.GamepadMenu)
end
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local IsNewTiltIconEnabledModule = require(RobloxGui.Modules.isNewTiltIconEnabled)
local FFlagGamepadNavigationDialogABTestModule = require(Parent.Flags.FFlagGamepadNavigationDialogABTest)
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local PartyMicBinderModule = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder)
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = SharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local JoinVoiceBinderModule = if game:GetEngineFeature("VoiceChatSupported") and GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and EnabledFunction() then require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder) else nil
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local TopBarAppPolicyModule = require(script.Parent.Parent.TopBarAppPolicy)
local EnabledResult1 = EnabledFunction()
local VRBottomUnibarModule = if IsInExperienceUIVREnabled and EnabledFunction() then require(script.Parent.VRBottomUnibar) else require(RobloxGui.Modules.VR.VRBottomBar.VRBottomBar)

local function _(p1) --[[ Line: 207 | Named "selectMenuOpen" ]]
	return p1.displayOptions.menuOpen or p1.displayOptions.inspectMenuOpen
end

local _ = function(): boolean --[[ Line: 211 | Named "canShowAssistantBuild" ]]
	-- upvalues: BuildModeLaunchModule (copy), VRService (copy)
	return BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled
end

local TopBarApp = RoactModule.PureComponent:extend("TopBarApp")
TopBarApp.validateProps = TModule.strictInterface({
	menuOpen = if FFlagTopBarSignalizeMenuOpen then nil else TModule.optional(TModule.boolean),
	inspectMenuOpen = if FFlagTopBarSignalizeMenuOpen then nil else TModule.optional(TModule.boolean),
	setScreenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.callback,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	showGameAgeRating = TModule.optional(TModule.boolean)
})

function TopBarApp.init(p1) --[[ Line: 229 ]]
	-- upvalues: RoactModule (copy), SignalsModule (copy), DisplayModule (copy), FFlagAddUILessMode (copy), Stores (copy), FIntAddUILessModeVariant (copy), TweenService (copy), LocalStoreModule (ref), ConstantsModule1 (ref), UILessTooltipDuration (copy), SettingsHubModule (copy), ConstantsModule (copy), ContextActionService (copy), FFlagTopBarSignalizeMenuOpen (copy), SettingsShowSignal (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), FFlagExperienceAgeRatingBadge (copy), IsSpatialFunction (copy), ReactModule (copy), ExperienceAgeRatingPolicyModule (copy), EnabledFunction (copy), Chrome (copy), FFlagEnableConsoleExpControls (copy), GamepadConnectorModule (ref), FFlagEnableInExperienceShop1 (copy), EnabledResult (copy), InExperienceShopModule (copy), FFlagCenterInExperienceShopWindow (copy), TextChatService (copy), FFlagShowSwitchServerButton1 (copy), GetSwitchServerStoreFunction (copy)
	p1.unibarRightSidePosition, p1.setUnibarRightSidePosition = RoactModule.createBinding(UDim2.new())
	p1.closeButtonState, p1.setCloseButtonState = RoactModule.createBinding(false)
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2) --[[ Line: 232 ]]
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if FFlagAddUILessMode then
		p1.uiLessStore = Stores.GetUILessStore(false)
		
		if FIntAddUILessModeVariant ~= 0 then
			p1.uiLessTooltipVisible, p1.setUILessTooltipVisible = RoactModule.createBinding(false)
			p1.uiLessTooltipTransparency, p1.setUILessTooltipTransparency = RoactModule.createBinding(0)
			
			function p1.fadeOutUILessTooltip() --[[ Line: 246 ]]
				-- upvalues: p1 (copy), TweenService (upval)
				local NumValue = Instance.new("NumberValue")
				NumValue.Value = 0
				NumValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 249 ]]
					-- upvalues: p1 (upval), NumValue (copy)
					p1.setUILessTooltipTransparency(NumValue.Value)
				end)
				p1.uiLessTooltipTween = TweenService:Create(NumValue, TweenInfo.new(0.5), { Value = 1 })
				p1.uiLessTooltipTween.Completed:Connect(function() --[[ Line: 256 ]]
					-- upvalues: p1 (upval)
					p1.setUILessTooltipVisible(false)
					p1.uiLessTooltipTween = nil
				end)
				p1.uiLessTooltipTween:Play()
			end
			
			function p1.cleanupUILessTooltip() --[[ Line: 264 ]]
				-- upvalues: p1 (copy)
				if p1.uiLessTooltipTween then
					p1.uiLessTooltipTween:Cancel()
					p1.uiLessTooltipTween = nil
				end
				if p1.uiLessTooltipTimer then
					task.cancel(p1.uiLessTooltipTimer)
					p1.uiLessTooltipTimer = nil
				end
			end
			
			if p1.uiLessStore.getUILessModeEnabled(false) then
				local IsMAXNUMUNIVERSESSHOWNAbove = true
				
				if LocalStoreModule then
					local NumExperiencesUserSeenUILessTooltipKey2 = LocalStoreModule.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0
					IsMAXNUMUNIVERSESSHOWNAbove = NumExperiencesUserSeenUILessTooltipKey2 < ConstantsModule1.MAX_NUM_UNIVERSES_SHOWN
					
					if IsMAXNUMUNIVERSESSHOWNAbove then
						LocalStoreModule.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", NumExperiencesUserSeenUILessTooltipKey2 + 1)
					end
				end
				if IsMAXNUMUNIVERSESSHOWNAbove then
					p1.setUILessTooltipVisible(true)
					p1.uiLessTooltipTimer = task.delay(UILessTooltipDuration, function() --[[ Line: 293 ]]
						-- upvalues: p1 (copy)
						p1.fadeOutUILessTooltip()
						p1.uiLessTooltipTimer = nil
					end)
				end
			end
			ContextActionService:BindCoreAction("ToggleUILess", function(_, UserInputState) --[[ Line: 300 ]]
				-- upvalues: p1 (copy), FIntAddUILessModeVariant (upval), SettingsHubModule (upval), ConstantsModule (upval)
				if UserInputState ~= Enum.UserInputState.Begin then return end
				if p1.uiLessStore.getUILessModeEnabled(false) then
					if FIntAddUILessModeVariant == 1 then
						p1.uiLessStore.setUIVisible(function(Visibility): boolean --[[ Line: 307 ]]
							-- upvalues: SettingsHubModule (upval), ConstantsModule (upval)
							if Visibility == SettingsHubModule:GetVisibility() then
								SettingsHubModule:PopMenu(false, true, ConstantsModule.AnalyticsMenuOpenTypes.Keyboard)
							end
							return not Visibility
						end)
						p1.cleanupUILessTooltip()
						p1.setUILessTooltipVisible(false)
						
						return
					end
					if FIntAddUILessModeVariant == 2 then
						p1.uiLessStore.setUIVisible(function(p2): boolean --[[ Line: 318 ]]
							return not p2
						end)
						
						if SettingsHubModule:GetVisibility() then
							SettingsHubModule:PopMenu(false, true, ConstantsModule.AnalyticsMenuOpenTypes.Keyboard)
						end
						p1.cleanupUILessTooltip()
						p1.setUILessTooltipVisible(false)
						
						return
					end
				else
					SettingsHubModule:PopMenu(false, true, ConstantsModule.AnalyticsMenuOpenTypes.Keyboard)
				end
			end, false, Enum.KeyCode.Escape)
		end
	end
	if FFlagTopBarSignalizeMenuOpen then
		p1.tiltMenuOpen, p1.setTiltMenuOpen = RoactModule.createBinding(false)
		p1.inspectMenuOpen, p1.setInspectMenuOpen = RoactModule.createBinding(false)
		p1.inspectMenuDisposeEffect = SignalsModule.createEffect(function(p2) --[[ Line: 340 ]]
			-- upvalues: Stores (upval), p1 (copy)
			p1.setInspectMenuOpen((Stores.GetInspectAndBuyStore(p2).getInspectAndBuyOpen(p2)))
		end)
		SettingsShowSignal:connect(function(p2) --[[ Line: 345 ]]
			-- upvalues: p1 (copy)
			p1.setTiltMenuOpen(p2)
		end)
	end
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if FFlagExperienceAgeRatingBadge then
		p1:setState({ ageRatingSpatial = IsSpatialFunction() })
		p1.ageRatingControlsVisible, p1.setAgeRatingControlsVisible = ReactModule.createBinding(true)
		p1.ageRatingControlsWidth, p1.setAgeRatingControlsWidth = ReactModule.createBinding(0)
		
		function p1.onAgeRatingControlsSizeChanged(Frame) --[[ Line: 357 ]]
			-- upvalues: p1 (copy)
			p1.setAgeRatingControlsWidth(Frame.AbsoluteSize.X)
		end
		
		function p1.onAgeRatingUnibarAreaChanged(p2, p3, p4) --[[ Line: 360 ]]
			-- upvalues: p1 (copy), FFlagTopBarSignalizeKeepOutAreas (upval)
			p1.setAgeRatingControlsWidth(p4.X);
			(if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea)(p2, p3, p4)
		end
		
		function p1.onAgeRatingAreaChanged(Frame: Frame) --[[ Line: 367 ]]
			-- upvalues: FFlagTopBarSignalizeKeepOutAreas (upval), p1 (copy), ExperienceAgeRatingPolicyModule (upval)
			(if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea)(ExperienceAgeRatingPolicyModule.keepOutAreaId, if Frame then Frame.AbsolutePosition else Vector2.zero, if Frame then Frame.AbsoluteSize else Vector2.zero)
		end
	end
	function p1:onCloseBtnStateChange(p2) --[[ Line: 379 ]]
		-- upvalues: p1 (copy)
		p1.setCloseButtonState(p2)
	end
	
	if EnabledFunction() then
		local ServiceModule = require(Chrome.Service)
		p1:setState({ unibarAlignment = ServiceModule:orderAlignment():get() })
		
		if FFlagEnableConsoleExpControls then
			p1.GamepadConnector = GamepadConnectorModule
		end
		if FFlagEnableConsoleExpControls then
			p1.unibarMenuRef = ReactModule.createRef()
			p1.menuIconRef = RoactModule.createRef()
		end
		if FFlagEnableInExperienceShop1 and not EnabledResult then
			p1.shopGlobalIconDisposeEffect = SignalsModule.createEffect(function(p2) --[[ Line: 398 ]]
				-- upvalues: InExperienceShopModule (upval), p1 (copy)
				local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
				
				if GetShopGlobalIconStoreFunction then
					local ShopGlobalIconStore = GetShopGlobalIconStoreFunction(p2)
					p1:setState({
						shopGlobalIconEnabled = ShopGlobalIconStore.getEnabled(p2),
						shopGlobalStatusIndicatorEnabled = ShopGlobalIconStore.getStatusIndicatorEnabled(p2)
					})
					
					return
				end
			end)
			
			function p1.onShopGlobalIconActivated() --[[ Line: 409 ]]
				-- upvalues: FFlagCenterInExperienceShopWindow (upval), Chrome (upval), ServiceModule (copy), ConstantsModule1 (upval)
				if FFlagCenterInExperienceShopWindow then
					require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
					
					return
				else
					ServiceModule:toggleWindow(ConstantsModule1.IN_EXPERIENCE_SHOP_ID)
				end
			end
			
			p1.shopGlobalIconCleanup = InExperienceShopModule.initShopGlobalIcon and InExperienceShopModule.initShopGlobalIcon()
			p1.shopIsActiveMappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function() --[[ Line: 420 ]]
				-- upvalues: ServiceModule (copy), ConstantsModule1 (upval)
				return ServiceModule:isWindowOpen(ConstantsModule1.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p1:setState({ chatVersion = TextChatService.ChatVersion })
	
	if not game:IsLoaded() then
		game.Loaded:Connect(function() --[[ Line: 434 ]]
			-- upvalues: p1 (copy), TextChatService (upval)
			p1:setState({ chatVersion = TextChatService.ChatVersion })
		end)
	end
	if FFlagShowSwitchServerButton1 then
		p1.disposeSwitchServerEffect = SignalsModule.createEffect(function(p2) --[[ Line: 442 ]]
			-- upvalues: GetSwitchServerStoreFunction (upval), p1 (copy)
			local SwitchServerStore = GetSwitchServerStoreFunction(false)
			p1:setState({
				shouldEnableSwitchServer = SwitchServerStore.shouldEnableSwitchServer(p2),
				isConfirmationOpen = SwitchServerStore.isConfirmationOpen(p2)
			})
		end)
		p1.setConfirmationOpen = GetSwitchServerStoreFunction(false).setConfirmationOpen
	end
end

function TopBarApp.didMount(p1) --[[ Line: 453 ]]
	-- upvalues: FFlagExperienceAgeRatingBadge (copy), GamepadConnectorModule (ref), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), SignalsModule (copy), VRService (copy), IsSpatialFunction (copy), EnabledFunction (copy), Chrome (copy), FFlagEnableInExperienceShop1 (copy), EnabledResult (copy), ConstantsModule1 (ref), FFlagEnableConsoleExpControls (copy)
	if FFlagExperienceAgeRatingBadge then
		if GamepadConnectorModule then
			local ShowTopBar = GamepadConnectorModule:getShowTopBar()
			p1.ageRatingVisibilityConnection = ShowTopBar:connect(function() --[[ Line: 457 ]]
				-- upvalues: p1 (copy), ShowTopBar (copy)
				p1.setAgeRatingControlsVisible(ShowTopBar:get())
			end, true)
		end
		if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and p1.uiLessStore then
			p1.ageRatingVisibilityEffect = SignalsModule.createEffect(function(p2) --[[ Line: 462 ]]
				-- upvalues: p1 (copy)
				if p1.uiLessStore.getUILessModeEnabled(p2) then
					p1.setAgeRatingControlsVisible(p1.uiLessStore.getUIVisible(p2))
				end
			end)
		end
		p1.ageRatingSpatialConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 468 ]]
			-- upvalues: p1 (copy), IsSpatialFunction (upval)
			p1:setState({ ageRatingSpatial = IsSpatialFunction() })
		end)
	end
	if EnabledFunction() then
		local ServiceModule = require(Chrome.Service)
		p1.orderAlignmentConnection = ServiceModule:orderAlignment():connect(function() --[[ Line: 474 ]]
			-- upvalues: p1 (copy), ServiceModule (copy)
			p1:setState({ unibarAlignment = ServiceModule:orderAlignment():get() })
		end)
		
		if FFlagEnableInExperienceShop1 and not EnabledResult then
			p1.shopIsActiveConnection = ServiceModule:onIntegrationStatusChanged():connect(function() --[[ Line: 481 ]]
				-- upvalues: p1 (copy), ServiceModule (copy), ConstantsModule1 (upval)
				p1:setState({
					shopGlobalIconIsActive = ServiceModule:isWindowOpen(ConstantsModule1.IN_EXPERIENCE_SHOP_ID)
				})
			end)
		end
		if FFlagEnableConsoleExpControls then
			if not IsSpatialFunction() then
				p1.GamepadConnector:connectToTopbar()
			end
			p1.vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 492 ]]
				-- upvalues: IsSpatialFunction (upval), p1 (copy)
				if IsSpatialFunction() then
					p1.GamepadConnector:disconnectFromTopbar()
					
					return
				else
					p1.GamepadConnector:connectToTopbar()
				end
			end)
		end
	end
end

function TopBarApp.willUnmount(p1) --[[ Line: 503 ]]
	-- upvalues: EnabledFunction (copy), FFlagEnableConsoleExpControls (copy), FFlagEnableInExperienceShop1 (copy), EnabledResult (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), ContextActionService (copy), FFlagTopBarSignalizeMenuOpen (copy), FFlagTopBarSignalizeKeepOutAreas (copy), FFlagShowSwitchServerButton1 (copy)
	if p1.ageRatingVisibilityConnection then
		p1.ageRatingVisibilityConnection:disconnect()
	end
	if p1.ageRatingVisibilityEffect then
		p1.ageRatingVisibilityEffect()
	end
	if p1.ageRatingSpatialConnection then
		p1.ageRatingSpatialConnection:Disconnect()
	end
	if EnabledFunction() then
		if p1.orderAlignmentConnection then
			p1.orderAlignmentConnection:disconnect()
			p1.orderAlignmentConnection = nil
		end
		if FFlagEnableConsoleExpControls then
			if p1.vrEnabledConnection then
				p1.vrEnabledConnection:Disconnect()
				p1.vrEnabledConnection = nil
			end
			p1.GamepadConnector:disconnectFromTopbar()
		end
	end
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
	if FFlagEnableInExperienceShop1 and not EnabledResult then
		if EnabledFunction() and p1.shopGlobalIconDisposeEffect then
			p1.shopGlobalIconDisposeEffect()
		end
		if p1.shopIsActiveConnection then
			p1.shopIsActiveConnection:disconnect()
			p1.shopIsActiveConnection = nil
		end
		if p1.shopGlobalIconCleanup then
			p1.shopGlobalIconCleanup()
			p1.shopGlobalIconCleanup = nil
		end
	end
	if FFlagAddUILessMode then
		if p1.uiLessStore then
			p1.uiLessStore.cleanup()
		end
		if FIntAddUILessModeVariant ~= 0 then
			p1.cleanupUILessTooltip()
			ContextActionService:UnbindCoreAction("ToggleUILess")
		end
	end
	if FFlagTopBarSignalizeMenuOpen then
		if p1.tiltMenuDisposeEffect then
			p1.tiltMenuDisposeEffect()
		end
		if p1.inspectMenuDisposeEffect then
			p1.inspectMenuDisposeEffect()
		end
	end
	if FFlagTopBarSignalizeKeepOutAreas and p1.keepOutAreasStore then
		p1.keepOutAreasStore.cleanup()
	end
	if FFlagShowSwitchServerButton1 and p1.disposeSwitchServerEffect then
		p1.disposeSwitchServerEffect()
	end
end

function TopBarApp.render(p1) --[[ Line: 578 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 579 ]]
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				},
				BackgroundOnHover = {
					Color = p2.Color.State.Hover.Color3,
					Transparency = p2.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p2.Color.State.Press.Color3,
					Transparency = p2.Color.State.Press.Transparency
				}
			},
			Tokens = {
				Color = {
					Extended = {
						White = { White_100 = p2.Color.Extended.White.White_100 }
					}
				},
				Size = {
					Size_100 = p2.Size.Size_100,
					Size_200 = p2.Size.Size_200,
					Size_300 = p2.Size.Size_300
				},
				Radius = { Small = p2.Radius.Small },
				FontSize = { FontSize_300 = p2.FontSize.FontSize_300 },
				Global = {
					Color = { White = p2.Color.Extended.White.White_100 },
					Space_50 = p2.Size.Size_100,
					Space_100 = p2.Size.Size_200,
					Space_150 = p2.Size.Size_300,
					FontSize_50 = p2.FontSize.FontSize_300
				},
				Semantic = { Radius = { Small = p2.Radius.Small } }
			}
		}
	end, function(p2) --[[ Line: 630 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function TopBarApp.renderUnibarFrame(p1, p2, IsEligible) --[[ Line: 635 ]]
	-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), FFlagEnableConsoleExpControls (copy), FFlagShowGameAgeRating1 (copy), ReactModule (copy), MenuIconContextModule (copy), UnibarModule (ref), FFlagAddTraversalBackButton (copy), FFlagTopBarSignalizeKeepOutAreas (copy), EnabledResult (copy), RoactModule (copy)
	return if IsInExperienceUIVREnabled and IsSpatialFunction() then nil elseif FFlagEnableConsoleExpControls or FFlagShowGameAgeRating1 then ReactModule.createElement(MenuIconContextModule.Provider, {
		value = {
			menuIconRef = p1.menuIconRef,
			replacesAgeRating = IsEligible
		}
	}, {
		ReactModule.createElement(UnibarModule, {
			layoutOrder = 1,
			onAreaChanged = if FFlagShowGameAgeRating1 and not FFlagAddTraversalBackButton then p1.onAgeRatingUnibarAreaChanged elseif FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
			onMinWidthChanged = if EnabledResult then nil else function(XOffset) --[[ Line: 656 ]]
				-- upvalues: p1 (copy)
				p1.setUnibarRightSidePosition(UDim2.new(0, XOffset, 0, 0))
			end,
			menuRef = if p2 then p1.unibarMenuRef else nil
		})
	}) else RoactModule.createElement(UnibarModule, {
		layoutOrder = 1,
		onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
		onMinWidthChanged = if EnabledResult then nil else function(XOffset) --[[ Line: 671 ]]
			-- upvalues: p1 (copy)
			p1.setUnibarRightSidePosition(UDim2.new(0, XOffset, 0, 0))
		end
	})
end

function TopBarApp.renderWithStyle(p1, p2) --[[ Line: 678 ]]
	-- upvalues: EnabledFunction (copy), ExperienceAgeRatingPolicyModule (copy), FFlagExperienceAgeRatingBadge (copy), IsSpatialFunction (copy), ConstantsModule2 (copy), EnabledResult (copy), FFlagEnableInExperienceShop1 (copy), FFlagAppNavMyStatsTab (copy), BuildModeLaunchModule (copy), VRService (copy), ConstantsModule1 (ref), FFlagTopBarSignalizeMenuOpen (copy), TenFootInterfaceModule (copy), RoactModule (copy), VoiceStateContextModule (copy), VRBottomUnibarModule (copy), Default (copy), IsInExperienceUIVREnabled (copy), MenuIconModule (copy), FFlagEnableConsoleExpControls (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SelectionCursorProvider (copy), FFlagEnablePlaytestModeUnibar (copy), PlaytestModeThemeProviderModule (copy), ReactModule (copy), View (copy), ExperienceAgeRatingBadgeModule (copy), FFlagTopBarSignalizeScreenSize (copy), ConnectionModule (copy), PlaytestModeTooltipModule (copy), FFlagEnableTeamTestLua (copy), UnpublishedPlaytestModeTooltip (copy), FFlagEnableUISelector (copy), CoreGuiCommonModule (copy), GamepadMenuModule (ref), FFlagAddMenuNavigationToggleDialog (ref), MenuNavigationToggleDialogModule (ref), FFlagGamepadNavigationDialogABTestModule (copy), GamepadNavigationDialogModule (copy), FFlagShowSwitchServerButton1 (copy), SwitchServerConfirmation (copy), UseNewHeadsetDisconnectDialog (copy), HeadsetDisconnectDialog (copy), HeadsetMenuModule (copy), KeepOutAreasHandlerModule (ref), HurtOverlayModule (copy), IsSideSheetEnabledModule (copy), IsNewTiltIconEnabledModule (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), WithLocalizationFunction (copy), UnibarModule (ref), IsNewInGameMenuEnabledModule (copy), Interactable (copy), RobloxGui (copy), ControlState (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), CloseIngame (copy), ImageSetButton (copy), SongbirdModule (copy), JoinVoiceBinderModule (ref), GetFFlagEnableCrossExpVoiceFunction (copy), PartyMicBinderModule (copy), AnalyticsModule (ref), FFlagAddTraversalBackButton (copy), TraversalBackButtonModule (copy), ShopIconModule (ref), FFlagShowGameAgeRating1 (copy), EnabledResult1 (copy), HealthBarModule (copy), BuildPillMenuPortalHost (copy), ShopGlobalIcon (copy), FFlagExperienceShopNewIconography (copy), Callback (ref), ChatIconModule (copy), MoreMenuModule (copy)
	local EnabledResult2 = EnabledFunction()
	local Right = if p1.state.unibarAlignment == nil then Enum.HorizontalAlignment.Right else p1.state.unibarAlignment
	local IsEligible = ExperienceAgeRatingPolicyModule.isEligible(p1.props.showGameAgeRating, EnabledResult2, Right == Enum.HorizontalAlignment.Left, if FFlagExperienceAgeRatingBadge then p1.state.ageRatingSpatial else IsSpatialFunction())
	local ScaledScreenSideOffset = ConstantsModule2.ScreenSideOffset * p1.state.UiScale
	local ScaledTopBarHeight = ConstantsModule2.TopBarHeight * p1.state.UiScale
	local ScaledTopBarTopMargin = ConstantsModule2.TopBarTopMargin * p1.state.UiScale
	local ScaledTopBarPadding = ConstantsModule2.TopBarPadding * p1.state.UiScale
	local ScaledTopBarPadding1 = if IsEligible and not EnabledResult then if FFlagEnableInExperienceShop1 and p1.state.shopGlobalIconEnabled then 0 else ScaledTopBarPadding elseif FFlagAppNavMyStatsTab and (BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled) then ScaledScreenSideOffset elseif EnabledResult then ScaledTopBarPadding elseif FFlagEnableInExperienceShop1 and p1.state.shopGlobalIconEnabled then 2 * ConstantsModule1.UNIBAR_END_PADDING * p1.state.UiScale else ScaledTopBarPadding
	local ScaledLegacyCloseMenuIconSize = ConstantsModule2.LegacyCloseMenuIconSize * p1.state.UiScale
	local ScaledPaddingTop = ConstantsModule2.UnibarFrame.PaddingTop * p1.state.UiScale
	local ScaledPaddingBottom = ConstantsModule2.UnibarFrame.PaddingBottom * p1.state.UiScale
	local ScaledPaddingLeft = ConstantsModule2.UnibarFrame.PaddingLeft * p1.state.UiScale
	local ScaledExtendedSize = ConstantsModule2.UnibarFrame.ExtendedSize * p1.state.UiScale
	local TiltMenuOpen = if FFlagTopBarSignalizeMenuOpen then p1.tiltMenuOpen else p1.props.menuOpen
	
	if TenFootInterfaceModule:IsEnabled() and not EnabledFunction() then
		ScaledScreenSideOffset = ConstantsModule2.ScreenSideOffsetTenFoot
		ScaledTopBarHeight = ConstantsModule2.TopBarHeightTenFoot
	end
	local MapResult = if FFlagTopBarSignalizeMenuOpen then RoactModule.joinBindings({ p1.tiltMenuOpen, p1.inspectMenuOpen }):map(function(Entry): boolean --[[ Line: 719 ]]
		return not (Entry[0] or Entry[1])
	end) else not (p1.props.menuOpen or p1.props.inspectMenuOpen)
	local _UDim2 = UDim2.new(0, 0, 0, ScaledTopBarTopMargin)
	local YOffset = ScaledTopBarHeight - ScaledTopBarTopMargin
	local _UDim2_1 = UDim2.new(0, ScaledScreenSideOffset, 0, 0)
	local _UDim2_2 = UDim2.new(1, -ScaledScreenSideOffset, 0, 0)
	local _UDim2_3 = UDim2.new(1, -ScaledScreenSideOffset, 0, ScaledTopBarTopMargin)
	local _UDim2_4 = UDim2.new(0, 0, 0.5, 0)
	local Element = RoactModule.createElement(VoiceStateContextModule.Provider, {}, {
		VRBottomBar = VoiceStateContextModule.withVoiceState(function(p3) --[[ Line: 732 ]]
			-- upvalues: RoactModule (upval), VRBottomUnibarModule (upval), Default (upval), IsInExperienceUIVREnabled (upval), p1 (copy)
			return RoactModule.createElement(VRBottomUnibarModule, {
				voiceChatServiceManager = Default,
				voiceEnabled = p3.voiceEnabled,
				voiceState = p3.voiceState,
				showBadgeOver12 = if IsInExperienceUIVREnabled then p1.props.showGameAgeRating else nil
			})
		end)
	})
	local Element1 = RoactModule.createElement(SelectionCursorProvider, {}, {
		Icon = RoactModule.createElement(MenuIconModule, {
			layoutOrder = 1,
			iconScale = if FFlagTopBarSignalizeMenuOpen then nil elseif p1.props.menuOpen then ConstantsModule2.MenuIconOpenScale else 1,
			showBadgeOver12 = p1.props.showGameAgeRating and not IsEligible,
			menuIconRef = if EnabledResult2 and FFlagEnableConsoleExpControls then p1.menuIconRef else nil,
			unibarMenuRef = if EnabledResult2 and FFlagEnableConsoleExpControls then p1.unibarMenuRef else nil,
			onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
		})
	})
	
	if FFlagEnablePlaytestModeUnibar then
		Element1 = RoactModule.createElement(PlaytestModeThemeProviderModule, nil, { MenuIcon = Element1 })
	end
	local NoIsInExperienceUIVREnabled: boolean = not IsInExperienceUIVREnabled or not IsSpatialFunction()
	local Element2 = if IsEligible then ReactModule.createElement(View, {
		tag = "row align-y-center auto-x",
		LayoutOrder = 3,
		Size = UDim2.fromOffset(0, ConstantsModule2.TopBarButtonHeight * p1.state.UiScale),
		padding = if EnabledResult then {
			left = p1.ageRatingControlsVisible:map(function(p3): UDim --[[ Line: 775 ]]
				-- upvalues: ScaledTopBarPadding (copy)
				return UDim.new(0, if p3 then ScaledTopBarPadding else 0)
			end)
		} else nil,
		ref = p1.onAgeRatingAreaChanged,
		onAbsoluteSizeChanged = p1.onAgeRatingAreaChanged,
		onAbsolutePositionChanged = p1.onAgeRatingAreaChanged
	}, {
		Badge = ReactModule.createElement(ExperienceAgeRatingBadgeModule, { universeId = tostring(game.GameId) })
	}) else nil
	
	return RoactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 6,
		[RoactModule.Change.AbsoluteSize] = if FFlagTopBarSignalizeScreenSize then nil else function(Frame) --[[ Line: 798 ]]
			-- upvalues: p1 (copy)
			p1.props.setScreenSize(Frame.AbsoluteSize)
		end
	}, {
		Connection = RoactModule.createElement(ConnectionModule),
		PlaytestTooltip = if FFlagEnablePlaytestModeUnibar then RoactModule.createElement(PlaytestModeTooltipModule, { anchorRef = p1.unibarMenuRef }) else nil,
		UnpublishedPlaytestTooltip = if FFlagEnableTeamTestLua then RoactModule.createElement(UnpublishedPlaytestModeTooltip, { anchorRef = p1.unibarMenuRef, isVisible = MapResult }) else nil,
		InExperienceUiSelector = if FFlagEnableUISelector then ReactModule.createElement(CoreGuiCommonModule.Components.InExperienceUiSelector) else nil,
		GamepadMenu = if FFlagEnableConsoleExpControls then nil else RoactModule.createElement(GamepadMenuModule, { chatVersion = p1.state.chatVersion }),
		MenuNavigationToggleDialog = if EnabledResult2 and FFlagAddMenuNavigationToggleDialog and FFlagEnableConsoleExpControls then RoactModule.createElement(MenuNavigationToggleDialogModule, {
			Position = UDim2.fromScale(0.5, 0.1),
			GamepadConnector = if FFlagEnableConsoleExpControls then p1.GamepadConnector else nil
		}) else nil,
		GamepadNavigationDialog = if FFlagGamepadNavigationDialogABTestModule then RoactModule.createElement(GamepadNavigationDialogModule) else nil,
		SwitchServerConfirmation = if FFlagShowSwitchServerButton1 and p1.state.shouldEnableSwitchServer and p1.state.isConfirmationOpen then ReactModule.createElement(SwitchServerConfirmation, {
			setSwitchServerConfirmationOpen = p1.setConfirmationOpen
		}) else nil,
		HeadsetMenu = if UseNewHeadsetDisconnectDialog then RoactModule.createElement(HeadsetDisconnectDialog) else RoactModule.createElement(HeadsetMenuModule),
		VRBottomBar = VRService.VREnabled and Element or nil,
		KeepOutAreasHandler = if FFlagTopBarSignalizeKeepOutAreas or not KeepOutAreasHandlerModule then nil else RoactModule.createElement(KeepOutAreasHandlerModule),
		FullScreenFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = MapResult
		}, {
			HurtOverlay = RoactModule.createElement(HurtOverlayModule)
		}),
		MenuIconHolder = if IsSideSheetEnabledModule or not NoIsInExperienceUIVREnabled or not IsNewTiltIconEnabledModule() then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
			Size = UDim2.new(1, 0, 0, YOffset)
		}, { MenuIcon = Element1 }),
		UILessTooltip = if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 then WithLocalizationFunction({
			uiLessTooltipTitle = ConstantsModule2.LocalizedKeys.UILessTooltipTitle,
			uiLessTooltipDescription = ConstantsModule2.LocalizedKeys.UILessTooltipDescription
		})(function(p3) --[[ Line: 870 ]]
			-- upvalues: RoactModule (upval), p2 (copy), ScaledScreenSideOffset (ref), ScaledTopBarTopMargin (copy), p1 (copy)
			return RoactModule.createElement("Frame", {
				BackgroundColor3 = p2.Tokens.Color.Extended.White.White_100.Color3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = p1.uiLessTooltipTransparency,
				Visible = p1.uiLessTooltipVisible,
				ZIndex = 10000,
				[RoactModule.Ref] = p1.uiLessTooltip
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p2.Tokens.Size.Size_200),
					PaddingBottom = UDim.new(0, p2.Tokens.Size.Size_200),
					PaddingLeft = UDim.new(0, p2.Tokens.Size.Size_300),
					PaddingRight = UDim.new(0, p2.Tokens.Size.Size_300)
				}),
				Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p2.Tokens.Radius.Small) }),
				VerticalLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, p2.Tokens.Size.Size_100)
				}),
				Title = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Text = p3.uiLessTooltipTitle,
					TextSize = p2.Tokens.FontSize.FontSize_300,
					TextTransparency = p1.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSansBold,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				Description = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Text = p3.uiLessTooltipDescription,
					TextSize = p2.Tokens.FontSize.FontSize_300,
					TextTransparency = p1.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSans,
					AutomaticSize = Enum.AutomaticSize.XY
				})
			})
		end) else nil,
		LegacyCloseMenu = not UnibarModule and (not IsNewInGameMenuEnabledModule() and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, ScaledScreenSideOffset, 0, 0),
			Size = UDim2.new(1, 0, 0, ScaledTopBarHeight),
			Visible = TiltMenuOpen
		}, {
			CloseMenuButtonRound = UnibarModule and RoactModule.createElement(Interactable, {
				onStateChanged = p1.onCloseBtnStateChange,
				Visible = not TenFootInterfaceModule:IsEnabled(),
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				Position = _UDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, ScaledLegacyCloseMenuIconSize, 0, ScaledLegacyCloseMenuIconSize),
				BackgroundColor3 = p2.Theme.Overlay.Color,
				[RoactModule.Event.Activated] = function() --[[ Line: 934 ]]
					-- upvalues: RobloxGui (upval)
					require(RobloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}, {
				UICorner = EnabledResult2 and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
				Line1 = RoactModule.createElement("Frame", {
					Name = "TopLine",
					BorderSizePixel = 0,
					Rotation = 45,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					Size = UDim2.new(0, 16, 0, 2),
					BackgroundColor3 = Color3.new(1, 1, 1)
				}),
				Line2 = RoactModule.createElement("Frame", {
					Name = "BottomLine",
					BorderSizePixel = 0,
					Rotation = -45,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					Size = UDim2.new(0, 16, 0, 2),
					BackgroundColor3 = Color3.new(1, 1, 1)
				}),
				StateOverlayRound = if EnabledResult2 then nil else RoactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = p1.closeButtonState:map(function(Hover) --[[ Line: 964 ]]
						-- upvalues: ControlState (upval), p2 (copy)
						return if Hover == ControlState.Pressed then p2.Theme.BackgroundOnPress.Transparency elseif Hover == ControlState.Hover then p2.Theme.BackgroundOnHover.Transparency else 1
					end),
					BackgroundColor3 = p1.closeButtonState:map(function(Hover) --[[ Line: 973 ]]
						-- upvalues: ControlState (upval), p2 (copy)
						return if Hover == ControlState.Pressed then p2.Theme.BackgroundOnPress.Color elseif Hover == ControlState.Hover then p2.Theme.BackgroundOnHover.Color else Color3.new(1, 1, 1)
					end),
					Size = UDim2.fromScale(1, 1)
				}, {
					UICorner = EnabledResult2 and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
				}) or nil
			}) or nil,
			CloseMenuButton = if UnibarModule then nil else (if FFlagCoreUiMigrateUIBloxToFoundation then RoactModule.createElement(Image, {
				Visible = not TenFootInterfaceModule:IsEnabled(),
				Position = _UDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, ScaledLegacyCloseMenuIconSize, 0, ScaledLegacyCloseMenuIconSize),
				Image = CloseIngame,
				onActivated = function() --[[ Line: 998 ]]
					-- upvalues: RobloxGui (upval)
					require(RobloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}) else RoactModule.createElement(ImageSetButton, {
				Visible = not TenFootInterfaceModule:IsEnabled(),
				BackgroundTransparency = 1,
				Position = _UDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, ScaledLegacyCloseMenuIconSize, 0, ScaledLegacyCloseMenuIconSize),
				Image = CloseIngame,
				[RoactModule.Event.Activated] = function() --[[ Line: 1010 ]]
					-- upvalues: RobloxGui (upval)
					require(RobloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			})) or nil
		})),
		SongbirdDebugAudio = RoactModule.createElement(SongbirdModule.DebugAudioEmitters),
		UnibarLeftFrame = UnibarModule and Right == Enum.HorizontalAlignment.Left and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, YOffset),
			Position = _UDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			JoinVoiceBinder = if EnabledResult2 and JoinVoiceBinderModule then RoactModule.createElement(JoinVoiceBinderModule) else nil,
			PartyMicBinder = if EnabledResult2 and GetFFlagEnableCrossExpVoiceFunction() then RoactModule.createElement(PartyMicBinderModule) else nil,
			ChromeAnalytics = if AnalyticsModule then RoactModule.createElement(AnalyticsModule) else nil,
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ScaledPaddingTop),
				PaddingBottom = UDim.new(0, ScaledPaddingBottom),
				PaddingLeft = if IsEligible then p1.ageRatingControlsVisible:map(function(p3): UDim --[[ Line: 1039 ]]
					-- upvalues: ScaledPaddingLeft (copy), ScaledScreenSideOffset (ref)
					return UDim.new(0, if p3 then ScaledPaddingLeft else 2 * ScaledScreenSideOffset)
				end) else UDim.new(0, ScaledPaddingLeft)
			}),
			TopBarLeftContainer = FFlagAddTraversalBackButton and (if EnabledResult then ReactModule.createElement(View, { tag = "row auto-xy" }, {
				PaddedControlRow = ReactModule.createElement(View, { tag = "row gap-xsmall auto-xy", LayoutOrder = 1 }, {
					TraversalBackButton = if FFlagAddTraversalBackButton and (not IsInExperienceUIVREnabled or not IsSpatialFunction()) then ReactModule.createElement(TraversalBackButtonModule) else nil,
					UnibarFrame = p1:renderUnibarFrame(EnabledResult2, IsEligible)
				}),
				ShopIcon = ReactModule.createElement(ShopIconModule, {
					layoutOrder = 2,
					buttonSize = ConstantsModule2.TopBarButtonHeight * p1.state.UiScale,
					leftGap = ScaledTopBarPadding,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea
				}),
				AgeRating = Element2
			}) else ReactModule.createElement(View, {
				tag = "row gap-xsmall auto-xy",
				onAbsoluteSizeChanged = if FFlagShowGameAgeRating1 then p1.onAgeRatingControlsSizeChanged else nil
			}, {
				TraversalBackButton = if FFlagAddTraversalBackButton and (not IsInExperienceUIVREnabled or not IsSpatialFunction()) then ReactModule.createElement(TraversalBackButtonModule) else nil,
				UnibarFrame = p1:renderUnibarFrame(EnabledResult2, IsEligible)
			})),
			Unibar = if FFlagAddTraversalBackButton then nil else p1:renderUnibarFrame(EnabledResult2, IsEligible),
			HealthBar = if EnabledResult1 then RoactModule.createElement(HealthBarModule, {}) else nil,
			AssistantBuildPillMenu = if FFlagAppNavMyStatsTab and (BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled) then ReactModule.createElement(BuildPillMenuPortalHost, {
				position = UDim2.new(1, 0, 0, 0),
				anchorPoint = Vector2.new(1, 0)
			}) else nil,
			StackedElements = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = if IsEligible and not EnabledResult then RoactModule.joinBindings({
					width = p1.ageRatingControlsWidth,
					visible = p1.ageRatingControlsVisible
				}):map(function(p3): UDim2 --[[ Line: 1105 ]]
					-- upvalues: FFlagAddTraversalBackButton (upval)
					return UDim2.fromOffset(if FFlagAddTraversalBackButton or p3.visible then p3.width else 0, 0)
				end) else p1.unibarRightSidePosition,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = if IsEligible and not EnabledResult then RoactModule.joinBindings({
						visible = p1.ageRatingControlsVisible,
						width = p1.ageRatingControlsWidth
					}):map(function(p3): UDim --[[ Line: 1116 ]]
						-- upvalues: FFlagAddTraversalBackButton (upval), ScaledTopBarPadding1 (copy)
						local Visible = p3.visible or FFlagAddTraversalBackButton and p3.width > 0
						
						return UDim.new(0, if Visible then ScaledTopBarPadding1 else 0)
					end) else UDim.new(0, ScaledTopBarPadding1)
				}),
				Layout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, ScaledTopBarPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ShopGlobalIcon = if EnabledResult or not FFlagEnableInExperienceShop1 or not p1.state.shopGlobalIconEnabled then nil else RoactModule.createElement(ShopGlobalIcon, {
					layoutOrder = 1,
					buttonSize = ConstantsModule2.TopBarButtonHeight * p1.state.UiScale,
					leftGap = ScaledTopBarPadding,
					showStatusIndicator = p1.state.shopGlobalStatusIndicatorEnabled,
					onActivated = p1.onShopGlobalIconActivated,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
					isActive = p1.state.shopGlobalIconIsActive,
					icon = if FFlagExperienceShopNewIconography or (not Callback or not p1.shopIsActiveMappedSignal) then nil else Callback("BuildingStore", nil, p1.shopIsActiveMappedSignal)
				}),
				AgeRating = if EnabledResult then nil else Element2,
				HealthBar = if EnabledResult1 then nil else RoactModule.createElement(HealthBarModule, { layoutOrder = 10 })
			})
		}) or nil,
		UnibarRightFrame = UnibarModule and Right == Enum.HorizontalAlignment.Right and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, YOffset),
			Position = _UDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			ChromeAnalytics = if AnalyticsModule then RoactModule.createElement(AnalyticsModule) else nil,
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ScaledPaddingTop),
				PaddingBottom = UDim.new(0, ScaledPaddingBottom)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, ScaledTopBarPadding),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			HealthBar = RoactModule.createElement(HealthBarModule, { layoutOrder = 1 }),
			Unibar = RoactModule.createElement(UnibarModule, {
				layoutOrder = 2,
				onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea
			})
		}) or nil,
		TopBarFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, YOffset),
			Visible = MapResult,
			Position = _UDim2
		}, {
			LeftFrame = if EnabledResult2 then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -ScaledScreenSideOffset, 1, 0),
				Position = _UDim2_1
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, ScaledTopBarPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Blank = EnabledResult2 and RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, ScaledExtendedSize, 0, 1)
				}),
				MenuIcon = not IsNewTiltIconEnabledModule() and RoactModule.createElement(MenuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p1.props.showGameAgeRating and not IsEligible,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = if EnabledResult2 then nil else RoactModule.createElement(ChatIconModule, { layoutOrder = 3 }) or nil
			}) else not TenFootInterfaceModule:IsEnabled() and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -ScaledScreenSideOffset, 1, 0),
				Position = _UDim2_1
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, ScaledTopBarPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Blank = EnabledResult2 and RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, ScaledExtendedSize, 0, 1)
				}),
				MenuIcon = not IsNewTiltIconEnabledModule() and RoactModule.createElement(MenuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p1.props.showGameAgeRating and not IsEligible,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = if EnabledResult2 then nil else RoactModule.createElement(ChatIconModule, { layoutOrder = 3 }) or nil
			}),
			RightFrame = if UnibarModule then nil else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -ScaledScreenSideOffset, 1, 0),
				Position = _UDim2_2,
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, ScaledTopBarPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				HealthBar = RoactModule.createElement(HealthBarModule, { layoutOrder = 1 }),
				MoreMenu = not TenFootInterfaceModule:IsEnabled() and RoactModule.createElement(MoreMenuModule, { layoutOrder = 2 })
			}) or nil
		})
	})
end

local function mapStateToProps(p1) --[[ Line: 1260 ]]
	-- upvalues: FFlagTopBarSignalizeMenuOpen (copy)
	return if FFlagTopBarSignalizeMenuOpen then nil else {
		menuOpen = p1.displayOptions.menuOpen,
		inspectMenuOpen = p1.displayOptions.inspectMenuOpen
	}
end

return RoactRoduxModule.UNSTABLE_connect2(if FFlagTopBarSignalizeMenuOpen then nil else mapStateToProps, function(Callback) --[[ Line: 1285 | Named "mapDispatchToProps" ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), SetScreenSizeModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return {
		setScreenSize = if FFlagTopBarSignalizeScreenSize then nil else function(p1) --[[ Line: 1289 ]]
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			return Callback(SetScreenSizeModule(p1))
		end,
		setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2, p3) --[[ Line: 1294 ]]
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1) --[[ Line: 1299 ]]
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end)(if FFlagShowGameAgeRating then UniversalAppPolicyModule.UniversalAppPolicy.connect(function(p1, _) --[[ Line: 1274 ]]
	return { showGameAgeRating = p1.getShowGameAgeRating() }
end)(TopBarApp) else TopBarAppPolicyModule.connect(function(p1, _) --[[ Line: 1279 ]]
	return { showGameAgeRating = p1.showBadgeOver12() }
end)(TopBarApp))