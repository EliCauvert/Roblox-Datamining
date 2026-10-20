local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local FocusNavigationEventNameEnum = require(Parent1.FocusNavigationUtils).FocusNavigationEventNameEnum
local HoldDetector = require(Parent1.HoldToPlay).HoldDetector
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local RoduxFriends = DependenciesModule.RoduxFriends
local SocialCommonModule = require(Parent1.SocialCommon)
local PresenceType = require(Parent.installReducer.RoduxPresence).Enums.PresenceType
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local PYMKCarouselUserContextualInfoModule = require(script.Parent.PYMKCarouselUserContextualInfo)
local UsePYMKCarouselUserButtonsModule = require(script.Parent.usePYMKCarouselUserButtons)
local GetFriendStatusModule = require(Parent.Analytics.getFriendStatus)
local EventNames = require(Parent.Analytics).EventNames
local ConstantsModule = require(Parent.Common.Constants)
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local ImpressionsTagUtility = require(Parent1.Impressions).ImpressionsTagUtility
local GetRecommendationContextualInfoTypeFunction = SocialCommonModule.Utils.getRecommendationContextualInfoType
local CarouselUserTile = SocialCommonModule.Components.CarouselUserTile.CarouselUserTile
local FFlagHomepagePYMKPresence = require(Parent1.SharedFlags).FFlagHomepagePYMKPresence
local FFlagHomepagePYMKPresenceAnalytics = require(Parent1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics

return function(Frame: Frame)
	-- upvalues: React (copy), ImpressionsTagUtility (copy), SocialStopwatchModule (copy), EventNames (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RoduxFriends (copy), FFlagHomepagePYMKPresence (copy), UsePYMKCarouselUserButtonsModule (copy), RecommendationContextType (copy), FFlagHomepagePYMKPresenceAnalytics (copy), FocusNavigationEventNameEnum (copy), PYMKCarouselUserContextualInfoModule (copy), ConstantsModule (copy), GetRecommendationContextualInfoTypeFunction (copy), GetFriendStatusModule (copy), HttpService (copy), PresenceType (copy), UseStyleFunction (copy), Roact (copy), CarouselUserTile (copy), HoldDetector (copy)
	local UseRefResult = React.useRef(nil)
	React.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), Frame (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, Frame.impressionsTag, Frame.LayoutOrder)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), Frame (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, Frame.impressionsTag, Frame.LayoutOrder)
		end
	end, { UseRefResult, Frame.impressionsTag, Frame.LayoutOrder })
	React.useEffect(function()
		-- upvalues: SocialStopwatchModule (upval), Frame (copy), EventNames (upval)
		local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.PYMKCarouselLoaded)
		
		if StopResult then
			Frame.fireAnalyticsEvent(EventNames.PYMKCarouselLoadingTime, { loadingTime = StopResult.timeElapsed })
		end
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p1): string
		return (tostring(p1.LocalUserId))
	end)
	local Text = tostring(Frame.userId)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), Text (copy)
		return GetDeepValueFunction(p1, string.format("PYMKCarousel.Users.byUserId.%s", Text))
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: RoduxFriends (upval), Text (copy)
		return RoduxFriends.Selectors.selectFriendshipStatusesByUserIds(p1)({ Text })[Text] or nil
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), Text (copy)
		return GetDeepValueFunction(p1, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text))
	end)
	local UseSelectorResult4 = UseSelectorFunction(function(p1)
		-- upvalues: RoduxFriends (upval), UseSelectorResult (copy), Text (copy)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p1)(UseSelectorResult)[Text] or {}
	end)
	local UserPresenceType = nil
	
	if FFlagHomepagePYMKPresence then
		local UseSelectorResult5 = UseSelectorFunction(function(p1)
			-- upvalues: GetDeepValueFunction (upval), Text (copy)
			return GetDeepValueFunction(p1, string.format("PYMKCarousel.Presence.byUserId.%s", Text)) or {}
		end)
		UserPresenceType = UseSelectorResult5 and UseSelectorResult5.userPresenceType or nil
	end
	local UsePYMKCarouselUserButtonsModuleResult = UsePYMKCarouselUserButtonsModule({
		userId = Text,
		showToast = Frame.showToast,
		fireAnalyticsEvent = Frame.fireAnalyticsEvent,
		absolutePosition = Frame.absolutePosition,
		contactId = if UseSelectorResult4.contextType == RecommendationContextType.Contacts then UseSelectorResult4.entityId else nil,
		userPresenceType = if FFlagHomepagePYMKPresenceAnalytics then UserPresenceType else nil
	})
	local UseRefResult1 = React.useRef(false)
	React.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
		
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	local UseRefResult2 = React.useRef(false)
	local UseResult = React.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = Current
	end, {})
	local UseRefResult3 = React.useRef(nil)
	local NoUseSelectorResult2: boolean = not UseSelectorResult2 or UseSelectorResult2 == Enum.FriendStatus.NotFriend
	local HoldToAcceptFriendRequest = if UseSelectorResult3 then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest elseif NoUseSelectorResult2 then FocusNavigationEventNameEnum.HoldToAddFriend else nil
	local UseMemoResult = React.useMemo(function()
		-- upvalues: UsePYMKCarouselUserButtonsModuleResult (copy)
		return function()
			-- upvalues: UsePYMKCarouselUserButtonsModuleResult (upval)
			local UsePYMKCarouselUserButtonsModuleResultResult = UsePYMKCarouselUserButtonsModuleResult()
			
			if #UsePYMKCarouselUserButtonsModuleResultResult > 0 and UsePYMKCarouselUserButtonsModuleResultResult[1].onActivated then
				UsePYMKCarouselUserButtonsModuleResultResult[1].onActivated()
			end
		end
	end, { UsePYMKCarouselUserButtonsModuleResult })
	
	local function RenderContextualInfo()
		-- upvalues: PYMKCarouselUserContextualInfoModule (upval), Frame (copy), UseSelectorResult4 (copy)
		return PYMKCarouselUserContextualInfoModule({
			lineWidth = Frame.tileWidth,
			userId = Frame.userId,
			contextType = UseSelectorResult4.contextType
		})
	end
	
	local MutualFriendsCount = if UseSelectorResult4.mutualFriendsCount then UseSelectorResult4.mutualFriendsCount elseif UseSelectorResult4.mutualFriendsList then #UseSelectorResult4.mutualFriendsList else nil
	
	local function v41()
		-- upvalues: Frame (copy), Text (copy), ConstantsModule (upval), MutualFriendsCount (copy), UseSelectorResult4 (copy), GetRecommendationContextualInfoTypeFunction (upval), RecommendationContextType (upval)
		Frame.openProfilePeekView(Text, {
			isRecommendation = true,
			absolutePosition = Frame.absolutePosition,
			source = ConstantsModule.HomepagePYMKCarouselSourceName,
			mutualFriendsCount = MutualFriendsCount,
			recommendationSessionId = Frame.recommendationSessionId,
			recommendationRank = UseSelectorResult4.rank,
			recommendationContextType = UseSelectorResult4.contextType.rawValue(),
			contextualInfoType = GetRecommendationContextualInfoTypeFunction(UseSelectorResult4),
			contactProps = if UseSelectorResult4.contextType == RecommendationContextType.Contacts and UseSelectorResult4.entityId then {
				contactId = UseSelectorResult4.entityId,
				avatarImageUrl = if UseSelectorResult4.thumbnailEntities then UseSelectorResult4.thumbnailEntities.avatarImageUrl else nil,
				contactName = UseSelectorResult4.entityDisplayName
			} else nil,
			profileType = if UseSelectorResult4.contextType == RecommendationContextType.Contacts then "FromContacts" else nil
		})
	end
	
	local function OnActivatedContextual()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), v41 (copy), Frame (copy), EventNames (upval), Text (copy), GetFriendStatusModule (upval), UseSelectorResult2 (copy), UseSelectorResult3 (copy), UseSelectorResult4 (copy), RecommendationContextType (upval), FFlagHomepagePYMKPresenceAnalytics (upval), UserPresenceType (ref), HttpService (upval)
		if not UseRefResult2.current and UseRefResult1.current then
			v41()
			Frame.fireAnalyticsEvent(EventNames.UserPressed, {
				recommendationId = Text,
				friendStatus = GetFriendStatusModule(UseSelectorResult2, UseSelectorResult3),
				recommendationContextType = UseSelectorResult4.contextType,
				recommendationRank = UseSelectorResult4.rank,
				absolutePosition = Frame.absolutePosition,
				positionInRow = Frame.absolutePosition,
				contactId = if UseSelectorResult4.contextType == RecommendationContextType.Contacts then UseSelectorResult4.entityId else nil,
				presence = if FFlagHomepagePYMKPresenceAnalytics then UserPresenceType else nil,
				interactionUuid = HttpService:GenerateGUID(false)
			})
			
			return
		end
	end
	
	local UseMemoResult1 = nil
	
	if FFlagHomepagePYMKPresence then
		local UseMemoResult2 = React.useMemo(function()
			-- upvalues: UseSelectorResult4 (copy), RecommendationContextType (upval), UseSelectorResult1 (copy)
			return (if UseSelectorResult4.contextType == RecommendationContextType.Contacts then UseSelectorResult4.entityDisplayName else (UseSelectorResult1 or {}).displayName) or ""
		end, { UseSelectorResult1, UseSelectorResult4 })
		local UseMemoResult3 = React.useMemo(function(): boolean
			-- upvalues: UserPresenceType (ref), PresenceType (upval)
			return UserPresenceType == PresenceType.Online or (UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.InGame)
		end, { UserPresenceType })
		local Color = UseStyleFunction().Theme.OnlineStatus.Color
		UseMemoResult1 = React.useMemo(function()
			-- upvalues: Color (copy), UseMemoResult3 (copy), UseMemoResult2 (copy)
			local Message: string = `<font color="rgb({math.round(Color.R * 255)},{math.round(Color.G * 255)},{math.round(Color.B * 255)})">● </font>`
			
			return if UseMemoResult3 then Message .. UseMemoResult2 else UseMemoResult2
		end, { UseMemoResult2, UseMemoResult3, Color })
	end
	return Roact.createFragment({
		PYMKCarouselUserTile = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, Frame.tileWidth, 0, Frame.tileWidth),
			LayoutOrder = Frame.LayoutOrder,
			ref = UseRefResult
		}, {
			CarouselUserTile = Roact.createElement(CarouselUserTile, {
				headshotImageUrl = if UseSelectorResult4.thumbnailEntities then UseSelectorResult4.thumbnailEntities.headshotImageUrl else nil,
				userId = Text,
				userName = if FFlagHomepagePYMKPresence then UseMemoResult1 else (if UseSelectorResult4.contextType == RecommendationContextType.Contacts then UseSelectorResult4.entityDisplayName else (UseSelectorResult1 or {}).displayName) or "",
				tileSize = Frame.tileWidth,
				renderContextualInfo = RenderContextualInfo,
				renderButtons = if Frame.hideButtons then nil else UsePYMKCarouselUserButtonsModuleResult,
				onActivatedTile = OnActivatedContextual,
				onActivatedContextual = OnActivatedContextual,
				buttonRef = UseRefResult3
			}),
			HoldDetector = if UseRefResult3.current then Roact.createElement(HoldDetector, {
				guiObject = UseRefResult3.current,
				onHoldDetected = UseMemoResult,
				onRegularActivated = OnActivatedContextual,
				setDisabledForHold = UseResult,
				keyCode = Enum.KeyCode.ButtonA,
				focusNavigationEventName = HoldToAcceptFriendRequest
			}) else nil
		})
	})
end