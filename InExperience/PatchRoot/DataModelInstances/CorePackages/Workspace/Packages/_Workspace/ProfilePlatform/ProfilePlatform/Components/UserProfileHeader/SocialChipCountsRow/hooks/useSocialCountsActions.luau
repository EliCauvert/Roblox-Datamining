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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3, p4, p5)
	-- upvalues: useDispatch (ref), useNavigation (ref), reactModule (ref), appPage (ref), eventNamesModule (ref), fFlagEnableSocialTabsPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), url (ref), textKeysModule (ref), fFlagCreateConnectionsHub (ref), urlBuilder (ref), fFlagConnectionsToFriendsRename (ref)
	local var2 = useDispatch()
	local var3 = useNavigation()
	
	return reactModule.useMemo(function()
		-- upvalues: p4 (ref), appPage (copy), p3 (ref), eventNamesModule (copy), fFlagEnableSocialTabsPage (copy), p2 (ref), p1 (ref), p5 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), url (copy), textKeysModule (copy), fFlagCreateConnectionsHub (copy), var3 (ref), urlBuilder (copy), fFlagConnectionsToFriendsRename (copy)
		local function buildTabConfig()
			-- upvalues: p4 (copy), appPage (copy)
			local t = {}
			
			if p4 and #p4 > 0 then
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
			mutualFriendsCount = function()
				-- upvalues: p3 (copy), eventNamesModule (copy), fFlagEnableSocialTabsPage (copy), p2 (copy), appPage (copy), p1 (copy), p5 (copy), buildTabConfig (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (copy), navigateDown (copy), p4 (copy)
				p3.fireAnalyticsEvent(eventNamesModule.MutualFriendsButton)
				
				if fFlagEnableSocialTabsPage and not p2 then
					local t = {
						name = appPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = p1,
							title = p5,
							initialTabId = appPage.SocialTabsMutuals,
							tabConfig = buildTabConfig()
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					var2(navigateDown(t))
					
					return
				else
					local t = {
						name = appPage.MutualConnectionList,
						extraProps = { mutualFriendIds = p4 }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					var2(navigateDown(t))
				end
			end,
			followersCount = function()
				-- upvalues: p3 (copy), eventNamesModule (copy), appPage (copy), url (copy), p1 (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (copy), navigateDown (copy)
				p3.fireAnalyticsEvent(eventNamesModule.FollowersButton)
				local t = {
					name = appPage.GenericWebPage,
					detail = `{url.BASE_URL}users/{p1}/friends#!/followers`,
					extraProps = { titleKey = textKeysModule.Followers }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				var2(navigateDown(t))
			end,
			followingsCount = function()
				-- upvalues: p3 (copy), eventNamesModule (copy), appPage (copy), url (copy), p1 (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (copy), navigateDown (copy)
				p3.fireAnalyticsEvent(eventNamesModule.FollowingsButton)
				local t = {
					name = appPage.GenericWebPage,
					detail = `{url.BASE_URL}users/{p1}/friends#!/following`,
					extraProps = { titleKey = textKeysModule.Following }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				var2(navigateDown(t))
			end,
			friendsCount = function()
				-- upvalues: p3 (copy), eventNamesModule (copy), p2 (copy), fFlagCreateConnectionsHub (copy), var3 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (copy), navigateDown (copy), fFlagEnableSocialTabsPage (copy), p1 (copy), p5 (copy), buildTabConfig (ref), urlBuilder (copy), fFlagConnectionsToFriendsRename (copy), textKeysModule (copy)
				p3.fireAnalyticsEvent(eventNamesModule.FriendsButton)
				
				if p2 then
					if fFlagCreateConnectionsHub then
						var3.navigate(appPage.CoHubMyConnections)
						
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
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					var2(navigateDown(t))
					
					return
				elseif fFlagEnableSocialTabsPage then
					local t = {
						name = appPage.SocialTabsPage,
						extraProps = {
							source = "ProfilePage",
							profileId = p1,
							title = p5,
							initialTabId = appPage.SocialTabsFriends,
							tabConfig = buildTabConfig()
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					var2(navigateDown(t))
					
					return
				else
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.user.friends({ userId = p1 }),
						extraProps = {
							titleKey = if fFlagConnectionsToFriendsRename then textKeysModule.Friends else textKeysModule.Connections
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					var2(navigateDown(t))
				end
			end
		}
	end, {
		p1, p2, p3, var2, p4, if fFlagEnableSocialTabsPage then p5 else nil
	})
end