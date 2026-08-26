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
local var1 = if isInExperienceUIVREnabled then require(components.VRBottomUnibar) else require(parent_1.VR.VRBottomBar.VRBottomBar)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildPillMenuPortalHost = buildExperienceModule.BuildPillMenuPortalHost
local unpublishedPlaytestModeTooltip = buildExperienceModule.UnpublishedPlaytestModeTooltip
local var2 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(chrome.ChromeShared.Analytics) else nil
local var3 = if game:GetEngineFeature("VoiceChatSupported") and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then require(chrome.Integrations.JoinVoiceBinder) else nil
local partyMicBinderModule = require(chrome.Integrations.Party.PartyMicBinder)
local unibarModule = require(chrome.ChromeShared.Unibar)
local default = require(parent_1.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(parent_1.VoiceChat.VoiceStateContext)
local var4 = if fFlagEnableInExperienceShop then require(chrome.Service) else nil
local var5 = if fFlagEnableInExperienceShop then require(chrome.ChromeShared.Unibar.Constants) else nil
local var6 = if fFlagEnableInExperienceShop then require(chrome.Integrations.CommonIcon) else nil
local var7 = if fFlagEnableInExperienceShop then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var8 = if fFlagEnableInExperienceShop and var4 and var5 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var4:onIntegrationStatusChanged(), function()
	-- upvalues: var4 (ref), var5 (ref)
	return var4:isWindowOpen(var5.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var9 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p1)
	-- upvalues: fFlagEnableInExperienceShop (ref), inExperienceShopModule (ref)
	if not fFlagEnableInExperienceShop then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getEnabled(p1) else false
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
	-- upvalues: fFlagEnableInExperienceShop (ref), fFlagCenterInExperienceShopWindow (ref), var9 (ref), var4 (ref), var5 (ref)
	if not fFlagEnableInExperienceShop then return end
	if fFlagCenterInExperienceShopWindow then
		if var9 then
			var9()
			
			return
		end
	elseif var4 and var5 then
		var4:toggleWindow(var5.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _()
	-- upvalues: buildExperienceModule (ref), VRService (ref)
	return buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return function(_)
	-- upvalues: fFlagShowGameAgeRating (ref), universalAppPolicyModule (ref), signalsReactModule (ref), coreGuiCommonModule (ref), displayModule (ref), fFlagEnableInExperienceShop (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), handleShopGlobalIconActivated (ref), reactModule (ref), inExperienceShopModule (ref), var7 (ref), var8 (ref), gamepadConnectorModule (ref), isSpatial (ref), VRService (ref), constantsModule (ref), view (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), var3 (ref), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), var2 (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeTooltipModule (ref), fFlagEnableTeamTestLua (ref), unpublishedPlaytestModeTooltip (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), fFlagAddTraversalBackButton (ref), traversalBackButtonModule (ref), menuIconContextModule (ref), unibarModule (ref), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), var6 (ref), fFlagAppNavMyStatsTab (ref), buildExperienceModule (ref), buildPillMenuPortalHost (ref), healthBar (ref), voiceStateContextModule (ref), var1 (ref), default (ref), isInExperienceUIVREnabled (ref)
	local var10 = if fFlagShowGameAgeRating then universalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowGameAgeRating()
	end) else universalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowBadgeOver12()
	end)
	local var11 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: coreGuiCommonModule (copy)
		return coreGuiCommonModule.Stores.GetKeepOutAreasStore(p1)
	end)
	local var12 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p1).getUIScale(p1)
	end)
	local var13 = nil
	local var14 = nil
	local var15 = nil
	local var16 = nil
	
	if fFlagEnableInExperienceShop then
		var13 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
		var14 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		var15 = handleShopGlobalIconActivated
		reactModule.useEffect(function()
			-- upvalues: inExperienceShopModule (copy)
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() end
		end, {})
		var16 = (var7 or function() end)(var8)
	end
	local var17
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local showTopBar = gamepadConnectorModule:getShowTopBar()
	local var20, var21 = reactModule.useBinding(showTopBar:get())
	reactModule.useEffect(function()
		-- upvalues: isSpatial (copy), gamepadConnectorModule (copy), VRService (copy), showTopBar (ref), var21 (ref), var11 (ref)
		if not isSpatial() then
			gamepadConnectorModule:connectToTopbar()
		end
		local var22 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: isSpatial (copy), gamepadConnectorModule (copy)
			if isSpatial() then
				gamepadConnectorModule:disconnectFromTopbar()
				
				return
			end
			gamepadConnectorModule:connectToTopbar()
		end)
		local var23 = showTopBar:connect(function()
			-- upvalues: var21 (copy), showTopBar (copy)
			var21(showTopBar:get())
		end)
		
		return function()
			-- upvalues: var22 (ref), gamepadConnectorModule (copy), var11 (copy), var23 (ref)
			if var22 then
				var22:Disconnect()
			end
			gamepadConnectorModule:disconnectFromTopbar()
			
			if var11 then
				var11.cleanup()
			end
			var23:disconnect()
		end
	end, {})
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: var11 (ref), constantsModule (copy)
		var11.setKeepOutArea(constantsModule.TopBarKeepOutAreaId, p1.AbsolutePosition, p1.AbsoluteSize)
	end, { var11 })
	local var23 = constantsModule.ScreenSideOffset * var12
	local var24 = constantsModule.TopBarHeight * var12
	local var25 = constantsModule.TopBarButtonHeight * var12
	local var26 = constantsModule.TopBarTopMargin * var12
	local createElement = reactModule.createElement
	local var27 = "ScreenGui"
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
			JoinVoiceBinder = if var3 then reactModule.createElement(var3) else nil,
			PartyMicBinder = if getFFlagEnableCrossExpVoice() then reactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if var2 then reactModule.createElement(var2) else nil
		}),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then reactModule.createElement(playtestModeTooltipModule, { anchorRef = var18 }) else nil,
		UnpublishedPlaytestTooltip = if fFlagEnableTeamTestLua then reactModule.createElement(unpublishedPlaytestModeTooltip, { anchorRef = var18, isVisible = var20 }) else nil
	}
	local createElement_1 = reactModule.createElement
	local t_2 = { Size = UDim2.new(1, 0, 0, var24) }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, var25),
		onAbsoluteSizeChanged = var22,
		onAbsolutePositionChanged = var22,
		Position = UDim2.new(0, var23, 0, var26),
		Visible = var20
	}
	local t_5 = {
		MenuIcon = if not fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = var10,
				menuIconRef = var19,
				unibarMenuRef = var18
			})
		}) else nil,
		TraversalBackButton = if fFlagAddTraversalBackButton then reactModule.createElement(traversalBackButtonModule) else nil,
		UnibarFrame = reactModule.createElement(menuIconContextModule.Provider, { value = { menuIconRef = var19 } }, {
			reactModule.createElement(unibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() end,
				onAreaChanged = function() end,
				menuRef = var18
			})
		})
	}
	
	if fFlagEnableInExperienceShop and var13 and shopGlobalIcon ~= nil then
		var17 = reactModule.createElement
		var17 = var17(shopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = var25,
			showStatusIndicator = var14,
			onActivated = var15,
			isActive = var16,
			icon = if fFlagExperienceShopNewIconography or not var6 or not var8 then nil else var6("BuildingStore", nil, var8)
		})
	else
		var17 = nil
	end
	t_5.ShopGlobalIcon = var17
	t_3.TopLeftFrame = createElement_2(view, t_4, t_5)
	t_3.TopRightFrame = reactModule.createElement(view, {
		tag = "anchor-top-right auto-x",
		Size = UDim2.fromOffset(0, var25),
		Position = UDim2.new(1, -var23, 0, var26)
	}, {
		BuildPillMenu = if fFlagAppNavMyStatsTab and (buildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost) else nil,
		HealthBar = reactModule.createElement(healthBar)
	})
	t_1.TopBarFrame = createElement_1(view, t_2, t_3)
	t_1.VRBottomBar = if VRService.VREnabled then reactModule.createElement(voiceStateContextModule.Provider, {}, {
		VRBottomBar = voiceStateContextModule.withVoiceState(function(p1)
			-- upvalues: reactModule (copy), var1 (copy), default (copy), isInExperienceUIVREnabled (copy), var10 (ref)
			return reactModule.createElement(var1, {
				voiceChatServiceManager = default,
				voiceEnabled = p1.voiceEnabled,
				voiceState = p1.voiceState,
				showBadgeOver12 = if isInExperienceUIVREnabled then var10 else nil
			})
		end)
	}) else nil
	
	return createElement(var27, t, t_1)
end