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
local fFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagAddTopBarPoliciesToUniversalPolicies = sharedFlagsModule.FFlagAddTopBarPoliciesToUniversalPolicies
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
local var23 = if isInExperienceUIVREnabled then require(components.VRBottomUnibar) else require(parent_1.VR.VRBottomBar.VRBottomBar)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildPillMenu = buildExperienceModule.BuildPillMenu
local var25 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(chrome.ChromeShared.Analytics) else nil
local var26 = if game:GetEngineFeature("VoiceChatSupported") and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then require(chrome.Integrations.JoinVoiceBinder) else nil
local partyMicBinderModule = require(chrome.Integrations.Party.PartyMicBinder)
local unibarModule = require(chrome.ChromeShared.Unibar)
local default = require(parent_1.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(parent_1.VoiceChat.VoiceStateContext)
local var30 = if fFlagEnableInExperienceShop then require(chrome.Service) else nil
local var31 = if fFlagEnableInExperienceShop then require(chrome.ChromeShared.Unibar.Constants) else nil
local var32 = if fFlagEnableInExperienceShop then require(chrome.Integrations.CommonIcon) else nil
local var33 = if fFlagEnableInExperienceShop then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var34 = if fFlagEnableInExperienceShop and var30 and var31 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var30:onIntegrationStatusChanged(), function() --[[ line: 87 ]]
	-- upvalues: var30 (ref), var31 (ref)
	return var30:isWindowOpen(var31.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var35 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p0) --[[ line: 98 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p0).getEnabled(p0) else false
end

local function getShopGlobalStatusIndicatorEnabled(p1) --[[ line: 106 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getStatusIndicatorEnabled(p1) else false
end

local function handleShopGlobalIconActivated() --[[ line: 114 ]]
	-- upvalues: fFlagEnableInExperienceShop (ref), fFlagCenterInExperienceShopWindow (ref), var35 (ref), var30 (ref), var31 (ref)
	if not fFlagEnableInExperienceShop then return end
	if fFlagCenterInExperienceShopWindow then
		if var35 then
			var35()
			
			return
		end
	elseif var30 and var31 then
		var30:toggleWindow(var31.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _() --[[ line: 129 | named "canShowAssistantBuild" ]]
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return function(_) --[[ line: 133 | named "TopBarApp" ]]
	-- upvalues: universalAppPolicyModule (ref), fFlagAddTopBarPoliciesToUniversalPolicies (ref), signalsReactModule (ref), coreGuiCommonModule (ref), displayModule (ref), fFlagEnableInExperienceShop (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), handleShopGlobalIconActivated (ref), reactModule (ref), inExperienceShopModule (ref), var33 (ref), var34 (ref), gamepadConnectorModule (ref), isSpatial (ref), VRService (ref), constantsModule (ref), view (ref), constantsModule_1 (ref), songbirdModule (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), var26 (ref), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), var25 (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), fFlagAddTraversalBackButton (ref), traversalBackButtonModule (ref), menuIconContextModule (ref), unibarModule (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), var32 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), buildPillMenu (ref), healthBar (ref), voiceStateContextModule (ref), var23 (ref), default (ref), isInExperienceUIVREnabled (ref)
	local var39 = universalAppPolicyModule.useAppPolicy(function(p2) --[[ line: 134 ]]
		-- upvalues: fFlagAddTopBarPoliciesToUniversalPolicies (copy)
		return if fFlagAddTopBarPoliciesToUniversalPolicies then p2.getShowBadgeOver12() else p2.ShowBadgeOver12 or false
	end)
	local var40 = signalsReactModule.useSignalState(function(p3) --[[ line: 142 ]]
		-- upvalues: coreGuiCommonModule (copy)
		return coreGuiCommonModule.Stores.GetKeepOutAreasStore(p3)
	end)
	local var41 = signalsReactModule.useSignalState(function(p4) --[[ line: 145 ]]
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p4).getUIScale(p4)
	end)
	local var42 = nil
	local var43 = nil
	local var44 = nil
	local var45 = nil
	
	if fFlagEnableInExperienceShop then
		var42 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
		var43 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		var44 = handleShopGlobalIconActivated
		reactModule.useEffect(function() --[[ line: 157 ]]
			-- upvalues: inExperienceShopModule (copy)
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() --[[ line: 159 ]] end
		end, {})
		var45 = (var33 or function() --[[ line: 161 ]] end)(var34)
	end
	local var63
	local var46 = reactModule.useRef(nil)
	local var47 = reactModule.useRef(nil)
	local showTopBar = gamepadConnectorModule:getShowTopBar()
	local var49, var50 = reactModule.useBinding(showTopBar:get())
	reactModule.useEffect(function() --[[ line: 171 ]]
		-- upvalues: isSpatial (copy), gamepadConnectorModule (copy), VRService (copy), showTopBar (ref), var50 (ref), var40 (ref)
		if not isSpatial() then
			gamepadConnectorModule:connectToTopbar()
		end
		local var64 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ line: 175 ]]
			-- upvalues: isSpatial (copy), gamepadConnectorModule (copy)
			if isSpatial() then
				gamepadConnectorModule:disconnectFromTopbar()
				
				return
			end
			gamepadConnectorModule:connectToTopbar()
		end)
		local var65 = showTopBar:connect(function() --[[ line: 183 ]]
			-- upvalues: var50 (copy), showTopBar (copy)
			var50(showTopBar:get())
		end)
		
		return function() --[[ line: 186 ]]
			-- upvalues: var64 (ref), gamepadConnectorModule (copy), var40 (copy), var65 (ref)
			if var64 then
				var64:Disconnect()
			end
			gamepadConnectorModule:disconnectFromTopbar()
			
			if var40 then
				var40.cleanup()
			end
			var65:disconnect()
		end
	end, {})
	local var51 = reactModule.useCallback(function(p5) --[[ line: 198 ]]
		-- upvalues: var40 (ref), constantsModule (copy)
		var40.setKeepOutArea(constantsModule.TopBarKeepOutAreaId, p5.AbsolutePosition, p5.AbsoluteSize)
	end, { var40 })
	local var52 = constantsModule.ScreenSideOffset * var41
	local var53 = constantsModule.TopBarHeight * var41
	local var54 = constantsModule.TopBarButtonHeight * var41
	local var55 = constantsModule.TopBarTopMargin * var41
	local createElement = reactModule.createElement
	local var56 = "ScreenGui"
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
			JoinVoiceBinder = if var26 then reactModule.createElement(var26) else nil,
			PartyMicBinder = if getFFlagEnableCrossExpVoice() then reactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if var25 then reactModule.createElement(var25) else nil
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = { Size = UDim2.new(1, 0, 0, var53) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, var54),
		onAbsoluteSizeChanged = var51,
		onAbsolutePositionChanged = var51,
		Position = UDim2.new(0, var52, 0, var55),
		Visible = var49
	}
	local t_5 = {
		MenuIcon = if not fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = var39,
				menuIconRef = var47,
				unibarMenuRef = var46
			})
		}) else nil,
		TraversalBackButton = if fFlagAddTraversalBackButton then reactModule.createElement(traversalBackButtonModule) else nil,
		UnibarFrame = reactModule.createElement(menuIconContextModule.Provider, { value = { menuIconRef = var47 } }, {
			reactModule.createElement(unibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() --[[ line: 267 ]] end,
				onAreaChanged = function() --[[ line: 268 ]] end,
				menuRef = var46
			})
		})
	}
	
	if fFlagEnableInExperienceShop and var42 and shopGlobalIcon ~= nil then
		var63 = reactModule.createElement
		var63 = var63(shopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = var54,
			showStatusIndicator = var43,
			onActivated = var44,
			isActive = var45,
			icon = if fFlagExperienceShopNewIconography or not var32 or not var34 then nil else var32("BuildingStore", nil, var34)
		})
	else
		var63 = nil
	end
	t_5.ShopGlobalIcon = var63
	t_3.TopLeftFrame = createElement_2(view, t_4, t_5)
	t_3.TopRightFrame = reactModule.createElement(view, {
		tag = "anchor-top-right auto-x",
		Size = UDim2.fromOffset(0, var54),
		Position = UDim2.new(1, -var52, 0, var55)
	}, {
		BuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenu, {
			target = {
				isNewGameTarget = false,
				universeId = game.GameId,
				placeId = game.PlaceId
			}
		}) else nil,
		HealthBar = reactModule.createElement(healthBar)
	})
	t_1.TopBarFrame = createElement_1(view, t_2, t_3)
	t_1.VRBottomBar = if VRService.VREnabled then reactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p6) --[[ line: 308 ]]
			-- upvalues: reactModule (copy), var23 (copy), default (copy), isInExperienceUIVREnabled (copy), var39 (ref)
			return reactModule.createElement(var23, {
				voiceChatServiceManager = default,
				voiceEnabled = p6.voiceEnabled,
				voiceState = p6.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then var39 else nil
			})
		end)
	}) else nil
	
	return createElement(var56, t, t_1)
end