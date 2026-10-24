local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local _ = require(Parent.ReactFocusNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local Analytics = require(Parent.MomentsCommon).Analytics
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local EventNames = Analytics.EventNames
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local Loading = FoundationModule.Loading
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseUsernameModule = require(Moments.Hooks.useUsername)
local UseCreatorVerifiedModule = require(Moments.Hooks.useCreatorVerified)
local FFlagMomentsCreatorFollow = require(Parent.SharedFlags).FFlagMomentsCreatorFollow
local FFlagMomentsFlushDwellBeforeNavigationModule = require(Moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local FollowingModule = require(Parent.DataHydration.Following)
local FollowingStore = FollowingModule.FollowingStore
local FollowingUpdateErrorTypeEnum = FollowingModule.FollowingUpdateErrorTypeEnum
local ImageWithSkeletonModule = require(Moments.Components.ImageWithSkeleton)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local _ = require(script.Parent.Parent.Parent.createMomentStore)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local _Vector2 = Vector2.new(120, 16)
local config = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local Character = utf8.char(57344)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local config1 = {
	cancel = "Feature.Groups.Action.Cancel",
	follow = "Feature.Groups.Action.Follow",
	followed = "Feature.Friends.Label.Followed",
	following = "Feature.Friends.Label.Following",
	somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong",
	unfollow = "Feature.Groups.Action.Unfollow",
	unfollowed = "Feature.Friends.Label.Unfollowed",
	userNotPassedCaptchaError = "Feature.Friends.Error.UserNotPassedCaptcha"
}

local function _(Title)
	-- upvalues: GetToastStoreModule (copy)
	GetToastStoreModule(false).triggerToast({ text = "", title = Title })
end

local MomentsCreatorFollow = nil

local _ = function()
	-- upvalues: MomentsCreatorFollow (ref), Parent (copy)
	if MomentsCreatorFollow == nil then
		MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
	end
	return MomentsCreatorFollow
end

local _ = function(p1)
	-- upvalues: Parent (copy), MomentsCreatorFollow (ref)
	local Middleware = require(Parent.GenericChallenges).Middleware
	
	return Middleware.createChallengeNetwork(function(p2)
		-- upvalues: MomentsCreatorFollow (upval), Parent (upval), p1 (copy), Middleware (copy)
		if MomentsCreatorFollow == nil then
			MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
		end
		MomentsCreatorFollow:debug("captcha required creatorId={}", p1)
		local InterceptChallengeResult = Middleware.InterceptChallenge(p2)
		
		if MomentsCreatorFollow == nil then
			MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
		end
		MomentsCreatorFollow:debug("captcha opened creatorId={}", p1)
		
		return InterceptChallengeResult:andThen(function(Result)
			-- upvalues: MomentsCreatorFollow (upval), Parent (upval), p1 (upval)
			if MomentsCreatorFollow == nil then
				MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
			end
			MomentsCreatorFollow:debug("captcha completed creatorId={}", p1)
			
			return Result
		end, function(p3)
			-- upvalues: MomentsCreatorFollow (upval), Parent (upval), p1 (upval)
			if MomentsCreatorFollow == nil then
				MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
			end
			MomentsCreatorFollow:warning("captcha failed creatorId={} error={}", p1, (tostring(p3)))
			error(p3)
		end)
	end)
end

local function UnfollowConfirmationDialog(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Dialog (copy), FoundationModule (copy), ButtonVariant (copy)
	local OnCancelFunction = p1.onCancel
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "moments-creator-unfollow-dialog",
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCancelFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: OnCancelFunction (upval)
							OnCancelFunction()
							p2:cancel()
						end)
					}
				}
			end, { OnCancelFunction })
		}),
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationFunction({
				title = {
					"Feature.Moments.Title.UnfollowConfirmationDialog",
					username = p1.creatorUsername
				}
			}).title
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					testId = "moments-creator-unfollow-confirm",
					text = p1.unfollowText,
					variant = ButtonVariant.Alert,
					onActivated = p1.onConfirm
				},
				{
					testId = "moments-creator-unfollow-cancel",
					text = p1.cancelText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), FFlagMomentsCreatorFollow (copy), UseLocalizationFunction (copy), config1 (copy), ReactModule (copy), FollowingStore (copy), SignalsReactModule (copy), ReactOtterModule (copy), UseUsernameModule (copy), UseCreatorVerifiedModule (copy), UseMomentsHostFunction (copy), FFlagMomentsFlushDwellBeforeNavigationModule (copy), FeedContextModule (copy), MakeFeedActionFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), Character (copy), MomentsCreatorFollow (ref), Parent (copy), GetToastStoreModule (copy), SignalActionTypeModule (copy), FollowingUpdateErrorTypeEnum (copy), View (copy), StateLayerAffordance (copy), ControlState (copy), ImageWithSkeletonModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), Radius (copy), GetColorStyleWithTransparencyModule (copy), config (copy), Text (copy), Skeleton (copy), _Vector2 (copy), GetLocalUserIdModule (copy), Loading (copy), IconSize (copy), UnfollowConfirmationDialog (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local Data = UseMomentResult.store.getData(false)
	local v1 = nil
	local IsUseSignalStateResult: boolean? = nil
	local IsNotReady: boolean? = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local Callback = nil
	local Callback1 = nil
	local Callback2 = nil
	local UseRefResult = nil
	
	if FFlagMomentsCreatorFollow then
		v1 = UseLocalizationFunction(config1)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FollowingStore (upval), Data (copy)
			return FollowingStore.get().GetIsFollowing((tostring(Data.creatorId)))
		end, { Data.creatorId })
		IsUseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data) == true
		IsNotReady = SignalsReactModule.useSignalState(UseMemoResult.status) == "NotReady"
		v2, Callback = ReactModule.useState(false)
		v4, Callback1 = ReactModule.useState(nil)
		v3, Callback2 = ReactModule.useState(false)
		UseRefResult = ReactModule.useRef(false)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult (copy)
		UseAnimatedBindingResult2(ReactOtterModule.ease(if UseStateResult then 0.6 else 0, {
			duration = if UseStateResult then 0.05 else 0.03,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { UseStateResult })
	local MapResult = ReactModule.joinBindings({ UseMomentResult.animationRatio, UseAnimatedBindingResult }):map(function(Entry): number
		return 1 - (1 - Entry[1]) * (1 - Entry[2])
	end)
	local UseUsernameModuleResult = UseUsernameModule(Data.creatorId)
	local UseCreatorVerifiedModuleResult = UseCreatorVerifiedModule(Data.creatorId)
	local OpenProfileFunction = UseMomentsHostFunction().openProfile
	local UseFeedOptionalResult = if FFlagMomentsCreatorFollow or FFlagMomentsFlushDwellBeforeNavigationModule then FeedContextModule.useFeedOptional() else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OpenProfileFunction (copy), MakeFeedActionFieldsModule (upval), Data (copy), FireAnalyticsEventFunction (upval), EventNames (upval), FFlagMomentsFlushDwellBeforeNavigationModule (upval), UseFeedOptionalResult (ref), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		if OpenProfileFunction ~= nil then
			local FeedActionFieldsModule = MakeFeedActionFieldsModule(Data.momentId, Data.feedItemId, Data.feedSessionId)
			
			if FeedActionFieldsModule ~= nil then
				FireAnalyticsEventFunction(EventNames.ProfileCreatorInfoTapped, FeedActionFieldsModule)
			end
			if FFlagMomentsFlushDwellBeforeNavigationModule and UseFeedOptionalResult ~= nil then
				UseFeedOptionalResult.flushView(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.CreatorProfile else nil)
			end
			OpenProfileFunction(Data.creatorId)
		end
	end, if FFlagMomentsFlushDwellBeforeNavigationModule then {
		OpenProfileFunction, UseFeedOptionalResult, Data.creatorId, Data.momentId,
		Data.feedItemId, Data.feedSessionId
	} else {
		OpenProfileFunction,
		Data.creatorId,
		Data.momentId,
		Data.feedItemId,
		Data.feedSessionId
	})
	local Size800 = UseTokensResult.Size.Size_800
	local Text1 = if UseUsernameModuleResult and UseCreatorVerifiedModuleResult then `{UseUsernameModuleResult} {Character}` else UseUsernameModuleResult
	local UseResult1 = if FFlagMomentsCreatorFollow then ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (ref), v1 (ref), Callback1 (ref), Callback (ref), MomentsCreatorFollow (upval), Parent (upval), Data (copy), FollowingStore (upval), GetToastStoreModule (upval), UseFeedOptionalResult (ref), SignalActionTypeModule (upval), FollowingUpdateErrorTypeEnum (upval)
		if UseRefResult.current then return end
		local v5 = v1
		UseRefResult.current = true
		Callback1(p1)
		Callback(true)
		
		if MomentsCreatorFollow == nil then
			MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
		end
		MomentsCreatorFollow:debug("request started creatorId={}", Data.creatorId)
		local Success, Result = pcall(function()
			-- upvalues: Data (upval), Parent (upval), MomentsCreatorFollow (upval), FollowingStore (upval), p1 (copy)
			local CreatorId = Data.creatorId
			local Middleware = require(Parent.GenericChallenges).Middleware
			local ChallengeNetwork = Middleware.createChallengeNetwork(function(p2)
				-- upvalues: MomentsCreatorFollow (upval), Parent (upval), CreatorId (copy), Middleware (copy)
				if MomentsCreatorFollow == nil then
					MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
				end
				MomentsCreatorFollow:debug("captcha required creatorId={}", CreatorId)
				local InterceptChallengeResult = Middleware.InterceptChallenge(p2)
				
				if MomentsCreatorFollow == nil then
					MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
				end
				MomentsCreatorFollow:debug("captcha opened creatorId={}", CreatorId)
				
				return InterceptChallengeResult:andThen(function(Result)
					-- upvalues: MomentsCreatorFollow (upval), Parent (upval), CreatorId (upval)
					if MomentsCreatorFollow == nil then
						MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
					end
					MomentsCreatorFollow:debug("captcha completed creatorId={}", CreatorId)
					
					return Result
				end, function(p3)
					-- upvalues: MomentsCreatorFollow (upval), Parent (upval), CreatorId (upval)
					if MomentsCreatorFollow == nil then
						MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
					end
					MomentsCreatorFollow:warning("captcha failed creatorId={} error={}", CreatorId, (tostring(p3)))
					error(p3)
				end)
			end)
			
			if MomentsCreatorFollow == nil then
				MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
			end
			MomentsCreatorFollow:debug("challenge network ready creatorId={}", Data.creatorId)
			local GetResult = FollowingStore.get()
			local FollowResult = if p1 then GetResult.Follow(tostring(Data.creatorId), ChallengeNetwork) else GetResult.Unfollow(tostring(Data.creatorId), ChallengeNetwork)
			
			if MomentsCreatorFollow == nil then
				MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
			end
			MomentsCreatorFollow:debug("request dispatched creatorId={}", Data.creatorId)
			
			return FollowResult
		end)
		
		if Success then
			return Result:andThen(function()
				-- upvalues: UseRefResult (upval), Callback1 (upval), Callback (upval), Data (upval), UseFeedOptionalResult (upval), p1 (copy), SignalActionTypeModule (upval), MomentsCreatorFollow (upval), Parent (upval), v5 (copy), GetToastStoreModule (upval)
				UseRefResult.current = false
				Callback1(nil)
				Callback(false)
				local FeedItemId = Data.feedItemId
				
				if UseFeedOptionalResult ~= nil and FeedItemId ~= nil and FeedItemId ~= "" then
					local Success, Result = pcall(function()
						-- upvalues: UseFeedOptionalResult (upval), p1 (upval), SignalActionTypeModule (upval), FeedItemId (copy), Data (upval)
						UseFeedOptionalResult.logAction(if p1 then SignalActionTypeModule.AddFollow else SignalActionTypeModule.RemoveFollow, { itemId = FeedItemId, tracingId = Data.feedSessionId }, {})
					end)
					
					if not Success then
						if MomentsCreatorFollow == nil then
							MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
						end
						MomentsCreatorFollow:warning("preference signal failed creatorId={} error={}", Data.creatorId, (tostring(Result)))
					end
				end
				if MomentsCreatorFollow == nil then
					MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
				end
				MomentsCreatorFollow:debug("request succeeded creatorId={}", Data.creatorId)
				GetToastStoreModule(false).triggerToast({
					text = "",
					title = if p1 then v5.followed else v5.unfollowed
				})
			end, function(p2)
				-- upvalues: UseRefResult (upval), Callback1 (upval), Callback (upval), MomentsCreatorFollow (upval), Parent (upval), Data (upval), FollowingUpdateErrorTypeEnum (upval), v5 (copy), GetToastStoreModule (upval)
				UseRefResult.current = false
				Callback1(nil)
				Callback(false)
				local Text: string = if type(p2) == "table" and p2.errorType ~= nil then tostring(p2.errorType) else "Unknown"
				local Text1: string = if type(p2) == "table" and p2.responseCode ~= nil then tostring(p2.responseCode) else "Unknown"
				
				if MomentsCreatorFollow == nil then
					MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
				end
				MomentsCreatorFollow:warning("request failed creatorId={} errorType={} responseCode={}", Data.creatorId, Text, Text1)
				GetToastStoreModule(false).triggerToast({
					text = "",
					title = if Text == FollowingUpdateErrorTypeEnum.Captcha then v5.userNotPassedCaptchaError else v5.somethingIsWrong
				})
			end)
		end
		UseRefResult.current = false
		Callback1(nil)
		Callback(false)
		
		if MomentsCreatorFollow == nil then
			MomentsCreatorFollow = require(Parent.Loggers).Logger:new("Moments.CreatorFollow")
		end
		MomentsCreatorFollow:warning("request setup failed creatorId={} error={}", Data.creatorId, (tostring(Result)))
		GetToastStoreModule(false).triggerToast({ text = "", title = v5.somethingIsWrong })
	end, {
		Data.creatorId,
		Data.feedItemId,
		Data.feedSessionId,
		UseFeedOptionalResult,
		v1
	}) else nil
	local UseResult2 = if FFlagMomentsCreatorFollow then ReactModule.useCallback(function()
		-- upvalues: IsUseSignalStateResult (ref), Callback2 (ref), UseResult1 (copy)
		if IsUseSignalStateResult then
			Callback2(true)
			
			return
		else
			return UseResult1(true)
		end
	end, { IsUseSignalStateResult, UseResult1 }) else nil
	local UseResult3 = if FFlagMomentsCreatorFollow then ReactModule.useCallback(function()
		-- upvalues: Callback2 (ref), UseResult1 (copy)
		Callback2(false)
		
		return UseResult1(false)
	end, { UseResult1 }) else nil
	local IsUseSignalStateResult1 = if FFlagMomentsCreatorFollow then if v4 == nil then IsUseSignalStateResult else not v4 else nil
	local IsNotReady1 = if FFlagMomentsCreatorFollow then IsNotReady or v2 else nil
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-small auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		testId = if FFlagMomentsFlushDwellBeforeNavigationModule then "--moments-creator-attribution" else nil,
		stateLayer = { affordance = StateLayerAffordance.None },
		onActivated = if OpenProfileFunction == nil then nil else UseResult,
		onStateChanged = function(Pressed)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Pressed == ControlState.Pressed or Pressed == ControlState.SelectedPressed)
		end
	}, {
		Avatar = ReactModule.createElement(ImageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = GetRbxThumbFunction(ThumbnailType.AvatarHeadShot, Data.creatorId, ThumbnailSize.Medium),
			Size = UDim2.fromOffset(Size800, Size800),
			radius = Radius.Circle,
			backgroundStyle = MapResult:map(function(p1)
				-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
				return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Shift.Shift_300, p1)
			end),
			imageStyle = MapResult:map(function(p1)
				-- upvalues: GetColorStyleWithTransparencyModule (upval), config (upval)
				return GetColorStyleWithTransparencyModule(config, p1)
			end)
		}),
		Username = if Text1 then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-large text-align-x-left text-align-y-center text-truncate-end content-emphasis",
			Text = Text1,
			textStyle = MapResult:map(function(p1)
				-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
				return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1)
			end)
		}) else ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			radius = Radius.Medium,
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
		}),
		FollowAction = if FFlagMomentsCreatorFollow and Data.creatorId ~= GetLocalUserIdModule() then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-x-center align-y-center size-0-600 auto-x padding-x-small radius-small",
			testId = "moments-creator-follow-button",
			backgroundStyle = MapResult:map(function(p1)
				-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
				return GetColorStyleWithTransparencyModule(UseTokensResult.Color.ActionStandard.Background, p1)
			end),
			isDisabled = IsNotReady1,
			onActivated = UseResult2,
			stroke = {
				Color = UseTokensResult.Color.Content.Emphasis.Color3,
				Transparency = MapResult:map(function(p1)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
					return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1).Transparency or 0
				end),
				Thickness = if IsNotReady1 then 0 else UseTokensResult.Stroke.Standard,
				BorderStrokePosition = Enum.BorderStrokePosition.Inner
			}
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-label-small content-system-contrast",
				testId = "moments-creator-follow-button--text",
				Text = if IsUseSignalStateResult1 then v1.following else v1.follow,
				textStyle = MapResult:map(function(p1)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy), IsNotReady1 (copy)
					return GetColorStyleWithTransparencyModule(UseTokensResult.Color.System.Contrast, if IsNotReady1 then 1 else p1)
				end)
			}, {
				Loading = if IsNotReady1 then ReactModule.createElement(Loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = IconSize.XSmall
				}) else nil
			})
		}) else nil,
		UnfollowDialog = if FFlagMomentsCreatorFollow and v3 then ReactModule.createElement(UnfollowConfirmationDialog, {
			cancelText = v1.cancel,
			creatorUsername = UseUsernameModuleResult or tostring(Data.creatorId),
			onCancel = function()
				-- upvalues: Callback2 (ref)
				Callback2(false)
			end,
			onConfirm = UseResult3,
			unfollowText = v1.unfollow
		}) else nil
	})
end)