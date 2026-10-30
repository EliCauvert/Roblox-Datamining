local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagEnableSocialTabsPage = require(Parent.SharedFlags).FFlagEnableSocialTabsPage
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagSocialTabsPageIxpEnabledModule = require(ProfilePlatform.Flags.FFlagSocialTabsPageIxpEnabled)
local FStringSocialTabsPageIxpLayerModule = require(ProfilePlatform.Flags.FStringSocialTabsPageIxpLayer)
local IXPServiceWrapper = if FFlagSocialTabsPageIxpEnabledModule then require(Parent.IXPServiceWrapper).IXPServiceWrapper else nil

return function(ProfileId, p1, p2, MutualFriendIds, Title, p3)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagEnableSocialTabsPage (copy), UseProfileFormFactorModule (copy), ReactModule (copy), AppPage (copy), EventNamesModule (copy), FFlagSocialTabsPageIxpEnabledModule (copy), IXPServiceWrapper (copy), FStringSocialTabsPageIxpLayerModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Url (copy), TextKeysModule (copy), FFlagCreateConnectionsHub (copy), UrlBuilder (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local NoIsFullView = if FFlagEnableSocialTabsPage then not UseProfileFormFactorModule().isFullView else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: MutualFriendIds (copy), AppPage (upval), p2 (copy), EventNamesModule (upval), FFlagSocialTabsPageIxpEnabledModule (upval), IXPServiceWrapper (upval), FStringSocialTabsPageIxpLayerModule (upval), FFlagEnableSocialTabsPage (upval), p1 (copy), ProfileId (copy), Title (copy), NoIsFullView (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), Url (upval), TextKeysModule (upval), p3 (copy), FFlagCreateConnectionsHub (upval), UseNavigationResult (copy), UrlBuilder (upval)
		local function buildTabConfig()
			-- upvalues: MutualFriendIds (upval), AppPage (upval)
			local List = {}
			
			if MutualFriendIds and #MutualFriendIds > 0 then
				table.insert(List, {
					tabLabelKey = "Feature.Friends.Mutuals",
					id = AppPage.SocialTabsMutuals
				})
			end
			table.insert(List, {
				tabLabelKey = "CommonUI.Features.Label.Friends",
				id = AppPage.SocialTabsFriends
			})
			
			return List
		end
		
		return {
			mutualFriendsCount = function()
				-- upvalues: p2 (upval), EventNamesModule (upval), FFlagSocialTabsPageIxpEnabledModule (upval), IXPServiceWrapper (upval), FStringSocialTabsPageIxpLayerModule (upval), FFlagEnableSocialTabsPage (upval), p1 (upval), AppPage (upval), ProfileId (upval), Title (upval), buildTabConfig (copy), NoIsFullView (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval), MutualFriendIds (upval)
				p2.fireAnalyticsEvent(EventNamesModule.MutualFriendsButton)
				
				if FFlagSocialTabsPageIxpEnabledModule then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringSocialTabsPageIxpLayerModule)
				end
				if FFlagEnableSocialTabsPage and not p1 then
					local config1 = {
						name = AppPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = ProfileId,
							title = Title,
							initialTabId = AppPage.SocialTabsMutuals,
							tabConfig = buildTabConfig(),
							dockToProfilePanel = NoIsFullView
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config1))
						
						return
					end
				else
					local config = {
						name = AppPage.MutualConnectionList,
						extraProps = { mutualFriendIds = MutualFriendIds }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				end
			end,
			followersCount = function()
				-- upvalues: p2 (upval), EventNamesModule (upval), AppPage (upval), Url (upval), ProfileId (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
				p2.fireAnalyticsEvent(EventNamesModule.FollowersButton)
				local config = {
					name = AppPage.GenericWebPage,
					detail = `{Url.BASE_URL}users/{ProfileId}/friends#!/followers`,
					extraProps = { titleKey = TextKeysModule.Followers }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end,
			followingsCount = function()
				-- upvalues: p2 (upval), EventNamesModule (upval), AppPage (upval), Url (upval), ProfileId (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
				p2.fireAnalyticsEvent(EventNamesModule.FollowingsButton)
				local config = {
					name = AppPage.GenericWebPage,
					detail = `{Url.BASE_URL}users/{ProfileId}/friends#!/following`,
					extraProps = { titleKey = TextKeysModule.Following }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end,
			friendsCount = function()
				-- upvalues: p2 (upval), EventNamesModule (upval), FFlagSocialTabsPageIxpEnabledModule (upval), p1 (upval), p3 (upval), IXPServiceWrapper (upval), FStringSocialTabsPageIxpLayerModule (upval), FFlagCreateConnectionsHub (upval), UseNavigationResult (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval), FFlagEnableSocialTabsPage (upval), ProfileId (upval), Title (upval), buildTabConfig (copy), NoIsFullView (upval), UrlBuilder (upval), TextKeysModule (upval)
				p2.fireAnalyticsEvent(EventNamesModule.FriendsButton)
				
				if FFlagSocialTabsPageIxpEnabledModule and not p1 and p3 then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringSocialTabsPageIxpLayerModule)
				end
				if p1 then
					if FFlagCreateConnectionsHub then
						UseNavigationResult.navigate(AppPage.CoHubMyConnections)
						
						return
					end
					local config = {
						name = AppPage.ViewFriends,
						extraProps = {
							navigateToFriendsLandingEventStart = {
								startPage = AppPage.ProfilePlatform,
								startTime = os.clock()
							}
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
						
						return
					end
				elseif FFlagEnableSocialTabsPage then
					local config = {
						name = AppPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = ProfileId,
							title = Title,
							initialTabId = AppPage.SocialTabsFriends,
							tabConfig = buildTabConfig(),
							dockToProfilePanel = NoIsFullView
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
						
						return
					end
				else
					local config1 = {
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.user.friends({ userId = ProfileId }),
						extraProps = { titleKey = TextKeysModule.Friends }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config1))
					end
				end
			end
		}
	end, {
		ProfileId, p1, p2, UseDispatchResult, MutualFriendIds,
		if FFlagEnableSocialTabsPage then Title or "" else nil,
		if FFlagEnableSocialTabsPage then NoIsFullView else nil,
		if FFlagEnableSocialTabsPage then UseNavigationResult else nil,
		if FFlagSocialTabsPageIxpEnabledModule then p3 else nil
	})
end