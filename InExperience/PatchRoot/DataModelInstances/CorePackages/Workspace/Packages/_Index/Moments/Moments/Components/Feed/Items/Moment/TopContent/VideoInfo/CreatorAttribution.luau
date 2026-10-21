local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Analytics = require(Parent.MomentsCommon).Analytics
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local EventNames = Analytics.EventNames
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseUsernameModule = require(Moments.Hooks.useUsername)
local UseCreatorVerifiedModule = require(Moments.Hooks.useCreatorVerified)
local FFlagMomentsFlushDwellBeforeNavigationModule = require(Moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local ImageWithSkeletonModule = require(Moments.Components.ImageWithSkeleton)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local _ = require(script.Parent.Parent.Parent.createMomentStore)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local _Vector2 = Vector2.new(120, 16)
local config = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local Character = utf8.char(57344)

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), ReactModule (copy), ReactOtterModule (copy), UseUsernameModule (copy), UseCreatorVerifiedModule (copy), UseMomentsHostFunction (copy), FFlagMomentsFlushDwellBeforeNavigationModule (copy), FeedContextModule (copy), MakeFeedActionFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), Character (copy), View (copy), StateLayerAffordance (copy), ControlState (copy), ImageWithSkeletonModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), Radius (copy), GetColorStyleWithTransparencyModule (copy), config (copy), Text (copy), Skeleton (copy), _Vector2 (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local Data = UseMomentResult.store.getData(false)
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
	local UseFeedOptionalResult = if FFlagMomentsFlushDwellBeforeNavigationModule then FeedContextModule.useFeedOptional() else nil
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
		})
	})
end)