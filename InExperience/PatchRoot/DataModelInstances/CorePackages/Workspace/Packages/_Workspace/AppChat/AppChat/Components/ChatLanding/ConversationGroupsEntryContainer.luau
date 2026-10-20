local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local LuaAppNavigationContextModule = require(AppChat.LuaAppNavigationContext)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local GetAppChatCommunitiesVisualConfigModule = require(AppChat.Utils.getAppChatCommunitiesVisualConfig)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local IconName = require(Parent.Foundation).Enums.IconName
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local CustomConversationListEntryModule = require(script.Parent.CustomConversationListEntry)
local CustomConversationListRowModule = require(script.Parent.CustomConversationListRow.CustomConversationListRow)
local FFlagAppChatUseFoundationCustomConversationListRowModule = require(AppChat.Flags.FFlagAppChatUseFoundationCustomConversationListRow)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)

function ConversationGroupsEntryContainer(p1)
	-- upvalues: GetAppChatCommunitiesVisualConfigModule (copy), UseLocalizationFunction (copy), ReactModule (copy), LuaAppNavigationContextModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), Images (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ChatLandingTelemetryEventsModule (copy), FFlagAppChatUseFoundationCustomConversationListRowModule (copy), CustomConversationListRowModule (copy), IconName (copy), CustomConversationListEntryModule (copy)
	local AppChatCommunitiesVisualConfigModule = GetAppChatCommunitiesVisualConfigModule()
	local UseLocalizationResult = UseLocalizationFunction({
		createAndExploreGroupsText = "Feature.SocialTab.Label.CreateAndExploreGroups",
		groupsText = AppChatCommunitiesVisualConfigModule.label
	})
	local UseContextResult = ReactModule.useContext(LuaAppNavigationContextModule)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local Image = Images[AppChatCommunitiesVisualConfigModule.icon]
	local Communities = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingConversationListHeader("communities") else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), UseContextResult (copy)
		UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingGroupsBtnClicked, {})
		UseContextResult.navigateToGroups()
	end, { UseTelemetryModuleResult, UseContextResult })
	
	return if FFlagAppChatUseFoundationCustomConversationListRowModule then ReactModule.createElement(CustomConversationListRowModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = IconName.ThreePeople,
		onActivated = UseResult,
		subTitleText = UseLocalizationResult.createAndExploreGroupsText,
		titleText = UseLocalizationResult.groupsText,
		testId = Communities
	}) else ReactModule.createElement(CustomConversationListEntryModule, {
		key = "ConversationGroupsEntry",
		entryHeight = p1.entryHeight,
		entryIcon = Image,
		onActivated = UseResult,
		subTitleText = UseLocalizationResult.createAndExploreGroupsText,
		titleText = UseLocalizationResult.groupsText,
		testId = Communities
	})
end

return ConversationGroupsEntryContainer