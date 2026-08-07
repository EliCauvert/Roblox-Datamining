local _ = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local components = parent.Components
local presentation = components.Presentation
local chrome = parent.Parent.Chrome
local constantsModule = require(parent.Constants)
local constantsModule_1 = require(chrome.Integrations.MusicUtility.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local foundationModule = require(corePackagesService.Packages.Foundation)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local songbirdModule = require(corePackagesService.Workspace.Packages.Songbird)
local traversal = coreScriptsRoactCommonModule.Traversal
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local fFlagAddMenuNavigationToggleDialog = sharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local fFlagGamepadNavigationDialogABTestModule = require(parent.Flags.FFlagGamepadNavigationDialogABTest)
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar
local fFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local fFlagEnableInExperienceShop = inExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagCenterInExperienceShopWindow = inExperienceShopModule.FFlagCenterInExperienceShopWindow
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopGlobalIcon = inExperienceShopModule.ShopGlobalIcon
local view = foundationModule.View
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local gamepadConnectorModule = require(components.GamepadConnector)
local gamepadNavigationDialogModule = require(presentation.GamepadNavigationDialog)
local healthBar = coreGuiCommonModule.Components.HealthBar
local menuIconModule = require(parent.ComponentsV2.MenuIcon)
local menuIconContextModule = require(components.MenuIconContext)
local menuNavigationToggleDialogModule = require(presentation.GamepadMenu.MenuNavigationToggleDialog)
local traversalBackButtonModule = require(components.TraversalBackButton)
local playtestModeTooltipModule = require(presentation.PlaytestModeTooltip)
local var24 = if isInExperienceUIVREnabled then require(components.VRBottomUnibar) else require(parent_1.VR.VRBottomBar.VRBottomBar)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildPillMenuPortalHost = buildExperienceModule.BuildPillMenuPortalHost
local var26 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(chrome.ChromeShared.Analytics) else nil
local var27 = if game:GetEngineFeature("VoiceChatSupported") and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then require(chrome.Integrations.JoinVoiceBinder) else nil
local partyMicBinderModule = require(chrome.Integrations.Party.PartyMicBinder)
local unibarModule = require(chrome.ChromeShared.Unibar)
local default = require(parent_1.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(parent_1.VoiceChat.VoiceStateContext)
local var31 = if fFlagEnableInExperienceShop then require(chrome.Service) else nil
local var32 = if fFlagEnableInExperienceShop then require(chrome.ChromeShared.Unibar.Constants) else nil
local var33 = if fFlagEnableInExperienceShop then require(chrome.Integrations.CommonIcon) else nil
local var34 = if fFlagEnableInExperienceShop then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var35 = if fFlagEnableInExperienceShop and var31 and var32 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var31:onIntegrationStatusChanged(), function() --[[ line: 88 ]]
	-- upvalues: var31 (ref), var32 (ref)
	return var31:isWindowOpen(var32.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var36 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p0) --[[ line: 99 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p0).getEnabled(p0) else false
end

local function getShopGlobalStatusIndicatorEnabled(p1) --[[ line: 107 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getStatusIndicatorEnabled(p1) else false
end

local function handleShopGlobalIconActivated() --[[ line: 115 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), fFlagCenterInExperienceShopWindow (ref), var36 (ref), var31 (ref), var32 (ref)
	if not fFlagEnableInExperienceShop then return end
	if fFlagCenterInExperienceShopWindow then
		if var36 then
			var36()
			
			return
		end
	elseif var31 and var32 then
		var31:toggleWindow(var32.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _() --[[ line: 130 | named "canShowAssistantBuild" ]]
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return function(_) --[[ line: 134 | named "TopBarApp" ]]
	-- upvalues: universalAppPolicyModule (ref), signalsReactModule (ref), coreGuiCommonModule (ref), displayModule (ref), fFlagEnableInExperienceShop (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), handleShopGlobalIconActivated (ref), reactModule (ref), inExperienceShopModule (ref), var34 (ref), var35 (ref), gamepadConnectorModule (ref), isSpatial (ref), VRService (ref), constantsModule (ref), view (ref), constantsModule_1 (ref), songbirdModule (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), var27 (ref), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), var26 (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeTooltipModule (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), fFlagAddTraversalBackButton (ref), traversalBackButtonModule (ref), menuIconContextModule (ref), unibarModule (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), var33 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), buildPillMenuPortalHost (ref), healthBar (ref), voiceStateContextModule (ref), var24 (ref), default (ref), isInExperienceUIVREnabled (ref)
	local var40 = universalAppPolicyModule.useAppPolicy(function(p2) --[[ line: 135 ]]
		return p2.getShowBadgeOver12()
	end)
	local var41 = signalsReactModule.useSignalState(function(p3) --[[ line: 139 ]]
		-- upvalues: coreGuiCommonModule (copy)
		return coreGuiCommonModule.Stores.GetKeepOutAreasStore(p3)
	end)
	local var42 = signalsReactModule.useSignalState(function(p4) --[[ line: 142 ]]
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p4).getUIScale(p4)
	end)
	local var43 = nil
	local var44 = nil
	local var45 = nil
	local var46 = nil
	
	if fFlagEnableInExperienceShop then
		var43 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
		var44 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		var45 = handleShopGlobalIconActivated
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: inExperienceShopModule (copy)
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() --[[ line: 156 ]] end
		end, {})
		var46 = (var34 or function() --[[ line: 158 ]] end)(var35)
	end
	local var64
	local var47 = reactModule.useRef(nil)
	local var48 = reactModule.useRef(nil)
	local showTopBar = gamepadConnectorModule:getShowTopBar()
	local var50, var51 = reactModule.useBinding(showTopBar:get())
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: isSpatial (copy), gamepadConnectorModule (copy), VRService (copy), showTopBar (ref), var51 (ref), var41 (ref)
		if not isSpatial() then
			gamepadConnectorModule:connectToTopbar()
		end
		local var65 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ line: 172 ]]
			-- upvalues: isSpatial (copy), gamepadConnectorModule (copy)
			if isSpatial() then
				gamepadConnectorModule:disconnectFromTopbar()
				
				return
			end
			gamepadConnectorModule:connectToTopbar()
		end)
		local var66 = showTopBar:connect(function() --[[ line: 180 ]]
			-- upvalues: var51 (copy), showTopBar (copy)
			var51(showTopBar:get())
		end)
		
		return function() --[[ line: 183 ]]
			-- upvalues: var65 (ref), gamepadConnectorModule (copy), var41 (copy), var66 (ref)
			if var65 then
				var65:Disconnect()
			end
			gamepadConnectorModule:disconnectFromTopbar()
			
			if var41 then
				var41.cleanup()
			end
			var66:disconnect()
		end
	end, {})
	local var52 = reactModule.useCallback(function(p5) --[[ line: 195 ]]
		-- upvalues: var41 (ref), constantsModule (copy)
		var41.setKeepOutArea(constantsModule.TopBarKeepOutAreaId, p5.AbsolutePosition, p5.AbsoluteSize)
	end, { var41 })
	local var53 = constantsModule.ScreenSideOffset * var42
	local var54 = constantsModule.TopBarHeight * var42
	local var55 = constantsModule.TopBarButtonHeight * var42
	local var56 = constantsModule.TopBarTopMargin * var42
	local createElement = reactModule.createElement
	local var57 = "ScreenGui"
	local t = {
		IgnoreGuiInset = true,
		DisplayOrder = 6,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}
	local t_1 = {
		Popups = reactModule.createElement(view, { tag = "size-full" }, {
			SongbirdReportAudioFrame = reactModule.createElement(view, {
				tag = "anchor-center-center position-center-center",
				Size = UDim2.new(1, 0, 0, constantsModule_1.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
			}, {
				ReportAudioPopup = reactModule.createElement(songbirdModule.ReportAudioPopup)
			}),
			MenuNavigationToggleDialog = if fFlagAddMenuNavigationToggleDialog then reactModule.createElement(menuNavigationToggleDialogModule, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = gamepadConnectorModule
			}) else nil,
			GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then reactModule.createElement(gamepadNavigationDialogModule) else nil
		}),
		Binders = reactModule.createElement(reactModule.Fragment, {}, {
			JoinVoiceBinder = if var27 then reactModule.createElement(var27) else nil,
			PartyMicBinder = if getFFlagEnableCrossExpVoice() then reactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if var26 then reactModule.createElement(var26) else nil
		}),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then reactModule.createElement(playtestModeTooltipModule, { anchorRef = var47 }) else nil
	}
	local createElement_1 = reactModule.createElement
	local t_2 = { Size = UDim2.new(1, 0, 0, var54) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, var55),
		onAbsoluteSizeChanged = var52,
		onAbsolutePositionChanged = var52,
		Position = UDim2.new(0, var53, 0, var56),
		Visible = var50
	}
	local t_5 = {
		MenuIcon = if not fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = var40,
				menuIconRef = var48,
				unibarMenuRef = var47
			})
		}) else nil,
		TraversalBackButton = if fFlagAddTraversalBackButton then reactModule.createElement(traversalBackButtonModule) else nil,
		UnibarFrame = reactModule.createElement(menuIconContextModule.Provider, { value = { menuIconRef = var48 } }, {
			reactModule.createElement(unibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() --[[ line: 269 ]] end,
				onAreaChanged = function() --[[ line: 270 ]] end,
				menuRef = var47
			})
		})
	}
	
	if fFlagEnableInExperienceShop and var43 and shopGlobalIcon ~= nil then
		var64 = reactModule.createElement
		var64 = var64(shopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = var55,
			showStatusIndicator = var44,
			onActivated = var45,
			isActive = var46,
			icon = if fFlagExperienceShopNewIconography or not var33 or not var35 then nil else var33("BuildingStore", nil, var35)
		})
	else
		var64 = nil
	end
	t_5.ShopGlobalIcon = var64
	t_3.TopLeftFrame = createElement_2(view, t_4, t_5)
	t_3.TopRightFrame = reactModule.createElement(view, {
		tag = "anchor-top-right auto-x",
		Size = UDim2.fromOffset(0, var55),
		Position = UDim2.new(1, -var53, 0, var56)
	}, {
		BuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost) else nil,
		HealthBar = reactModule.createElement(healthBar)
	})
	t_1.TopBarFrame = createElement_1(view, t_2, t_3)
	t_1.VRBottomBar = if VRService.VREnabled then reactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p6) --[[ line: 304 ]]
			-- upvalues: reactModule (copy), var24 (copy), default (copy), isInExperienceUIVREnabled (copy), var40 (ref)
			return reactModule.createElement(var24, {
				voiceChatServiceManager = default,
				voiceEnabled = p6.voiceEnabled,
				voiceState = p6.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then var40 else nil
			})
		end)
	}) else nil
	
	return createElement(var57, t, t_1)
end