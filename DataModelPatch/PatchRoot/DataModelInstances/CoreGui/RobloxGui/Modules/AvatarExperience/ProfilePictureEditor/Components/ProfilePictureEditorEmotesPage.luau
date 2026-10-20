local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local AppPageModule = require(Modules.LuaApp.AppPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local LoadingStatePage = UIBloxModule.App.Container.LoadingStatePage
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Common = Modules.AvatarExperience.Common
local AnalyticsModule = require(Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AvatarExperienceViewModule = require(Common.Components.AvatarExperienceView)
local MakeTitleDropDownModule = require(Common.Components.TopBar.makeTitleDropDown)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local WithStackVisibilityWrapperModule = require(Common.Components.RoactNavigation.withStackVisibilityWrapper)
local SetFullViewModule = require(Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local UtilsModule = require(Common.Utils)
local OpenQuickMenuModule = require(Common.Thunks.OpenQuickMenu)
local OpenItemPromptModule = require(Common.Thunks.OpenItemPrompt)
local SetItemDetailsPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetItemDetailsPeekViewState
local NavigationUtilsModule = require(Common.Components.RoactNavigation.NavigationUtils)
local SelectIsFullViewModule = require(Common.Selectors.selectIsFullView)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagUpdateNoInternetConnectionText = AvatarExperienceFlagsModule.FFlagUpdateNoInternetConnectionText
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local ProfilePictureEditor = Modules.AvatarExperience.ProfilePictureEditor
local AnalyticsModule2 = require(ProfilePictureEditor.Services.Analytics)
local FetchPPEConfigModule = require(ProfilePictureEditor.Thunks.FetchPPEConfig)
local ProfilePictureEditorBottomBarModule = require(ProfilePictureEditor.Components.ProfilePictureEditorBottomBar)
local EmotesScrollViewModule = require(ProfilePictureEditor.Components.EmotesScrollView)
local ConstantsModule = require(ProfilePictureEditor.Constants)
local FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation
local FFlagAXOpaqueMarketplaceTopbar = AvatarExperienceFlagsModule.FFlagAXOpaqueMarketplaceTopbar
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local ProfilePictureEditorEmotesPage = RoactModule.PureComponent:extend("ProfilePictureEditorEmotesPage")
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt,
	[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.OpenCatalogContextMenu
}

local function useFocusNavigationBindings(p1, Callback, Callback1, Callback2)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), Callback1 (copy), Callback2 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if Callback1 then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback1 (upval)
					Callback1()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if Callback2 then {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback2 (upval)
					Callback2()
				end)
			} else nil
		}
	end, { Callback, Callback1, Callback2 }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

ProfilePictureEditorEmotesPage.validateProps = TModule.strictInterface({
	avatarRoute = TModule.table,
	navigation = TModule.table,
	networking = TModule.callback,
	avatarExperienceAnalytics = TModule.table,
	profilePictureEditorAnalytics = TModule.table,
	fullView = TModule.userdata,
	fetchingStatus = TModule.string,
	isPortrait = TModule.boolean,
	itemDetailsExpanded = TModule.boolean,
	emoteAssetId = TModule.optional(TModule.string),
	tryOnItems = TModule.table,
	fetchPPEConfig = TModule.callback,
	setFullView = TModule.callback,
	navigateIntoQuickMenu = TModule.callback,
	setItemDetailsPeekViewState = TModule.callback,
	is10ftUI = TModule.boolean,
	overlayClosedCallback = TModule.callback,
	resolvedFocusNavigationRef = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then TModule.table else nil,
	topBarRef = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then TModule.table else nil
})

function ProfilePictureEditorEmotesPage.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (copy), UserInputService (copy), IsGamepadInputFunction (copy), UtilsModule (copy), AvatarScreen (copy), AppPageModule (copy), TopBarModule (copy), CryoModule (copy), ProfilePictureEditorBottomBarModule (copy), MakeTitleDropDownModule (copy)
	p1.sceneUIContainerRef = RoactModule.createRef()
	p1.emotesScrollViewRef = RoactModule.createRef()
	
	if not FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then
		p1.topBarRef = RoactModule.createRef()
	end
	p1.bottomBarRef = RoactModule.createRef()
	p1:setState({
		bottomBarHeight = 72,
		lastInputIsGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	})
	
	function p1.fetchPPEConfig()
		-- upvalues: p1 (copy)
		p1.props.fetchPPEConfig(p1.props.networking)
	end
	
	function p1.onAbsoluteSizeChanged(p2)
		-- upvalues: p1 (copy)
		p1:setState({ bottomBarHeight = p2.Y })
	end
	
	function p1.changeView()
		-- upvalues: p1 (copy), UtilsModule (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, (UtilsModule.getNewFullViewEnum(p1.props.fullView)))
	end
	
	function p1.onBackFromTopBar()
		-- upvalues: p1 (copy), AvatarScreen (upval), AppPageModule (upval)
		local PrevNavPageParam = p1.props.navigation.getParam("prevNavPage")
		p1.props.navigation.navigate(if PrevNavPageParam then PrevNavPageParam elseif p1.props.is10ftUI then AvatarScreen.AvatarExperienceLandingPage else AppPageModule.Home)
	end
	
	p1.backButton = TopBarModule.makeBackButton(p1.onBackFromTopBar)
	
	function p1.onNext()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.profilePictureEditorAnalytics.clickNextFromEmotesPage(p1.props.emoteAssetId)
		p1.props.navigation.navigate(AvatarScreen.ProfilePictureEditorCamera, {})
	end
	
	function p1.onDone()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.ProfilePictureEditorFinal, {})
	end
	
	function p1.onRevertBtnClicked()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.ProfilePictureEditorRevertToDefaultPrompt, { onBack = p1.onBackFromTopBar })
	end
	
	function p1.renderBottomBar()
		-- upvalues: CryoModule (upval), p1 (copy), RoactModule (upval), ProfilePictureEditorBottomBarModule (upval)
		return RoactModule.createElement(ProfilePictureEditorBottomBarModule, {
			button1 = {
				textKey = "Feature.Avatar.Action.Revert",
				isDisabled = false,
				onActivated = p1.onRevertBtnClicked
			},
			button2 = {
				textKey = "Authentication.CrossDevice.Action.Next",
				onActivated = p1.onNext,
				isDisabled = not CryoModule.isEmpty(p1.props.tryOnItems)
			},
			NextSelectionUp = p1.emotesScrollViewRef,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
			baseRef = p1.bottomBarRef
		})
	end
	
	function p1.lastInputTypeChangedCallback(p2)
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction(p2)
		
		if IsGamepadInput ~= p1.state.lastInputIsGamepad then
			p1:setState({ lastInputIsGamepad = IsGamepadInput })
		end
	end
	
	p1.titleDropDown = MakeTitleDropDownModule("Feature.Avatar.Action.EditProfilePicture", p1.props.overlayClosedCallback)
end

function ProfilePictureEditorEmotesPage.renderTopBar(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), TopBarModule (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (copy), FFlagAXOpaqueMarketplaceTopbar (copy), FFlagEnableLeftNavOnConsole (copy)
	local IsPortrait = p1.props.isPortrait
	
	return WithLocalizationFunction({ title = "Feature.Avatar.Action.EditProfilePicture" })(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), TopBarModule (upval), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (upval), FFlagAXOpaqueMarketplaceTopbar (upval), FFlagEnableLeftNavOnConsole (upval), IsPortrait (copy)
		return RoactModule.createElement(TopBarModule.Container, {
			[RoactModule.Ref] = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
			NextSelectionDown = p1.emotesScrollViewRef,
			titleText = p2.title,
			transparentBackground = not FFlagAXOpaqueMarketplaceTopbar and not FFlagEnableLeftNavOnConsole or (if IsPortrait then true else false),
			hideSiteMessageBanner = IsPortrait,
			leftItem = p1.backButton,
			centerItem = if p1.props.is10ftUI then p1.titleDropDown else nil,
			useParentSizeForCenterItem = true
		})
	end)
end

function ProfilePictureEditorEmotesPage.render(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), FullView (copy), WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagUpdateNoInternetConnectionText (copy), RoactModule (copy), Focusable (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (copy), NavigationEventsLoggerModule (copy), ExternalEventConnection (copy), UserInputService (copy), AvatarExperienceViewModule (copy), LoadingStateContainer (copy), RetrievalStatus (copy), LoadingStatePage (copy), EmotesScrollViewModule (copy)
	local BottomBarHeight = if FFlagEnableLeftNavOnConsole then if p1.props.isPortrait then p1.state.bottomBarHeight else 0 else p1.state.bottomBarHeight
	local FetchingStatus = p1.props.fetchingStatus
	local IsFullViewMatch = p1.props.fullView == FullView.UIFullView
	local IsFullViewMatch1 = p1.props.fullView == FullView.SceneFullView
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), FFlagUpdateNoInternetConnectionText (upval), RoactModule (upval), Focusable (upval), p1 (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (upval), NavigationEventsLoggerModule (upval), ExternalEventConnection (upval), UserInputService (upval), AvatarExperienceViewModule (upval), IsFullViewMatch1 (copy), IsFullViewMatch (copy), LoadingStateContainer (upval), RetrievalStatus (upval), FetchingStatus (copy), LoadingStatePage (upval), EmotesScrollViewModule (upval), BottomBarHeight (copy)
		return WithLocalizationFunction({
			failedMessage = if FFlagUpdateNoInternetConnectionText then "Feature.DisplayName.ErrorMessage.SomethingWentWrong" else "Feature.EmptyStatePage.Message.NoInternet"
		})(function(p3)
			-- upvalues: RoactModule (upval), Focusable (upval), p1 (upval), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (upval), NavigationEventsLoggerModule (upval), ExternalEventConnection (upval), UserInputService (upval), AvatarExperienceViewModule (upval), IsFullViewMatch1 (upval), IsFullViewMatch (upval), LoadingStateContainer (upval), RetrievalStatus (upval), FetchingStatus (upval), p2 (copy), LoadingStatePage (upval), EmotesScrollViewModule (upval), BottomBarHeight (upval)
			return RoactModule.createElement(Focusable.Frame, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				defaultChild = p1.emotesScrollViewRef,
				restorePreviousChildFocus = false,
				[RoactModule.Ref] = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then p1.props.resolvedFocusNavigationRef else p1.ref
			}, {
				NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "ProfilePictureEditorEmotes" }),
				LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
					event = UserInputService.LastInputTypeChanged,
					callback = p1.lastInputTypeChangedCallback
				}),
				AvatarExperienceView = RoactModule.createElement(AvatarExperienceViewModule, {
					bottomBarEnabled = false,
					allowAdaptiveScrolling = true,
					changeViewFunction = p1.changeView,
					isSceneFullView = IsFullViewMatch1,
					isUIFullView = IsFullViewMatch,
					topBar = p1:renderTopBar(),
					[RoactModule.Ref] = p1.sceneUIContainerRef,
					NextSelectionDown = p1.emotesScrollViewRef
				}, {
					LoadingStateContainer = RoactModule.createElement(LoadingStateContainer, {
						dataStatus = RetrievalStatus.fromRawValue(FetchingStatus),
						renderOnLoading = function()
							-- upvalues: RoactModule (upval), p2 (upval), LoadingStatePage (upval)
							return RoactModule.createElement("Frame", {
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency,
								BackgroundColor3 = p2.Theme.BackgroundDefault.Color
							}, RoactModule.createElement(LoadingStatePage))
						end,
						renderOnLoaded = function()
							-- upvalues: RoactModule (upval), EmotesScrollViewModule (upval), p1 (upval), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (upval), BottomBarHeight (upval)
							return RoactModule.createFragment({
								EmotesScrollView = RoactModule.createElement(EmotesScrollViewModule, {
									baseRef = p1.emotesScrollViewRef,
									NextSelectionUp = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
									NextSelectionDown = p1.bottomBarRef,
									bottomBarHeight = BottomBarHeight
								}),
								BottomBar = p1.renderBottomBar()
							})
						end,
						renderOnFailed = function()
							-- upvalues: p1 (upval), p3 (copy)
							return p1:renderOnFailed(p3)
						end
					})
				})
			})
		end)
	end)
end

function ProfilePictureEditorEmotesPage.renderOnFailed(p1, p2)
	-- upvalues: RoactModule (copy), EmptyState (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (copy)
	return RoactModule.createElement(EmptyState, {
		NextSelectionUp = if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
		onActivated = p1.fetchPPEConfig,
		text = p2.failedMessage
	})
end

function ProfilePictureEditorEmotesPage.didMount(p1)
	-- upvalues: RetrievalStatusModule (copy)
	if p1.props.fetchingStatus == RetrievalStatusModule.NotStarted then
		p1.fetchPPEConfig()
	end
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: ConstantsModule (copy), SelectIsFullViewModule (copy), AvatarScreen (copy), DeviceOrientationMode (copy), PerformFetch (copy)
	return {
		fullView = SelectIsFullViewModule(p1, AvatarScreen.ProfilePictureEditorEmotes),
		fetchingStatus = PerformFetch.GetStatus(p1, ConstantsModule.PPEConfigFetchStatusKey),
		itemDetailsExpanded = p1.AvatarExperience.Common.ItemDetailsExpanded,
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		emoteAssetId = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId,
		tryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	}
end, function(Callback)
	-- upvalues: FetchPPEConfigModule (copy), SetFullViewModule (copy), OpenQuickMenuModule (copy), SetItemDetailsPeekViewStateFunction (copy)
	return {
		fetchPPEConfig = function(p1)
			-- upvalues: Callback (copy), FetchPPEConfigModule (upval)
			Callback(FetchPPEConfigModule(p1))
		end,
		setFullView = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p1, p2, p3))
		end,
		navigateIntoQuickMenu = function(p1, p2)
			-- upvalues: Callback (copy), OpenQuickMenuModule (upval)
			Callback(OpenQuickMenuModule(p1, p2))
		end,
		setItemDetailsPeekViewState = function(p1)
			-- upvalues: Callback (copy), SetItemDetailsPeekViewStateFunction (upval)
			Callback(SetItemDetailsPeekViewStateFunction(p1))
		end
	}
end)((RoactServices.connect({
	avatarExperienceAnalytics = AnalyticsModule,
	profilePictureEditorAnalytics = AnalyticsModule2,
	networking = RoactNetworkingModule
})(ProfilePictureEditorEmotesPage)))))

return function(p1)
	-- upvalues: UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation (copy), ReactModule (copy), UseDispatchFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule1 (copy), UseFocusGuiObjectFunction (copy), NavigationUtilsModule (copy), OpenItemPromptModule (copy), AvatarScreen (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), CryoModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), RoactModule (copy), WithStackVisibilityWrapperModuleResult (ref)
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule()
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult
	})
	local JoinResult = nil
	
	if FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation then
		local UseRefResult = ReactModule.useRef(nil)
		local UseDispatchResult = UseDispatchFunction()
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
		local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy)
			if UseFocusGuiObjectResult and UseRefResult and UseRefResult.current then
				UseFocusGuiObjectResult(UseRefResult.current)
			end
		end, { UseFocusGuiObjectResult })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: NavigationUtilsModule (upval), p1 (copy)
			NavigationUtilsModule.closeFocusedScreen(p1.navigation)
		end, { p1.navigation })
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), OpenItemPromptModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), UseOverlayClosedCallbackModuleResult (copy), p1 (copy), UseAvatarRouteResult (copy)
			UseDispatchResult(OpenItemPromptModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, UseOverlayClosedCallbackModuleResult, p1.navigation, UseAvatarRouteResult))
		end, {
			UseDispatchResult, UseRoactServiceModuleResult, UseRoactServiceModuleResult1,
			UseOverlayClosedCallbackModuleResult, p1.navigation, UseAvatarRouteResult
		})
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), UseOverlayClosedCallbackModuleResult (copy)
			p1.navigation.navigate(AvatarScreen.CatalogContextMenu, {
				itemId = UseAvatarRouteResult.current.params.itemId,
				itemType = UseAvatarRouteResult.current.params.itemType,
				onOverlayClosed = UseOverlayClosedCallbackModuleResult
			})
		end, {
			p1.navigation,
			UseAvatarRouteResult,
			UseOverlayClosedCallbackModuleResult
		})
		JoinResult = CryoModule.Dictionary.join(p1, {
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
			is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole,
			topBarRef = UseRefResult,
			resolvedFocusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, if UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails then UseResult1 else UseResult, if UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails then UseResult2 else nil, if UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails then UseResult3 else nil)))
		})
	else
		JoinResult = CryoModule.Dictionary.join(p1, {
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
			is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
		})
	end
	return RoactModule.createElement("Frame", {
		[RoactModule.Ref] = UseAvatarExperienceFocusNavigationBindingsModuleResult,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, ReactModule.createElement(WithStackVisibilityWrapperModuleResult, JoinResult))
end