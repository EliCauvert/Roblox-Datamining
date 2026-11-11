local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.Navigation)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local SystemBarVisibilityModule = require(Modules.LuaApp.Enum.SystemBarVisibility)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local ApiModule = require(Modules.LuaApp.Components.DiscoverabilityModal.api)
local SocialNetworksInEditProfileIXP = require(CorePackages.Workspace.Packages.EditProfile.Flags).SocialNetworksInEditProfileIXP
local FFlagEnableSocialProofUserList = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList
local FFlagProfilePlatformAddTC = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal
local FFlagUseNewDiscoverabilityModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNewDiscoverabilityModal
local FFlagCreateConnectionsHub = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub
local FFlagCiDeprecateFindFriendsModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal
local FFlagEnableSocialProofVerticalUserListSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSocialProofVerticalUserListSheet
local FFlagEnableMobileGameJoinCard = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagEnableSocialTabsPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSocialTabsPage
local FFlagEnableSchoolEntry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSchoolEntry

return function()
	-- upvalues: AppPage (copy), Modules (copy), AppPagePropertiesModule (copy), CorePackages (copy), SocialNetworksInEditProfileIXP (copy), SystemBarVisibilityModule (copy), ScreenKind (copy), GlobalNavDisplayOption (copy), FFlagCreateConnectionsHub (copy), FFlagUseNewDiscoverabilityModal (copy), ApiModule (copy), FFlagCiDeprecateFindFriendsModal (copy), FFlagProfilePlatformAddTC (copy), FFlagTCShareLinkErrorModal (copy), FFlagEnableSocialProofUserList (copy), FFlagEnableSocialTabsPage (copy), FFlagEnableSocialProofVerticalUserListSheet (copy), FFlagEnableMobileGameJoinCard (copy), FFlagEnableSchoolEntry (copy)
	return {
		{
			[AppPage.SocialUnableToJoinExperience] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.SocialUnableToJoinExperience)
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SocialUnableToJoinExperience]
			}
		},
		{
			[AppPage.SocialToast] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialToast).ToastScreen
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SocialToast]
			}
		},
		{
			[AppPage.SocialPurchaseExperience] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialExperienceJoin).PurchaseExperienceModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SocialPurchaseExperience]
			}
		},
		{
			[AppPage.SetNicknameModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.FriendRequestNicknames).SetNicknameModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SetNicknameModal]
			}
		},
		{
			[AppPage.ContentFeed] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.ContentFeed).App
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.ContentFeed]
			}
		},
		if SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
			[AppPage.EditSocialNetworks] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.EditProfile.EditSocialLinksModal)
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.EditSocialNetworks]
			}
		} else nil,
		if SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
			[AppPage.EditSocialNetworksError] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.EditProfile.EditSocialNetworksErrorModal)
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.EditSocialNetworksError]
			}
		} else nil,
		{
			[AppPage.ViewFriends] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container)
				end,
				navigationOptions = {
					hasSubNavigation = true,
					nativeWrapper = false,
					renderUnderlyingPage = false,
					tabBarHidden = SystemBarVisibilityModule.PolicyDependent
				}
			}
		},
		{
			[AppPage.AddFriendsPage] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.AddFriends.AddFriendsUniversalAppWrapper)
				end,
				navigationOptions = {
					nativeWrapper = false,
					bottomTabBarHidden = true,
					sideTabBarHidden = false,
					tabBarHidden = SystemBarVisibilityModule.PolicyDependent,
					screenKind = ScreenKind.Default,
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		},
		if FFlagCreateConnectionsHub then {
			[AppPage.ConnectionsHub] = {
				getScreen = function()
					return require(script.Parent.ConnectionsHub.ConnectionsHubNavigator)
				end
			}
		} else nil,
		{
			[AppPage.UserSearch] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.UserSearch.UserSearchScreenUniversalWrapper.UserSearchScreenUniversalWrapper)
				end,
				navigationOptions = { tabBarHidden = SystemBarVisibilityModule.PolicyDependent }
			}
		},
		{
			[AppPage.DiscoverabilityOverlay] = {
				getScreen = function()
					-- upvalues: FFlagUseNewDiscoverabilityModal (upval), ApiModule (upval)
					return if FFlagUseNewDiscoverabilityModal then ApiModule.DiscoverabilityWithAudit else ApiModule.DiscoverabilityOverlay
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.DiscoverabilityOverlay]
			}
		},
		{
			[AppPage.ContactImporter] = {
				getScreen = function()
					-- upvalues: FFlagCiDeprecateFindFriendsModal (upval), Modules (upval)
					return if FFlagCiDeprecateFindFriendsModal then require(Modules.LuaApp.Components.ContactImporter.api).ContactImporterLandingPage else require(Modules.LuaApp.Components.ContactImporter.api).FindFriendsModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.ContactImporter]
			}
		},
		{
			[AppPage.FindFriendsModal] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.ContactImporter.api).FindFriendsModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.FindFriendsModal]
			}
		},
		{
			[AppPage.ContactsList] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.ContactImporter.ContactsListUniversalAppWrapper)
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.ContactsList]
			}
		},
		{
			[AppPage.ContactsRevokedAccessDialog] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.ContactImporter.api).ContactsRevokedAccessDialog
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.ContactsRevokedAccessDialog]
			}
		},
		{
			[AppPage.TrustedContactsEducationModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.TrustedContacts).TrustedContactsEducationModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.TrustedContactsEducationModal]
			}
		},
		{
			[AppPage.SettingsPermissionInteractiveAlert] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialCommon).Components.SettingsPermissionInteractiveAlert
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SettingsPermissionInteractiveAlert]
			}
		},
		if FFlagProfilePlatformAddTC then {
			[AppPage.TrustedContactsModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.TrustedContacts).TrustedFriendsModalEntry
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.TrustedContactsModal]
			}
		} else nil,
		{
			[AppPage.FriendsRenameInfoModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.TrustedContacts).FriendsRenameInfoModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.FriendsRenameInfoModal]
			}
		},
		if FFlagTCShareLinkErrorModal then {
			[AppPage.TrustedFriendsShareLinkErrorModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.TrustedContacts).TrustedFriendsShareLinkErrorModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.TrustedFriendsShareLinkErrorModal]
			}
		} else nil,
		{
			[AppPage.BlockingModal] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialBlockingModal).BlockingModal
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.BlockingModal]
			}
		},
		if FFlagEnableSocialProofUserList then {
			[AppPage.FriendsOwnedUserList] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialProof).UserLists.FriendsOwnedUserList
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.FriendsOwnedUserList]
			}
		} else nil,
		{
			[AppPage.MutualConnectionList] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.ProfilePlatform.UserLists).MutualConnectionList
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.MutualConnectionList]
			}
		},
		if FFlagEnableSocialTabsPage then {
			[AppPage.SocialTabsPage] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialTabsPage).SocialTabsPageNavigator
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SocialTabsPage]
			}
		} else nil,
		{
			[AppPage.AboutDetailsSheet] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return (require(CorePackages.Workspace.Packages.ProfilePlatform.AboutDetailsSheet))
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.AboutDetailsSheet]
			}
		},
		if FFlagEnableSocialProofVerticalUserListSheet then {
			[AppPage.SocialProofVerticalUserListSheet] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SocialProof).UserLists.SocialProofVerticalUserListSheet
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.SocialProofVerticalUserListSheet]
			}
		} else nil,
		if FFlagEnableMobileGameJoinCard then {
			[AppPage.GameJoinCard] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.GameJoinCard).MobileGameJoinCard
				end,
				navigationOptions = AppPagePropertiesModule[AppPage.GameJoinCard]
			}
		} else nil,
		if FFlagEnableSchoolEntry then {
			[AppPage.Schools] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.Schools.SchoolsNavigator)
				end,
				navigationOptions = {
					hasSubNavigation = true,
					transparent = true,
					overlayEnabled = true
				}
			}
		} else nil
	}
end