local _ = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local components = parent.Components
local presentation = components.Presentation
local chrome = parent.Parent.Chrome
local constantsModule = require(parent.Constants)
local experienceAgeRatingPolicyModule = require(parent.ExperienceAgeRatingPolicy)
local experienceAgeRatingBadgeModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local fFlagExperienceAgeRatingBadge = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local foundationModule = require(corePackagesService.Packages.Foundation)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local _ = require(corePackagesService.Workspace.Packages.Songbird)
local switchServerModule = require(corePackagesService.Workspace.Packages.SwitchServer)
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
local isSideSheetEnabledModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagShowGameAgeRating_1 = fFlagExperienceAgeRatingBadge and fFlagShowGameAgeRating
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local fFlagEnableInExperienceShop = inExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagCenterInExperienceShopWindow = inExperienceShopModule.FFlagCenterInExperienceShopWindow
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local fFlagShowSwitchServerButton = isSideSheetEnabledModule and (sharedFlagsModule.FFlagShowSwitchServerButton or require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch())
local shopGlobalIcon = inExperienceShopModule.ShopGlobalIcon
local fFlagTopBarShopIconV2Module = require(parent.Flags.FFlagTopBarShopIconV2)
local var1 = if fFlagTopBarShopIconV2Module then require(components.Presentation.ShopIcon) else nil
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
local var2 = if isInExperienceUIVREnabled then require(components.VRBottomUnibar) else require(parent_1.VR.VRBottomBar.VRBottomBar)
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildModeLaunchModule = require(corePackagesService.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local buildPillMenuPortalHost = buildExperienceModule.BuildPillMenuPortalHost
local unpublishedPlaytestModeTooltip = buildExperienceModule.UnpublishedPlaytestModeTooltip
local var3 = if game:GetEngineFeature("InGameChromeSignalAPI") then require(chrome.ChromeShared.Analytics) else nil
local var4 = if game:GetEngineFeature("VoiceChatSupported") and getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then require(chrome.Integrations.JoinVoiceBinder) else nil
local partyMicBinderModule = require(chrome.Integrations.Party.PartyMicBinder)
local unibarModule = require(chrome.ChromeShared.Unibar)
local default = require(parent_1.VoiceChat.VoiceChatServiceManager).default
local voiceStateContextModule = require(parent_1.VoiceChat.VoiceStateContext)
local var5 = if fFlagEnableInExperienceShop then require(chrome.Service) else nil
local var6 = if fFlagEnableInExperienceShop then require(chrome.ChromeShared.Unibar.Constants) else nil
local var7 = if fFlagEnableInExperienceShop then require(chrome.Integrations.CommonIcon) else nil
local var8 = if fFlagEnableInExperienceShop then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var9 = if fFlagEnableInExperienceShop and var5 and var6 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var5:onIntegrationStatusChanged(), function()
	-- upvalues: var5 (ref), var6 (ref)
	return var5:isWindowOpen(var6.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var10 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil
local switchServerConfirmation = switchServerModule.SwitchServerConfirmation
local getSwitchServerStore = switchServerModule.GetSwitchServerStore

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
	-- upvalues: fFlagEnableInExperienceShop (ref), fFlagCenterInExperienceShopWindow (ref), var10 (ref), var5 (ref), var6 (ref)
	if not fFlagEnableInExperienceShop then return end
	if fFlagCenterInExperienceShopWindow then
		if var10 then
			var10()
			
			return
		end
	elseif var5 and var6 then
		var5:toggleWindow(var6.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _()
	-- upvalues: buildModeLaunchModule (ref), VRService (ref)
	return buildModeLaunchModule:hasBuildMode() and not VRService.VREnabled
end

local function getShouldEnableSwitchServer(p1)
	-- upvalues: fFlagShowSwitchServerButton (ref), getSwitchServerStore (ref)
	return if fFlagShowSwitchServerButton then if getSwitchServerStore then getSwitchServerStore(p1).shouldEnableSwitchServer(p1) else false else false
end

local function getIsConfirmationOpen(p1)
	-- upvalues: fFlagShowSwitchServerButton (ref), getSwitchServerStore (ref)
	return if fFlagShowSwitchServerButton then if getSwitchServerStore then getSwitchServerStore(p1).isConfirmationOpen(p1) else false else false
end

return function(_)
	-- upvalues: fFlagShowGameAgeRating (ref), universalAppPolicyModule (ref), signalsReactModule (ref), coreGuiCommonModule (ref), displayModule (ref), fFlagEnableInExperienceShop (ref), fFlagTopBarShopIconV2Module (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), handleShopGlobalIconActivated (ref), reactModule (ref), inExperienceShopModule (ref), var8 (ref), var9 (ref), isSpatial (ref), fFlagExperienceAgeRatingBadge (ref), experienceAgeRatingPolicyModule (ref), gamepadConnectorModule (ref), VRService (ref), constantsModule (ref), fFlagShowSwitchServerButton (ref), getShouldEnableSwitchServer (ref), getIsConfirmationOpen (ref), getSwitchServerStore (ref), view (ref), fFlagShowGameAgeRating_1 (ref), isSideSheetEnabledModule (ref), selectionCursorProvider (ref), menuIconModule (ref), fFlagAddTraversalBackButton (ref), traversalBackButtonModule (ref), menuIconContextModule (ref), unibarModule (ref), var1 (write), shopGlobalIcon (ref), fFlagExperienceShopNewIconography (ref), var7 (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref), fFlagGamepadNavigationDialogABTestModule (ref), gamepadNavigationDialogModule (ref), switchServerConfirmation (ref), var4 (ref), getFFlagEnableCrossExpVoice (ref), partyMicBinderModule (ref), var3 (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeTooltipModule (ref), fFlagEnableTeamTestLua (ref), unpublishedPlaytestModeTooltip (ref), experienceAgeRatingBadgeModule (ref), fFlagAppNavMyStatsTab (ref), buildModeLaunchModule (ref), buildPillMenuPortalHost (ref), healthBar (ref), voiceStateContextModule (ref), var2 (ref), default (ref), isInExperienceUIVREnabled (ref)
	local var11 = if fFlagShowGameAgeRating then universalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowGameAgeRating()
	end) else universalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowBadgeOver12()
	end)
	local var12 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: coreGuiCommonModule (copy)
		return coreGuiCommonModule.Stores.GetKeepOutAreasStore(p1)
	end)
	local var13 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p1).getUIScale(p1)
	end)
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	
	if fFlagEnableInExperienceShop and not fFlagTopBarShopIconV2Module then
		var14 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
		var15 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		var16 = handleShopGlobalIconActivated
		reactModule.useEffect(function()
			-- upvalues: inExperienceShopModule (copy)
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() end
		end, {})
		var17 = (var8 or function() end)(var9)
	end
	local var18 = reactModule.useRef(nil)
	local var19 = isSpatial()
	local var20 = nil
	
	if fFlagExperienceAgeRatingBadge then
		local var21, var22 = reactModule.useState(var19)
		var19 = var21
		var20 = var22
	end
	local var23 = experienceAgeRatingPolicyModule.isEligible(var11, true, true, var19)
	local var24 = reactModule.useRef(nil)
	local showTopBar = gamepadConnectorModule:getShowTopBar()
	local var25, var26 = reactModule.useBinding(showTopBar:get())
	reactModule.useEffect(function()
		-- upvalues: isSpatial (copy), gamepadConnectorModule (copy), VRService (copy), fFlagExperienceAgeRatingBadge (copy), var20 (write), showTopBar (ref), var26 (ref), var12 (ref)
		if not isSpatial() then
			gamepadConnectorModule:connectToTopbar()
		end
		local var27 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: fFlagExperienceAgeRatingBadge (copy), var20 (copy), isSpatial (copy), gamepadConnectorModule (copy)
			if fFlagExperienceAgeRatingBadge then
				var20(isSpatial())
			end
			if isSpatial() then
				gamepadConnectorModule:disconnectFromTopbar()
				
				return
			end
			gamepadConnectorModule:connectToTopbar()
		end)
		local var28 = showTopBar:connect(function()
			-- upvalues: var26 (copy), showTopBar (copy)
			var26(showTopBar:get())
		end)
		
		return function()
			-- upvalues: var27 (ref), gamepadConnectorModule (copy), var12 (copy), var28 (ref)
			if var27 then
				var27:Disconnect()
			end
			gamepadConnectorModule:disconnectFromTopbar()
			
			if var12 then
				var12.cleanup()
			end
			var28:disconnect()
		end
	end, {})
	local var27 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), constantsModule (copy)
		var12.setKeepOutArea(constantsModule.TopBarKeepOutAreaId, p1.AbsolutePosition, p1.AbsoluteSize)
	end, { var12 })
	local var28 = constantsModule.ScreenSideOffset * var13
	local var29 = constantsModule.TopBarHeight * var13
	local var30 = constantsModule.TopBarButtonHeight * var13
	local var31 = constantsModule.TopBarTopMargin * var13
	local var32 = nil
	local var33 = nil
	local setConfirmationOpen = nil
	
	if fFlagShowSwitchServerButton then
		var32 = signalsReactModule.useSignalState(getShouldEnableSwitchServer)
		var33 = signalsReactModule.useSignalState(getIsConfirmationOpen)
		setConfirmationOpen = getSwitchServerStore(false).setConfirmationOpen
	end
	local createElement_1
	local createElement = reactModule.createElement
	local t = {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, var30),
		onAbsoluteSizeChanged = if fFlagShowGameAgeRating_1 then nil else var27,
		onAbsolutePositionChanged = if fFlagShowGameAgeRating_1 then nil else var27,
		Position = if fFlagShowGameAgeRating_1 then nil else UDim2.new(0, var28, 0, var31),
		Visible = var25
	}
	local t_1 = {
		MenuIcon = if not isSideSheetEnabledModule then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				buttonSize = if fFlagShowGameAgeRating_1 then var30 else nil,
				showBadgeOver12 = var11 and not var23,
				menuIconRef = var24,
				unibarMenuRef = var18
			})
		}) else nil,
		TraversalBackButton = if fFlagAddTraversalBackButton then reactModule.createElement(traversalBackButtonModule) else nil,
		UnibarFrame = reactModule.createElement(menuIconContextModule.Provider, {
			value = { menuIconRef = var24, replacesAgeRating = var23 }
		}, {
			reactModule.createElement(unibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() end,
				onAreaChanged = function() end,
				menuRef = var18
			})
		}),
		ShopIcon = if fFlagTopBarShopIconV2Module and fFlagEnableInExperienceShop then reactModule.createElement(var1, { layoutOrder = 3, buttonSize = var30 }) else nil
	}
	
	if fFlagTopBarShopIconV2Module or not fFlagEnableInExperienceShop or (not var14 or shopGlobalIcon == nil) then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(shopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = var30,
			showStatusIndicator = var15,
			onActivated = var16,
			isActive = var17,
			icon = if fFlagExperienceShopNewIconography or not var7 or not var9 then nil else var7("BuildingStore", nil, var9)
		})
	end
	t_1.ShopGlobalIcon = createElement_1
	createElement = createElement(view, t, t_1)
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = 6,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Popups = reactModule.createElement(view, { tag = "size-full" }, {
			MenuNavigationToggleDialog = if fFlagAddMenuNavigationToggleDialog then reactModule.createElement(menuNavigationToggleDialogModule, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = gamepadConnectorModule
			}) else nil,
			GamepadNavigationDialog = if fFlagGamepadNavigationDialogABTestModule then reactModule.createElement(gamepadNavigationDialogModule) else nil,
			SwitchServerConfirmation = if var32 and var33 then reactModule.createElement(switchServerConfirmation, { setSwitchServerConfirmationOpen = setConfirmationOpen }) else nil
		}),
		Binders = reactModule.createElement(reactModule.Fragment, {}, {
			JoinVoiceBinder = if var4 then reactModule.createElement(var4) else nil,
			PartyMicBinder = if getFFlagEnableCrossExpVoice() then reactModule.createElement(partyMicBinderModule) else nil,
			ChromeAnalytics = if var3 then reactModule.createElement(var3) else nil
		}),
		PlaytestTooltip = if fFlagEnablePlaytestModeUnibar then reactModule.createElement(playtestModeTooltipModule, { anchorRef = var18 }) else nil,
		UnpublishedPlaytestTooltip = if fFlagEnableTeamTestLua then reactModule.createElement(unpublishedPlaytestModeTooltip, { anchorRef = var18, isVisible = var25 }) else nil,
		TopBarFrame = reactModule.createElement(view, { Size = UDim2.new(1, 0, 0, var29) }, {
			TopLeftFrame = if fFlagShowGameAgeRating_1 then reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-x",
				Size = UDim2.fromOffset(0, var30),
				Position = UDim2.new(0, var28, 0, var31),
				onAbsoluteSizeChanged = var27,
				onAbsolutePositionChanged = var27
			}, {
				Controls = createElement,
				AgeRating = if var23 then reactModule.createElement(experienceAgeRatingBadgeModule, { layoutOrder = 1, universeId = tostring(game.GameId) }) else nil
			}) else createElement,
			TopRightFrame = reactModule.createElement(view, {
				tag = "anchor-top-right auto-x",
				Size = UDim2.fromOffset(0, var30),
				Position = UDim2.new(1, -var28, 0, var31)
			}, {
				BuildPillMenu = if fFlagAppNavMyStatsTab and (buildModeLaunchModule:hasBuildMode() and not VRService.VREnabled) then reactModule.createElement(buildPillMenuPortalHost) else nil,
				HealthBar = reactModule.createElement(healthBar)
			})
		}),
		VRBottomBar = if VRService.VREnabled then reactModule.createElement(voiceStateContextModule.Provider, {}, {
			VRBottomBar = voiceStateContextModule.withVoiceState(function(p1)
				-- upvalues: reactModule (copy), var2 (copy), default (copy), isInExperienceUIVREnabled (copy), var11 (ref)
				return reactModule.createElement(var2, {
					voiceChatServiceManager = default,
					voiceEnabled = p1.voiceEnabled,
					voiceState = p1.voiceState,
					showBadgeOver12 = if isInExperienceUIVREnabled then var11 else nil
				})
			end)
		}) else nil
	})
end