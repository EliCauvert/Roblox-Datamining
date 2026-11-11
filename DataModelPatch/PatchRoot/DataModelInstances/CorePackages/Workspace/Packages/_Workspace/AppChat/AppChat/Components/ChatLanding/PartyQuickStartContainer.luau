local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Images = require(Parent.UIBlox).App.ImageSet.Images
local IconName = require(Parent.Foundation).Enums.IconName
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local CustomConversationListEntryModule = require(script.Parent.CustomConversationListEntry)
local CustomConversationListRowModule = require(script.Parent.CustomConversationListRow)
local FFlagAppChatCustomConversationListRowModule = require(AppChat.Flags.FFlagAppChatCustomConversationListRow)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local EnumScreensModule = require(AppChat.EnumScreens)
local Text = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local Text1 = if game.GameId > 0 then tostring(game.GameId) else nil

function PartyQuickStartContainer(p1)
	-- upvalues: UseAnalyticsModule (copy), UseChatPlacementContextFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), HttpService (copy), EventNamesModule (copy), Text (copy), Text1 (copy), EnumScreensModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), FFlagAppChatCustomConversationListRowModule (copy), CustomConversationListRowModule (copy), IconName (copy), CustomConversationListEntryModule (copy), Images (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseChatPlacementContextResult = UseChatPlacementContextFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Squads.Label.StartParty",
		subTitleText = "Feature.Squads.Label.JoinExperiencesTogether"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: HttpService (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseChatPlacementContextResult (copy), Text (upval), Text1 (upval), UseNavigationResult (copy), EnumScreensModule (upval)
		local Guid = HttpService:GenerateGUID(false)
		UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
			clickLocation = UseChatPlacementContextResult.chatPlacement,
			partyAttemptId = Guid,
			placeId = Text,
			universeId = Text1
		})
		UseNavigationResult.navigate(EnumScreensModule.QuickStartSquadInviteFriends, { partyAttemptId = Guid })
	end, {
		UseAnalyticsModuleResult,
		UseNavigationResult,
		UseChatPlacementContextResult.chatPlacement
	})
	local StartParty = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingConversationListHeader("startParty") else nil
	
	return if FFlagAppChatCustomConversationListRowModule then ReactModule.createElement(CustomConversationListRowModule, {
		entryHeight = p1.entryHeight,
		entryIcon = IconName.PersonPlay,
		onActivated = UseResult,
		titleText = UseLocalizationResult.titleText,
		subTitleText = UseLocalizationResult.subTitleText,
		testId = StartParty
	}) else ReactModule.createElement(CustomConversationListEntryModule, {
		entryHeight = p1.entryHeight,
		entryIcon = Images["icons/actions/friends/friendsplaying"],
		onActivated = UseResult,
		titleText = UseLocalizationResult.titleText,
		subTitleText = UseLocalizationResult.subTitleText,
		testId = StartParty
	})
end

return PartyQuickStartContainer