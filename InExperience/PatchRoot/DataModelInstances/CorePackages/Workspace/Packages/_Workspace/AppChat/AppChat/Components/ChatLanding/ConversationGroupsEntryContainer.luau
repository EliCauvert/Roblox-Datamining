local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local luaAppNavigationContextModule = require(appChat.LuaAppNavigationContext)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local getAppChatCommunitiesVisualConfigModule = require(appChat.Utils.getAppChatCommunitiesVisualConfig)
local getFFlagCommunitiesUseVisualConfigUtil = require(parent.SharedFlags).getFFlagCommunitiesUseVisualConfigUtil
local getFFlagUseCommunitiesTranslation = require(parent.SharedFlags).GetFFlagUseCommunitiesTranslation
local images = UIBloxModule.App.ImageSet.Images
local iconName = foundationModule.Enums.IconName
local domLocatorsModule = require(appChat.Utils.DomLocators)
local customConversationListEntryModule = require(script.Parent.CustomConversationListEntry)
local customConversationListRowModule = require(script.Parent.CustomConversationListRow.CustomConversationListRow)
local fFlagAppChatUseFoundationCustomConversationListRowModule = require(appChat.Flags.FFlagAppChatUseFoundationCustomConversationListRow)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local groups = images["icons/menu/groups"]

function ConversationGroupsEntryContainer(p1)
	-- upvalues: getFFlagCommunitiesUseVisualConfigUtil (ref), getAppChatCommunitiesVisualConfigModule (ref), useLocalization (ref), getFFlagUseCommunitiesTranslation (ref), reactModule (ref), luaAppNavigationContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), images (ref), groups (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatLandingTelemetryEventsModule (ref), fFlagAppChatUseFoundationCustomConversationListRowModule (ref), customConversationListRowModule (ref), iconName (ref), customConversationListEntryModule (ref)
	local var1 = if getFFlagCommunitiesUseVisualConfigUtil() then getAppChatCommunitiesVisualConfigModule() else nil
	local var2 = useLocalization({
		createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups",
		groupsText = if getFFlagCommunitiesUseVisualConfigUtil() then var1.label elseif getFFlagUseCommunitiesTranslation() then "Feature.SocialTab.Label.Groups" else "CommonUI.Features.Label.sGroups"
	})
	local var3 = reactModule.useContext(luaAppNavigationContextModule)
	local var4 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var5 = if getFFlagCommunitiesUseVisualConfigUtil() then images[var1.icon] else groups
	local var6 = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationListHeader("communities") else nil
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), chatLandingTelemetryEventsModule (copy), var3 (ref)
		var4.emit(chatLandingTelemetryEventsModule.ChatLandingGroupsBtnClicked, {})
		var3.navigateToGroups()
	end, { var4, var3 })
	
	return if fFlagAppChatUseFoundationCustomConversationListRowModule then reactModule.createElement(customConversationListRowModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = iconName.ThreePeople,
		onActivated = var7,
		subTitleText = var2.createAndExploreGroupsText,
		titleText = var2.groupsText,
		testId = var6
	}) else reactModule.createElement(customConversationListEntryModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = var5,
		onActivated = var7,
		subTitleText = var2.createAndExploreGroupsText,
		titleText = var2.groupsText,
		testId = var6
	})
end

return ConversationGroupsEntryContainer