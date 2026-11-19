local NotificationService = game:GetService("NotificationService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FormFactorModule = require(Parent.FormFactor)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
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
local UseIsChatBesideSideSheetModule = require(AppChat.App.useIsChatBesideSideSheet)
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
local FFlagSquadAppChatRTNFix = SharedFlagsModule.FFlagSquadAppChatRTNFix
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local FIntAppChatWideBreakpointMinHeightModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinHeight)
local FIntAppChatWideBreakpointMinWidthModule = require(AppChat.Flags.FIntAppChatWideBreakpointMinWidth)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local GetRootedNavigationStoreModule = require(AppChat.Stores.GetRootedNavigationStore)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)

local function _(Vector): boolean
	-- upvalues: FIntAppChatWideBreakpointMinWidthModule (copy), FIntAppChatWideBreakpointMinHeightModule (copy)
	return Vector.Y > 0 and (Vector.Y <= Vector.X and FIntAppChatWideBreakpointMinWidthModule <= Vector.X) and FIntAppChatWideBreakpointMinHeightModule <= Vector.Y
end

local _ = function()
	-- upvalues: AppChat (copy)
	return require(AppChat.EnumScreens)
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseContextFunction (copy), ParentContainerContextModule (copy), UseStateFunction (copy), UseExternalNavigationByScreenModule (copy), UseMemoFunction (copy), Signal (copy), RobloxEventReceiver (copy), NotificationService (copy), ReactModule (copy), ResponsiveModule (copy), FIntAppChatWideBreakpointMinWidthModule (copy), FIntAppChatWideBreakpointMinHeightModule (copy), FFlagAppChatInExpSelectChatMembersMobileHeightModule (copy), UseAppChatIsWideModeModule (copy), AppChat (copy), UseRefFunction (copy), UseParentContainerExtentsModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), UseIsChatBesideSideSheetModule (copy), UseEffectFunction (copy), UseSignalStateFunction (copy), GetRootedNavigationStoreModule (copy), PartyPageCarouselExperimentation (copy), SetFormFactorFunction (copy), FormFactorModule (copy), UseCallbackFunction (copy), AppChatInExperienceMountMinLoadingTimeMs (copy), AppChatEntryPointModule (copy), LocalPlayer (copy), ChatPlacementContextModule (copy), Loading (copy), IconSize (copy), IconButton (copy), IconName (copy), ButtonSize (copy), ButtonVariant (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ChatEventReceiverModule (copy), ChatExternalEventReceiverModule (copy), ContainerModule (copy), FFlagSquadAppChatRTNFix (copy), SquadAppChatEventReceiver (copy)
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
	local IsRooted: boolean = p1.requestedRoute ~= nil and (p1.requestedRoute.screen == require(AppChat.EnumScreens).ChatDetails and (p1.requestedRoute.params ~= nil and p1.requestedRoute.params.rooted == true))
	local UseRefResult1 = UseRefFunction(false)
	
	if IsRooted then
		UseRefResult1.current = true
	end
	local UseParentContainerExtentsModuleResult, UseParentContainerExtentsModuleResult2 = UseParentContainerExtentsModule()
	local UseIsChatBesideSideSheetModuleResult = if FFlagKeepSideSheetOpenBesideMenu then UseIsChatBesideSideSheetModule() else false
	local v1 = false
	
	if FFlagKeepSideSheetOpenBesideMenu then
		local UseStateResult1, UseStateResult2_1 = UseStateFunction(function(): boolean
			-- upvalues: UseParentContainerExtentsModuleResult (copy), FIntAppChatWideBreakpointMinWidthModule (upval), FIntAppChatWideBreakpointMinHeightModule (upval)
			local Value = UseParentContainerExtentsModuleResult:getValue()
			
			return Value.Y > 0 and (Value.Y <= Value.X and FIntAppChatWideBreakpointMinWidthModule <= Value.X) and FIntAppChatWideBreakpointMinHeightModule <= Value.Y
		end)
		UseEffectFunction(function()
			-- upvalues: UseStateResult2_1 (copy), UseParentContainerExtentsModuleResult (copy), FIntAppChatWideBreakpointMinWidthModule (upval), FIntAppChatWideBreakpointMinHeightModule (upval), ReactModule (upval)
			local Value = UseParentContainerExtentsModuleResult:getValue()
			UseStateResult2_1(Value.Y > 0 and (Value.Y <= Value.X and FIntAppChatWideBreakpointMinWidthModule <= Value.X) and FIntAppChatWideBreakpointMinHeightModule <= Value.Y)
			
			return ReactModule.__subscribeToBinding(UseParentContainerExtentsModuleResult, function(Vector)
				-- upvalues: UseStateResult2_1 (upval), FIntAppChatWideBreakpointMinWidthModule (upval), FIntAppChatWideBreakpointMinHeightModule (upval)
				UseStateResult2_1(Vector.Y > 0 and (Vector.Y <= Vector.X and FIntAppChatWideBreakpointMinWidthModule <= Vector.X) and FIntAppChatWideBreakpointMinHeightModule <= Vector.Y)
			end)
		end, { UseParentContainerExtentsModuleResult })
		v1 = UseStateResult1
	end
	local NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1 = not UseRefResult1.current and (if UseIsChatBesideSideSheetModuleResult then v1 else NoFFlagAppChatInExpSelectChatMembersMobileHeightModule)
	local UseSignalStateResult = UseSignalStateFunction(GetRootedNavigationStoreModule(false).getIsNavigationPending)
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
	local IsUseOrientationResultMatch = UseOrientationResult == ResponsiveModule.DefaultKey
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(IsUseOrientationResultMatch)
	local UseRefResult2 = UseRefFunction(os.clock())
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), HideParentContainerFunction (copy)
		p1.hideAppChat()
		HideParentContainerFunction()
	end, { HideParentContainerFunction, p1.hideAppChat })
	UseEffectFunction(function()
		-- upvalues: IsUseOrientationResultMatch (copy), UseRefResult2 (copy), AppChatInExperienceMountMinLoadingTimeMs (upval), UseStateResult2_2 (copy)
		if not IsUseOrientationResultMatch then
			local Elapsed = os.clock() - UseRefResult2.current
			local AppChatInExperienceMountMinLoadingTimeMsRatio = AppChatInExperienceMountMinLoadingTimeMs / 1000
			
			if Elapsed < AppChatInExperienceMountMinLoadingTimeMsRatio then
				delay(AppChatInExperienceMountMinLoadingTimeMsRatio - Elapsed, function()
					-- upvalues: UseStateResult2_2 (upval)
					UseStateResult2_2(false)
				end)
				
				return
			end
			UseStateResult2_2(false)
		end
	end, { IsUseOrientationResultMatch, UseStateResult2_2 })
	local Element = ReactModule.createElement(AppChatEntryPointModule, {
		isVisible = true,
		setActiveConversationId = UseStateResult2,
		localUserId = if LocalPlayer then LocalPlayer.UserId else nil,
		chatPlacement = ChatPlacementContextModule.Enum.InExperienceDefault,
		initialConversationId = p1.initialConversationId,
		setInitialConversationId = p1.setInitialConversationId,
		requestedRoute = p1.requestedRoute,
		clearRequestedRoute = p1.clearRequestedRoute,
		wideMode = NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1,
		navigateToRootStack = UseCallbackResult,
		updateExternalNavigationForScreen = UseExternalNavigationByScreenModuleResult2
	})
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		AppChatWindow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Name = if FFlagKeepSideSheetOpenBesideMenu then "AppChatWindow" else nil,
			BackgroundColor3 = Color3.new(0, 0, 0),
			ClipsDescendants = if UseIsChatBesideSideSheetModuleResult then true else nil,
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
				AppChatContent = if UseStateResult3 then if UseSignalStateResult then nil else ReactModule.createElement(Loading, {
					size = IconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) else ReactModule.createElement("Frame", {
					Name = "AppChatContent",
					[ReactModule.Tag] = "data-testid=app-chat-content",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Visible = not UseSignalStateResult
				}, { AppChatEntryPoint = Element }),
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