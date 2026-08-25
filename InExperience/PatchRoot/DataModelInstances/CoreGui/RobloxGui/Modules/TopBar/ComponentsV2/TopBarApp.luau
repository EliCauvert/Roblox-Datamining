local _ = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local components = parent.Components
local presentation = components.Presentation
local chrome = parent.Parent.Chrome
local constantsModule = require(parent.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local foundationModule = require(corePackagesService.Packages.Foundation)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local _ = require(corePackagesService.Workspace.Packages.Songbird)
local traversal = coreScriptsRoactCommonModule.Traversal
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local fFlagAddMenuNavigationToggleDialog = sharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local fFlagGamepadNavigationDialogABTestModule = require(parent.Flags.FFlagGamepadNavigationDialogABTest)
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagAddTraversalBackButton = traversal.Flags.FFlagAddTraversalBackButton
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = sharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
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
local var22 = if isInExperienceUIVREnabled then require(components.VRBottomUnibar) else require(parent_1.VR.VRBottomBar.VRBottomBar)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildPillMenuPortalHost = buildExperienceModule.BuildPillMenuPortalHost
local unpublishedPlaytestModeTooltip = buildExperienceModule.UnpublishedPlaytestModeTooltip
local var24 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(chrome.ChromeShared.Analytics) else nil
local var25 = if game:GetEngineFeature("VoiceChatSupported") and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then require(chrome.Integrations.JoinVoiceBinder) else nil
local partyMicBinderModule = require(chrome.Integrations.Party.PartyMicBinder)
local unibarModule = require(chrome.ChromeShared.Unibar)
local default = require(parent_1.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(parent_1.VoiceChat.VoiceStateContext)
local var29 = if fFlagEnableInExperienceShop then require(chrome.Service) else nil
local var30 = if fFlagEnableInExperienceShop then require(chrome.ChromeShared.Unibar.Constants) else nil
local var31 = if fFlagEnableInExperienceShop then require(chrome.Integrations.CommonIcon) else nil
local var32 = if fFlagEnableInExperienceShop then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var33 = if fFlagEnableInExperienceShop and var29 and var30 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var29:onIntegrationStatusChanged(), function()
	-- upvalues: var29 (ref), var30 (ref)
	return var29:isWindowOpen(var30.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var34 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p0)
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p0).getEnabled(p0) else false
end

local function getShopGlobalStatusIndicatorEnabled(p1)
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getStatusIndicatorEnabled(p1) else false
end

local function handleShopGlobalIconActivated()
	-- upvalues: fFlagEnableInExperienceShop (ref), fFlagCenterInExperienceShopWindow (ref), var34 (ref), var29 (ref), var30 (ref)
	if not fFlagEnableInExperienceShop then return end
	if fFlagCenterInExperienceShopWindow then
		if var34 then
			var34()
			
			return
		end
	elseif var29 and var30 then
		var29:toggleWindow(var30.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _()
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return function(_)
	-- upvalues: fFlagShowGameAgeRating (ref), universalAppPolicyModule (ref), signalsReactModule (ref), coreGuiCommonModule (ref), displayModule (ref), fFlagEnableInExperienceShop (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), handleShopGlobalIconActivated (ref), reactModule (ref), inExperienceShopModule (ref), var32 (ref), var33 (ref), gamepadConnectorModule (ref), isSpatial (ref), VRService (ref), constantsModule (ref), view (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), var25 (ref), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), var24 (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeTooltipModule (ref), fFlagEnableTeamTestLua (ref), unpublishedPlaytestModeTooltip (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), fFlagAddTraversalBackButton (ref), traversalBackButtonModule (ref), menuIconContextModule (ref), unibarModule (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), var31 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), buildPillMenuPortalHost (ref), healthBar (ref), voiceStateContextModule (ref), var22 (ref), default (ref), isInExperienceUIVREnabled (ref)
	local var38 = if fFlagShowGameAgeRating then universalAppPolicyModule.useAppPolicy(function(p3)
		return p3.getShowGameAgeRating()
	end) else universalAppPolicyModule.useAppPolicy(function(p2)
		return p2.getShowBadgeOver12()
	end)
	local var39 = signalsReactModule.useSignalState(function(p4)
		-- upvalues: coreGuiCommonModule (copy)
		return coreGuiCommonModule.Stores.GetKeepOutAreasStore(p4)
	end)
	local var40 = signalsReactModule.useSignalState(function(p5)
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p5).getUIScale(p5)
	end)
	local var41 = nil
	local var42 = nil
	local var43 = nil
	local var44 = nil
	
	if fFlagEnableInExperienceShop then
		var41 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
		var42 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		var43 = handleShopGlobalIconActivated
		reactModule.useEffect(function()
			-- upvalues: inExperienceShopModule (copy)
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() end
		end, {})
		var44 = (var32 or function() end)(var33)
	end
	local var62
	local var45 = reactModule.useRef(nil)
	local var46 = reactModule.useRef(nil)
	local showTopBar = gamepadConnectorModule:getShowTopBar()
	local var48, var49 = reactModule.useBinding(showTopBar:get())
	reactModule.useEffect(function()
		-- upvalues: isSpatial (copy), gamepadConnectorModule (copy), VRService (copy), showTopBar (ref), var49 (ref), var39 (ref)
		if not isSpatial() then
			gamepadConnectorModule:connectToTopbar()
		end
		local var63 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: isSpatial (copy), gamepadConnectorModule (copy)
			if isSpatial() then
				gamepadConnectorModule:disconnectFromTopbar()
				
				return
			end
			gamepadConnectorModule:connectToTopbar()
		end)
		local var64 = showTopBar:connect(function()
			-- upvalues: var49 (copy), showTopBar (copy)
			var49(showTopBar:get())
		end)
		
		return function()
			-- upvalues: var63 (ref), gamepadConnectorModule (copy), var39 (copy), var64 (ref)
			if var63 then
				var63:Disconnect()
			end
			gamepadConnectorModule:disconnectFromTopbar()
			
			if var39 then
				var39.cleanup()
			end
			var64:disconnect()
		end
	end, {})
	local var50 = reactModule.useCallback(function(p6)
		-- upvalues: var39 (ref), constantsModule (copy)
		var39.setKeepOutArea(constantsModule.TopBarKeepOutAreaId, p6.AbsolutePosition, p6.AbsoluteSize)
	end, { var39 })
	local var51 = constantsModule.ScreenSideOffset * var40
	local var52 = constantsModule.TopBarHeight * var40
	local var53 = constantsModule.TopBarButtonHeight * var40
	local var54 = constantsModule.TopBarTopMargin * var40
	local createElement = reactModule.createElement
	local var55 = "ScreenGui"
	local t = {
		IgnoreGuiInset = true,
		DisplayOrder = 6,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}
	local t_1 = {
		Popups = reactModule.createElement(view, { tag = "size-full" }, {
			MenuNavigationToggleDialog = if fFlagAddMenuNavigationToggleDialog then reactModule.createElement(menuNavigationToggleDialogModule, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = gamepadConnectorModule
			}) else nil,
			GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then reactModule.createElement(gamepadNavigationDialogModule) else nil
		}),
		Binders = reactModule.createElement(reactModule.Fragment, {}, {
			JoinVoiceBinder = if var25 then reactModule.createElement(var25) else nil,
			PartyMicBinder = if getFFlagEnableCrossExpVoice() then reactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if var24 then reactModule.createElement(var24) else nil
		}),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then reactModule.createElement(playtestModeTooltipModule, { anchorRef = var45 }) else nil,
		UnpublishedPlaytestTooltip = if fFlagEnableTeamTestLua then reactModule.createElement(unpublishedPlaytestModeTooltip, { anchorRef = var45, isVisible = var48 }) else nil
	}
	local createElement_1 = reactModule.createElement
	local t_2 = { Size = UDim2.new(1, 0, 0, var52) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, var53),
		onAbsoluteSizeChanged = var50,
		onAbsolutePositionChanged = var50,
		Position = UDim2.new(0, var51, 0, var54),
		Visible = var48
	}
	local t_5 = {
		MenuIcon = if not fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = var38,
				menuIconRef = var46,
				unibarMenuRef = var45
			})
		}) else nil,
		TraversalBackButton = if fFlagAddTraversalBackButton then reactModule.createElement(traversalBackButtonModule) else nil,
		UnibarFrame = reactModule.createElement(menuIconContextModule.Provider, { value = { menuIconRef = var46 } }, {
			reactModule.createElement(unibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() end,
				onAreaChanged = function() end,
				menuRef = var45
			})
		})
	}
	
	if fFlagEnableInExperienceShop and var41 and shopGlobalIcon ~= nil then
		var62 = reactModule.createElement
		var62 = var62(shopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = var53,
			showStatusIndicator = var42,
			onActivated = var43,
			isActive = var44,
			icon = if fFlagExperienceShopNewIconography or not var31 or not var33 then nil else var31("BuildingStore", nil, var33)
		})
	else
		var62 = nil
	end
	t_5.ShopGlobalIcon = var62
	t_3.TopLeftFrame = createElement_2(view, t_4, t_5)
	t_3.TopRightFrame = reactModule.createElement(view, {
		tag = "anchor-top-right auto-x",
		Size = UDim2.fromOffset(0, var53),
		Position = UDim2.new(1, -var51, 0, var54)
	}, {
		BuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost) else nil,
		HealthBar = reactModule.createElement(healthBar)
	})
	t_1.TopBarFrame = createElement_1(view, t_2, t_3)
	t_1.VRBottomBar = if VRService.VREnabled then reactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p7)
			-- upvalues: reactModule (copy), var22 (copy), default (copy), isInExperienceUIVREnabled (copy), var38 (ref)
			return reactModule.createElement(var22, {
				voiceChatServiceManager = default,
				voiceEnabled = p7.voiceEnabled,
				voiceState = p7.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then var38 else nil
			})
		end)
	}) else nil
	
	return createElement(var55, t, t_1)
end