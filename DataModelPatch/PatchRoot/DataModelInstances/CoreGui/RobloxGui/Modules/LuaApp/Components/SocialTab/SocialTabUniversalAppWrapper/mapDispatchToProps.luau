local CorePackages = game:GetService("CorePackages")
local JoinFunction = require(CorePackages.Packages.Cryo).Dictionary.join
local Modules = script:FindFirstAncestor("Modules")
local ConstantsModule = require(Modules.LuaApp.Constants)
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateDownToNotificationsFunction = NavigationRoduxModule.Thunks.NavigateDownToNotifications
local OpenGroupsListPageModule = require(Modules.LuaApp.Thunks.OpenGroupsListPage)
local NavigateDownToPrivacySettingsFunction = NavigationRoduxModule.Thunks.NavigateDownToPrivacySettings
local NavigateDownToReportAbuseFunction = NavigationRoduxModule.Thunks.NavigateDownToReportAbuse
local NavigateDownToViewUserProfileFunction = NavigationRoduxModule.Thunks.NavigateDownToViewUserProfile
local NavigateDownToGroupsFunction = NavigationRoduxModule.Thunks.NavigateDownToGroups
local NavigateDownToAddFriendsModule = require(Modules.LuaApp.Thunks.NavigateDownToAddFriends)
local NavigateDownToFriendRequestsModule = require(Modules.LuaApp.Thunks.NavigateDownToFriendRequests)
local NavigateDownToAddFriendsAccountProviderModule = require(Modules.LuaApp.Thunks.NavigateDownToAddFriendsAccountProvider)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local OpenCentralOverlayForPeopleListModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPeopleList)
local SetTabBarVisibleFromChatFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local ToggleChatPausedModule = require(CorePackages.Workspace.Packages.AppChat.ToggleChatPaused)
local GetUnreadConversationCount = require(CorePackages.Workspace.Packages.SocialTabState).Requests.GetUnreadConversationCount
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local OpenGameDetailsPageFromChatModule = require(Modules.LuaApp.Thunks.openGameDetailsPageFromChat)
local NavigateToUserInfoModule = require(Modules.LuaApp.Thunks.NavigateToUserInfo)
local OpenVerifiedBadgeModalModule = require(Modules.LuaApp.Thunks.OpenVerifiedBadgeModal)
local OpenReportDialogModule = require(Modules.LuaApp.Thunks.OpenReportDialog)
local OpenCentralOverlayForDiscoverabilityUpsellModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local OpenAmpWizardContainerFunction = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer
local NavigateDownTo3DQRCodePageModule = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local OpenCentralOverlayForPlayerContextualMenuModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu)
local GetFFlagLuafiedReportEntryPointsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuafiedReportEntryPoints

return function(Callback)
	-- upvalues: NavigateBackModule (copy), NavigateDownToNotificationsFunction (copy), NavigateDownToPrivacySettingsFunction (copy), NavigateDownToReportAbuseFunction (copy), GetFFlagLuafiedReportEntryPointsFunction (copy), OpenReportDialogModule (copy), ConstantsModule (copy), NavigateDownToViewUserProfileFunction (copy), NavigateDownToAddFriendsModule (copy), NavigateDownToFriendRequestsModule (copy), NavigateDownToAddFriendsAccountProviderModule (copy), OpenProfilePeekViewModule (copy), NavigateDownToGroupsFunction (copy), OpenGroupsListPageModule (copy), SetTabBarVisibleFromChatFunction (copy), ToggleChatPausedModule (copy), OpenCentralOverlayForPeopleListModule (copy), JoinFunction (copy), GetUnreadConversationCount (copy), OpenGameDetailsModule (copy), OpenGameDetailsPageFromChatModule (copy), NavigateToUserInfoModule (copy), OpenVerifiedBadgeModalModule (copy), OpenContactImporterLearnMoreLinkModule (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (copy), CloseCentralOverlayModule (copy), SetCurrentToastMessageModule (copy), NavigateDownTo3DQRCodePageModule (copy), OpenAmpWizardContainerFunction (copy), OpenCentralOverlayForPlayerContextualMenuModule (copy)
	return {
		navigateBack = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			Callback(NavigateBackModule())
		end,
		navigateDownToNotifications = function(p1)
			-- upvalues: Callback (copy), NavigateDownToNotificationsFunction (upval)
			Callback(NavigateDownToNotificationsFunction(p1))
		end,
		navigateDownToPrivacySettings = function(p1)
			-- upvalues: Callback (copy), NavigateDownToPrivacySettingsFunction (upval)
			Callback(NavigateDownToPrivacySettingsFunction(p1))
		end,
		navigateDownToReportAbuse = function(p1, p2, p3)
			-- upvalues: Callback (copy), NavigateDownToReportAbuseFunction (upval)
			Callback(NavigateDownToReportAbuseFunction(p1, p2, p3))
		end,
		openReportDialog = if GetFFlagLuafiedReportEntryPointsFunction() then function(UserId, ConversationId)
			-- upvalues: Callback (copy), OpenReportDialogModule (upval), ConstantsModule (upval)
			Callback(OpenReportDialogModule({
				reportEntryPoint = ConstantsModule.ReportDialogEntryPoints.Chat,
				userId = UserId,
				conversationId = ConversationId
			}))
		end else nil,
		navigateDownToViewUserProfile = function(p1, p2)
			-- upvalues: Callback (copy), NavigateDownToViewUserProfileFunction (upval)
			Callback(NavigateDownToViewUserProfileFunction(p1, p2))
		end,
		navigateDownToAddFriends = function(p1)
			-- upvalues: Callback (copy), NavigateDownToAddFriendsModule (upval)
			Callback(NavigateDownToAddFriendsModule(p1))
		end,
		navigateDownToFriendFinder = function(p1)
			-- upvalues: Callback (copy), NavigateDownToFriendRequestsModule (upval)
			Callback(NavigateDownToFriendRequestsModule(p1))
		end,
		navigateDownToAddFriendsAccountProvider = function(p1, p2)
			-- upvalues: Callback (copy), NavigateDownToAddFriendsAccountProviderModule (upval)
			Callback(NavigateDownToAddFriendsAccountProviderModule(p1, p2))
		end,
		openProfilePeekView = function(p1, p2)
			-- upvalues: Callback (copy), OpenProfilePeekViewModule (upval)
			Callback(OpenProfilePeekViewModule(p1, p2))
		end,
		navigateDownToGroups = function(p1)
			-- upvalues: Callback (copy), NavigateDownToGroupsFunction (upval)
			Callback(NavigateDownToGroupsFunction(p1))
		end,
		openGroupsListPage = function(p1)
			-- upvalues: Callback (copy), OpenGroupsListPageModule (upval)
			Callback(OpenGroupsListPageModule(p1))
		end,
		setTabBarVisibleFromChat = function(p1)
			-- upvalues: Callback (copy), SetTabBarVisibleFromChatFunction (upval)
			Callback(SetTabBarVisibleFromChatFunction(p1))
		end,
		toggleChatPaused = function(p1)
			-- upvalues: Callback (copy), ToggleChatPausedModule (upval)
			Callback(ToggleChatPausedModule(p1))
		end,
		openContextualMenu = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForPeopleListModule (upval), JoinFunction (upval)
			Callback(OpenCentralOverlayForPeopleListModule(JoinFunction(p1, { analyticContext = "SocialTab" })))
		end,
		fetchUnreadConversationCount = function()
			-- upvalues: Callback (copy), GetUnreadConversationCount (upval)
			Callback(GetUnreadConversationCount.API())
		end,
		openGameDetailsPeekView = function(p1)
			-- upvalues: Callback (copy), OpenGameDetailsModule (upval)
			assert(type(p1) == "string", "Expected universeId to be a string")
			Callback(OpenGameDetailsModule(p1))
		end,
		navigateToGameDetails = function(p1, p2)
			-- upvalues: Callback (copy), OpenGameDetailsPageFromChatModule (upval)
			Callback(OpenGameDetailsPageFromChatModule(p1, p2))
		end,
		navigateToUserInfo = function(p1, p2)
			-- upvalues: Callback (copy), NavigateToUserInfoModule (upval)
			assert(type(p1) == "string", "Expected userId to be a string")
			Callback(NavigateToUserInfoModule(p1, p2))
		end or nil,
		openVerifiedBadgeModal = function()
			-- upvalues: Callback (copy), OpenVerifiedBadgeModalModule (upval)
			Callback(OpenVerifiedBadgeModalModule())
		end,
		openLearnMoreLink = function()
			-- upvalues: Callback (copy), OpenContactImporterLearnMoreLinkModule (upval)
			Callback(OpenContactImporterLearnMoreLinkModule())
		end,
		openDiscoverabilityModal = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (upval)
			Callback(OpenCentralOverlayForDiscoverabilityUpsellModule(p1))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		showToast = function(ToastMessage)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule({ toastMessage = ToastMessage }))
		end,
		navigateTo3DQRCodePage = function(p1)
			-- upvalues: Callback (copy), NavigateDownTo3DQRCodePageModule (upval)
			Callback(NavigateDownTo3DQRCodePageModule(p1))
		end,
		openAmpWizardContainer = function(p1, p2)
			-- upvalues: Callback (copy), OpenAmpWizardContainerFunction (upval)
			Callback(OpenAmpWizardContainerFunction(p1, p2))
		end,
		openPlayerContextualMenu = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForPlayerContextualMenuModule (upval)
			Callback(OpenCentralOverlayForPlayerContextualMenuModule(p1))
		end
	}
end