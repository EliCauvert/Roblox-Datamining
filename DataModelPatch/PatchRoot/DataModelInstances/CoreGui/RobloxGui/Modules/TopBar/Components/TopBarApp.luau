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
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local FFlagCoreUiMigrateUIBloxToFoundation = SharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local Images = UIBloxModule.App.ImageSet.Images
local CloseIngame = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/controls/close-ingame" else Images["icons/controls/close-ingame"]
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
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
local VoiceBetaBadgeModule = require(Presentation.VoiceBetaBadge)
local TraversalBackButtonModule = require(script.Parent.TraversalBackButton)
local Chrome = script.Parent.Parent.Parent.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ConstantsModule1 = require(Chrome.Integrations.MusicUtility.Constants)
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
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
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
local ConstantsModule2 = nil
local Callback = nil

if EnabledFunction() then
	LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
	ConstantsModule2 = require(Chrome.ChromeShared.Unibar.Constants)
	
	if FFlagEnableInExperienceShop1 then
		Callback = require(Chrome.Integrations.CommonIcon)
	end
end
local ConnectionModule = require(script.Parent.Connection)
local Parent = Presentation.Parent.Parent
local ConstantsModule3 = require(Parent.Constants)
local SetScreenSizeModule = require(Parent.Actions.SetScreenSize)
local SetKeepOutAreaModule = require(Parent.Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Parent.Actions.RemoveKeepOutArea)
local MenuIconContextModule = if EnabledFunction() and FFlagEnableConsoleExpControls then require(script.Parent.MenuIconContext) else nil
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
local GetFFlagBetaBadgeModule = require(RobloxGui.Modules.Flags.GetFFlagBetaBadge)
local FFlagGamepadNavigationDialogABTestModule = require(Parent.Flags.FFlagGamepadNavigationDialogABTest)
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local PartyMicBinderModule = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder)
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = SharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local JoinVoiceBinderModule = if game:GetEngineFeature("VoiceChatSupported") and GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and EnabledFunction() then require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder) else nil
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local TopBarAppPolicyModule = require(script.Parent.Parent.TopBarAppPolicy)
local EnabledResult = EnabledFunction()
local VRBottomUnibarModule = if IsInExperienceUIVREnabled and EnabledFunction() then require(script.Parent.VRBottomUnibar) else require(RobloxGui.Modules.VR.VRBottomBar.VRBottomBar)

local function _(p1)
	return p1.displayOptions.menuOpen or p1.displayOptions.inspectMenuOpen
end

local _ = function(): boolean
	-- upvalues: BuildExperienceModule (copy), VRService (copy)
	return BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

local TopBarApp = RoactModule.PureComponent:extend("TopBarApp")
TopBarApp.validateProps = TModule.strictInterface({
	menuOpen = if FFlagTopBarSignalizeMenuOpen then nil else TModule.optional(TModule.boolean),
	inspectMenuOpen = if FFlagTopBarSignalizeMenuOpen then nil else TModule.optional(TModule.boolean),
	displayBetaBadge = TModule.boolean,
	setScreenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.callback,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	showBadgeOver12 = TModule.optional(TModule.boolean)
})

function TopBarApp.init(p1)
	-- upvalues: RoactModule (copy), SignalsModule (copy), DisplayModule (copy), FFlagAddUILessMode (copy), Stores (copy), FIntAddUILessModeVariant (copy), TweenService (copy), LocalStoreModule (ref), ConstantsModule2 (ref), UILessTooltipDuration (copy), SettingsHubModule (copy), ConstantsModule (copy), ContextActionService (copy), FFlagTopBarSignalizeMenuOpen (copy), SettingsShowSignal (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), EnabledFunction (copy), Chrome (copy), FFlagEnableConsoleExpControls (copy), GamepadConnectorModule (ref), ReactModule (copy), FFlagEnableInExperienceShop1 (copy), InExperienceShopModule (copy), FFlagCenterInExperienceShopWindow (copy), TextChatService (copy)
	p1.unibarRightSidePosition, p1.setUnibarRightSidePosition = RoactModule.createBinding(UDim2.new())
	p1.closeButtonState, p1.setCloseButtonState = RoactModule.createBinding(false)
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
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
			
			function p1.fadeOutUILessTooltip()
				-- upvalues: p1 (copy), TweenService (upval)
				local NumValue = Instance.new("NumberValue")
				NumValue.Value = 0
				NumValue:GetPropertyChangedSignal("Value"):Connect(function()
					-- upvalues: p1 (upval), NumValue (copy)
					p1.setUILessTooltipTransparency(NumValue.Value)
				end)
				p1.uiLessTooltipTween = TweenService:Create(NumValue, TweenInfo.new(0.5), { Value = 1 })
				p1.uiLessTooltipTween.Completed:Connect(function()
					-- upvalues: p1 (upval)
					p1.setUILessTooltipVisible(false)
					p1.uiLessTooltipTween = nil
				end)
				p1.uiLessTooltipTween:Play()
			end
			
			function p1.cleanupUILessTooltip()
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
					IsMAXNUMUNIVERSESSHOWNAbove = NumExperiencesUserSeenUILessTooltipKey2 < ConstantsModule2.MAX_NUM_UNIVERSES_SHOWN
					
					if IsMAXNUMUNIVERSESSHOWNAbove then
						LocalStoreModule.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", NumExperiencesUserSeenUILessTooltipKey2 + 1)
					end
				end
				if IsMAXNUMUNIVERSESSHOWNAbove then
					p1.setUILessTooltipVisible(true)
					p1.uiLessTooltipTimer = task.delay(UILessTooltipDuration, function()
						-- upvalues: p1 (copy)
						p1.fadeOutUILessTooltip()
						p1.uiLessTooltipTimer = nil
					end)
				end
			end
			ContextActionService:BindCoreAction("ToggleUILess", function(_, UserInputState)
				-- upvalues: p1 (copy), FIntAddUILessModeVariant (upval), SettingsHubModule (upval), ConstantsModule (upval)
				if UserInputState ~= Enum.UserInputState.Begin then return end
				if p1.uiLessStore.getUILessModeEnabled(false) then
					if FIntAddUILessModeVariant == 1 then
						p1.uiLessStore.setUIVisible(function(Visibility): boolean
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
						p1.uiLessStore.setUIVisible(function(p2): boolean
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
		p1.inspectMenuDisposeEffect = SignalsModule.createEffect(function(p2)
			-- upvalues: Stores (upval), p1 (copy)
			p1.setInspectMenuOpen((Stores.GetInspectAndBuyStore(p2).getInspectAndBuyOpen(p2)))
		end)
		SettingsShowSignal:connect(function(p2)
			-- upvalues: p1 (copy)
			p1.setTiltMenuOpen(p2)
		end)
	end
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	function p1:onCloseBtnStateChange(p2)
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
		if FFlagEnableInExperienceShop1 then
			p1.shopGlobalIconDisposeEffect = SignalsModule.createEffect(function(p2)
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
			
			function p1.onShopGlobalIconActivated()
				-- upvalues: FFlagCenterInExperienceShopWindow (upval), Chrome (upval), ServiceModule (copy), ConstantsModule2 (upval)
				if FFlagCenterInExperienceShopWindow then
					require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
					
					return
				else
					ServiceModule:toggleWindow(ConstantsModule2.IN_EXPERIENCE_SHOP_ID)
				end
			end
			
			p1.shopGlobalIconCleanup = InExperienceShopModule.initShopGlobalIcon and InExperienceShopModule.initShopGlobalIcon()
			p1.shopIsActiveMappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
				-- upvalues: ServiceModule (copy), ConstantsModule2 (upval)
				return ServiceModule:isWindowOpen(ConstantsModule2.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p1:setState({ chatVersion = TextChatService.ChatVersion })
	
	if not game:IsLoaded() then
		game.Loaded:Connect(function()
			-- upvalues: p1 (copy), TextChatService (upval)
			p1:setState({ chatVersion = TextChatService.ChatVersion })
		end)
	end
end

function TopBarApp.didMount(p1)
	-- upvalues: EnabledFunction (copy), Chrome (copy), FFlagEnableInExperienceShop1 (copy), ConstantsModule2 (ref), FFlagEnableConsoleExpControls (copy), IsSpatialFunction (copy), VRService (copy)
	if EnabledFunction() then
		local ServiceModule = require(Chrome.Service)
		p1.orderAlignmentConnection = ServiceModule:orderAlignment():connect(function()
			-- upvalues: p1 (copy), ServiceModule (copy)
			p1:setState({ unibarAlignment = ServiceModule:orderAlignment():get() })
		end)
		
		if FFlagEnableInExperienceShop1 then
			p1.shopIsActiveConnection = ServiceModule:onIntegrationStatusChanged():connect(function()
				-- upvalues: p1 (copy), ServiceModule (copy), ConstantsModule2 (upval)
				p1:setState({
					shopGlobalIconIsActive = ServiceModule:isWindowOpen(ConstantsModule2.IN_EXPERIENCE_SHOP_ID)
				})
			end)
		end
		if FFlagEnableConsoleExpControls then
			if not IsSpatialFunction() then
				p1.GamepadConnector:connectToTopbar()
			end
			p1.vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
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

function TopBarApp.willUnmount(p1)
	-- upvalues: EnabledFunction (copy), FFlagEnableConsoleExpControls (copy), FFlagEnableInExperienceShop1 (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), ContextActionService (copy), FFlagTopBarSignalizeMenuOpen (copy), FFlagTopBarSignalizeKeepOutAreas (copy)
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
	if FFlagEnableInExperienceShop1 then
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
end

function TopBarApp.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
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
	end, function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function TopBarApp.renderUnibarFrame(p1, p2)
	-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), FFlagEnableConsoleExpControls (copy), ReactModule (copy), MenuIconContextModule (copy), UnibarModule (ref), FFlagTopBarSignalizeKeepOutAreas (copy), RoactModule (copy)
	return if IsInExperienceUIVREnabled and IsSpatialFunction() then nil elseif FFlagEnableConsoleExpControls then ReactModule.createElement(MenuIconContextModule.Provider, { value = { menuIconRef = p1.menuIconRef } }, {
		ReactModule.createElement(UnibarModule, {
			layoutOrder = 1,
			onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
			onMinWidthChanged = function(XOffset)
				-- upvalues: p1 (copy)
				p1.setUnibarRightSidePosition(UDim2.new(0, XOffset, 0, 0))
			end,
			menuRef = if p2 then p1.unibarMenuRef else nil
		})
	}) else RoactModule.createElement(UnibarModule, {
		layoutOrder = 1,
		onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
		onMinWidthChanged = function(XOffset)
			-- upvalues: p1 (copy)
			p1.setUnibarRightSidePosition(UDim2.new(0, XOffset, 0, 0))
		end
	})
end

function TopBarApp.renderWithStyle(p1, p2)
	-- upvalues: EnabledFunction (copy), GetFFlagBetaBadgeModule (copy), ConstantsModule3 (copy), FFlagAppNavMyStatsTab (copy), BuildExperienceModule (copy), VRService (copy), FFlagEnableInExperienceShop1 (copy), ConstantsModule2 (ref), FFlagTopBarSignalizeMenuOpen (copy), TenFootInterfaceModule (copy), RoactModule (copy), VoiceStateContextModule (copy), VRBottomUnibarModule (copy), Default (copy), IsInExperienceUIVREnabled (copy), MenuIconModule (copy), FFlagEnableConsoleExpControls (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SelectionCursorProvider (copy), IsSpatialFunction (copy), FFlagTopBarSignalizeScreenSize (copy), ConnectionModule (copy), FFlagEnableUISelector (copy), ReactModule (copy), CoreGuiCommonModule (copy), GamepadMenuModule (ref), FFlagAddMenuNavigationToggleDialog (ref), MenuNavigationToggleDialogModule (ref), FFlagGamepadNavigationDialogABTestModule (copy), GamepadNavigationDialogModule (copy), UseNewHeadsetDisconnectDialog (copy), HeadsetDisconnectDialog (copy), HeadsetMenuModule (copy), KeepOutAreasHandlerModule (ref), HurtOverlayModule (copy), FFlagEnableSideSheet (copy), IsNewTiltIconEnabledModule (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), WithLocalizationFunction (copy), UnibarModule (ref), IsNewInGameMenuEnabledModule (copy), Interactable (copy), RobloxGui (copy), ControlState (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), CloseIngame (copy), ImageSetButton (copy), SongbirdModule (copy), ConstantsModule1 (copy), JoinVoiceBinderModule (ref), GetFFlagEnableCrossExpVoiceFunction (copy), PartyMicBinderModule (copy), AnalyticsModule (ref), FFlagAddTraversalBackButton (copy), View (copy), TraversalBackButtonModule (copy), EnabledResult (copy), HealthBarModule (copy), BuildPillMenuPortalHost (copy), ShopGlobalIcon (copy), FFlagExperienceShopNewIconography (copy), Callback (ref), VoiceBetaBadgeModule (copy), Analytics (copy), ChatIconModule (copy), MoreMenuModule (copy)
	local EnabledResult1 = EnabledFunction()
	local NoEnabledResult1: boolean = GetFFlagBetaBadgeModule() and not EnabledResult1
	local DisplayBetaBadge = p1.props.displayBetaBadge
	local Right = if p1.state.unibarAlignment == nil then Enum.HorizontalAlignment.Right else p1.state.unibarAlignment
	local ScaledScreenSideOffset = ConstantsModule3.ScreenSideOffset * p1.state.UiScale
	local ScaledTopBarHeight = ConstantsModule3.TopBarHeight * p1.state.UiScale
	local ScaledTopBarTopMargin = ConstantsModule3.TopBarTopMargin * p1.state.UiScale
	local ScaledTopBarPadding = ConstantsModule3.TopBarPadding * p1.state.UiScale
	local ScaledScreenSideOffset1 = if FFlagAppNavMyStatsTab and (BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then ScaledScreenSideOffset elseif FFlagEnableInExperienceShop1 and p1.state.shopGlobalIconEnabled then 2 * ConstantsModule2.UNIBAR_END_PADDING * p1.state.UiScale else ScaledTopBarPadding
	local ScaledLegacyCloseMenuIconSize = ConstantsModule3.LegacyCloseMenuIconSize * p1.state.UiScale
	local ScaledPaddingTop = ConstantsModule3.UnibarFrame.PaddingTop * p1.state.UiScale
	local ScaledPaddingBottom = ConstantsModule3.UnibarFrame.PaddingBottom * p1.state.UiScale
	local ScaledPaddingLeft = ConstantsModule3.UnibarFrame.PaddingLeft * p1.state.UiScale
	local ScaledExtendedSize = ConstantsModule3.UnibarFrame.ExtendedSize * p1.state.UiScale
	local TiltMenuOpen = if FFlagTopBarSignalizeMenuOpen then p1.tiltMenuOpen else p1.props.menuOpen
	
	if TenFootInterfaceModule:IsEnabled() and not EnabledFunction() then
		ScaledScreenSideOffset = ConstantsModule3.ScreenSideOffsetTenFoot
		ScaledTopBarHeight = ConstantsModule3.TopBarHeightTenFoot
	end
	local MapResult = if FFlagTopBarSignalizeMenuOpen then RoactModule.joinBindings({ p1.tiltMenuOpen, p1.inspectMenuOpen }):map(function(Entry): boolean
		return not (Entry[0] or Entry[1])
	end) else not (p1.props.menuOpen or p1.props.inspectMenuOpen)
	local _UDim2 = UDim2.new(0, 0, 0, ScaledTopBarTopMargin)
	local YOffset = ScaledTopBarHeight - ScaledTopBarTopMargin
	local _UDim2_1 = UDim2.new(0, ScaledScreenSideOffset, 0, 0)
	local _UDim2_2 = UDim2.new(1, -ScaledScreenSideOffset, 0, 0)
	local _UDim2_3 = UDim2.new(1, -ScaledScreenSideOffset, 0, ScaledTopBarTopMargin)
	local _UDim2_4 = UDim2.new(0, 0, 0.5, 0)
	local Element = RoactModule.createElement(VoiceStateContextModule.Provider, {}, {
		VRBottomBar = VoiceStateContextModule.withVoiceState(function(p3)
			-- upvalues: RoactModule (upval), VRBottomUnibarModule (upval), Default (upval), IsInExperienceUIVREnabled (upval), p1 (copy)
			return RoactModule.createElement(VRBottomUnibarModule, {
				voiceChatServiceManager = Default,
				voiceEnabled = p3.voiceEnabled,
				voiceState = p3.voiceState,
				showBadgeOver12 = if IsInExperienceUIVREnabled then p1.props.showBadgeOver12 else nil
			})
		end)
	})
	local Element1 = RoactModule.createElement(SelectionCursorProvider, {}, {
		Icon = RoactModule.createElement(MenuIconModule, {
			layoutOrder = 1,
			iconScale = if FFlagTopBarSignalizeMenuOpen then nil elseif p1.props.menuOpen then ConstantsModule3.MenuIconOpenScale else 1,
			showBadgeOver12 = p1.props.showBadgeOver12,
			menuIconRef = if EnabledResult1 and FFlagEnableConsoleExpControls then p1.menuIconRef else nil,
			unibarMenuRef = if EnabledResult1 and FFlagEnableConsoleExpControls then p1.unibarMenuRef else nil,
			onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
		})
	})
	local NoIsInExperienceUIVREnabled: boolean = not IsInExperienceUIVREnabled or not IsSpatialFunction()
	
	return RoactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 6,
		[RoactModule.Change.AbsoluteSize] = if FFlagTopBarSignalizeScreenSize then nil else function(Frame)
			-- upvalues: p1 (copy)
			p1.props.setScreenSize(Frame.AbsoluteSize)
		end
	}, {
		Connection = RoactModule.createElement(ConnectionModule),
		InExperienceUiSelector = if FFlagEnableUISelector then ReactModule.createElement(CoreGuiCommonModule.Components.InExperienceUiSelector) else nil,
		GamepadMenu = if FFlagEnableConsoleExpControls then nil else RoactModule.createElement(GamepadMenuModule, { chatVersion = p1.state.chatVersion }),
		MenuNavigationToggleDialog = if EnabledResult1 and FFlagAddMenuNavigationToggleDialog and FFlagEnableConsoleExpControls then RoactModule.createElement(MenuNavigationToggleDialogModule, {
			Position = UDim2.fromScale(0.5, 0.1),
			GamepadConnector = if FFlagEnableConsoleExpControls then p1.GamepadConnector else nil
		}) else nil,
		GamepadNavigationDialog = if FFlagGamepadNavigationDialogABTestModule then RoactModule.createElement(GamepadNavigationDialogModule) else nil,
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
		MenuIconHolder = if FFlagEnableSideSheet or not NoIsInExperienceUIVREnabled or not IsNewTiltIconEnabledModule() then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
			Size = UDim2.new(1, 0, 0, YOffset)
		}, { MenuIcon = Element1 }),
		UILessTooltip = if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 then WithLocalizationFunction({
			uiLessTooltipTitle = ConstantsModule3.LocalizedKeys.UILessTooltipTitle,
			uiLessTooltipDescription = ConstantsModule3.LocalizedKeys.UILessTooltipDescription
		})(function(p3)
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
				[RoactModule.Event.Activated] = function()
					-- upvalues: RobloxGui (upval)
					require(RobloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}, {
				UICorner = EnabledResult1 and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
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
				StateOverlayRound = if EnabledResult1 then nil else RoactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = p1.closeButtonState:map(function(Hover)
						-- upvalues: ControlState (upval), p2 (copy)
						return if Hover == ControlState.Pressed then p2.Theme.BackgroundOnPress.Transparency elseif Hover == ControlState.Hover then p2.Theme.BackgroundOnHover.Transparency else 1
					end),
					BackgroundColor3 = p1.closeButtonState:map(function(Hover)
						-- upvalues: ControlState (upval), p2 (copy)
						return if Hover == ControlState.Pressed then p2.Theme.BackgroundOnPress.Color elseif Hover == ControlState.Hover then p2.Theme.BackgroundOnHover.Color else Color3.new(1, 1, 1)
					end),
					Size = UDim2.fromScale(1, 1)
				}, {
					UICorner = EnabledResult1 and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
				}) or nil
			}) or nil,
			CloseMenuButton = if UnibarModule then nil else (if FFlagCoreUiMigrateUIBloxToFoundation then RoactModule.createElement(Image, {
				Visible = not TenFootInterfaceModule:IsEnabled(),
				Position = _UDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, ScaledLegacyCloseMenuIconSize, 0, ScaledLegacyCloseMenuIconSize),
				Image = CloseIngame,
				onActivated = function()
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
				[RoactModule.Event.Activated] = function()
					-- upvalues: RobloxGui (upval)
					require(RobloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			})) or nil
		})),
		SongbirdDebugAudio = RoactModule.createElement(SongbirdModule.DebugAudioEmitters),
		SongbirdReportAudioFrame = EnabledFunction() and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, ConstantsModule1.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
		}, {
			ReportAudioPopup = RoactModule.createElement(SongbirdModule.ReportAudioPopup)
		}),
		UnibarLeftFrame = UnibarModule and Right == Enum.HorizontalAlignment.Left and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, YOffset),
			Position = _UDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			JoinVoiceBinder = if EnabledResult1 and JoinVoiceBinderModule then RoactModule.createElement(JoinVoiceBinderModule) else nil,
			PartyMicBinder = if EnabledResult1 and GetFFlagEnableCrossExpVoiceFunction() then RoactModule.createElement(PartyMicBinderModule) else nil,
			ChromeAnalytics = if AnalyticsModule then RoactModule.createElement(AnalyticsModule) else nil,
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ScaledPaddingTop),
				PaddingBottom = UDim.new(0, ScaledPaddingBottom),
				PaddingLeft = UDim.new(0, ScaledPaddingLeft)
			}),
			TopBarLeftContainer = FFlagAddTraversalBackButton and ReactModule.createElement(View, { tag = "row gap-xsmall auto-xy" }, {
				TraversalBackButton = if IsInExperienceUIVREnabled and IsSpatialFunction() then nil else ReactModule.createElement(TraversalBackButtonModule),
				UnibarFrame = p1:renderUnibarFrame(EnabledResult1)
			}),
			Unibar = if FFlagAddTraversalBackButton then nil else p1:renderUnibarFrame(EnabledResult1),
			HealthBar = if EnabledResult then RoactModule.createElement(HealthBarModule, {}) else nil,
			AssistantBuildPillMenu = if FFlagAppNavMyStatsTab and (BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then ReactModule.createElement(BuildPillMenuPortalHost, {
				position = UDim2.new(1, 0, 0, 0),
				anchorPoint = Vector2.new(1, 0)
			}) else nil,
			StackedElements = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = p1.unibarRightSidePosition,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, ScaledScreenSideOffset1) }),
				Layout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, ScaledTopBarPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ShopGlobalIcon = if FFlagEnableInExperienceShop1 and p1.state.shopGlobalIconEnabled then RoactModule.createElement(ShopGlobalIcon, {
					layoutOrder = 1,
					buttonSize = ConstantsModule3.TopBarButtonHeight * p1.state.UiScale,
					leftGap = ScaledTopBarPadding,
					showStatusIndicator = p1.state.shopGlobalStatusIndicatorEnabled,
					onActivated = p1.onShopGlobalIconActivated,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
					isActive = p1.state.shopGlobalIconIsActive,
					icon = if FFlagExperienceShopNewIconography or (not Callback or not p1.shopIsActiveMappedSignal) then nil else Callback("BuildingStore", nil, p1.shopIsActiveMappedSignal)
				}) else nil,
				HealthBar = if EnabledResult then nil else RoactModule.createElement(HealthBarModule, { layoutOrder = 10 }),
				VoiceBetaBadge = if GetFFlagBetaBadgeModule() and DisplayBetaBadge then RoactModule.createElement(VoiceBetaBadgeModule, { layoutOrder = 6, Analytics = Analytics.new() }) else nil
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
			LeftFrame = if EnabledResult1 then RoactModule.createElement("Frame", {
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
				Blank = EnabledResult1 and RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, ScaledExtendedSize, 0, 1)
				}),
				MenuIcon = not IsNewTiltIconEnabledModule() and RoactModule.createElement(MenuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p1.props.showBadgeOver12,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = if EnabledResult1 then nil else RoactModule.createElement(ChatIconModule, { layoutOrder = 3 }) or nil,
				VoiceBetaBadge = if NoEnabledResult1 and DisplayBetaBadge then RoactModule.createElement(VoiceBetaBadgeModule, { layoutOrder = 4, Analytics = Analytics.new() }) else nil
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
				Blank = EnabledResult1 and RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, ScaledExtendedSize, 0, 1)
				}),
				MenuIcon = not IsNewTiltIconEnabledModule() and RoactModule.createElement(MenuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p1.props.showBadgeOver12,
					onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = if EnabledResult1 then nil else RoactModule.createElement(ChatIconModule, { layoutOrder = 3 }) or nil,
				VoiceBetaBadge = if NoEnabledResult1 and DisplayBetaBadge then RoactModule.createElement(VoiceBetaBadgeModule, { layoutOrder = 4, Analytics = Analytics.new() }) else nil
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

local function mapStateToProps(p1)
	-- upvalues: FFlagTopBarSignalizeMenuOpen (copy)
	return if FFlagTopBarSignalizeMenuOpen then nil else {
		menuOpen = p1.displayOptions.menuOpen,
		inspectMenuOpen = p1.displayOptions.inspectMenuOpen
	}
end

return RoactRoduxModule.UNSTABLE_connect2(if FFlagTopBarSignalizeMenuOpen then nil else mapStateToProps, function(Callback)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), SetScreenSizeModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return {
		setScreenSize = if FFlagTopBarSignalizeScreenSize then nil else function(p1)
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			return Callback(SetScreenSizeModule(p1))
		end,
		setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2, p3)
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1)
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end)((TopBarAppPolicyModule.connect(function(p1, _)
	return {
		displayBetaBadge = p1.getDisplayVoiceBetaBadge(),
		showBadgeOver12 = p1.showBadgeOver12()
	}
end)(TopBarApp)))