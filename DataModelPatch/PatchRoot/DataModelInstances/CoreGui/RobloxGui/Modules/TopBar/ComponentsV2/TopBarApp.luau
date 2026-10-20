local _ = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Components = Parent.Components
local Presentation = Components.Presentation
local Chrome = Parent.Parent.Chrome
local ConstantsModule = require(Parent.Constants)
local ConstantsModule1 = require(Chrome.Integrations.MusicUtility.Constants)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local SongbirdModule = require(CorePackages.Workspace.Packages.Songbird)
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local FFlagAddMenuNavigationToggleDialog = SharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local FFlagGamepadNavigationDialogABTestModule = require(Parent.Flags.FFlagGamepadNavigationDialogABTest)
local FFlagAddTraversalBackButton = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalBackButton
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = SharedFlagsModule.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local FFlagAddTopBarPoliciesToUniversalPolicies = SharedFlagsModule.FFlagAddTopBarPoliciesToUniversalPolicies
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagEnableInExperienceShop1 = InExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and FFlagEnableInExperienceShop
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local ShopGlobalIcon = InExperienceShopModule.ShopGlobalIcon
local View = require(CorePackages.Packages.Foundation).View
local SelectionCursorProvider = require(CorePackages.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local GamepadConnectorModule = require(Components.GamepadConnector)
local GamepadNavigationDialogModule = require(Presentation.GamepadNavigationDialog)
local HealthBar = CoreGuiCommonModule.Components.HealthBar
local MenuIconModule = require(Parent.ComponentsV2.MenuIcon)
local MenuIconContextModule = require(Components.MenuIconContext)
local MenuNavigationToggleDialogModule = require(Presentation.GamepadMenu.MenuNavigationToggleDialog)
local TraversalBackButtonModule = require(Components.TraversalBackButton)
local VRBottomUnibarModule = if IsInExperienceUIVREnabled then require(Components.VRBottomUnibar) else require(Parent1.VR.VRBottomBar.VRBottomBar)
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
local BuildPillMenuPortalHost = BuildExperienceModule.BuildPillMenuPortalHost
local AnalyticsModule = if game:GetEngineFeature("InGameChromeSignalAPI") then require(Chrome.ChromeShared.Analytics) else nil
local JoinVoiceBinderModule = if game:GetEngineFeature("VoiceChatSupported") and GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then require(Chrome.Integrations.JoinVoiceBinder) else nil
local PartyMicBinderModule = require(Chrome.Integrations.Party.PartyMicBinder)
local UnibarModule = require(Chrome.ChromeShared.Unibar)
local Default = require(Parent1.VoiceChat.VoiceChatServiceManager).default
local VoiceStateContextModule = require(Parent1.VoiceChat.VoiceStateContext)
local ServiceModule = if FFlagEnableInExperienceShop1 then require(Chrome.Service) else nil
local ConstantsModule2 = if FFlagEnableInExperienceShop1 then require(Chrome.ChromeShared.Unibar.Constants) else nil
local CommonIconModule = if FFlagEnableInExperienceShop1 then require(Chrome.Integrations.CommonIcon) else nil
local UseMappedSignal = if FFlagEnableInExperienceShop1 then require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local NewResult = if FFlagEnableInExperienceShop1 and ServiceModule and ConstantsModule2 then require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
	-- upvalues: ServiceModule (copy), ConstantsModule2 (copy)
	return ServiceModule:isWindowOpen(ConstantsModule2.IN_EXPERIENCE_SHOP_ID)
end) else nil
local ToggleInExperienceShopWindow = if FFlagEnableInExperienceShop1 then require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

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
	-- upvalues: FFlagEnableInExperienceShop1 (copy), FFlagCenterInExperienceShopWindow (copy), ToggleInExperienceShopWindow (copy), ServiceModule (copy), ConstantsModule2 (copy)
	if not FFlagEnableInExperienceShop1 then return end
	if FFlagCenterInExperienceShopWindow then
		if ToggleInExperienceShopWindow then
			ToggleInExperienceShopWindow()
			
			return
		end
	elseif ServiceModule and ConstantsModule2 then
		ServiceModule:toggleWindow(ConstantsModule2.IN_EXPERIENCE_SHOP_ID)
	end
end

local function _(): boolean
	-- upvalues: BuildExperienceModule (copy), VRService (copy)
	return BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled
end

return function(_)
	-- upvalues: UniversalAppPolicyModule (copy), FFlagAddTopBarPoliciesToUniversalPolicies (copy), SignalsReactModule (copy), CoreGuiCommonModule (copy), DisplayModule (copy), FFlagEnableInExperienceShop1 (copy), getShopGlobalIconEnabled (copy), getShopGlobalStatusIndicatorEnabled (copy), handleShopGlobalIconActivated (copy), ReactModule (copy), InExperienceShopModule (copy), UseMappedSignal (copy), NewResult (copy), GamepadConnectorModule (copy), IsSpatialFunction (copy), VRService (copy), ConstantsModule (copy), View (copy), ConstantsModule1 (copy), SongbirdModule (copy), FFlagAddMenuNavigationToggleDialog (copy), MenuNavigationToggleDialogModule (copy), FFlagGamepadNavigationDialogABTestModule (copy), GamepadNavigationDialogModule (copy), JoinVoiceBinderModule (copy), GetFFlagEnableCrossExpVoiceFunction (copy), PartyMicBinderModule (copy), AnalyticsModule (copy), FFlagEnableSideSheet (copy), SelectionCursorProvider (copy), MenuIconModule (copy), FFlagAddTraversalBackButton (copy), TraversalBackButtonModule (copy), MenuIconContextModule (copy), UnibarModule (copy), ShopGlobalIcon (copy), FFlagExperienceShopNewIconography (copy), CommonIconModule (copy), FFlagAppNavMyStatsTab (copy), BuildExperienceModule (copy), BuildPillMenuPortalHost (copy), HealthBar (copy), VoiceStateContextModule (copy), VRBottomUnibarModule (copy), Default (copy), IsInExperienceUIVREnabled (copy)
	local UseAppPolicyResult = UniversalAppPolicyModule.useAppPolicy(function(p1)
		-- upvalues: FFlagAddTopBarPoliciesToUniversalPolicies (upval)
		return if FFlagAddTopBarPoliciesToUniversalPolicies then p1.getShowBadgeOver12() else p1.ShowBadgeOver12 or false
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
	
	if FFlagEnableInExperienceShop1 then
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
	local UseRefResult1 = ReactModule.useRef(nil)
	local ShowTopBar = GamepadConnectorModule:getShowTopBar()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ShowTopBar:get())
	ReactModule.useEffect(function()
		-- upvalues: IsSpatialFunction (upval), GamepadConnectorModule (upval), VRService (upval), ShowTopBar (copy), UseBindingResult2 (copy), UseSignalStateResult (copy)
		if not IsSpatialFunction() then
			GamepadConnectorModule:connectToTopbar()
		end
		local Connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: IsSpatialFunction (upval), GamepadConnectorModule (upval)
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
	local ScaledTopBarButtonHeight = ConstantsModule.TopBarButtonHeight * UseSignalStateResult1
	local ScaledTopBarTopMargin = ConstantsModule.TopBarTopMargin * UseSignalStateResult1
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = 6,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Popups = ReactModule.createElement(View, { tag = "size-full" }, {
			SongbirdReportAudioFrame = ReactModule.createElement(View, {
				tag = "anchor-center-center position-center-center",
				Size = UDim2.new(1, 0, 0, ConstantsModule1.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
			}, {
				ReportAudioPopup = ReactModule.createElement(SongbirdModule.ReportAudioPopup)
			}),
			MenuNavigationToggleDialog = if FFlagAddMenuNavigationToggleDialog then ReactModule.createElement(MenuNavigationToggleDialogModule, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = GamepadConnectorModule
			}) else nil,
			GamepadNavigationDialog = if FFlagGamepadNavigationDialogABTestModule then ReactModule.createElement(GamepadNavigationDialogModule) else nil
		}),
		Binders = ReactModule.createElement(ReactModule.Fragment, {}, {
			JoinVoiceBinder = if JoinVoiceBinderModule then ReactModule.createElement(JoinVoiceBinderModule) else nil,
			PartyMicBinder = if GetFFlagEnableCrossExpVoiceFunction() then ReactModule.createElement(PartyMicBinderModule) else nil,
			ChromeAnalytics = if AnalyticsModule then ReactModule.createElement(AnalyticsModule) else nil
		}),
		TopBarFrame = ReactModule.createElement(View, {
			Size = UDim2.new(1, 0, 0, ConstantsModule.TopBarHeight * UseSignalStateResult1)
		}, {
			TopLeftFrame = ReactModule.createElement(View, {
				tag = "anchor-top-left auto-x row gap-small",
				Size = UDim2.fromOffset(0, ScaledTopBarButtonHeight),
				onAbsoluteSizeChanged = UseResult,
				onAbsolutePositionChanged = UseResult,
				Position = UDim2.new(0, ScaledScreenSideOffset, 0, ScaledTopBarTopMargin),
				Visible = UseBindingResult
			}, {
				MenuIcon = if FFlagEnableSideSheet then nil else ReactModule.createElement(SelectionCursorProvider, {}, {
					Icon = ReactModule.createElement(MenuIconModule, {
						showBadgeOver12 = UseAppPolicyResult,
						menuIconRef = UseRefResult1,
						unibarMenuRef = UseRefResult
					})
				}),
				TraversalBackButton = if FFlagAddTraversalBackButton then ReactModule.createElement(TraversalBackButtonModule) else nil,
				UnibarFrame = ReactModule.createElement(MenuIconContextModule.Provider, { value = { menuIconRef = UseRefResult1 } }, {
					ReactModule.createElement(UnibarModule, {
						layoutOrder = 2,
						onMinWidthChanged = function() end,
						onAreaChanged = function() end,
						menuRef = UseRefResult
					})
				}),
				ShopGlobalIcon = if FFlagEnableInExperienceShop1 and UseSignalStateResult2 and ShopGlobalIcon ~= nil then ReactModule.createElement(ShopGlobalIcon, {
					layoutOrder = 3,
					buttonSize = ScaledTopBarButtonHeight,
					showStatusIndicator = UseSignalStateResult3,
					onActivated = OnActivated,
					isActive = IsActive,
					icon = if FFlagExperienceShopNewIconography or (not CommonIconModule or not NewResult) then nil else CommonIconModule("BuildingStore", nil, NewResult)
				}) else nil
			}),
			TopRightFrame = ReactModule.createElement(View, {
				tag = "anchor-top-right auto-x",
				Size = UDim2.fromOffset(0, ScaledTopBarButtonHeight),
				Position = UDim2.new(1, -ScaledScreenSideOffset, 0, ScaledTopBarTopMargin)
			}, {
				BuildPillMenu = if FFlagAppNavMyStatsTab and (BuildExperienceModule.BuildModeLaunch:hasBuildMode() and not VRService.VREnabled) then ReactModule.createElement(BuildPillMenuPortalHost) else nil,
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