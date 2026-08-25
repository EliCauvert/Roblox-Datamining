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
local customConversationListRowModule = require(script.Parent.CustomConversationListRow)
local fFlagAppChatCustomConversationListRowModule = require(appChat.Flags.FFlagAppChatCustomConversationListRow)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local groups = images["icons/menu/groups"]

function ConversationGroupsEntryContainer(p0)
	-- upvalues: getFFlagCommunitiesUseVisualConfigUtil (ref), getAppChatCommunitiesVisualConfigModule (ref), useLocalization (ref), getFFlagUseCommunitiesTranslation (ref), reactModule (ref), luaAppNavigationContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), images (ref), groups (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatLandingTelemetryEventsModule (ref), fFlagAppChatCustomConversationListRowModule (ref), customConversationListRowModule (ref), iconName (ref), customConversationListEntryModule (ref)
	local var14 = if getFFlagCommunitiesUseVisualConfigUtil() then getAppChatCommunitiesVisualConfigModule() else nil
	local var15 = useLocalization({
		createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups",
		groupsText = if getFFlagCommunitiesUseVisualConfigUtil() then var14.label elseif getFFlagUseCommunitiesTranslation() then "Feature.SocialTab.Label.Groups" else "CommonUI.Features.Label.sGroups"
	})
	local var16 = reactModule.useContext(luaAppNavigationContextModule)
	local var17 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local var18 = if getFFlagCommunitiesUseVisualConfigUtil() then images[var14.icon] else groups
	local var19 = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationListHeader("communities") else nil
	local var20 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), chatLandingTelemetryEventsModule (copy), var16 (ref)
		var17.emit(chatLandingTelemetryEventsModule.ChatLandingGroupsBtnClicked, {})
		var16.navigateToGroups()
	end, { var17, var16 })
	
	return if fFlagAppChatCustomConversationListRowModule then reactModule.createElement(customConversationListRowModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p0.entryHeight,
		entryIcon = iconName.ThreePeople,
		onActivated = var20,
		subTitleText = var15.createAndExploreGroupsText,
		titleText = var15.groupsText,
		testId = var19
	}) else reactModule.createElement(customConversationListEntryModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p0.entryHeight,
		entryIcon = var18,
		onActivated = var20,
		subTitleText = var15.createAndExploreGroupsText,
		titleText = var15.groupsText,
		testId = var19
	})
end

return ConversationGroupsEntryContainer