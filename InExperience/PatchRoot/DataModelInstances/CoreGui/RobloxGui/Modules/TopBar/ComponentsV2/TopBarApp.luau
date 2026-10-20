local _ = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Components = Parent.Components
local Presentation = Components.Presentation
local Chrome = Parent.Parent.Chrome
local ConstantsModule = require(Parent.Constants)
local ExperienceAgeRatingPolicyModule = require(Parent.ExperienceAgeRatingPolicy)
local ExperienceAgeRatingBadgeModule = require(CorePackages.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local FFlagExperienceAgeRatingBadge = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FoundationModule = require(CorePackages.Packages.Foundation)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local _ = require(CorePackages.Workspace.Packages.Songbird)
local SwitchServerModule = require(CorePackages.Workspace.Packages.SwitchServer)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local FFlagAddMenuNavigationToggleDialog = SharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local FFlagGamepadNavigationDialogABTestModule = require(Parent.Flags.FFlagGamepadNavigationDialogABTest)
local FFlagEnablePlaytestModeUnibar = SharedFlagsModule.FFlagEnablePlaytestModeUnibar
local FFlagEnableTeamTestLua = SharedFlagsModule.FFlagEnableTeamTestLua
local FFlagAddTraversalBackButton = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalBackButton
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = SharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagShowGameAgeRating = SharedFlagsModule.FFlagShowGameAgeRating
local FFlagShowGameAgeRating1 = FFlagExperienceAgeRatingBadge and FFlagShowGameAgeRating
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagEnableInExperienceShop1 = InExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and FFlagEnableInExperienceShop
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagShowSwitchServerButton1 = IsSideSheetEnabledModule and (FFlagShowSwitchServerButton or IsPioneerLaunchFunction())
local ShopGlobalIcon = InExperienceShopModule.ShopGlobalIcon
local FFlagTopBarShopIconV2Module = require(Parent.Flags.FFlagTopBarShopIconV2)
local ShopIconModule = if FFlagTopBarShopIconV2Module then require(Components.Presentation.ShopIcon) else nil
local View = FoundationModule.View
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local GamepadConnectorModule = require(Components.GamepadConnector)
local GamepadNavigationDialogModule = require(Presentation.GamepadNavigationDialog)
local HealthBar = CoreGuiCommonModule.Components.HealthBar
local MenuIconModule = require(Parent.ComponentsV2.MenuIcon)
local MenuIconContextModule = require(Components.MenuIconContext)
local MenuNavigationToggleDialogModule = require(Presentation.GamepadMenu.MenuNavigationToggleDialog)
local TraversalBackButtonModule = require(Components.TraversalBackButton)
local PlaytestModeTooltipModule = require(Presentation.PlaytestModeTooltip)
local VRBottomUnibarModule = if IsInExperienceUIVREnabled then require(Components.VRBottomUnibar) else require(Parent1.VR.VRBottomBar.VRBottomBar)
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
local BuildModeLaunchModule = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local BuildPillMenuPortalHost = BuildExperienceModule.BuildPillMenuPortalHost
local UnpublishedPlaytestModeTooltip = BuildExperienceModule.UnpublishedPlaytestModeTooltip
local AnalyticsModule = if game:GetEngineFeature("InGameChromeSignalAPI") then require(Chrome.ChromeShared.Analytics) else nil
local JoinVoiceBinderModule = if game:GetEngineFeature("VoiceChatSupported") and GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then require(Chrome.Integrations.JoinVoiceBinder) else nil
local PartyMicBinderModule = require(Chrome.Integrations.Party.PartyMicBinder)
local UnibarModule = require(Chrome.ChromeShared.Unibar)
local Default = require(Parent1.VoiceChat.VoiceChatServiceManager).default
local VoiceStateContextModule = require(Parent1.VoiceChat.VoiceStateContext)
local ServiceModule = if FFlagEnableInExperienceShop1 then require(Chrome.Service) else nil
local ConstantsModule1 = if FFlagEnableInExperienceShop1 then require(Chrome.ChromeShared.Unibar.Constants) else nil
local CommonIconModule = if FFlagEnableInExperienceShop1 then require(Chrome.Integrations.CommonIcon) else nil
local UseMappedSignal = if FFlagEnableInExperienceShop1 then require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local NewResult = if FFlagEnableInExperienceShop1 and ServiceModule and ConstantsModule1 then require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
	-- upvalues: ServiceModule (copy), ConstantsModule1 (copy)
	return ServiceModule:isWindowOpen(ConstantsModule1.IN_EXPERIENCE_SHOP_ID)
end) else nil
local ToggleInExperienceShopWindow = if FFlagEnableInExperienceShop1 then require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil
local SwitchServerConfirmation = SwitchServerModule.SwitchServerConfirmation
local GetSwitchServerStoreFunction = SwitchServerModule.GetSwitchServerStore

local function getShopGlobalIconEnabled(p1)
	-- upvalues: FFlagEnableInExperienceShop1 (copy), InExperienceShopModule (copy)
	if FFlagEnableInExperienceShop1 then
		local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
		
		return if GetShopGlobalIconStoreFunction then GetShopGlobalIconStoreFunction(p1).getEnabled(p1) else false
	else
		return false
	end
end

local function getShopGlobalStatusIndicatorEnabled(p1)
	-- upvalues: FFlagEnableInExperienceShop1 (copy), InExperienceShopModule (copy)
	if FFlagEnableInExperienceShop1 then
		local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
		
		return if GetShopGlobalIconStoreFunction then GetShopGlobalIconStoreFunction(p1).getStatusIndicatorEnabled(p1) else false
	else
		return false
	end
end

local function handleShopGlobalIconActivated()
	-- upvalues: FFlagEnableInExperienceShop1 (copy), FFlagCenterInExperienceShopWindow (copy), ToggleInExperienceShopWindow (copy), ServiceModule (copy), ConstantsModule1 (copy)
	if not FFlagEnableInExperienceShop1 then return end
	if FFlagCenterInExperienceShopWindow then
		if ToggleInExperienceShopWindow then
			ToggleInExperienceShopWindow()
			
			return
		end
	elseif ServiceModule and ConstantsModule1 then
		ServiceModule:toggleWindow(ConstantsModule1.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _(): boolean
	-- upvalues: BuildModeLaunchModule (copy), VRService (copy)
	return BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled
end

local function getShouldEnableSwitchServer(p1)
	-- upvalues: FFlagShowSwitchServerButton1 (copy), GetSwitchServerStoreFunction (copy)
	return if FFlagShowSwitchServerButton1 and GetSwitchServerStoreFunction then GetSwitchServerStoreFunction(p1).shouldEnableSwitchServer(p1) else false
end

local function getIsConfirmationOpen(p1)
	-- upvalues: FFlagShowSwitchServerButton1 (copy), GetSwitchServerStoreFunction (copy)
	return if FFlagShowSwitchServerButton1 and GetSwitchServerStoreFunction then GetSwitchServerStoreFunction(p1).isConfirmationOpen(p1) else false
end

return function(_)
	-- upvalues: FFlagShowGameAgeRating (copy), UniversalAppPolicyModule (copy), SignalsReactModule (copy), CoreGuiCommonModule (copy), DisplayModule (copy), FFlagEnableInExperienceShop1 (copy), FFlagTopBarShopIconV2Module (copy), getShopGlobalIconEnabled (copy), getShopGlobalStatusIndicatorEnabled (copy), handleShopGlobalIconActivated (copy), ReactModule (copy), InExperienceShopModule (copy), UseMappedSignal (copy), NewResult (copy), IsSpatialFunction (copy), FFlagExperienceAgeRatingBadge (copy), ExperienceAgeRatingPolicyModule (copy), GamepadConnectorModule (copy), VRService (copy), ConstantsModule (copy), FFlagShowSwitchServerButton1 (copy), getShouldEnableSwitchServer (copy), getIsConfirmationOpen (copy), GetSwitchServerStoreFunction (copy), View (copy), FFlagShowGameAgeRating1 (copy), IsSideSheetEnabledModule (copy), SelectionCursorProvider (copy), MenuIconModule (copy), FFlagAddTraversalBackButton (copy), TraversalBackButtonModule (copy), MenuIconContextModule (copy), UnibarModule (copy), ShopIconModule (ref), ShopGlobalIcon (copy), FFlagExperienceShopNewIconography (copy), CommonIconModule (copy), FFlagAddMenuNavigationToggleDialog (copy), MenuNavigationToggleDialogModule (copy), FFlagGamepadNavigationDialogABTestModule (copy), GamepadNavigationDialogModule (copy), SwitchServerConfirmation (copy), JoinVoiceBinderModule (copy), GetFFlagEnableCrossExpVoiceFunction (copy), PartyMicBinderModule (copy), AnalyticsModule (copy), FFlagEnablePlaytestModeUnibar (copy), PlaytestModeTooltipModule (copy), FFlagEnableTeamTestLua (copy), UnpublishedPlaytestModeTooltip (copy), ExperienceAgeRatingBadgeModule (copy), FFlagAppNavMyStatsTab (copy), BuildModeLaunchModule (copy), BuildPillMenuPortalHost (copy), HealthBar (copy), VoiceStateContextModule (copy), VRBottomUnibarModule (copy), Default (copy), IsInExperienceUIVREnabled (copy)
	local UseAppPolicyResult = if FFlagShowGameAgeRating then UniversalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowGameAgeRating()
	end) else UniversalAppPolicyModule.useAppPolicy(function(p1)
		return p1.getShowBadgeOver12()
	end)
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: CoreGuiCommonModule (upval)
		return CoreGuiCommonModule.Stores.GetKeepOutAreasStore(p1)
	end)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: DisplayModule (upval)
		return DisplayModule.GetDisplayStore(p1).getUIScale(p1)
	end)
	local UseSignalStateResult2 = nil
	local UseSignalStateResult3 = nil
	local OnActivated = nil
	local IsActive = nil
	
	if FFlagEnableInExperienceShop1 and not FFlagTopBarShopIconV2Module then
		UseSignalStateResult2 = SignalsReactModule.useSignalState(getShopGlobalIconEnabled)
		UseSignalStateResult3 = SignalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
		OnActivated = handleShopGlobalIconActivated
		ReactModule.useEffect(function()
			-- upvalues: InExperienceShopModule (upval)
			return InExperienceShopModule.initShopGlobalIcon and InExperienceShopModule.initShopGlobalIcon() or function() end
		end, {})
		IsActive = (UseMappedSignal or function() end)(NewResult)
	end
	local UseRefResult = ReactModule.useRef(nil)
	local IsSpatial = IsSpatialFunction()
	local Callback = nil
	
	if FFlagExperienceAgeRatingBadge then
		IsSpatial, Callback = ReactModule.useState(IsSpatial)
	end
	local IsEligible = ExperienceAgeRatingPolicyModule.isEligible(UseAppPolicyResult, true, true, IsSpatial)
	local UseRefResult1 = ReactModule.useRef(nil)
	local ShowTopBar = GamepadConnectorModule:getShowTopBar()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ShowTopBar:get())
	ReactModule.useEffect(function()
		-- upvalues: IsSpatialFunction (upval), GamepadConnectorModule (upval), VRService (upval), FFlagExperienceAgeRatingBadge (upval), Callback (ref), ShowTopBar (copy), UseBindingResult2 (copy), UseSignalStateResult (copy)
		if not IsSpatialFunction() then
			GamepadConnectorModule:connectToTopbar()
		end
		local Connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: FFlagExperienceAgeRatingBadge (upval), Callback (upval), IsSpatialFunction (upval), GamepadConnectorModule (upval)
			if FFlagExperienceAgeRatingBadge then
				Callback(IsSpatialFunction())
			end
			if IsSpatialFunction() then
				GamepadConnectorModule:disconnectFromTopbar()
				
				return
			else
				GamepadConnectorModule:connectToTopbar()
			end
		end)
		local Connection1 = ShowTopBar:connect(function()
			-- upvalues: UseBindingResult2 (upval), ShowTopBar (upval)
			UseBindingResult2(ShowTopBar:get())
		end)
		
		return function()
			-- upvalues: Connection (copy), GamepadConnectorModule (upval), UseSignalStateResult (upval), Connection1 (copy)
			if Connection then
				Connection:Disconnect()
			end
			GamepadConnectorModule:disconnectFromTopbar()
			
			if UseSignalStateResult then
				UseSignalStateResult.cleanup()
			end
			Connection1:disconnect()
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseSignalStateResult (copy), ConstantsModule (upval)
		UseSignalStateResult.setKeepOutArea(ConstantsModule.TopBarKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
	end, { UseSignalStateResult })
	local ScaledScreenSideOffset = ConstantsModule.ScreenSideOffset * UseSignalStateResult1
	local ScaledTopBarHeight = ConstantsModule.TopBarHeight * UseSignalStateResult1
	local ScaledTopBarButtonHeight = ConstantsModule.TopBarButtonHeight * UseSignalStateResult1
	local ScaledTopBarTopMargin = ConstantsModule.TopBarTopMargin * UseSignalStateResult1
	local UseSignalStateResult4 = nil
	local UseSignalStateResult5 = nil
	local SetConfirmationOpen = nil
	
	if FFlagShowSwitchServerButton1 then
		UseSignalStateResult4 = SignalsReactModule.useSignalState(getShouldEnableSwitchServer)
		UseSignalStateResult5 = SignalsReactModule.useSignalState(getIsConfirmationOpen)
		SetConfirmationOpen = GetSwitchServerStoreFunction(false).setConfirmationOpen
	end
	local Element = ReactModule.createElement(View, {
		tag = "anchor-top-left auto-x row gap-small",
		Size = UDim2.fromOffset(0, ScaledTopBarButtonHeight),
		onAbsoluteSizeChanged = if FFlagShowGameAgeRating1 then nil else UseResult,
		onAbsolutePositionChanged = if FFlagShowGameAgeRating1 then nil else UseResult,
		Position = if FFlagShowGameAgeRating1 then nil else UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
		Visible = UseBindingResult
	}, {
		MenuIcon = if IsSideSheetEnabledModule then nil else ReactModule.createElement(SelectionCursorProvider, {}, {
			Icon = ReactModule.createElement(MenuIconModule, {
				buttonSize = if FFlagShowGameAgeRating1 then ScaledTopBarButtonHeight else nil,
				showBadgeOver12 = UseAppPolicyResult and not IsEligible,
				menuIconRef = UseRefResult1,
				unibarMenuRef = UseRefResult
			})
		}),
		TraversalBackButton = if FFlagAddTraversalBackButton then ReactModule.createElement(TraversalBackButtonModule) else nil,
		UnibarFrame = ReactModule.createElement(MenuIconContextModule.Provider, {
			value = {
				menuIconRef = UseRefResult1,
				replacesAgeRating = IsEligible
			}
		}, {
			ReactModule.createElement(UnibarModule, {
				layoutOrder = 2,
				onMinWidthChanged = function() end,
				onAreaChanged = function() end,
				menuRef = UseRefResult
			})
		}),
		ShopIcon = if FFlagTopBarShopIconV2Module and FFlagEnableInExperienceShop1 then ReactModule.createElement(ShopIconModule, { layoutOrder = 3, buttonSize = ScaledTopBarButtonHeight }) else nil,
		ShopGlobalIcon = if FFlagTopBarShopIconV2Module or not FFlagEnableInExperienceShop1 or not UseSignalStateResult2 or ShopGlobalIcon == nil then nil else ReactModule.createElement(ShopGlobalIcon, {
			layoutOrder = 3,
			buttonSize = ScaledTopBarButtonHeight,
			showStatusIndicator = UseSignalStateResult3,
			onActivated = OnActivated,
			isActive = IsActive,
			icon = if FFlagExperienceShopNewIconography or not CommonIconModule or not NewResult then nil else CommonIconModule("BuildingStore", nil, NewResult)
		})
	})
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = 6,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Popups = ReactModule.createElement(View, { tag = "size-full" }, {
			MenuNavigationToggleDialog = if FFlagAddMenuNavigationToggleDialog then ReactModule.createElement(MenuNavigationToggleDialogModule, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = GamepadConnectorModule
			}) else nil,
			GamepadNavigationDialog = if FFlagGamepadNavigationDialogABTestModule then ReactModule.createElement(GamepadNavigationDialogModule) else nil,
			SwitchServerConfirmation = if UseSignalStateResult4 and UseSignalStateResult5 then ReactModule.createElement(SwitchServerConfirmation, { setSwitchServerConfirmationOpen = SetConfirmationOpen }) else nil
		}),
		Binders = ReactModule.createElement(ReactModule.Fragment, {}, {
			JoinVoiceBinder = if JoinVoiceBinderModule then ReactModule.createElement(JoinVoiceBinderModule) else nil,
			PartyMicBinder = if GetFFlagEnableCrossExpVoiceFunction() then ReactModule.createElement(PartyMicBinderModule) else nil,
			ChromeAnalytics = if AnalyticsModule then ReactModule.createElement(AnalyticsModule) else nil
		}),
		PlaytestTooltip = if FFlagEnablePlaytestModeUnibar then ReactModule.createElement(PlaytestModeTooltipModule, { anchorRef = UseRefResult }) else nil,
		UnpublishedPlaytestTooltip = if FFlagEnableTeamTestLua then ReactModule.createElement(UnpublishedPlaytestModeTooltip, { anchorRef = UseRefResult, isVisible = UseBindingResult }) else nil,
		TopBarFrame = ReactModule.createElement(View, { Size = UDim2.new(1, 0, 0, ScaledTopBarHeight) }, {
			TopLeftFrame = if FFlagShowGameAgeRating1 then ReactModule.createElement(View, {
				tag = "row align-y-center gap-small auto-x",
				Size = UDim2.fromOffset(0, ScaledTopBarButtonHeight),
				Position = UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
				onAbsoluteSizeChanged = UseResult,
				onAbsolutePositionChanged = UseResult
			}, {
				Controls = Element,
				AgeRating = if IsEligible then ReactModule.createElement(ExperienceAgeRatingBadgeModule, { layoutOrder = 1, universeId = tostring(game.GameId) }) else nil
			}) else Element,
			TopRightFrame = ReactModule.createElement(View, {
				tag = "anchor-top-right auto-x",
				Size = UDim2.fromOffset(0, ScaledTopBarButtonHeight),
				Position = UDim2.new(1, -ScaledScreenSideOffset, 0, ScaledTopBarTopMargin)
			}, {
				BuildPillMenu = if FFlagAppNavMyStatsTab and (BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled) then ReactModule.createElement(BuildPillMenuPortalHost) else nil,
				HealthBar = ReactModule.createElement(HealthBar)
			})
		}),
		VRBottomBar = if VRService.VREnabled then ReactModule.createElement(VoiceStateContextModule.Provider, {}, {
			VRBottomBar = VoiceStateContextModule.withVoiceState(function(p1)
				-- upvalues: ReactModule (upval), VRBottomUnibarModule (upval), Default (upval), IsInExperienceUIVREnabled (upval), UseAppPolicyResult (copy)
				return ReactModule.createElement(VRBottomUnibarModule, {
					voiceChatServiceManager = Default,
					voiceEnabled = p1.voiceEnabled,
					voiceState = p1.voiceState,
					showBadgeOver12 = if IsInExperienceUIVREnabled then UseAppPolicyResult else nil
				})
			end)
		}) else nil
	})
end