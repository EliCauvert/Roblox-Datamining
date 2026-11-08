local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SocialCommonModule = require(Parent.SocialCommon)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GoToBuildModule = require(Parent.BuildExperiencePlaytestLaunch.goToBuild)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local AppGuiService = require(Parent.RoactServiceTags).AppGuiService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local FFlagSocialCarouselBuildPresence = require(Parent.SharedFlags).FFlagSocialCarouselBuildPresence
local AnalyticsConstantsModule = require(GameJoinCard.Analytics.AnalyticsConstants)
local UseGameJoinCardAnalyticsModule = require(GameJoinCard.Analytics.useGameJoinCardAnalytics)
local _ = require(GameJoinCard.Components.Actions.Types)
local TextKeysModule = require(GameJoinCard.Components.Actions.TextKeys)
local ViewProfileLinkModule = require(GameJoinCard.Components.Actions.ViewProfileLink)
local _ = require(script.Parent.Types)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local AppPage = RobloxAppEnumsModule.AppPage
local NotificationType = RobloxAppEnumsModule.NotificationType
local ChatEntryPointNames = SocialCommonModule.Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = SocialCommonModule.Actions.EnteredChatFromEntryPoint
local _UDim = UDim.new(1, 0)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction

local function _(p1, FriendId)
	-- upvalues: UseGameJoinCardAnalyticsModule (copy), FFlagSocialCarouselBuildPresence (copy), AnalyticsConstantsModule (copy)
	UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(p1, {
		friendId = FriendId,
		cardType = if FFlagSocialCarouselBuildPresence then AnalyticsConstantsModule.JoinCardType.Build else nil
	})
end

local function renderViewProfileLink(p1, LayoutOrder)
	-- upvalues: ReactModule (copy), ViewProfileLinkModule (copy)
	return ReactModule.createElement(ViewProfileLinkModule, {
		text = p1.text,
		onActivated = p1.onActivated,
		LayoutOrder = LayoutOrder
	})
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppGuiService (copy), FFlagSocialCarouselBuildPresence (copy), UseDispatchFunction (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UserCtaAction (copy), FFlagEnableSplitPane (copy), ButtonVariant (copy), InputSize (copy), _UDim (copy), GameJoinCardButtonAction (copy), UseGameJoinCardAnalyticsModule (copy), AnalyticsConstantsModule (copy), GoToBuildModule (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), NotificationType (copy), renderViewProfileLink (copy), AppPage (copy)
	local UserId = p1.userId
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppGuiService)
	local UseDispatchResult = if FFlagSocialCarouselBuildPresence then UseDispatchFunction() else nil
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getCanUsePlatformChat()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		createInBuild = "Feature.Profile.Action.CreateInBuild",
		chat = TextKeysModule[UserCtaAction.Chat],
		viewProfile = TextKeysModule[UserCtaAction.ViewProfile]
	})
	local Push = if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate
	local config = {
		id = UserCtaAction.Chat,
		text = UseLocalizationResult.chat,
		variant = ButtonVariant.Standard,
		inputSize = InputSize.Medium,
		width = _UDim,
		keepOpenOnActivate = p1.keepsOpenOnNavigation,
		onActivated = function()
			-- upvalues: GameJoinCardButtonAction (upval), UserId (copy), UseGameJoinCardAnalyticsModule (upval), FFlagSocialCarouselBuildPresence (upval), AnalyticsConstantsModule (upval), UseDispatchResult (copy), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), UseRoactServiceResult (copy), NotificationType (upval)
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, {
				friendId = UserId,
				cardType = if FFlagSocialCarouselBuildPresence then AnalyticsConstantsModule.JoinCardType.Build else nil
			})
			
			if FFlagSocialCarouselBuildPresence then
				UseDispatchResult(EnteredChatFromEntryPointFunction(ChatEntryPointNames.BuildJoinCard))
			end
			UseRoactServiceResult:BroadcastNotification(UserId, NotificationType.LAUNCH_CONVERSATION)
		end
	}
	local config1 = {
		id = UserCtaAction.ViewProfile,
		text = UseLocalizationResult.viewProfile,
		keepOpenOnActivate = p1.keepsOpenOnNavigation,
		render = renderViewProfileLink,
		onActivated = function()
			-- upvalues: GameJoinCardButtonAction (upval), UserId (copy), UseGameJoinCardAnalyticsModule (upval), FFlagSocialCarouselBuildPresence (upval), AnalyticsConstantsModule (upval), Push (copy), AppPage (upval)
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, {
				friendId = UserId,
				cardType = if FFlagSocialCarouselBuildPresence then AnalyticsConstantsModule.JoinCardType.Build else nil
			})
			Push(AppPage.ProfilePlatform, { detail = UserId })
		end
	}
	local List = {
		{
			keepOpenOnActivate = true,
			id = UserCtaAction.GoToBuild,
			text = UseLocalizationResult.createInBuild,
			variant = ButtonVariant.Emphasis,
			inputSize = InputSize.Medium,
			width = _UDim,
			onActivated = function()
				-- upvalues: GameJoinCardButtonAction (upval), UserId (copy), UseGameJoinCardAnalyticsModule (upval), FFlagSocialCarouselBuildPresence (upval), AnalyticsConstantsModule (upval), p1 (copy), GoToBuildModule (upval), UseNavigationResult (copy)
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.CreateInBuild, {
					friendId = UserId,
					cardType = if FFlagSocialCarouselBuildPresence then AnalyticsConstantsModule.JoinCardType.Build else nil
				})
				p1.onClose()
				GoToBuildModule(false, UseNavigationResult)
			end
		}
	}
	
	if UseAppPolicyResult then
		table.insert(List, config)
	end
	table.insert(List, config1)
	
	return { actions = List }
end