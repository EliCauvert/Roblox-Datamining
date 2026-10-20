local NotificationService = game:GetService("NotificationService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FormFactorModule = require(Parent.FormFactor)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Loading = FoundationModule.Loading
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SetFormFactorFunction = FormFactorModule.Actions.SetFormFactor
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppChatEntryPointModule = require(AppChat.AppChatEntryPoint)
local ChatEventReceiverModule = require(AppChat.Components.EventReceivers.ChatEventReceiver)
local ChatExternalEventReceiverModule = require(AppChat.App.Components.ChatExternalEventReceiver)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local _ = require(AppChat.App.InExperienceAppChatModal)
local UseParentContainerExtentsModule = require(AppChat.Contexts.ParentContainer.useParentContainerExtents)
local ContainerModule = require(AppChat.Components.ExternalNavigationHandler.Container)
local UseExternalNavigationByScreenModule = require(AppChat.Hooks.useExternalNavigationByScreen)
local UseAppChatIsWideModeModule = require(AppChat.Hooks.useAppChatIsWideMode)
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local LocalPlayer = game:GetService("Players").LocalPlayer
local RobloxEventReceiver = require(Parent.RealtimeDelivery).RobloxEventReceiver
local Signal = require(Parent.AppCommonLib).Signal
local SquadAppChatEventReceiver = require(Parent.SquadsCore.Components).SquadAppChatEventReceiver
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseRefFunction = ReactModule.useRef
local AppChatInExperienceMountMinLoadingTimeMs = game:DefineFastInt("AppChatInExperienceMountMinLoadingTimeMs", 0)
local FFlagAppChatInExpSelectChatMembersMobileHeightModule = require(AppChat.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight)
local FFlagSquadAppChatRTNFix = require(Parent.SharedFlags).FFlagSquadAppChatRTNFix
local FIntAppChatWideBreakpointMinHeightModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinHeight)
local FIntAppChatWideBreakpointMinWidthModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinWidth)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local GetFFlagAppChatRequestedRouteModule = require(AppChat.Flags.getFFlagAppChatRequestedRoute)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local GetRootedNavigationStoreModule = require(AppChat.Stores.GetRootedNavigationStore)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)

local function _()
	-- upvalues: AppChat (copy)
	return require(AppChat.EnumScreens)
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseContextFunction (copy), ParentContainerContextModule (copy), UseStateFunction (copy), UseExternalNavigationByScreenModule (copy), UseMemoFunction (copy), Signal (copy), RobloxEventReceiver (copy), NotificationService (copy), ReactModule (copy), ResponsiveModule (copy), FIntAppChatWideBreakpointMinWidthModule (copy), FIntAppChatWideBreakpointMinHeightModule (copy), FFlagAppChatInExpSelectChatMembersMobileHeightModule (copy), UseAppChatIsWideModeModule (copy), GetFFlagAppChatRequestedRouteModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), AppChat (copy), UseRefFunction (copy), UseSignalStateFunction (copy), GetRootedNavigationStoreModule (copy), UseEffectFunction (copy), PartyPageCarouselExperimentation (copy), SetFormFactorFunction (copy), FormFactorModule (copy), UseParentContainerExtentsModule (copy), UseCallbackFunction (copy), AppChatInExperienceMountMinLoadingTimeMs (copy), AppChatEntryPointModule (copy), LocalPlayer (copy), ChatPlacementContextModule (copy), Loading (copy), IconSize (copy), IconButton (copy), IconName (copy), ButtonSize (copy), ButtonVariant (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ChatEventReceiverModule (copy), ChatExternalEventReceiverModule (copy), ContainerModule (copy), FFlagSquadAppChatRTNFix (copy), SquadAppChatEventReceiver (copy)
	local UseDispatchResult = UseDispatchFunction()
	local HideParentContainerFunction = UseContextFunction(ParentContainerContextModule).hideParentContainer
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseExternalNavigationByScreenModuleResult, UseExternalNavigationByScreenModuleResult2 = UseExternalNavigationByScreenModule()
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
		return RobloxEventReceiver.new(NotificationService)
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local IsWide = ResponsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = FIntAppChatWideBreakpointMinWidthModule,
			minHeight = FIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide"
	local NoFFlagAppChatInExpSelectChatMembersMobileHeightModule = if FFlagAppChatInExpSelectChatMembersMobileHeightModule or UseOrientationResult ~= ResponsiveModule.Keys.Portrait and IsWide then not FFlagAppChatInExpSelectChatMembersMobileHeightModule or UseAppChatIsWideModeModule(true) else false
	local FFlagAppChatRequestedRouteModule = GetFFlagAppChatRequestedRouteModule()
	local FFlagAppChatEnableRootedNavigationModule = GetFFlagAppChatEnableRootedNavigationModule()
	local IsRooted: boolean = FFlagAppChatEnableRootedNavigationModule and (p1.requestedRoute ~= nil and (p1.requestedRoute.screen == require(AppChat.EnumScreens).ChatDetails and (p1.requestedRoute.params ~= nil and p1.requestedRoute.params.rooted == true)))
	local UseRefResult1 = UseRefFunction(false)
	
	if IsRooted then
		UseRefResult1.current = true
	end
	local NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1 = not UseRefResult1.current and NoFFlagAppChatInExpSelectChatMembersMobileHeightModule
	local UseSignalStateResult = if FFlagAppChatEnableRootedNavigationModule then UseSignalStateFunction(GetRootedNavigationStoreModule(false).getIsNavigationPending) else false
	UseEffectFunction(function()
		-- upvalues: PartyPageCarouselExperimentation (upval), NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1 (copy), UseDispatchResult (copy), SetFormFactorFunction (upval), FormFactorModule (upval)
		if PartyPageCarouselExperimentation.getAppChatFormFactorEnabled() then
			if NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1 then
				UseDispatchResult(SetFormFactorFunction(FormFactorModule.Enums.FormFactor.WIDE))
				
				return
			end
			UseDispatchResult(SetFormFactorFunction(FormFactorModule.Enums.FormFactor.COMPACT))
		end
	end, {
		NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1,
		UseDispatchResult
	})
	local UseParentContainerExtentsModuleResult, UseParentContainerExtentsModuleResult2 = UseParentContainerExtentsModule()
	local IsUseOrientationResultMatch = UseOrientationResult == ResponsiveModule.DefaultKey
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(IsUseOrientationResultMatch)
	local UseRefResult2 = UseRefFunction(os.clock())
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), HideParentContainerFunction (copy)
		p1.hideAppChat()
		HideParentContainerFunction()
	end, { HideParentContainerFunction, p1.hideAppChat })
	UseEffectFunction(function()
		-- upvalues: IsUseOrientationResultMatch (copy), UseRefResult2 (copy), AppChatInExperienceMountMinLoadingTimeMs (upval), UseStateResult2_1 (copy)
		if not IsUseOrientationResultMatch then
			local Elapsed = os.clock() - UseRefResult2.current
			local AppChatInExperienceMountMinLoadingTimeMsRatio = AppChatInExperienceMountMinLoadingTimeMs / 1000
			
			if Elapsed < AppChatInExperienceMountMinLoadingTimeMsRatio then
				delay(AppChatInExperienceMountMinLoadingTimeMsRatio - Elapsed, function()
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(false)
				end)
				
				return
			end
			UseStateResult2_1(false)
		end
	end, { IsUseOrientationResultMatch, UseStateResult2_1 })
	local Element = ReactModule.createElement(AppChatEntryPointModule, {
		isVisible = true,
		setActiveConversationId = UseStateResult2,
		localUserId = if LocalPlayer then LocalPlayer.UserId else nil,
		chatPlacement = ChatPlacementContextModule.Enum.InExperienceDefault,
		initialConversationId = p1.initialConversationId,
		setInitialConversationId = p1.setInitialConversationId,
		requestedRoute = if FFlagAppChatRequestedRouteModule then p1.requestedRoute else nil,
		clearRequestedRoute = if FFlagAppChatRequestedRouteModule then p1.clearRequestedRoute else nil,
		wideMode = NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1,
		navigateToRootStack = UseCallbackResult,
		updateExternalNavigationForScreen = UseExternalNavigationByScreenModuleResult2
	})
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		AppChatWindow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = UseParentContainerExtentsModuleResult:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.X, Vector.Y)
			end),
			Position = UseParentContainerExtentsModuleResult2:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.X, Vector.Y)
			end),
			ref = UseRefResult
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			containerRef = ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = UseRefResult }, {
				AppChatContent = if UseStateResult1 then if UseSignalStateResult then nil else ReactModule.createElement(Loading, {
					size = IconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) elseif FFlagAppChatEnableRootedNavigationModule then ReactModule.createElement("Frame", {
					Name = "AppChatContent",
					[ReactModule.Tag] = "data-testid=app-chat-content",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Visible = not UseSignalStateResult
				}, { AppChatEntryPoint = Element }) else Element,
				LoadingOverlay = if UseSignalStateResult then ReactModule.createElement("Frame", {
					Name = "AppChatLoadingOverlay",
					[ReactModule.Tag] = "data-testid=app-chat-loading-overlay",
					Active = true,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2
				}, {
					Spinner = ReactModule.createElement(Loading, {
						size = IconSize.Large,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}),
					BackButton = ReactModule.createElement(IconButton, {
						ZIndex = 3,
						icon = IconName.ChevronLargeLeft,
						size = ButtonSize.XSmall,
						variant = ButtonVariant.Utility,
						AnchorPoint = Vector2.new(0, 0),
						Position = UDim2.fromOffset(12, 12),
						onActivated = UseCallbackResult,
						testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.appChatLoadingOverlayBackButton() else nil
					})
				}) else nil
			})
		}),
		ChatEventReceiver = ReactModule.createElement(ChatEventReceiverModule, {
			robloxEventReceiver = UseMemoResult1,
			rnBypassActionSignal = UseMemoResult,
			activeConversationId = tostring(UseStateResult)
		}),
		ChatExternalEventReceiver = ReactModule.createElement(ChatExternalEventReceiverModule, {
			robloxEventReceiver = UseMemoResult1,
			localUserId = if LocalPlayer then LocalPlayer.UserId else nil
		}),
		ExternalNavigationHandler = ReactModule.createElement(ContainerModule, {
			navigationByScreen = UseExternalNavigationByScreenModuleResult
		}),
		SquadAppChatEventReceiver = if FFlagSquadAppChatRTNFix then ReactModule.createElement(SquadAppChatEventReceiver) else nil
	})
end