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
local images = UIBloxModule.App.ImageSet.Images
local iconName = foundationModule.Enums.IconName
local domLocatorsModule = require(appChat.Utils.DomLocators)
local customConversationListEntryModule = require(script.Parent.CustomConversationListEntry)
local customConversationListRowModule = require(script.Parent.CustomConversationListRow.CustomConversationListRow)
local fFlagAppChatUseFoundationCustomConversationListRowModule = require(appChat.Flags.FFlagAppChatUseFoundationCustomConversationListRow)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)

function ConversationGroupsEntryContainer(p1)
	-- upvalues: getAppChatCommunitiesVisualConfigModule (ref), useLocalization (ref), reactModule (ref), luaAppNavigationContextModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), images (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatLandingTelemetryEventsModule (ref), fFlagAppChatUseFoundationCustomConversationListRowModule (ref), customConversationListRowModule (ref), iconName (ref), customConversationListEntryModule (ref)
	local var1 = getAppChatCommunitiesVisualConfigModule()
	local var2 = useLocalization({
		createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups",
		groupsText = var1.label
	})
	local var3 = reactModule.useContext(luaAppNavigationContextModule)
	local var4 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local icon = images[var1.icon]
	local var5 = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingConversationListHeader("communities") else nil
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), chatLandingTelemetryEventsModule (copy), var3 (ref)
		var4.emit(chatLandingTelemetryEventsModule.ChatLandingGroupsBtnClicked, {})
		var3.navigateToGroups()
	end, { var4, var3 })
	
	return if fFlagAppChatUseFoundationCustomConversationListRowModule then reactModule.createElement(customConversationListRowModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = iconName.ThreePeople,
		onActivated = var6,
		subTitleText = var2.createAndExploreGroupsText,
		titleText = var2.groupsText,
		testId = var5
	}) else reactModule.createElement(customConversationListEntryModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = icon,
		onActivated = var6,
		subTitleText = var2.createAndExploreGroupsText,
		titleText = var2.groupsText,
		testId = var5
	})
end

return ConversationGroupsEntryContainer