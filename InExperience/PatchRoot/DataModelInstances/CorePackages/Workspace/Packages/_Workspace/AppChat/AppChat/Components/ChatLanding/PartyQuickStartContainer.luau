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
local var1 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local var2 = if game.GameId > 0 then tostring(game.GameId) else nil

function PartyQuickStartContainer(p1)
	-- upvalues: useAnalyticsModule (ref), useChatPlacementContext (ref), useNavigation (ref), useLocalization (ref), reactModule (ref), httpService (ref), eventNamesModule (ref), var1 (ref), var2 (ref), enumScreensModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), fFlagAppChatCustomConversationListRowModule (ref), customConversationListRowModule (ref), iconName (ref), customConversationListEntryModule (ref), images (ref)
	local var3 = useAnalyticsModule()
	local var4 = useChatPlacementContext()
	local var5 = useNavigation()
	local var6 = useLocalization({
		titleText = "Feature.Squads.Label.StartParty",
		subTitleText = "Feature.Squads.Label.JoinExperiencesTogether"
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: httpService (copy), var3 (ref), eventNamesModule (copy), var4 (ref), var1 (copy), var2 (copy), var5 (ref), enumScreensModule (copy)
		local var8 = httpService:GenerateGUID(false)
		var3.fireAnalyticsEvent(eventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
			clickLocation = var4.chatPlacement,
			partyAttemptId = var8,
			placeId = var1,
			universeId = var2
		})
		var5.navigate(enumScreensModule.QuickStartSquadInviteFriends, { partyAttemptId = var8 })
	end, { var3, var5, var4.chatPlacement })
	local var8 = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationListHeader("startParty") else nil
	
	return if fFlagAppChatCustomConversationListRowModule then reactModule.createElement(customConversationListRowModule, {
		entryHeight = p1.entryHeight,
		entryIcon = iconName.PersonPlay,
		onActivated = var7,
		titleText = var6.titleText,
		subTitleText = var6.subTitleText,
		testId = var8
	}) else reactModule.createElement(customConversationListEntryModule, {
		entryHeight = p1.entryHeight,
		entryIcon = images["icons/actions/friends/friendsplaying"],
		onActivated = var7,
		titleText = var6.titleText,
		subTitleText = var6.subTitleText,
		testId = var8
	})
end

return PartyQuickStartContainer