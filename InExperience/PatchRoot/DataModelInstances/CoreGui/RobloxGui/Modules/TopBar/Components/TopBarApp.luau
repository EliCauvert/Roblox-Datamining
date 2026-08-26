local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("Players")
local VRService = game:GetService("VRService")
local textChatService = game:GetService("TextChatService")
local tweenService = game:GetService("TweenService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local foundationModule = require(corePackagesService.Packages.Foundation)
local image = foundationModule.Image
local view = foundationModule.View
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactable = UIBloxModule.Core.Control.Interactable
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local fFlagCoreUiMigrateUIBloxToFoundation = sharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/controls/close-ingame" else UIBloxModule.App.ImageSet.Images["icons/controls/close-ingame"]
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local songbirdModule = require(corePackagesService.Workspace.Packages.Songbird)
local traversal = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local stores = coreGuiCommonModule.Stores
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local presentation = script.Parent.Presentation
local buildPillMenuPortalHost = buildExperienceModule.BuildPillMenuPortalHost
local menuIconModule = require(presentation.MenuIcon)
local chatIconModule = require(presentation.ChatIcon)
local moreMenuModule = require(presentation.MoreMenu)
local healthBarModule = require(presentation.HealthBar)
local hurtOverlayModule = require(presentation.HurtOverlay)
local gamepadNavigationDialogModule = require(presentation.GamepadNavigationDialog)
local headsetMenuModule = require(presentation.HeadsetMenu)
local headsetDisconnectDialog = coreGuiCommonModule.Components.HeadsetDisconnectDialog
local playtestModeTooltipModule = require(presentation.PlaytestModeTooltip)
local unpublishedPlaytestModeTooltip = buildExperienceModule.UnpublishedPlaytestModeTooltip
local traversalBackButtonModule = require(script.Parent.TraversalBackButton)
local chrome = script.Parent.Parent.Parent.Chrome
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local playtestModeThemeProviderModule = require(chrome.ChromeShared.Unibar.PlaytestModeThemeProvider)
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode
local fIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant
local UILessTooltipDuration = game:DefineFastInt("UILessTooltipDuration", 10)
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local fFlagTopBarSignalizeScreenSize = coreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local fFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton
local useNewHeadsetDisconnectDialog = game:DefineFastFlag("UseNewHeadsetDisconnectDialog", false)
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local fFlagEnableInExperienceShop = inExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagCenterInExperienceShopWindow = inExperienceShopModule.FFlagCenterInExperienceShopWindow
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopGlobalIcon = inExperienceShopModule.ShopGlobalIcon
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local unibarModule = nil
local keepOutAreasHandlerModule = nil
local analyticsModule = nil

if enabled() then
	unibarModule = require(chrome.ChromeShared.Unibar)
end
if game:GetEngineFeature("InGameChromeSignalAPI") then
	keepOutAreasHandlerModule = require(chrome.ChromeShared.Service.KeepOutAreasHandler)
	
	if enabled() then
		analyticsModule = require(chrome.ChromeShared.Analytics)
	end
end
local localStoreModule = nil
local constantsModule_1 = nil
local commonIconModule = nil

if enabled() then
	localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
	constantsModule_1 = require(chrome.ChromeShared.Unibar.Constants)
	
	if fFlagEnableInExperienceShop then
		commonIconModule = require(chrome.Integrations.CommonIcon)
	end
end
local connectionModule = require(script.Parent.Connection)
local parent = presentation.Parent.Parent
local constantsModule_2 = require(parent.Constants)
local setScreenSizeModule = require(parent.Actions.SetScreenSize)
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local var2 = if enabled() and fFlagEnableConsoleExpControls then require(script.Parent.MenuIconContext) else nil
local gamepadMenuModule = nil
local gamepadConnectorModule = nil
local fFlagAddMenuNavigationToggleDialog = nil
local menuNavigationToggleDialogModule = nil

if enabled() and fFlagEnableConsoleExpControls then
	gamepadConnectorModule = require(script.Parent.GamepadConnector)
	fFlagAddMenuNavigationToggleDialog = sharedFlagsModule.FFlagAddMenuNavigationToggleDialog
	menuNavigationToggleDialogModule = require(presentation.GamepadMenu.MenuNavigationToggleDialog)
else
	gamepadMenuModule = require(presentation.GamepadMenu)
end
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local isNewTiltIconEnabledModule = require(robloxGui.Modules.isNewTiltIconEnabled)
local fFlagGamepadNavigationDialogABTestModule = require(parent.Flags.FFlagGamepadNavigationDialogABTest)
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local partyMicBinderModule = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder)
local var3 = if game:GetEngineFeature("VoiceChatSupported") and sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and enabled() then require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder) else nil
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local topBarAppPolicyModule = require(script.Parent.Parent.TopBarAppPolicy)
local var4 = enabled()
local var5 = if isInExperienceUIVREnabled and enabled() then require(script.Parent.VRBottomUnibar) else require(robloxGui.Modules.VR.VRBottomBar.VRBottomBar)

local function _(p1)
	return p1.displayOptions.menuOpen or p1.displayOptions.inspectMenuOpen
end

local _ = function()
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

local topBarApp = roactModule.PureComponent:extend("TopBarApp")
topBarApp.validateProps = tModule.strictInterface({
	menuOpen = if fFlagTopBarSignalizeMenuOpen then nil else tModule.optional(tModule.boolean),
	inspectMenuOpen = if fFlagTopBarSignalizeMenuOpen then nil else tModule.optional(tModule.boolean),
	setScreenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.callback,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	showGameAgeRating = tModule.optional(tModule.boolean)
})

function topBarApp.init(p1)
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref), fFlagAddUILessMode (ref), stores (ref), fIntAddUILessModeVariant (ref), tweenService (ref), localStoreModule (write), constantsModule_1 (write), UILessTooltipDuration (ref), settingsHubModule (ref), constantsModule (ref), contextActionService (ref), fFlagTopBarSignalizeMenuOpen (ref), settingsShowSignal (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), enabled (ref), chrome (ref), fFlagEnableConsoleExpControls (ref), gamepadConnectorModule (write), reactModule (ref), fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref), fFlagCenterInExperienceShopWindow (ref), textChatService (ref)
	local var6, var7 = roactModule.createBinding(UDim2.new())
	p1.unibarRightSidePosition = var6
	p1.setUnibarRightSidePosition = var7
	local var8, var9 = roactModule.createBinding(false)
	p1.closeButtonState = var8
	p1.setCloseButtonState = var9
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if fFlagAddUILessMode then
		p1.uiLessStore = stores.GetUILessStore(false)
		
		if fIntAddUILessModeVariant ~= 0 then
			local var10, var11 = roactModule.createBinding(false)
			p1.uiLessTooltipVisible = var10
			p1.setUILessTooltipVisible = var11
			local var12, var13 = roactModule.createBinding(0)
			p1.uiLessTooltipTransparency = var12
			p1.setUILessTooltipTransparency = var13
			
			function p1.fadeOutUILessTooltip()
				-- upvalues: p1 (ref), tweenService (copy)
				local numberValue = Instance.new("NumberValue")
				numberValue.Value = 0
				numberValue:GetPropertyChangedSignal("Value"):Connect(function()
					-- upvalues: p1 (copy), numberValue (ref)
					p1.setUILessTooltipTransparency(numberValue.Value)
				end)
				p1.uiLessTooltipTween = tweenService:Create(numberValue, TweenInfo.new(0.5), { Value = 1 })
				p1.uiLessTooltipTween.Completed:Connect(function()
					-- upvalues: p1 (copy)
					p1.setUILessTooltipVisible(false)
					p1.uiLessTooltipTween = nil
				end)
				p1.uiLessTooltipTween:Play()
			end
			
			function p1.cleanupUILessTooltip()
				-- upvalues: p1 (ref)
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
				local var14 = true
				
				if localStoreModule then
					local numExperiencesUserSeenUILessTooltipKey2 = localStoreModule.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0
					var14 = numExperiencesUserSeenUILessTooltipKey2 < constantsModule_1.MAX_NUM_UNIVERSES_SHOWN
					
					if var14 then
						localStoreModule.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", numExperiencesUserSeenUILessTooltipKey2 + 1)
					end
				end
				if var14 then
					p1.setUILessTooltipVisible(true)
					p1.uiLessTooltipTimer = task.delay(UILessTooltipDuration, function()
						-- upvalues: p1 (ref)
						p1.fadeOutUILessTooltip()
						p1.uiLessTooltipTimer = nil
					end)
				end
			end
			contextActionService:BindCoreAction("ToggleUILess", function(_, p2)
				-- upvalues: p1 (ref), fIntAddUILessModeVariant (copy), settingsHubModule (copy), constantsModule (copy)
				if p2 ~= Enum.UserInputState.Begin then return end
				if p1.uiLessStore.getUILessModeEnabled(false) then
					if fIntAddUILessModeVariant == 1 then
						p1.uiLessStore.setUIVisible(function(p3)
							-- upvalues: settingsHubModule (copy), constantsModule (copy)
							if p3 == settingsHubModule:GetVisibility() then
								settingsHubModule:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
							end
							return not p3
						end)
						p1.cleanupUILessTooltip()
						p1.setUILessTooltipVisible(false)
						
						return
					elseif fIntAddUILessModeVariant ~= 2 then return end
					p1.uiLessStore.setUIVisible(function(p3)
						return not p3
					end)
					
					if settingsHubModule:GetVisibility() then
						settingsHubModule:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
					end
					p1.cleanupUILessTooltip()
					p1.setUILessTooltipVisible(false)
					
					return
				else
					settingsHubModule:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
				end
			end, false, Enum.KeyCode.Escape)
		end
	end
	if fFlagTopBarSignalizeMenuOpen then
		local var15, var16 = roactModule.createBinding(false)
		p1.tiltMenuOpen = var15
		p1.setTiltMenuOpen = var16
		local var17, var18 = roactModule.createBinding(false)
		p1.inspectMenuOpen = var17
		p1.setInspectMenuOpen = var18
		p1.inspectMenuDisposeEffect = signalsModule.createEffect(function(p2)
			-- upvalues: stores (copy), p1 (ref)
			p1.setInspectMenuOpen(stores.GetInspectAndBuyStore(p2).getInspectAndBuyOpen(p2))
		end)
		settingsShowSignal:connect(function(p2)
			-- upvalues: p1 (ref)
			p1.setTiltMenuOpen(p2)
		end)
	end
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	function p1.onCloseBtnStateChange(_, p2)
		-- upvalues: p1 (ref)
		p1.setCloseButtonState(p2)
	end
	
	if enabled() then
		local serviceModule = require(chrome.Service)
		p1:setState({ unibarAlignment = serviceModule:orderAlignment():get() })
		
		if fFlagEnableConsoleExpControls then
			p1.GamepadConnector = gamepadConnectorModule
		end
		if fFlagEnableConsoleExpControls then
			p1.unibarMenuRef = reactModule.createRef()
			p1.menuIconRef = roactModule.createRef()
		end
		if fFlagEnableInExperienceShop then
			p1.shopGlobalIconDisposeEffect = signalsModule.createEffect(function(p2)
				-- upvalues: inExperienceShopModule (copy), p1 (ref)
				local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
				
				if getShopGlobalIconStore then
					local var19 = getShopGlobalIconStore(p2)
					p1:setState({
						shopGlobalIconEnabled = var19.getEnabled(p2),
						shopGlobalStatusIndicatorEnabled = var19.getStatusIndicatorEnabled(p2)
					})
					
					return
				end
			end)
			
			function p1.onShopGlobalIconActivated()
				-- upvalues: fFlagCenterInExperienceShopWindow (copy), chrome (copy), serviceModule (ref), constantsModule_1 (copy)
				if fFlagCenterInExperienceShopWindow then
					require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
					
					return
				end
				serviceModule:toggleWindow(constantsModule_1.IN_EXPERIENCE_SHOP_ID)
			end
			
			p1.shopGlobalIconCleanup = inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon()
			p1.shopIsActiveMappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(serviceModule:onIntegrationStatusChanged(), function()
				-- upvalues: serviceModule (ref), constantsModule_1 (copy)
				return serviceModule:isWindowOpen(constantsModule_1.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p1:setState({ chatVersion = textChatService.ChatVersion })
	
	if not game:IsLoaded() then
		game.Loaded:Connect(function()
			-- upvalues: p1 (ref), textChatService (copy)
			p1:setState({ chatVersion = textChatService.ChatVersion })
		end)
	end
end

function topBarApp.didMount(p1)
	-- upvalues: enabled (ref), chrome (ref), fFlagEnableInExperienceShop (ref), constantsModule_1 (write), fFlagEnableConsoleExpControls (ref), isSpatial (ref), VRService (ref)
	if enabled() then
		local serviceModule = require(chrome.Service)
		p1.orderAlignmentConnection = serviceModule:orderAlignment():connect(function()
			-- upvalues: p1 (ref), serviceModule (ref)
			p1:setState({ unibarAlignment = serviceModule:orderAlignment():get() })
		end)
		
		if fFlagEnableInExperienceShop then
			p1.shopIsActiveConnection = serviceModule:onIntegrationStatusChanged():connect(function()
				-- upvalues: p1 (ref), serviceModule (ref), constantsModule_1 (copy)
				p1:setState({
					shopGlobalIconIsActive = serviceModule:isWindowOpen(constantsModule_1.IN_EXPERIENCE_SHOP_ID)
				})
			end)
		end
		if fFlagEnableConsoleExpControls then
			if not isSpatial() then
				p1.GamepadConnector:connectToTopbar()
			end
			p1.vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: isSpatial (copy), p1 (ref)
				if isSpatial() then
					p1.GamepadConnector:disconnectFromTopbar()
					
					return
				end
				p1.GamepadConnector:connectToTopbar()
			end)
		end
	end
end

function topBarApp.willUnmount(p1)
	-- upvalues: enabled (ref), fFlagEnableConsoleExpControls (ref), fFlagEnableInExperienceShop (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), contextActionService (ref), fFlagTopBarSignalizeMenuOpen (ref), fFlagTopBarSignalizeKeepOutAreas (ref)
	if enabled() then
		if p1.orderAlignmentConnection then
			p1.orderAlignmentConnection:disconnect()
			p1.orderAlignmentConnection = nil
		end
		if fFlagEnableConsoleExpControls then
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
	if fFlagEnableInExperienceShop then
		if enabled() and p1.shopGlobalIconDisposeEffect then
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
	if fFlagAddUILessMode then
		if p1.uiLessStore then
			p1.uiLessStore.cleanup()
		end
		if fIntAddUILessModeVariant ~= 0 then
			p1.cleanupUILessTooltip()
			contextActionService:UnbindCoreAction("ToggleUILess")
		end
	end
	if fFlagTopBarSignalizeMenuOpen then
		if p1.tiltMenuDisposeEffect then
			p1.tiltMenuDisposeEffect()
		end
		if p1.inspectMenuDisposeEffect then
			p1.inspectMenuDisposeEffect()
		end
	end
	if fFlagTopBarSignalizeKeepOutAreas and p1.keepOutAreasStore then
		p1.keepOutAreasStore.cleanup()
	end
end

function topBarApp.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref)
	return withFoundationOrUIBloxStyle(function(p2)
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
		-- upvalues: p1 (ref)
		return p1:renderWithStyle(p2)
	end)
end

function topBarApp.renderUnibarFrame(p1, p2)
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), fFlagEnableConsoleExpControls (ref), reactModule (ref), var2 (ref), unibarModule (write), fFlagTopBarSignalizeKeepOutAreas (ref), roactModule (ref)
	return if isInExperienceUIVREnabled and isSpatial() then nil elseif fFlagEnableConsoleExpControls then reactModule.createElement(var2.Provider, { value = { menuIconRef = p1.menuIconRef } }, {
		reactModule.createElement(unibarModule, {
			layoutOrder = 1,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
			onMinWidthChanged = function(a)
				-- upvalues: p1 (ref)
				p1.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
			end,
			menuRef = if p2 then p1.unibarMenuRef else nil
		})
	}) else roactModule.createElement(unibarModule, {
		layoutOrder = 1,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
		onMinWidthChanged = function(a)
			-- upvalues: p1 (ref)
			p1.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
		end
	})
end

function topBarApp.renderWithStyle(p1, p2)
	-- upvalues: enabled (ref), constantsModule_2 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), VRService (ref), fFlagEnableInExperienceShop (ref), constantsModule_1 (write), fFlagTopBarSignalizeMenuOpen (ref), tenFootInterfaceModule (ref), roactModule (ref), voiceStateContextModule (ref), var5 (ref), default (ref), isInExperienceUIVREnabled (ref), menuIconModule (ref), fFlagEnableConsoleExpControls (ref), fFlagTopBarSignalizeKeepOutAreas (ref), selectionCursorProvider (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeThemeProviderModule (ref), isSpatial (ref), fFlagTopBarSignalizeScreenSize (ref), connectionModule (ref), playtestModeTooltipModule (ref), fFlagEnableTeamTestLua (ref), unpublishedPlaytestModeTooltip (ref), fFlagEnableUISelector (ref), reactModule (ref), coreGuiCommonModule (ref), gamepadMenuModule (write), fFlagAddMenuNavigationToggleDialog (write), menuNavigationToggleDialogModule (write), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), useNewHeadsetDisconnectDialog (ref), headsetDisconnectDialog (ref), headsetMenuModule (ref), keepOutAreasHandlerModule (write), hurtOverlayModule (ref), fFlagEnableSideSheet (ref), isNewTiltIconEnabledModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), withLocalization (ref), unibarModule (write), isNewInGameMenuEnabledModule (ref), interactable (ref), robloxGui (ref), controlState (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var1 (ref), imageSetButton (ref), songbirdModule (ref), var3 (write), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), analyticsModule (write), fFlagAddTraversalBackButton (ref), view (ref), traversalBackButtonModule (ref), var4 (ref), healthBarModule (ref), buildPillMenuPortalHost (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), commonIconModule (write), chatIconModule (ref), moreMenuModule (ref)
	local var6 = enabled()
	local var7 = if p1.state.unibarAlignment ~= nil then p1.state.unibarAlignment else Enum.HorizontalAlignment.Right
	local var8 = constantsModule_2.ScreenSideOffset * p1.state.UiScale
	local var9 = constantsModule_2.TopBarHeight * p1.state.UiScale
	local var10 = constantsModule_2.TopBarTopMargin * p1.state.UiScale
	local var11 = constantsModule_2.TopBarPadding * p1.state.UiScale
	local var12 = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then var8 elseif fFlagEnableInExperienceShop and p1.state.shopGlobalIconEnabled then 2 * constantsModule_1.UNIBAR_END_PADDING * p1.state.UiScale else var11
	local var13 = constantsModule_2.LegacyCloseMenuIconSize * p1.state.UiScale
	local var14 = constantsModule_2.UnibarFrame.PaddingTop * p1.state.UiScale
	local var15 = constantsModule_2.UnibarFrame.PaddingBottom * p1.state.UiScale
	local var16 = constantsModule_2.UnibarFrame.PaddingLeft * p1.state.UiScale
	local var17 = constantsModule_2.UnibarFrame.ExtendedSize * p1.state.UiScale
	local var18 = if fFlagTopBarSignalizeMenuOpen then p1.tiltMenuOpen else p1.props.menuOpen
	
	if tenFootInterfaceModule:IsEnabled() and not enabled() then
		var8 = constantsModule_2.ScreenSideOffsetTenFoot
		var9 = constantsModule_2.TopBarHeightTenFoot
	end
	local var19 = if fFlagTopBarSignalizeMenuOpen then roactModule.joinBindings({ p1.tiltMenuOpen, p1.inspectMenuOpen }):map(function(p3)
		return not (p3[0] or p3[1])
	end) else not (p1.props.menuOpen or p1.props.inspectMenuOpen)
	local uDim2 = UDim2.new(0, 0, 0, var10)
	local var20 = var9 - var10
	local uDim2_1 = UDim2.new(0, var8, 0, 0)
	local uDim2_2 = UDim2.new(1, -var8, 0, 0)
	local uDim2_3 = UDim2.new(1, -var8, 0, var10)
	local uDim2_4 = UDim2.new(0, 0, 0.5, 0)
	local var21 = roactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p3)
			-- upvalues: roactModule (copy), var5 (copy), default (copy), isInExperienceUIVREnabled (copy), p1 (ref)
			return roactModule.createElement(var5, {
				voiceChatServiceManager = default,
				voiceEnabled = p3.voiceEnabled,
				voiceState = p3.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then p1.props.showGameAgeRating else nil
			})
		end)
	})
	local createElement = roactModule.createElement
	createElement = roactModule.createElement(selectionCursorProvider, {}, {
		Icon = createElement(menuIconModule, {
			layoutOrder = 1,
			iconScale = if fFlagTopBarSignalizeMenuOpen then nil elseif p1.props.menuOpen then constantsModule_2.MenuIconOpenScale else 1,
			showBadgeOver12 = p1.props.showGameAgeRating,
			menuIconRef = if var6 and fFlagEnableConsoleExpControls then p1.menuIconRef else nil,
			unibarMenuRef = if var6 and fFlagEnableConsoleExpControls then p1.unibarMenuRef else nil,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
		})
	})
	
	if fFlagEnablePlaytestModeUnibar then
		createElement = roactModule.createElement(playtestModeThemeProviderModule, nil, { MenuIcon = createElement })
	end
	local var22 = if isInExperienceUIVREnabled then not isSpatial() else true
	local createElement_1 = roactModule.createElement
	local var23 = "ScreenGui"
	local t = {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 6,
		[roactModule.Change.AbsoluteSize] = if fFlagTopBarSignalizeScreenSize then nil else function(p3)
			-- upvalues: p1 (ref)
			p1.props.setScreenSize(p3.AbsoluteSize)
		end
	}
	local t_1 = {
		Connection = roactModule.createElement(connectionModule),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then roactModule.createElement(playtestModeTooltipModule, { anchorRef = p1.unibarMenuRef }) else nil,
		UnpublishedPlaytestTooltip = if fFlagEnableTeamTestLua then roactModule.createElement(unpublishedPlaytestModeTooltip, { anchorRef = p1.unibarMenuRef, isVisible = var19 }) else nil,
		InExperienceUiSelector = if fFlagEnableUISelector then reactModule.createElement(coreGuiCommonModule.Components.InExperienceUiSelector) else nil,
		GamepadMenu = if not fFlagEnableConsoleExpControls then roactModule.createElement(gamepadMenuModule, { chatVersion = p1.state.chatVersion }) else nil,
		MenuNavigationToggleDialog = if var6 and fFlagAddMenuNavigationToggleDialog and fFlagEnableConsoleExpControls then roactModule.createElement(menuNavigationToggleDialogModule, {
			Position = UDim2.fromScale(0.5, 0.1),
			GamepadConnector = if fFlagEnableConsoleExpControls then p1.GamepadConnector else nil
		}) else nil,
		GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then roactModule.createElement(gamepadNavigationDialogModule) else nil,
		HeadsetMenu = if useNewHeadsetDisconnectDialog then roactModule.createElement(headsetDisconnectDialog) else roactModule.createElement(headsetMenuModule),
		VRBottomBar = if VRService.VREnabled then var21 else nil,
		KeepOutAreasHandler = if fFlagTopBarSignalizeKeepOutAreas or not keepOutAreasHandlerModule then nil else roactModule.createElement(keepOutAreasHandlerModule),
		FullScreenFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var19
		}, {
			HurtOverlay = roactModule.createElement(hurtOverlayModule)
		}),
		MenuIconHolder = if fFlagEnableSideSheet or not var22 or not isNewTiltIconEnabledModule() then nil else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var8, 0, var10),
			Size = UDim2.new(1, 0, 0, var20)
		}, { MenuIcon = createElement }),
		UILessTooltip = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 then withLocalization({
			uiLessTooltipTitle = constantsModule_2.LocalizedKeys.UILessTooltipTitle,
			uiLessTooltipDescription = constantsModule_2.LocalizedKeys.UILessTooltipDescription
		})(function(p3)
			-- upvalues: roactModule (copy), p2 (ref), var8 (write), var10 (ref), p1 (ref)
			return roactModule.createElement("Frame", {
				BackgroundColor3 = p2.Tokens.Color.Extended.White.White_100.Color3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, var8, 0, var10),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = p1.uiLessTooltipTransparency,
				Visible = p1.uiLessTooltipVisible,
				ZIndex = 10000,
				[roactModule.Ref] = p1.uiLessTooltip
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p2.Tokens.Size.Size_200),
					PaddingBottom = UDim.new(0, p2.Tokens.Size.Size_200),
					PaddingLeft = UDim.new(0, p2.Tokens.Size.Size_300),
					PaddingRight = UDim.new(0, p2.Tokens.Size.Size_300)
				}),
				Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p2.Tokens.Radius.Small) }),
				VerticalLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, p2.Tokens.Size.Size_100)
				}),
				Title = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Text = p3.uiLessTooltipTitle,
					TextSize = p2.Tokens.FontSize.FontSize_300,
					TextTransparency = p1.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSansBold,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				Description = roactModule.createElement("TextLabel", {
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
		end) else nil
	}
	local var24 = not unibarModule
	
	if var24 then
		var24 = not isNewInGameMenuEnabledModule()
		
		if var24 then
			local var25
			var24 = roactModule.createElement
			local var26 = "Frame"
			local t_2 = {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, var8, 0, 0),
				Size = UDim2.new(1, 0, 0, var9),
				Visible = var18
			}
			local t_3 = {
				CloseMenuButtonRound = unibarModule and (roactModule.createElement(interactable, {
					onStateChanged = p1.onCloseBtnStateChange,
					Visible = not tenFootInterfaceModule:IsEnabled(),
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var13, 0, var13),
					BackgroundColor3 = p2.Theme.Overlay.Color,
					[roactModule.Event.Activated] = function()
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				}, {
					UICorner = var6 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
					Line1 = roactModule.createElement("Frame", {
						Name = "TopLine",
						BorderSizePixel = 0,
						Rotation = 45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = Color3.new(1, 1, 1)
					}),
					Line2 = roactModule.createElement("Frame", {
						Name = "BottomLine",
						BorderSizePixel = 0,
						Rotation = -45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = Color3.new(1, 1, 1)
					}),
					StateOverlayRound = not var6 and roactModule.createElement("Frame", {
						ZIndex = 2,
						BackgroundTransparency = p1.closeButtonState:map(function(p3)
							-- upvalues: controlState (copy), p2 (ref)
							return if p3 == controlState.Pressed then p2.Theme.BackgroundOnPress.Transparency elseif p3 == controlState.Hover then p2.Theme.BackgroundOnHover.Transparency else 1
						end),
						BackgroundColor3 = p1.closeButtonState:map(function(p3)
							-- upvalues: controlState (copy), p2 (ref)
							return if p3 == controlState.Pressed then p2.Theme.BackgroundOnPress.Color elseif p3 == controlState.Hover then p2.Theme.BackgroundOnHover.Color else Color3.new(1, 1, 1)
						end),
						Size = UDim2.fromScale(1, 1)
					}, {
						UICorner = var6 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
					}) or nil
				}) or nil)
			}
			
			if not unibarModule then
				var25 = (if fFlagCoreUiMigrateUIBloxToFoundation then roactModule.createElement(image, {
					Visible = not tenFootInterfaceModule:IsEnabled(),
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var13, 0, var13),
					Image = var1,
					onActivated = function()
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				}) else roactModule.createElement(imageSetButton, {
					Visible = not tenFootInterfaceModule:IsEnabled(),
					BackgroundTransparency = 1,
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var13, 0, var13),
					Image = var1,
					[roactModule.Event.Activated] = function()
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				})) or nil
			end
			t_3.CloseMenuButton = var25
			var24 = var24(var26, t_2, t_3)
		end
	end
	local createElement_2
	t_1.LegacyCloseMenu = var24
	t_1.SongbirdDebugAudio = roactModule.createElement(songbirdModule.DebugAudioEmitters)
	
	if unibarModule and var7 == Enum.HorizontalAlignment.Left then
		createElement_2 = roactModule.createElement
		local var27 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var20),
			Position = uDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}
		local t_3 = {
			JoinVoiceBinder = if var6 and var3 then roactModule.createElement(var3) else nil,
			PartyMicBinder = if var6 and getFFlagEnableCrossExpVoice() then roactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var14),
				PaddingBottom = UDim.new(0, var15),
				PaddingLeft = UDim.new(0, var16)
			})
		}
		local var28 = fFlagAddTraversalBackButton
		
		if var28 then
			var28 = reactModule.createElement
			var28 = var28(view, { tag = "row gap-xsmall auto-xy" }, {
				TraversalBackButton = if isInExperienceUIVREnabled and isSpatial() then nil else reactModule.createElement(traversalBackButtonModule),
				UnibarFrame = p1:renderUnibarFrame(var6)
			})
		end
		local var29
		t_3.TopBarLeftContainer = var28
		t_3.Unibar = if not fFlagAddTraversalBackButton then p1:renderUnibarFrame(var6) else nil
		t_3.HealthBar = if var4 then roactModule.createElement(healthBarModule, {}) else nil
		t_3.AssistantBuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost, {
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0)
		}) else nil
		local createElement_3 = roactModule.createElement
		local var30 = "Frame"
		local t_4 = {
			BackgroundTransparency = 1,
			Position = p1.unibarRightSidePosition,
			Size = UDim2.new(1, 0, 1, 0)
		}
		local t_5 = {
			Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var12) }),
			Layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var11),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if fFlagEnableInExperienceShop and p1.state.shopGlobalIconEnabled then
			var29 = roactModule.createElement
			var29 = var29(shopGlobalIcon, {
				layoutOrder = 1,
				buttonSize = constantsModule_2.TopBarButtonHeight * p1.state.UiScale,
				leftGap = var11,
				showStatusIndicator = p1.state.shopGlobalStatusIndicatorEnabled,
				onActivated = p1.onShopGlobalIconActivated,
				onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea,
				isActive = p1.state.shopGlobalIconIsActive,
				icon = if fFlagExperienceShopNewIconography or not commonIconModule or not p1.shopIsActiveMappedSignal then nil else commonIconModule("BuildingStore", nil, p1.shopIsActiveMappedSignal)
			})
		else
			var29 = nil
		end
		t_5.ShopGlobalIcon = var29
		t_5.HealthBar = if var4 then nil else roactModule.createElement(healthBarModule, { layoutOrder = 10 })
		t_3.StackedElements = createElement_3(var30, t_4, t_5)
		createElement_2 = createElement_2(var27, t_2, t_3) or nil
	end
	local frame
	t_1.UnibarLeftFrame = createElement_2
	t_1.UnibarRightFrame = unibarModule and (var7 ~= Enum.HorizontalAlignment.Right and (roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var20),
		Position = uDim2_3,
		AnchorPoint = Vector2.new(1, 0)
	}, {
		ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
		Padding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var14),
			PaddingBottom = UDim.new(0, var15)
		}),
		Layout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var11),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		HealthBar = roactModule.createElement(healthBarModule, { layoutOrder = 1 }),
		Unibar = roactModule.createElement(unibarModule, {
			layoutOrder = 2,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else p1.props.setKeepOutArea
		})
	}) or nil))
	local createElement_3 = roactModule.createElement
	local var31 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var20),
		Visible = var19,
		Position = uDim2
	}
	local t_3 = {}
	
	if not var6 then
		frame = not tenFootInterfaceModule:IsEnabled() and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, -var8, 1, 0),
			Position = uDim2_1
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var11),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Blank = var6 and roactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var17, 0, 1)
			}),
			MenuIcon = not isNewTiltIconEnabledModule() and roactModule.createElement(menuIconModule, {
				layoutOrder = 1,
				showBadgeOver12 = p1.props.showGameAgeRating,
				onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p1.keepOutAreasStore.setKeepOutArea else nil
			}),
			ChatIcon = not var6 and roactModule.createElement(chatIconModule, { layoutOrder = 3 }) or nil
		})
	end
	local frame_1
	t_3.LeftFrame = frame
	
	if not unibarModule then
		frame_1 = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, -var8, 1, 0),
			Position = uDim2_2,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var11),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			HealthBar = roactModule.createElement(healthBarModule, { layoutOrder = 1 }),
			MoreMenu = not tenFootInterfaceModule:IsEnabled() and roactModule.createElement(moreMenuModule, { layoutOrder = 2 })
		}) or nil
	end
	t_3.RightFrame = frame_1
	t_1.TopBarFrame = createElement_3(var31, t_2, t_3)
	
	return createElement_1(var23, t, t_1)
end

return roactRoduxModule.UNSTABLE_connect2(if fFlagTopBarSignalizeMenuOpen then nil else function(p1)
	-- upvalues: fFlagTopBarSignalizeMenuOpen (ref)
	return if fFlagTopBarSignalizeMenuOpen then nil else {
		menuOpen = p1.displayOptions.menuOpen,
		inspectMenuOpen = p1.displayOptions.inspectMenuOpen
	}
end, function(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), setScreenSizeModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return {
		setScreenSize = if fFlagTopBarSignalizeScreenSize then nil else function(p2)
			-- upvalues: p1 (ref), setScreenSizeModule (copy)
			return p1(setScreenSizeModule(p2))
		end,
		setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2, p3, p4)
			-- upvalues: p1 (ref), setKeepOutAreaModule (copy)
			return p1(setKeepOutAreaModule(p2, p3, p4))
		end,
		removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2)
			-- upvalues: p1 (ref), removeKeepOutAreaModule (copy)
			return p1(removeKeepOutAreaModule(p2))
		end
	}
end)(if fFlagShowGameAgeRating then universalAppPolicyModule.UniversalAppPolicy.connect(function(p1, _)
	return { showGameAgeRating = p1.getShowGameAgeRating() }
end)(topBarApp) else topBarAppPolicyModule.connect(function(p1, _)
	return { showGameAgeRating = p1.showBadgeOver12() }
end)(topBarApp))