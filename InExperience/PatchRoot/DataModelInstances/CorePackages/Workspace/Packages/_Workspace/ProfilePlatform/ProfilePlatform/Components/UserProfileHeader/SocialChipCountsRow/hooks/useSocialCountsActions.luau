local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationRoduxModule = require(parent.NavigationRodux)
local roactUtilsModule = require(parent.RoactUtils)
local appPage = require(parent.RobloxAppEnums).AppPage
local url = require(parent.Http).Url
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local textKeysModule = require(profilePlatform.Common.TextKeys)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagEnableSocialTabsPage = require(parent.SharedFlags).FFlagEnableSocialTabsPage
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1, p2, p3, p4) --[[ line: 35 | named "useSocialCountsActions" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), reactModule (ref), appPage (ref), eventNamesModule (ref), fFlagEnableSocialTabsPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), url (ref), textKeysModule (ref), fFlagCreateConnectionsHub (ref), urlBuilder (ref), fFlagConnectionsToFriendsRename (ref)
	local var7 = useDispatch()
	local var8 = useNavigation()
	
	return reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: p3 (ref), appPage (copy), p2 (ref), eventNamesModule (copy), fFlagEnableSocialTabsPage (copy), p1 (ref), p0 (ref), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (ref), navigateDown (copy), url (copy), textKeysModule (copy), fFlagCreateConnectionsHub (copy), var8 (ref), urlBuilder (copy), fFlagConnectionsToFriendsRename (copy)
		local function buildTabConfig() --[[ line: 47 ]]
			-- upvalues: p3 (copy), appPage (copy)
			local t = {}
			
			if p3 and #p3 > 0 then
				table.insert(t, {
					tabLabelKey = "Feature.Friends.Mutuals",
					id = appPage.SocialTabsMutuals
				})
			end
			table.insert(t, {
				tabLabelKey = "CommonUI.Features.Label.Friends",
				id = appPage.SocialTabsFriends
			})
			
			return t
		end
		
		return {
			mutualFriendsCount = function() --[[ line: 60 ]]
				-- upvalues: p2 (copy), eventNamesModule (copy), fFlagEnableSocialTabsPage (copy), p1 (copy), appPage (copy), p0 (copy), p4 (copy), buildTabConfig (ref), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (copy), navigateDown (copy), p3 (copy)
				p2.fireAnalyticsEvent(eventNamesModule.MutualFriendsButton)
				
				if fFlagEnableSocialTabsPage and not p1 then
					local t = {
						name = appPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = p0,
							title = p4,
							initialTabId = appPage.SocialTabsMutuals,
							tabConfig = buildTabConfig()
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var6.down(var6.fromLegacyPage(t))
						
						return
					end
					var7(navigateDown(t))
					
					return
				else
					local t = {
						name = appPage.MutualConnectionList,
						extraProps = { mutualFriendIds = p3 }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var6.down(var6.fromLegacyPage(t))
						
						return
					end
					var7(navigateDown(t))
				end
			end,
			followersCount = function() --[[ line: 94 ]]
				-- upvalues: p2 (copy), eventNamesModule (copy), appPage (copy), url (copy), p0 (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (copy), navigateDown (copy)
				p2.fireAnalyticsEvent(eventNamesModule.FollowersButton)
				local t = {
					name = appPage.GenericWebPage,
					detail = `{url.BASE_URL}users/{p0}/friends#!/followers`,
					extraProps = { titleKey = textKeysModule.Followers }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var6.down(var6.fromLegacyPage(t))
					
					return
				end
				var7(navigateDown(t))
			end,
			followingsCount = function() --[[ line: 110 ]]
				-- upvalues: p2 (copy), eventNamesModule (copy), appPage (copy), url (copy), p0 (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (copy), navigateDown (copy)
				p2.fireAnalyticsEvent(eventNamesModule.FollowingsButton)
				local t = {
					name = appPage.GenericWebPage,
					detail = `{url.BASE_URL}users/{p0}/friends#!/following`,
					extraProps = { titleKey = textKeysModule.Following }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var6.down(var6.fromLegacyPage(t))
					
					return
				end
				var7(navigateDown(t))
			end,
			friendsCount = function() --[[ line: 126 ]]
				-- upvalues: p2 (copy), eventNamesModule (copy), p1 (copy), fFlagCreateConnectionsHub (copy), var8 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (copy), navigateDown (copy), fFlagEnableSocialTabsPage (copy), p0 (copy), p4 (copy), buildTabConfig (ref), urlBuilder (copy), fFlagConnectionsToFriendsRename (copy), textKeysModule (copy)
				p2.fireAnalyticsEvent(eventNamesModule.FriendsButton)
				
				if p1 then
					if fFlagCreateConnectionsHub then
						var8.navigate(appPage.CoHubMyConnections)
						
						return
					end
					local t = {
						name = appPage.ViewFriends,
						extraProps = {
							navigateToFriendsLandingEventStart = {
								startPage = appPage.ProfilePlatform,
								startTime = os.clock()
							}
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var6.down(var6.fromLegacyPage(t))
						
						return
					end
					var7(navigateDown(t))
					
					return
				elseif fFlagEnableSocialTabsPage then
					local t = {
						name = appPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = p0,
							title = p4,
							initialTabId = appPage.SocialTabsFriends,
							tabConfig = buildTabConfig()
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var6.down(var6.fromLegacyPage(t))
						
						return
					end
					var7(navigateDown(t))
					
					return
				else
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.user.friends({ userId = p0 }),
						extraProps = {
							titleKey = if fFlagConnectionsToFriendsRename then textKeysModule.Friends else textKeysModule.Connections
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var6.down(var6.fromLegacyPage(t))
						
						return
					end
					var7(navigateDown(t))
				end
			end
		}
	end, {
		p0, p1, p2, var7, p3, if fFlagEnableSocialTabsPage then p4 else nil
	})
end