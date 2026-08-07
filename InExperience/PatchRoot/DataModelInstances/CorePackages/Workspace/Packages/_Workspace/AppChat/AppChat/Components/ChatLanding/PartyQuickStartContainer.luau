local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local eventNamesModule = require(appChat.Analytics.EventNames)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local images = UIBloxModule.App.ImageSet.Images
local iconName = foundationModule.Enums.IconName
local domLocatorsModule = require(appChat.Utils.DomLocators)
local customConversationListEntryModule = require(script.Parent.CustomConversationListEntry)
local customConversationListRowModule = require(script.Parent.CustomConversationListRow)
local fFlagAppChatCustomConversationListRowModule = require(appChat.Flags.FFlagAppChatCustomConversationListRow)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local enumScreensModule = require(appChat.EnumScreens)
local var14 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local var15 = if game.GameId > 0 then tostring(game.GameId) else nil

function PartyQuickStartContainer(p0) --[[ line: 34 ]]
	-- upvalues: useAnalyticsModule (ref), useChatPlacementContext (ref), useNavigation (ref), useLocalization (ref), reactModule (ref), httpService (ref), eventNamesModule (ref), var14 (ref), var15 (ref), enumScreensModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), fFlagAppChatCustomConversationListRowModule (ref), customConversationListRowModule (ref), iconName (ref), customConversationListEntryModule (ref), images (ref)
	local var16 = useAnalyticsModule()
	local var17 = useChatPlacementContext()
	local var18 = useNavigation()
	local var19 = useLocalization({
		titleText = "Feature.Squads.Label.StartParty",
		subTitleText = "Feature.Squads.Label.JoinExperiencesTogether"
	})
	local var20 = reactModule.useCallback(function() --[[ line: 43 ]]
		-- upvalues: httpService (copy), var16 (ref), eventNamesModule (copy), var17 (ref), var14 (copy), var15 (copy), var18 (ref), enumScreensModule (copy)
		local var22 = httpService:GenerateGUID(false)
		var16.fireAnalyticsEvent(eventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
			clickLocation = var17.chatPlacement,
			partyAttemptId = var22,
			placeId = var14,
			universeId = var15
		})
		var18.navigate(enumScreensModule.QuickStartSquadInviteFriends, { partyAttemptId = var22 })
	end, { var16, var18, var17.chatPlacement })
	local var21 = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationListHeader("startParty") else nil
	
	return if fFlagAppChatCustomConversationListRowModule then reactModule.createElement(customConversationListRowModule, {
		entryHeight = p0.entryHeight,
		entryIcon = iconName.PersonPlay,
		onActivated = var20,
		titleText = var19.titleText,
		subTitleText = var19.subTitleText,
		testId = var21
	}) else reactModule.createElement(customConversationListEntryModule, {
		entryHeight = p0.entryHeight,
		entryIcon = images["icons/actions/friends/friendsplaying"],
		onActivated = var20,
		titleText = var19.titleText,
		subTitleText = var19.subTitleText,
		testId = var21
	})
end

return PartyQuickStartContainer