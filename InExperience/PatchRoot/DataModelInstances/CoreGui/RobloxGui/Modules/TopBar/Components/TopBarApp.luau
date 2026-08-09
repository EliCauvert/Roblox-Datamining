local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("Players")
local VRService = game:GetService("VRService")
local textChatService = game:GetService("TextChatService")
local tweenService = game:GetService("TweenService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local view = require(corePackagesService.Packages.Foundation).View
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactable = UIBloxModule.Core.Control.Interactable
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local analytics = require(corePackagesService.Workspace.Packages.Analytics).Analytics
local withStyle = UIBloxModule.Core.Style.withStyle
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
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
local buildPillMenu = buildExperienceModule.BuildPillMenu
local menuIconModule = require(presentation.MenuIcon)
local chatIconModule = require(presentation.ChatIcon)
local moreMenuModule = require(presentation.MoreMenu)
local healthBarModule = require(presentation.HealthBar)
local hurtOverlayModule = require(presentation.HurtOverlay)
local gamepadNavigationDialogModule = require(presentation.GamepadNavigationDialog)
local headsetMenuModule = require(presentation.HeadsetMenu)
local headsetDisconnectDialog = coreGuiCommonModule.Components.HeadsetDisconnectDialog
local voiceBetaBadgeModule = require(presentation.VoiceBetaBadge)
local traversalBackButtonModule = require(script.Parent.TraversalBackButton)
local chrome = script.Parent.Parent.Parent.Chrome
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local constantsModule_1 = require(chrome.Integrations.MusicUtility.Constants)
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
local var44 = if enabled() and fFlagEnableConsoleExpControls then require(script.Parent.MenuIconContext) else nil
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
local var54 = if game:GetEngineFeature("VoiceChatSupported") and sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and enabled() then require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder) else nil
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local topBarAppPolicyModule = require(script.Parent.Parent.TopBarAppPolicy)
local var57 = enabled()
local var58 = if isInExperienceUIVREnabled and enabled() then require(script.Parent.VRBottomUnibar) else require(robloxGui.Modules.VR.VRBottomBar.VRBottomBar)

local function _(p0) --[[ line: 173 | named "selectMenuOpen" ]]
	return p0.displayOptions.menuOpen or p0.displayOptions.inspectMenuOpen
end

local _ = function() --[[ line: 177 | named "canShowAssistantBuild" ]]
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

function topBarApp.init(p1) --[[ line: 196 ]]
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref), fFlagAddUILessMode (ref), stores (ref), fIntAddUILessModeVariant (ref), tweenService (ref), localStoreModule (write), constantsModule_2 (write), UILessTooltipDuration (ref), settingsHubModule (ref), constantsModule (ref), contextActionService (ref), fFlagTopBarSignalizeMenuOpen (ref), settingsShowSignal (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), enabled (ref), chrome (ref), fFlagEnableConsoleExpControls (ref), gamepadConnectorModule (write), reactModule (ref), fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref), fFlagCenterInExperienceShopWindow (ref), textChatService (ref)
	local var60, var61 = roactModule.createBinding(UDim2.new())
	p1.unibarRightSidePosition = var60
	p1.setUnibarRightSidePosition = var61
	local var62, var63 = roactModule.createBinding(false)
	p1.closeButtonState = var62
	p1.setCloseButtonState = var63
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2) --[[ line: 199 ]]
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if fFlagAddUILessMode then
		p1.uiLessStore = stores.GetUILessStore(false)
		
		if fIntAddUILessModeVariant ~= 0 then
			local var64, var65 = roactModule.createBinding(false)
			p1.uiLessTooltipVisible = var64
			p1.setUILessTooltipVisible = var65
			local var66, var67 = roactModule.createBinding(0)
			p1.uiLessTooltipTransparency = var66
			p1.setUILessTooltipTransparency = var67
			
			function p1.fadeOutUILessTooltip() --[[ line: 213 ]]
				-- upvalues: p1 (ref), tweenService (copy)
				local numberValue = Instance.new("NumberValue")
				numberValue.Value = 0
				numberValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ line: 216 ]]
					-- upvalues: p1 (copy), numberValue (ref)
					p1.setUILessTooltipTransparency(numberValue.Value)
				end)
				p1.uiLessTooltipTween = tweenService:Create(numberValue, TweenInfo.new(0.5), { Value = 1 })
				p1.uiLessTooltipTween.Completed:Connect(function() --[[ line: 223 ]]
					-- upvalues: p1 (copy)
					p1.setUILessTooltipVisible(false)
					p1.uiLessTooltipTween = nil
				end)
				p1.uiLessTooltipTween:Play()
			end
			
			function p1.cleanupUILessTooltip() --[[ line: 231 ]]
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
				local var68 = true
				
				if localStoreModule then
					local numExperiencesUserSeenUILessTooltipKey2 = localStoreModule.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0
					var68 = numExperiencesUserSeenUILessTooltipKey2 < constantsModule_2.MAX_NUM_UNIVERSES_SHOWN
					
					if var68 then
						localStoreModule.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", numExperiencesUserSeenUILessTooltipKey2 + 1)
					end
				end
				if var68 then
					p1.setUILessTooltipVisible(true)
					p1.uiLessTooltipTimer = task.delay(UILessTooltipDuration, function() --[[ line: 254 ]]
						-- upvalues: p1 (ref)
						p1.fadeOutUILessTooltip()
						p1.uiLessTooltipTimer = nil
					end)
				end
			end
			contextActionService:BindCoreAction("ToggleUILess", function(_, p3) --[[ line: 261 ]]
				-- upvalues: p1 (ref), fIntAddUILessModeVariant (copy), settingsHubModule (copy), constantsModule (copy)
				if p3 ~= Enum.UserInputState.Begin then return end
				if p1.uiLessStore.getUILessModeEnabled(false) then
					if fIntAddUILessModeVariant == 1 then
						p1.uiLessStore.setUIVisible(function(p4) --[[ line: 266 ]]
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
					p1.uiLessStore.setUIVisible(function(p5) --[[ line: 277 ]]
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
		local var70, var71 = roactModule.createBinding(false)
		p1.tiltMenuOpen = var70
		p1.setTiltMenuOpen = var71
		local var72, var73 = roactModule.createBinding(false)
		p1.inspectMenuOpen = var72
		p1.setInspectMenuOpen = var73
		p1.inspectMenuDisposeEffect = signalsModule.createEffect(function(p6) --[[ line: 299 ]]
			-- upvalues: stores (copy), p1 (ref)
			p1.setInspectMenuOpen(stores.GetInspectAndBuyStore(p6).getInspectAndBuyOpen(p6))
		end)
		settingsShowSignal:connect(function(p7) --[[ line: 304 ]]
			-- upvalues: p1 (ref)
			p1.setTiltMenuOpen(p7)
		end)
	end
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	function p1.onCloseBtnStateChange(_, p8) --[[ line: 313 ]]
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
			p1.shopGlobalIconDisposeEffect = signalsModule.createEffect(function(p9) --[[ line: 332 ]]
				-- upvalues: inExperienceShopModule (copy), p1 (ref)
				local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
				
				if getShopGlobalIconStore then
					local var76 = getShopGlobalIconStore(p9)
					p1:setState({
						shopGlobalIconEnabled = var76.getEnabled(p9),
						shopGlobalStatusIndicatorEnabled = var76.getStatusIndicatorEnabled(p9)
					})
					
					return
				end
			end)
			
			function p1.onShopGlobalIconActivated() --[[ line: 343 ]]
				-- upvalues: fFlagCenterInExperienceShopWindow (copy), chrome (copy), serviceModule (ref), constantsModule_2 (copy)
				if fFlagCenterInExperienceShopWindow then
					require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
					
					return
				end
				serviceModule:toggleWindow(constantsModule_2.IN_EXPERIENCE_SHOP_ID)
			end
			
			p1.shopGlobalIconCleanup = inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon()
			p1.shopIsActiveMappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 354 ]]
				-- upvalues: serviceModule (ref), constantsModule_2 (copy)
				return serviceModule:isWindowOpen(constantsModule_2.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p1:setState({ chatVersion = textChatService.ChatVersion })
	
	if not game:IsLoaded() then
		game.Loaded:Connect(function() --[[ line: 368 ]]
			-- upvalues: p1 (ref), textChatService (copy)
			p1:setState({ chatVersion = textChatService.ChatVersion })
		end)
	end
end

function topBarApp.didMount(p10) --[[ line: 376 ]]
	-- upvalues: enabled (ref), chrome (ref), fFlagEnableInExperienceShop (ref), constantsModule_2 (write), fFlagEnableConsoleExpControls (ref), isSpatial (ref), VRService (ref)
	if enabled() then
		local serviceModule = require(chrome.Service)
		p10.orderAlignmentConnection = serviceModule:orderAlignment():connect(function() --[[ line: 379 ]]
			-- upvalues: p10 (ref), serviceModule (ref)
			p10:setState({ unibarAlignment = serviceModule:orderAlignment():get() })
		end)
		
		if fFlagEnableInExperienceShop then
			p10.shopIsActiveConnection = serviceModule:onIntegrationStatusChanged():connect(function() --[[ line: 386 ]]
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
			p10.vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ line: 397 ]]
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

function topBarApp.willUnmount(p11) --[[ line: 408 ]]
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

function topBarApp.render(p12) --[[ line: 470 ]]
	-- upvalues: withStyle (ref)
	return withStyle(function(p13) --[[ line: 471 ]]
		-- upvalues: p12 (ref)
		return p12:renderWithStyle(p13)
	end)
end

function topBarApp.renderUnibarFrame(p14, p15) --[[ line: 476 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), fFlagEnableConsoleExpControls (ref), reactModule (ref), var44 (ref), unibarModule (write), fFlagTopBarSignalizeKeepOutAreas (ref), roactModule (ref)
	return if isInExperienceUIVREnabled and isSpatial() then nil elseif fFlagEnableConsoleExpControls then reactModule.createElement(var44.Provider, { value = { menuIconRef = p14.menuIconRef } }, {
		reactModule.createElement(unibarModule, {
			layoutOrder = 1,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p14.keepOutAreasStore.setKeepOutArea else p14.props.setKeepOutArea,
			onMinWidthChanged = function(a) --[[ line: 490 ]]
				-- upvalues: p14 (ref)
				p14.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
			end,
			menuRef = if p15 then p14.unibarMenuRef else nil
		})
	}) else roactModule.createElement(unibarModule, {
		layoutOrder = 1,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p14.keepOutAreasStore.setKeepOutArea else p14.props.setKeepOutArea,
		onMinWidthChanged = function(a) --[[ line: 502 ]]
			-- upvalues: p14 (ref)
			p14.setUnibarRightSidePosition(UDim2.new(0, a, 0, 0))
		end
	})
end

function topBarApp.renderWithStyle(p16, p17) --[[ line: 509 ]]
	-- upvalues: enabled (ref), getFFlagBetaBadgeModule (ref), constantsModule_3 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), VRService (ref), fFlagEnableInExperienceShop (ref), constantsModule_2 (write), fFlagTopBarSignalizeMenuOpen (ref), tenFootInterfaceModule (ref), roactModule (ref), voiceStateContextModule (ref), var58 (ref), default (ref), isInExperienceUIVREnabled (ref), menuIconModule (ref), fFlagEnableConsoleExpControls (ref), fFlagTopBarSignalizeKeepOutAreas (ref), selectionCursorProvider (ref), isSpatial (ref), fFlagTopBarSignalizeScreenSize (ref), connectionModule (ref), fFlagEnableUISelector (ref), reactModule (ref), coreGuiCommonModule (ref), gamepadMenuModule (write), fFlagAddMenuNavigationToggleDialog (write), menuNavigationToggleDialogModule (write), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), useNewHeadsetDisconnectDialog (ref), headsetDisconnectDialog (ref), headsetMenuModule (ref), keepOutAreasHandlerModule (write), hurtOverlayModule (ref), fFlagEnableSideSheet (ref), isNewTiltIconEnabledModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), withLocalization (ref), fFlagRenameDeprecatedUIBloxTokens (ref), unibarModule (write), isNewInGameMenuEnabledModule (ref), interactable (ref), robloxGui (ref), controlState (ref), imageSetButton (ref), images (ref), songbirdModule (ref), constantsModule_1 (ref), var54 (write), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), analyticsModule (write), fFlagAddTraversalBackButton (ref), view (ref), traversalBackButtonModule (ref), var57 (ref), healthBarModule (ref), buildPillMenu (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), commonIconModule (write), voiceBetaBadgeModule (ref), analytics (ref), chatIconModule (ref), moreMenuModule (ref)
	local var78 = enabled()
	local var79 = getFFlagBetaBadgeModule() and not var78
	local displayBetaBadge = p16.props.displayBetaBadge
	local var80 = if p16.state.unibarAlignment ~= nil then p16.state.unibarAlignment else Enum.HorizontalAlignment.Right
	local var81 = constantsModule_3.ScreenSideOffset * p16.state.UiScale
	local var82 = constantsModule_3.TopBarHeight * p16.state.UiScale
	local var83 = constantsModule_3.TopBarTopMargin * p16.state.UiScale
	local var84 = constantsModule_3.TopBarPadding * p16.state.UiScale
	local var85 = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then var81 elseif fFlagEnableInExperienceShop and p16.state.shopGlobalIconEnabled then 2 * constantsModule_2.UNIBAR_END_PADDING * p16.state.UiScale else var84
	local var86 = constantsModule_3.LegacyCloseMenuIconSize * p16.state.UiScale
	local var87 = constantsModule_3.UnibarFrame.PaddingTop * p16.state.UiScale
	local var88 = constantsModule_3.UnibarFrame.PaddingBottom * p16.state.UiScale
	local var89 = constantsModule_3.UnibarFrame.PaddingLeft * p16.state.UiScale
	local var90 = constantsModule_3.UnibarFrame.ExtendedSize * p16.state.UiScale
	local var91 = if fFlagTopBarSignalizeMenuOpen then p16.tiltMenuOpen else p16.props.menuOpen
	
	if tenFootInterfaceModule:IsEnabled() and not enabled() then
		var81 = constantsModule_3.ScreenSideOffsetTenFoot
		var82 = constantsModule_3.TopBarHeightTenFoot
	end
	local createElement_1
	local var92 = if fFlagTopBarSignalizeMenuOpen then roactModule.joinBindings({ p16.tiltMenuOpen, p16.inspectMenuOpen }):map(function(p18) --[[ line: 542 ]]
		return not (p18[0] or p18[1])
	end) else not (p16.props.menuOpen or p16.props.inspectMenuOpen)
	local uDim2 = UDim2.new(0, 0, 0, var83)
	local var94 = var82 - var83
	local uDim2_1 = UDim2.new(0, var81, 0, 0)
	local uDim2_2 = UDim2.new(1, -var81, 0, 0)
	local uDim2_3 = UDim2.new(1, -var81, 0, var83)
	local uDim2_4 = UDim2.new(0, 0, 0.5, 0)
	local var99 = roactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p19) --[[ line: 556 ]]
			-- upvalues: roactModule (copy), var58 (copy), default (copy), isInExperienceUIVREnabled (copy), p16 (ref)
			return roactModule.createElement(var58, {
				voiceChatServiceManager = default,
				voiceEnabled = p19.voiceEnabled,
				voiceState = p19.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then p16.props.showBadgeOver12 else nil
			})
		end)
	})
	local var100 = roactModule.createElement(selectionCursorProvider, {}, {
		Icon = roactModule.createElement(menuIconModule, {
			layoutOrder = 1,
			iconScale = if fFlagTopBarSignalizeMenuOpen then nil elseif p16.props.menuOpen then constantsModule_3.MenuIconOpenScale else 1,
			showBadgeOver12 = p16.props.showBadgeOver12,
			menuIconRef = if var78 and fFlagEnableConsoleExpControls then p16.menuIconRef else nil,
			unibarMenuRef = if var78 and fFlagEnableConsoleExpControls then p16.unibarMenuRef else nil,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p16.keepOutAreasStore.setKeepOutArea else nil
		})
	})
	local var101 = if isInExperienceUIVREnabled then not isSpatial() else true
	local createElement = roactModule.createElement
	local var102 = "ScreenGui"
	local t = {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 6,
		[roactModule.Change.AbsoluteSize] = if fFlagTopBarSignalizeScreenSize then nil else function(p20) --[[ line: 590 ]]
			-- upvalues: p16 (ref)
			p16.props.setScreenSize(p20.AbsoluteSize)
		end
	}
	local t_1 = {
		Connection = roactModule.createElement(connectionModule),
		InExperienceUiSelector = if fFlagEnableUISelector then reactModule.createElement(coreGuiCommonModule.Components.InExperienceUiSelector) else nil,
		GamepadMenu = if not fFlagEnableConsoleExpControls then roactModule.createElement(gamepadMenuModule, { chatVersion = p16.state.chatVersion }) else nil,
		MenuNavigationToggleDialog = if var78 and fFlagAddMenuNavigationToggleDialog and fFlagEnableConsoleExpControls then roactModule.createElement(menuNavigationToggleDialogModule, {
			Position = UDim2.fromScale(0.5, 0.1),
			GamepadConnector = if fFlagEnableConsoleExpControls then p16.GamepadConnector else nil
		}) else nil,
		GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then roactModule.createElement(gamepadNavigationDialogModule) else nil,
		HeadsetMenu = if useNewHeadsetDisconnectDialog then roactModule.createElement(headsetDisconnectDialog) else roactModule.createElement(headsetMenuModule),
		VRBottomBar = if VRService.VREnabled then var99 else nil,
		KeepOutAreasHandler = if fFlagTopBarSignalizeKeepOutAreas or not keepOutAreasHandlerModule then nil else roactModule.createElement(keepOutAreasHandlerModule),
		FullScreenFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var92
		}, {
			HurtOverlay = roactModule.createElement(hurtOverlayModule)
		}),
		MenuIconHolder = if fFlagEnableSideSheet or not var101 or not isNewTiltIconEnabledModule() then nil else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var81, 0, var83),
			Size = UDim2.new(1, 0, 0, var94)
		}, { MenuIcon = var100 }),
		UILessTooltip = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 then withLocalization({
			uiLessTooltipTitle = constantsModule_3.LocalizedKeys.UILessTooltipTitle,
			uiLessTooltipDescription = constantsModule_3.LocalizedKeys.UILessTooltipDescription
		})(function(p21) --[[ line: 652 ]]
			-- upvalues: roactModule (copy), fFlagRenameDeprecatedUIBloxTokens (copy), p17 (ref), var81 (write), var83 (ref), p16 (ref)
			return roactModule.createElement("Frame", {
				BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Color.Extended.White.White_100 else p17.Tokens.Global.Color.White).Color3,
				BorderSizePixel = 0,
				Position = UDim2.new(0, var81, 0, var83),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = p16.uiLessTooltipTransparency,
				Visible = p16.uiLessTooltipVisible,
				ZIndex = 10000,
				[roactModule.Ref] = p16.uiLessTooltip
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Size.Size_200 else p17.Tokens.Global.Space_100),
					PaddingBottom = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Size.Size_200 else p17.Tokens.Global.Space_100),
					PaddingLeft = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Size.Size_300 else p17.Tokens.Global.Space_150),
					PaddingRight = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Size.Size_300 else p17.Tokens.Global.Space_150)
				}),
				Corner = roactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Radius.Small else p17.Tokens.Semantic.Radius.Small)
				}),
				VerticalLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.Size.Size_100 else p17.Tokens.Global.Space_50)
				}),
				Title = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Text = p21.uiLessTooltipTitle,
					TextSize = if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.FontSize.FontSize_300 else p17.Tokens.Global.FontSize_50,
					TextTransparency = p16.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSansBold,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				Description = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Text = p21.uiLessTooltipDescription,
					TextSize = if fFlagRenameDeprecatedUIBloxTokens then p17.Tokens.FontSize.FontSize_300 else p17.Tokens.Global.FontSize_50,
					TextTransparency = p16.uiLessTooltipTransparency,
					Font = Enum.Font.BuilderSans,
					AutomaticSize = Enum.AutomaticSize.XY
				})
			})
		end) else nil,
		LegacyCloseMenu = not unibarModule and (not isNewInGameMenuEnabledModule() and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var81, 0, 0),
			Size = UDim2.new(1, 0, 0, var82),
			Visible = var91
		}, {
			CloseMenuButtonRound = unibarModule and (roactModule.createElement(interactable, {
				onStateChanged = p16.onCloseBtnStateChange,
				Visible = not tenFootInterfaceModule:IsEnabled(),
				BackgroundTransparency = p17.Theme.Overlay.Transparency,
				Position = uDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, var86, 0, var86),
				BackgroundColor3 = p17.Theme.Overlay.Color,
				[roactModule.Event.Activated] = function() --[[ line: 721 ]]
					-- upvalues: robloxGui (copy)
					require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}, {
				UICorner = var78 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
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
				StateOverlayRound = not var78 and roactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = p16.closeButtonState:map(function(p22) --[[ line: 751 ]]
						-- upvalues: controlState (copy), p17 (ref)
						return if p22 == controlState.Pressed then p17.Theme.BackgroundOnPress.Transparency elseif p22 == controlState.Hover then p17.Theme.BackgroundOnHover.Transparency else 1
					end),
					BackgroundColor3 = p16.closeButtonState:map(function(p23) --[[ line: 760 ]]
						-- upvalues: controlState (copy), p17 (ref)
						return if p23 == controlState.Pressed then p17.Theme.BackgroundOnPress.Color elseif p23 == controlState.Hover then p17.Theme.BackgroundOnHover.Color else Color3.new(1, 1, 1)
					end),
					Size = UDim2.fromScale(1, 1)
				}, {
					UICorner = var78 and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
				}) or nil
			}) or nil),
			CloseMenuButton = not unibarModule and roactModule.createElement(imageSetButton, {
				Visible = not tenFootInterfaceModule:IsEnabled(),
				BackgroundTransparency = 1,
				Position = uDim2_4,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, var86, 0, var86),
				Image = images["icons/controls/close-ingame"],
				[roactModule.Event.Activated] = function() --[[ line: 786 ]]
					-- upvalues: robloxGui (copy)
					require(robloxGui.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}) or nil
		})),
		SongbirdDebugAudio = roactModule.createElement(songbirdModule.DebugAudioEmitters),
		SongbirdReportAudioFrame = enabled() and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, constantsModule_1.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
		}, {
			ReportAudioPopup = roactModule.createElement(songbirdModule.ReportAudioPopup)
		})
	}
	
	if unibarModule and var80 == Enum.HorizontalAlignment.Left then
		createElement_1 = roactModule.createElement
		local var105 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var94),
			Position = uDim2_3,
			AnchorPoint = Vector2.new(1, 0)
		}
		local t_3 = {
			JoinVoiceBinder = if var78 and var54 then roactModule.createElement(var54) else nil,
			PartyMicBinder = if var78 and getFFlagEnableCrossExpVoice() then roactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var87),
				PaddingBottom = UDim.new(0, var88),
				PaddingLeft = UDim.new(0, var89)
			})
		}
		local var108 = fFlagAddTraversalBackButton
		
		if var108 then
			var108 = reactModule.createElement
			var108 = var108(view, { tag = "auto-xy row gap-xsmall" }, {
				TraversalBackButton = if isInExperienceUIVREnabled and isSpatial() then nil else reactModule.createElement(traversalBackButtonModule),
				UnibarFrame = p16:renderUnibarFrame(var78)
			})
		end
		local var112
		t_3.TopBarLeftContainer = var108
		t_3.Unibar = if not fFlagAddTraversalBackButton then p16:renderUnibarFrame(var78) else nil
		t_3.HealthBar = if var57 then roactModule.createElement(healthBarModule, {}) else nil
		t_3.AssistantBuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenu, {
			target = {
				isNewGameTarget = false,
				universeId = game.GameId,
				placeId = game.PlaceId
			},
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0)
		}) else nil
		local createElement_2 = roactModule.createElement
		local var109 = "Frame"
		local t_4 = {
			BackgroundTransparency = 1,
			Position = p16.unibarRightSidePosition,
			Size = UDim2.new(1, 0, 1, 0)
		}
		local t_5 = {
			Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var85) }),
			Layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var84),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if fFlagEnableInExperienceShop and p16.state.shopGlobalIconEnabled then
			var112 = roactModule.createElement
			var112 = var112(shopGlobalIcon, {
				layoutOrder = 1,
				buttonSize = constantsModule_3.TopBarButtonHeight * p16.state.UiScale,
				leftGap = var84,
				showStatusIndicator = p16.state.shopGlobalStatusIndicatorEnabled,
				onActivated = p16.onShopGlobalIconActivated,
				onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p16.keepOutAreasStore.setKeepOutArea else p16.props.setKeepOutArea,
				isActive = p16.state.shopGlobalIconIsActive,
				icon = if fFlagExperienceShopNewIconography or not commonIconModule or not p16.shopIsActiveMappedSignal then nil else commonIconModule("BuildingStore", nil, p16.shopIsActiveMappedSignal)
			})
		else
			var112 = nil
		end
		t_5.ShopGlobalIcon = var112
		t_5.HealthBar = if var57 then nil else roactModule.createElement(healthBarModule, { layoutOrder = 10 })
		t_5.VoiceBetaBadge = if getFFlagBetaBadgeModule() and displayBetaBadge then roactModule.createElement(voiceBetaBadgeModule, { layoutOrder = 6, Analytics = analytics.new() }) else nil
		t_3.StackedElements = createElement_2(var109, t_4, t_5)
		createElement_1 = createElement_1(var105, t_2, t_3) or nil
	end
	local var116
	t_1.UnibarLeftFrame = createElement_1
	t_1.UnibarRightFrame = unibarModule and (var80 ~= Enum.HorizontalAlignment.Right and (roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var94),
		Position = uDim2_3,
		AnchorPoint = Vector2.new(1, 0)
	}, {
		ChromeAnalytics = if analyticsModule then roactModule.createElement(analyticsModule) else nil,
		Padding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var87),
			PaddingBottom = UDim.new(0, var88)
		}),
		Layout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var84),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		HealthBar = roactModule.createElement(healthBarModule, { layoutOrder = 1 }),
		Unibar = roactModule.createElement(unibarModule, {
			layoutOrder = 2,
			onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p16.keepOutAreasStore.setKeepOutArea else p16.props.setKeepOutArea
		})
	}) or nil))
	local createElement_2 = roactModule.createElement
	local var113 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var94),
		Visible = var92,
		Position = uDim2
	}
	local t_3 = {}
	
	if not var78 then
		var116 = not tenFootInterfaceModule:IsEnabled()
		
		if var116 then
			var116 = roactModule.createElement
			var116 = var116("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -var81, 1, 0),
				Position = uDim2_1
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, var84),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Blank = var78 and roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var90, 0, 1)
				}),
				MenuIcon = not isNewTiltIconEnabledModule() and roactModule.createElement(menuIconModule, {
					layoutOrder = 1,
					showBadgeOver12 = p16.props.showBadgeOver12,
					onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then p16.keepOutAreasStore.setKeepOutArea else nil
				}),
				ChatIcon = not var78 and roactModule.createElement(chatIconModule, { layoutOrder = 3 }) or nil,
				VoiceBetaBadge = if var79 and displayBetaBadge then roactModule.createElement(voiceBetaBadgeModule, { layoutOrder = 4, Analytics = analytics.new() }) else nil
			})
		end
		local frame
		t_3.LeftFrame = var116
		
		if not unibarModule then
			frame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0.5, -var81, 1, 0),
				Position = uDim2_2,
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, var84),
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
		t_1.TopBarFrame = createElement_2(var113, t_2, t_3)
		
		return createElement(var102, t, t_1)
	end
end

return roactRoduxModule.UNSTABLE_connect2(if fFlagTopBarSignalizeMenuOpen then nil else function(p25) --[[ line: 1018 | named "mapStateToProps" ]]
	-- upvalues: fFlagTopBarSignalizeMenuOpen (ref)
	return if fFlagTopBarSignalizeMenuOpen then nil else {
		menuOpen = p25.displayOptions.menuOpen,
		inspectMenuOpen = p25.displayOptions.inspectMenuOpen
	}
end, function(p26) --[[ line: 1038 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), setScreenSizeModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return {
		setScreenSize = if fFlagTopBarSignalizeScreenSize then nil else function(p27) --[[ line: 1042 ]]
			-- upvalues: p26 (ref), setScreenSizeModule (copy)
			return p26(setScreenSizeModule(p27))
		end,
		setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p28, p29, p30) --[[ line: 1047 ]]
			-- upvalues: p26 (ref), setKeepOutAreaModule (copy)
			return p26(setKeepOutAreaModule(p28, p29, p30))
		end,
		removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p31) --[[ line: 1052 ]]
			-- upvalues: p26 (ref), removeKeepOutAreaModule (copy)
			return p26(removeKeepOutAreaModule(p31))
		end
	}
end)(topBarAppPolicyModule.connect(function(p24, _) --[[ line: 1031 ]]
	return {
		displayBetaBadge = p24.getDisplayVoiceBetaBadge(),
		showBadgeOver12 = p24.showBadgeOver12()
	}
end)(topBarApp))