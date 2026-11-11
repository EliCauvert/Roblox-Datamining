local NotificationService = game:GetService("NotificationService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FormFactorModule = require(Parent.FormFactor)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
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

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseContextFunction (copy), ParentContainerContextModule (copy), UseStateFunction (copy), UseExternalNavigationByScreenModule (copy), UseMemoFunction (copy), Signal (copy), RobloxEventReceiver (copy), NotificationService (copy), ReactModule (copy), ResponsiveModule (copy), FIntAppChatWideBreakpointMinWidthModule (copy), FIntAppChatWideBreakpointMinHeightModule (copy), FFlagAppChatInExpSelectChatMembersMobileHeightModule (copy), UseAppChatIsWideModeModule (copy), GetFFlagAppChatRequestedRouteModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), UseEffectFunction (copy), PartyPageCarouselExperimentation (copy), SetFormFactorFunction (copy), FormFactorModule (copy), UseParentContainerExtentsModule (copy), UseRefFunction (copy), UseCallbackFunction (copy), AppChatInExperienceMountMinLoadingTimeMs (copy), Loading (copy), IconSize (copy), AppChatEntryPointModule (copy), LocalPlayer (copy), ChatPlacementContextModule (copy), ChatEventReceiverModule (copy), ChatExternalEventReceiverModule (copy), ContainerModule (copy), FFlagSquadAppChatRTNFix (copy), SquadAppChatEventReceiver (copy)
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
	local NoFFlagAppChatInExpSelectChatMembersMobileHeightModule1 = not (GetFFlagAppChatEnableRootedNavigationModule() and (p1.requestedRoute ~= nil and (p1.requestedRoute.params ~= nil and p1.requestedRoute.params.rooted == true))) and NoFFlagAppChatInExpSelectChatMembersMobileHeightModule
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
	local UseRefResult1 = UseRefFunction(os.clock())
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), HideParentContainerFunction (copy)
		p1.hideAppChat()
		HideParentContainerFunction()
	end, { HideParentContainerFunction, p1.hideAppChat })
	UseEffectFunction(function()
		-- upvalues: IsUseOrientationResultMatch (copy), UseRefResult1 (copy), AppChatInExperienceMountMinLoadingTimeMs (upval), UseStateResult2_1 (copy)
		if not IsUseOrientationResultMatch then
			local Elapsed = os.clock() - UseRefResult1.current
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
				AppChatEntryPoint = if UseStateResult1 then ReactModule.createElement(Loading, {
					size = IconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) else ReactModule.createElement(AppChatEntryPointModule, {
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