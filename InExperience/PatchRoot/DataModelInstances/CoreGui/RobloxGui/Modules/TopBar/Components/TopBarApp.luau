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
local analytics = require(corePackagesService.Workspace.Packages.Analytics).Analytics
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local fFlagCoreUiMigrateUIBloxToFoundation = sharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local var15 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/controls/close-ingame" else UIBloxModule.App.ImageSet.Images["icons/controls/close-ingame"]
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
local voiceBetaBadgeModule = require(presentation.VoiceBetaBadge)
local playtestModeTooltipModule = require(presentation.PlaytestModeTooltip)
local traversalBackButtonModule = require(script.Parent.TraversalBackButton)
local chrome = script.Parent.Parent.Parent.Chrome
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local constantsModule_1 = require(chrome.Integrations.MusicUtility.Constants)
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
local constantsModule_2 = nil
local commonIconModule = nil

if enabled() then
	localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
	constantsModule_2 = require(chrome.ChromeShared.Unibar.Constants)
	
	if fFlagEnableInExperienceShop then
		commonIconModule = require(chrome.Integrations.CommonIcon)
	end
end
local connectionModule = require(script.Parent.Connection)
local parent = presentation.Parent.Parent
local constantsModule_3 = require(parent.Constants)
local setScreenSizeModule = require(parent.Actions.SetScreenSize)
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local var48 = if enabled() and fFlagEnableConsoleExpControls then require(script.Parent.MenuIconContext) else nil
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
local getFFlagBetaBadgeModule = require(robloxGui.Modules.Flags.GetFFlagBetaBadge)
local fFlagGamepadNavigationDialogABTestModule = require(parent.Flags.FFlagGamepadNavigationDialogABTest)
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local partyMicBinderModule = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder)
local var58 = if game:GetEngineFeature("VoiceChatSupported") and sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and enabled() then require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder) else nil
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local topBarAppPolicyModule = require(script.Parent.Parent.TopBarAppPolicy)
local var61 = enabled()
local var62 = if isInExperienceUIVREnabled and enabled() then require(script.Parent.VRBottomUnibar) else require(robloxGui.Modules.VR.VRBottomBar.VRBottomBar)

local function _(p0) --[[ line: 182 | named "selectMenuOpen" ]]
	return p0.displayOptions.menuOpen or p0.displayOptions.inspectMenuOpen
end

local _ = function() --[[ line: 186 | named "canShowAssistantBuild" ]]
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

local topBarApp = roactModule.PureComponent:extend("TopBarApp")
topBarApp.validateProps = tModule.strictInterface({
	menuOpen = if fFlagTopBarSignalizeMenuOpen then nil else tModule.optional(tModule.boolean),
	inspectMenuOpen = if fFlagTopBarSignalizeMenuOpen then nil else tModule.optional(tModule.boolean),
	displayBetaBadge = tModule.boolean,
	setScreenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.callback,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	showBadgeOver12 = tModule.optional(tModule.boolean)
})

function topBarApp.init(p1) --[[ line: 205 ]]
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref), fFlagAddUILessMode (ref), stores (ref), fIntAddUILessModeVariant (ref), tweenService (ref), localStoreModule (write), constantsModule_2 (write), UILessTooltipDuration (ref), settingsHubModule (ref), constantsModule (ref), contextActionService (ref), fFlagTopBarSignalizeMenuOpen (ref), settingsShowSignal (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), enabled (ref), chrome (ref), fFlagEnableConsoleExpControls (ref), gamepadConnectorModule (write), reactModule (ref), fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref), fFlagCenterInExperienceShopWindow (ref), textChatService (ref)
	local var64, var65 = roactModule.createBinding(UDim2.new())
	p1.unibarRightSidePosition = var64
	p1.setUnibarRightSidePosition = var65
	local var66, var67 = roactModule.createBinding(false)
	p1.closeButtonState = var66
	p1.setCloseButtonState = var67
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2) --[[ line: 208 ]]
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if fFlagAddUILessMode then
		p1.uiLessStore = stores.GetUILessStore(false)
		
		if fIntAddUILessModeVariant ~= 0 then
			local var68, var69 = roactModule.createBinding(false)
			p1.uiLessTooltipVisible = var68
			p1.setUILessTooltipVisible = var69
			local var70, var71 = roactModule.createBinding(0)
			p1.uiLessTooltipTransparency = var70
			p1.setUILessTooltipTransparency = var71
			
			function p1.fadeOutUILessTooltip() --[[ line: 222 ]]
				-- upvalues: p1 (ref), tweenService (copy)
				local numberValue = Instance.new("NumberValue")
				numberValue.Value = 0
				numberValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ line: 225 ]]
					-- upvalues: p1 (copy), numberValue (ref)
					p1.setUILessTooltipTransparency(numberValue.Value)
				end)
				p1.uiLessTooltipTween = tweenService:Create(numberValue, TweenInfo.new(0.5), { Value = 1 })
				p1.uiLessTooltipTween.Completed:Connect(function() --[[ line: 232 ]]
					-- upvalues: p1 (copy)
					p1.setUILessTooltipVisible(false)
					p1.uiLessTooltipTween = nil
				end)
				p1.uiLessTooltipTween:Play()
			end
			
			function p1.cleanupUILessTooltip() --[[ line: 240 ]]
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
				local var72 = true
				
				if localStoreModule then
					local numExperiencesUserSeenUILessTooltipKey2 = localStoreModule.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0
					var72 = numExperiencesUserSeenUILessTooltipKey2 < constantsModule_2.MAX_NUM_UNIVERSES_SHOWN
					
					if var72 then
						localStoreModule.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", numExperiencesUserSeenUILessTooltipKey2 + 1)
					end
				end
				if var72 then
					p1.setUILessTooltipVisible(true)
					p1.uiLessTooltipTimer = task.delay(UILessTooltipDuration, function() --[[ line: 269 ]]
						-- upvalues: p1 (ref)
						p1.fadeOutUILessTooltip()
						p1.uiLessTooltipTimer = nil
					end)
				end
			end
			contextActionService:BindCoreAction("ToggleUILess", function(_, p3) --[[ line: 276 ]]
				-- upvalues: p1 (ref), fIntAddUILessModeVariant (copy), settingsHubModule (copy), constantsModule (copy)
				if p3 ~= Enum.UserInputState.Begin then return end
				if p1.uiLessStore.getUILessModeEnabled(false) then
					if fIntAddUILessModeVariant == 1 then
						p1.uiLessStore.setUIVisible(function(p4) --[[ line: 283 ]]
							-- upvalues: settingsHubModule (copy), constantsModule (copy)
							if p4 == settingsHubModule:GetVisibility() then
								settingsHubModule:PopMenu(false, true, constantsModule.AnalyticsMenuOpenTypes.Keyboard)
							end
							return not p4
						end)
						p1.cleanupUILessTooltip()
						p1.setUILessTooltipVisible(false)
						
						return
					elseif fIntAddUILessModeVariant ~= 2 then return end
					p1.uiLessStore.setUIVisible(function(p5) --[[ line: 294 ]]
						return not p5
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
		local var74, var75 = roactModule.createBinding(false)
		p1.tiltMenuOpen = var74
		p1.setTiltMenuOpen = var75
		local var76, var77 = roactModule.createBinding(false)
		p1.inspectMenuOpen = var76
		p1.setInspectMenuOpen = var77
		p1.inspectMenuDisposeEffect = signalsModule.createEffect(function(p6) --[[ line: 316 ]]
			-- upvalues: stores (copy), p1 (ref)
			p1.setInspectMenuOpen(stores.GetInspectAndBuyStore(p6).getInspectAndBuyOpen(p6))
		end)
		settingsShowSignal:connect(function(p7) --[[ line: 321 ]]
			-- upvalues: p1 (ref)
			p1.setTiltMenuOpen(p7)
		end)
	end
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	function p1.onCloseBtnStateChange(_, p8) --[[ line: 330 ]]
		-- upvalues: p1 (ref)
		p1.setCloseButtonState(p8)
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
			p1.shopGlobalIconDisposeEffect = signalsModule.createEffect(function(p9) --[[ line: 349 ]]
				-- upvalues: inExperienceShopModule (copy), p1 (ref)
				local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
				
				if getShopGlobalIconStore then
					local var80 = getShopGlobalIconStore(p9)
					p1:setState({
						shopGlobalIconEnabled = var80.getEnabled(p9),
						shopGlobalStatusIndicatorEnabled = var80.getStatusIndicatorEnabled(p9)
					})
					
					return
				end
			end)
			
			function p1.onShopGlobalIconActivated() --[[ line: 360 ]]
				-- upvalues: fFlagCenterInExperienceShopWindow (copy), chrome (copy), serviceModule (ref), constantsModule_2 (copy)
				if fFlagCenterInExperienceShopWindow then
					require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
					
					return
				end
				serviceModule:toggleWindow(constantsModule_2.IN_EXPERIENCE_SHOP_ID)
			end
			
			p1.shopGlobalIconCleanup = inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon()
			p1.shopIsActiveMappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 371 ]]
				-- upvalues: serviceModule (ref), constantsModule_2 (copy)
				return serviceModule:isWindowOpen(constantsModule_2.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p1:setState({ chatVersion = textChatService.ChatVersion })
	
	if not game:IsLoaded() then
		game.Loaded:Connect(function() --[[ line: 385 ]]
			-- upvalues: p1 (ref), textChatService (copy)
			p1:setState({ chatVersion = textChatService.ChatVersion })
		end)
	end
end

function topBarApp.didMount(p10) --[[ line: 393 ]]
	-- upvalues: enabled (ref), chrome (ref), fFlagEnableInExperienceShop (ref), constantsModule_2 (write), fFlagEnableConsoleExpControls (ref), isSpatial (ref), VRService (ref)
	if enabled() then
		local serviceModule = require(chrome.Service)
		p10.orderAlignmentConnection = serviceModule:orderAlignment():connect(function() --[[ line: 396 ]]
			-- upvalues: p10 (ref), serviceModule (ref)
			p10:setState({ unibarAlignment = serviceModule:orderAlignment():get() })
		end)
		
		if fFlagEnableInExperienceShop then
			p10.shopIsActiveConnection = serviceModule:onIntegrationStatusChanged():connect(function() --[[ line: 403 ]]
				-- upvalues: p10 (ref), serviceModule (ref), constantsModule_2 (copy)
				p10:setState({
					shopGlobalIconIsActive = serviceModule:isWindowOpen(constantsModule_2.IN_EXPERIENCE_SHOP_ID)
				})
			end)
		end
		if fFlagEnableConsoleExpControls then
			if not isSpatial() then
				p10.GamepadConnector:connectToTopbar()
			end
			p10.vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ line: 414 ]]
				-- upvalues: isSpatial (copy), p10 (ref)
				if isSpatial() then
					p10.GamepadConnector:disconnectFromTopbar()
					
					return
				end
				p10.GamepadConnector:connectToTopbar()
			end)
		end
	end
end

function topBarApp.willUnmount(p11) --[[ line: 425 ]]
	-- upvalues: enabled (ref), fFlagEnableConsoleExpControls (ref), fFlagEnableInExperienceShop (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), contextActionService (ref), fFlagTopBarSignalizeMenuOpen (ref), fFlagTopBarSignalizeKeepOutAreas (ref)
	if enabled() then
		if p11.orderAlignmentConnection then
			p11.orderAlignmentConnection:disconnect()
			p11.orderAlignmentConnection = nil
		end
		if fFlagEnableConsoleExpControls then
			if p11.vrEnabledConnection then
				p11.vrEnabledConnection:Disconnect()
				p11.vrEnabledConnection = nil
			end
			p11.GamepadConnector:disconnectFromTopbar()
		end
	end
	if p11.disposeUiScaleEffect then
		p11.disposeUiScaleEffect()
	end
	if fFlagEnableInExperienceShop then
		if enabled() and p11.shopGlobalIconDisposeEffect then
			p11.shopGlobalIconDisposeEffect()
		end
		if p11.shopIsActiveConnection then
			p11.shopIsActiveConnection:disconnect()
			p11.shopIsActiveConnection = nil
		end
		if p11.shopGlobalIconCleanup then
			p11.shopGlobalIconCleanup()
			p11.shopGlobalIconCleanup = nil
		end
	end
	if fFlagAddUILessMode then
		if p11.uiLessStore then
			p11.uiLessStore.cleanup()
		end
		if fIntAddUILessModeVariant ~= 0 then
			p11.cleanupUILessTooltip()
			contextActionService:UnbindCoreAction("ToggleUILess")
		end
	end
	if fFlagTopBarSignalizeMenuOpen then
		if p11.tiltMenuDisposeEffect then
			p11.tiltMenuDisposeEffect()
		end
		if p11.inspectMenuDisposeEffect then
			p11.inspectMenuDisposeEffect()
		end
	end
	if fFlagTopBarSignalizeKeepOutAreas and p11.keepOutAreasStore then
		p11.keepOutAreasStore.cleanup()
	end
end

function topBarApp.render(p12) --[[ line: 487 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref)
	return withFoundationOrUIBloxStyle(function(p13) --[[ line: 488 ]]
		return {
			Theme = {
				Overlay = {
					Color = p13.Color.Common.Scrim.Color3,
					Transparency = p13.Color.Common.Scrim.Transparency
				},
				BackgroundOnHover = {
					Color = p13.Color.State.Hover.Color3,
					Transparency = p13.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p13.Color.State.Press.Color3,
					Transparency = p13.Color.State.Press.Transparency
				}
			},
			Tokens = {
				Color = {
					Extended = {
						White = { White_100 = p13.Color.Extended.White.White_100 }
					}
				},
				Size = {
					Size_100 = p13.Size.Size_100,
					Size_200 = p13.Size.Size_200,
					Size_300 = p13.Size.Size_300
				},
				Radius = { Small = p13.Radius.Small },
				FontSize = { FontSize_300 = p13.FontSize.FontSize_300 },
				Global = {
					Color = { White = p13.Color.Extended.White.White_100 },
					Space_50 = p13.Size.Size_100,
					Space_100 = p13.Size.Size_200,
					Space_150 = p13.Size.Size_300,
					FontSize_50 = p13.FontSize.FontSize_300
				},
				Semantic = { Radius = { Small = p13.Radius.Small } }
			}
		}
	end, function(p14) --[[ line: 539 ]]
		-- upvalues: p12 (ref)
		return p12:renderWithStyle(p14)
	end)
end

function topBarApp.renderUnibarFrame(p15, p16) --[[ line: 544 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), fFlagEnableConsoleExpControls (ref), reactModule (ref), var48 (ref), unibarModule (write), fFlagTopBarSignalizeKeepOutAreas (ref), roactModule (ref)
	return if isInExperienceUIVREnabled and isSpatial() then nil elseif fFlagEnableConsoleExpControls then reactModule.createElement(var48.Provider, { value = { menuIconRef = p15.menuIconRef } }, {
		reactModule.createElement(unibarModule, {
			layoutOrder = 1,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p15.keepOutAreasStore.setKeepOutArea else p15.props.setKeepOutArea,
			onMinWidthChanged = function(a) --[[ line: 558 ]]
				-- upvalues: p15 (ref)
				p15.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
			end,
			menuRef = if p16 then p15.unibarMenuRef else nil
		})
	}) else roactModule.createElement(unibarModule, {
		layoutOrder = 1,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p15.keepOutAreasStore.setKeepOutArea else p15.props.setKeepOutArea,
		onMinWidthChanged = function(a) --[[ line: 570 ]]
			-- upvalues: p15 (ref)
			p15.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
		end
	})
end

function topBarApp.renderWithStyle(p17, p18) --[[ line: 577 ]]
	-- upvalues: enabled (ref), getFFlagBetaBadgeModule (ref), constantsModule_3 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), VRService (ref), fFlagEnableInExperienceShop (ref), constantsModule_2 (write), fFlagTopBarSignalizeMenuOpen (ref), tenFootInterfaceModule (ref), roactModule (ref), voiceStateContextModule (ref), var62 (ref), default (ref), isInExperienceUIVREnabled (ref), menuIconModule (ref), fFlagEnableConsoleExpControls (ref), fFlagTopBarSignalizeKeepOutAreas (ref), selectionCursorProvider (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeThemeProviderModule (ref), isSpatial (ref), fFlagTopBarSignalizeScreenSize (ref), connectionModule (ref), playtestModeTooltipModule (ref), fFlagEnableUISelector (ref), reactModule (ref), coreGuiCommonModule (ref), gamepadMenuModule (write), fFlagAddMenuNavigationToggleDialog (write), menuNavigationToggleDialogModule (write), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), useNewHeadsetDisconnectDialog (ref), headsetDisconnectDialog (ref), headsetMenuModule (ref), keepOutAreasHandlerModule (write), hurtOverlayModule (ref), fFlagEnableSideSheet (ref), isNewTiltIconEnabledModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), withLocalization (ref), unibarModule (write), isNewInGameMenuEnabledModule (ref), interactable (ref), robloxGui (ref), controlState (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var15 (ref), imageSetButton (ref), songbirdModule (ref), constantsModule_1 (ref), var58 (write), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), analyticsModule (write), fFlagAddTraversalBackButton (ref), view (ref), traversalBackButtonModule (ref), var61 (ref), healthBarModule (ref), buildPillMenuPortalHost (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), commonIconModule (write), voiceBetaBadgeModule (ref), analytics (ref), chatIconModule (ref), moreMenuModule (ref)
	local var82 = enabled()
	local var83 = getFFlagBetaBadgeModule() and not var82
	local displayBetaBadge = p17.props.displayBetaBadge
	local var84 = if p17.state.unibarAlignment ~= nil then p17.state.unibarAlignment else Enum.HorizontalAlignment.Right
	local var85 = constantsModule_3.ScreenSideOffset * p17.state.UiScale
	local var86 = constantsModule_3.TopBarHeight * p17.state.UiScale
	local var87 = constantsModule_3.TopBarTopMargin * p17.state.UiScale
	local var88 = constantsModule_3.TopBarPadding * p17.state.UiScale
	local var89 = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then var85 elseif fFlagEnableInExperienceShop and p17.state.shopGlobalIconEnabled then 2 * constantsModule_2.UNIBAR_END_PADDING * p17.state.UiScale else var88
	local var90 = constantsModule_3.LegacyCloseMenuIconSize * p17.state.UiScale
	local var91 = constantsModule_3.UnibarFrame.PaddingTop * p17.state.UiScale
	local var92 = constantsModule_3.UnibarFrame.PaddingBottom * p17.state.UiScale
	local var93 = constantsModule_3.UnibarFrame.PaddingLeft * p17.state.UiScale
	local var94 = constantsModule_3.UnibarFrame.ExtendedSize * p17.state.UiScale
	local var95 = if fFlagTopBarSignalizeMenuOpen then p17.tiltMenuOpen else p17.props.menuOpen
	
	if tenFootInterfaceModule:IsEnabled() and not enabled() then
		var85 = constantsModule_3.ScreenSideOffsetTenFoot
		var86 = constantsModule_3.TopBarHeightTenFoot
	end
	local var96 = if fFlagTopBarSignalizeMenuOpen then roactModule.joinBindings({ p17.tiltMenuOpen, p17.inspectMenuOpen }):map(function(p19) --[[ line: 611 ]]
		return not (p19[0] or p19[1])
	end) else not (p17.props.menuOpen or p17.props.inspectMenuOpen)
	local uDim2 = UDim2.new(0, 0, 0, var87)
	local var98 = var86 - var87
	local uDim2_1 = UDim2.new(0, var85, 0, 0)
	local uDim2_2 = UDim2.new(1, -var85, 0, 0)
	local uDim2_3 = UDim2.new(1, -var85, 0, var87)
	local uDim2_4 = UDim2.new(0, 0, 0.5, 0)
	local var103 = roactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p20) --[[ line: 625 ]]
			-- upvalues: roactModule (copy), var62 (copy), default (copy), isInExperienceUIVREnabled (copy), p17 (ref)
			return roactModule.createElement(var62, {
				voiceChatServiceManager = default,
				voiceEnabled = p20.voiceEnabled,
				voiceState = p20.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then p17.props.showBadgeOver12 else nil
			})
		end)
	})
	local createElement = roactModule.createElement
	createElement = roactModule.createElement(selectionCursorProvider, {}, {
		Icon = createElement(menuIconModule, {
			layoutOrder = 1,
			iconScale = if fFlagTopBarSignalizeMenuOpen then nil elseif p17.props.menuOpen then constantsModule_3.MenuIconOpenScale else 1,
			showBadgeOver12 = p17.props.showBadgeOver12,
			menuIconRef = if var82 and fFlagEnableConsoleExpControls then p17.menuIconRef else nil,
			unibarMenuRef = if var82 and fFlagEnableConsoleExpControls then p17.unibarMenuRef else nil,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p17.keepOutAreasStore.setKeepOutArea else nil
		})
	})
	
	if fFlagEnablePlaytestModeUnibar then
		createElement = roactModule.createElement(playtestModeThemeProviderModule, nil, { MenuIcon = createElement })
	end
	local var104 = if isInExperienceUIVREnabled then not isSpatial() else true
	local createElement_1 = roactModule.createElement
	local var105 = "ScreenGui"
	local t = {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 6,
		[roactModule.Change.AbsoluteSize] = if fFlagTopBarSignalizeScreenSize then nil else function(p21) --[[ line: 669 ]]
			-- upvalues: p17 (ref)
			p17.props.setScreenSize(p21.AbsoluteSize)
		end
	}
	local t_1 = {
		Connection = roactModule.createElement(connectionModule),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then roactModule.createElement(playtestModeTooltipModule, { anchorRef = p17.unibarMenuRef }) else nil,
		InExperienceUiSelector = if fFlagEnableUISelector then reactModule.createElement(coreGuiCommonModule.Components.InExperienceUiSelector) else nil,
		GamepadMenu = if not fFlagEnableConsoleExpControls then roactModule.createElement(gamepadMenuModule, { chatVersion = p17.state.chatVersion }) else nil,
		MenuNavigationToggleDialog = if var82 and fFlagAddMenuNavigationToggleDialog and fFlagEnableConsoleExpControls then roactModule.createElement(menuNavigationToggleDialogModule, {
			Position = UDim2.fromScale(0.5, 0.1),
			GamepadConnector = if fFlagEnableConsoleExpControls then p17.GamepadConnector else nil
		}) else nil,
		GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then roactModule.createElement(gamepadNavigationDialogModule) else nil,
		HeadsetMenu = if useNewHeadsetDisconnectDialog then roactModule.createElement(headsetDisconnectDialog) else roactModule.createElement(headsetMenuModule),
		VRBottomBar = if VRService.VREnabled then var103 else nil,
		KeepOutAreasHandler = if fFlagTopBarSignalizeKeepOutAreas or not keepOutAreasHandlerModule then nil else roactModule.createElement(keepOutAreasHandlerModule),
		FullScreenFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var96
		}, {
			HurtOverlay = roactModule.createElement(hurtOverlayModule)
		}),
		MenuIconHolder = if fFlagEnableSideSheet or not var104 or not isNewTiltIconEnabledModule() then nil else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var85, 0, var87),
			Size = UDim2.new(1, 0, 0, var98)
		}, { MenuIcon = createElement }),
		UILessTooltip = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 then withLocalization({
			uiLessTooltipTitle = constantsModule_3.LocalizedKeys.UILessTooltipTitle,
			uiLessTooltipDescription = constantsModule_3.LocalizedKeys.UILessTooltipDescription
		})(function(p22) --[[ line: 728 ]]
			-- upvalues: roactModule (copy), p18 (ref), var85 (write), var87 (ref), p17 (ref)
			return roactModule.createElement("Frame", {
				BackgroundColor3 = p18.Tokens.Color.Extended.White.White_100.Color3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, var85, 0, var87),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = p17.uiLessTooltipTransparency,
				Visible = p17.uiLessTooltipVisible,
				ZIndex = 10000,
				[roactModule.Ref] = p17.uiLessTooltip
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p18.Tokens.Size.Size_200),
					PaddingBottom = UDim.new(0, p18.Tokens.Size.Size_200),
					PaddingLeft = UDim.new(0, p18.Tokens.Size.Size_300),
					PaddingRight = UDim.new(0, p18.Tokens.Size.Size_300)
				}),
				Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p18.Tokens.Radius.Small) }),
				VerticalLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, p18.Tokens.Size.Size_100)
				}),
				Title = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Text = p22.uiLessTooltipTitle,
					TextSize = p18.Tokens.FontSize.FontSize_300,
					TextTransparency = p17.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSansBold,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				Description = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Text = p22.uiLessTooltipDescription,
					TextSize = p18.Tokens.FontSize.FontSize_300,
					TextTransparency = p17.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSans,
					AutomaticSize = Enum.AutomaticSize.XY
				})
			})
		end) else nil
	}
	local var108 = not unibarModule
	
	if var108 then
		var108 = not isNewInGameMenuEnabledModule()
		
		if var108 then
			local var112
			var108 = roactModule.createElement
			local var109 = "Frame"
			local t_2 = {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, var85, 0, 0),
				Size = UDim2.new(1, 0, 0, var86),
				Visible = var95
			}
			local t_3 = {
				CloseMenuButtonRound = unibarModule and (roactModule.createElement(interactable, {
					onStateChanged = p17.onCloseBtnStateChange,
					Visible = not tenFootInterfaceModule:IsEnabled(),
					BackgroundTransparency = p18.Theme.Overlay.Transparency,
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var90, 0, var90),
					BackgroundColor3 = p18.Theme.Overlay.Color,
					[roactModule.Event.Activated] = function() --[[ line: 792 ]]
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				}, {
					UICorner = var82 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
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
					StateOverlayRound = not var82 and roactModule.createElement("Frame", {
						ZIndex = 2,
						BackgroundTransparency = p17.closeButtonState:map(function(p23) --[[ line: 822 ]]
							-- upvalues: controlState (copy), p18 (ref)
							return if p23 == controlState.Pressed then p18.Theme.BackgroundOnPress.Transparency elseif p23 == controlState.Hover then p18.Theme.BackgroundOnHover.Transparency else 1
						end),
						BackgroundColor3 = p17.closeButtonState:map(function(p24) --[[ line: 831 ]]
							-- upvalues: controlState (copy), p18 (ref)
							return if p24 == controlState.Pressed then p18.Theme.BackgroundOnPress.Color elseif p24 == controlState.Hover then p18.Theme.BackgroundOnHover.Color else Color3.new(1, 1, 1)
						end),
						Size = UDim2.fromScale(1, 1)
					}, {
						UICorner = var82 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
					}) or nil
				}) or nil)
			}
			
			if not unibarModule then
				var112 = (if fFlagCoreUiMigrateUIBloxToFoundation then roactModule.createElement(image, {
					Visible = not tenFootInterfaceModule:IsEnabled(),
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var90, 0, var90),
					Image = var15,
					onActivated = function() --[[ line: 856 ]]
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				}) else roactModule.createElement(imageSetButton, {
					Visible = not tenFootInterfaceModule:IsEnabled(),
					BackgroundTransparency = 1,
					Position = uDim2_4,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, var90, 0, var90),
					Image = var15,
					[roactModule.Event.Activated] = function() --[[ line: 868 ]]
						-- upvalues: robloxGui (copy)
						require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				})) or nil
			end
			t_3.CloseMenuButton = var112
			var108 = var108(var109, t_2, t_3)
		end
	end
	local createElement_2
	t_1.LegacyCloseMenu = var108
	t_1.SongbirdDebugAudio = roactModule.createElement(songbirdModule.DebugAudioEmitters)
	t_1.SongbirdReportAudioFrame = enabled() and roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, 0, 0, constantsModule_1.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
	}, {
		ReportAudioPopup = roactModule.createElement(songbirdModule.ReportAudioPopup)
	})
	
	if unibarModule and var84 == Enum.HorizontalAlignment.Left then
		createElement_2 = roactModule.createElement
		local var113 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var98),
			Position = uDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}
		local t_3 = {
			JoinVoiceBinder = if var82 and var58 then roactModule.createElement(var58) else nil,
			PartyMicBinder = if var82 and getFFlagEnableCrossExpVoice() then roactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var91),
				PaddingBottom = UDim.new(0, var92),
				PaddingLeft = UDim.new(0, var93)
			})
		}
		local var116 = fFlagAddTraversalBackButton
		
		if var116 then
			var116 = reactModule.createElement
			var116 = var116(view, { tag = "row gap-xsmall auto-xy" }, {
				TraversalBackButton = if isInExperienceUIVREnabled and isSpatial() then nil else reactModule.createElement(traversalBackButtonModule),
				UnibarFrame = p17:renderUnibarFrame(var82)
			})
		end
		local var120
		t_3.TopBarLeftContainer = var116
		t_3.Unibar = if not fFlagAddTraversalBackButton then p17:renderUnibarFrame(var82) else nil
		t_3.HealthBar = if var61 then roactModule.createElement(healthBarModule, {}) else nil
		t_3.AssistantBuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost, {
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0)
		}) else nil
		local createElement_3 = roactModule.createElement
		local var117 = "Frame"
		local t_4 = {
			BackgroundTransparency = 1,
			Position = p17.unibarRightSidePosition,
			Size = UDim2.new(1, 0, 1, 0)
		}
		local t_5 = {
			Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var89) }),
			Layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var88),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if fFlagEnableInExperienceShop and p17.state.shopGlobalIconEnabled then
			var120 = roactModule.createElement
			var120 = var120(shopGlobalIcon, {
				layoutOrder = 1,
				buttonSize = constantsModule_3.TopBarButtonHeight * p17.state.UiScale,
				leftGap = var88,
				showStatusIndicator = p17.state.shopGlobalStatusIndicatorEnabled,
				onActivated = p17.onShopGlobalIconActivated,
				onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p17.keepOutAreasStore.setKeepOutArea else p17.props.setKeepOutArea,
				isActive = p17.state.shopGlobalIconIsActive,
				icon = if fFlagExperienceShopNewIconography or not commonIconModule or not p17.shopIsActiveMappedSignal then nil else commonIconModule("BuildingStore", nil, p17.shopIsActiveMappedSignal)
			})
		else
			var120 = nil
		end
		t_5.ShopGlobalIcon = var120
		t_5.HealthBar = if var61 then nil else roactModule.createElement(healthBarModule, { layoutOrder = 10 })
		t_5.VoiceBetaBadge = if getFFlagBetaBadgeModule() and displayBetaBadge then roactModule.createElement(voiceBetaBadgeModule, { layoutOrder = 6, Analytics = analytics.new() }) else nil
		t_3.StackedElements = createElement_3(var117, t_4, t_5)
		createElement_2 = createElement_2(var113, t_2, t_3) or nil
	end
	local var124
	t_1.UnibarLeftFrame = createElement_2
	t_1.UnibarRightFrame = unibarModule and (var84 ~= Enum.HorizontalAlignment.Right and (roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var98),
		Position = uDim2_3,
		AnchorPoint = Vector2.new(1, 0)
	}, {
		ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
		Padding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var91),
			PaddingBottom = UDim.new(0, var92)
		}),
		Layout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var88),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		HealthBar = roactModule.createElement(healthBarModule, { layoutOrder = 1 }),
		Unibar = roactModule.createElement(unibarModule, {
			layoutOrder = 2,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p17.keepOutAreasStore.setKeepOutArea else p17.props.setKeepOutArea
		})
	}) or nil))
	local createElement_3 = roactModule.createElement
	local var121 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var98),
		Visible = var96,
		Position = uDim2
	}
	local t_3 = {}
	
	if not var82 then
		var124 = not tenFootInterfaceModule:IsEnabled()
		
		if var124 then
			var124 = roactModule.createElement
			var124 = var124("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -var85, 1, 0),
				Position = uDim2_1
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, var88),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Blank = var82 and roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var94, 0, 1)
				}),
				MenuIcon = not isNewTiltIconEnabledModule() and roactModule.createElement(menuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p17.props.showBadgeOver12,
					onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p17.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = not var82 and roactModule.createElement(chatIconModule, { layoutOrder = 3 }) or nil,
				VoiceBetaBadge = if var83 and displayBetaBadge then roactModule.createElement(voiceBetaBadgeModule, { layoutOrder = 4, Analytics = analytics.new() }) else nil
			})
		end
		local frame
		t_3.LeftFrame = var124
		
		if not unibarModule then
			frame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -var85, 1, 0),
				Position = uDim2_2,
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, var88),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				HealthBar = roactModule.createElement(healthBarModule, { layoutOrder = 1 }),
				MoreMenu = not tenFootInterfaceModule:IsEnabled() and roactModule.createElement(moreMenuModule, { layoutOrder = 2 })
			}) or nil
		end
		t_3.RightFrame = frame
		t_1.TopBarFrame = createElement_3(var121, t_2, t_3)
		
		return createElement_1(var105, t, t_1)
	end
end

return roactRoduxModule.UNSTABLE_connect2(if fFlagTopBarSignalizeMenuOpen then nil else function(p26) --[[ line: 1082 | named "mapStateToProps" ]]
	-- upvalues: fFlagTopBarSignalizeMenuOpen (ref)
	return if fFlagTopBarSignalizeMenuOpen then nil else {
		menuOpen = p26.displayOptions.menuOpen,
		inspectMenuOpen = p26.displayOptions.inspectMenuOpen
	}
end, function(p27) --[[ line: 1102 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), setScreenSizeModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return {
		setScreenSize = if fFlagTopBarSignalizeScreenSize then nil else function(p28) --[[ line: 1106 ]]
			-- upvalues: p27 (ref), setScreenSizeModule (copy)
			return p27(setScreenSizeModule(p28))
		end,
		setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p29, p30, p31) --[[ line: 1111 ]]
			-- upvalues: p27 (ref), setKeepOutAreaModule (copy)
			return p27(setKeepOutAreaModule(p29, p30, p31))
		end,
		removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p32) --[[ line: 1116 ]]
			-- upvalues: p27 (ref), removeKeepOutAreaModule (copy)
			return p27(removeKeepOutAreaModule(p32))
		end
	}
end)(topBarAppPolicyModule.connect(function(p25, _) --[[ line: 1095 ]]
	return {
		displayBetaBadge = p25.getDisplayVoiceBetaBadge(),
		showBadgeOver12 = p25.showBadgeOver12()
	}
end)(topBarApp))