local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateToUserInfoModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.NavigateToUserInfo)
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local UserSearchTile = require(script.Parent.Parent.api).UserSearchTile
local ImpressionsTaggerWrapper = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTaggerWrapper
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local _ = require(CorePackages.Workspace.Packages.GraphQLServer)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), NavigateToUserInfoModule (copy), EnumsModule (copy), RoactModule (copy), ImpressionsTaggerWrapper (copy), UserSearchTile (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	local function NavigateToUserInfo(p2)
		-- upvalues: UseDispatchResult (copy), NavigateToUserInfoModule (upval), EnumsModule (upval), p1 (copy)
		UseDispatchResult(NavigateToUserInfoModule(p2.userId, {
			profilePeekViewProps = {
				resetPeekView = false,
				source = EnumsModule.Sources.PlayerSearch,
				contextualInfoType = p2.contextualInfoType,
				contextualInfoDisplay = p2.contextualInfoDisplay,
				analyticsProps = {
					userSearchSessionId = p1.Analytics.getInfoForAllEvents().userSearchSessionId
				}
			}
		}))
	end
	
	return RoactModule.createElement(ImpressionsTaggerWrapper, {
		impressionsIndex = p1.index,
		impressionsTag = p1.impressionsTag,
		renderComponent = function()
			-- upvalues: RoactModule (upval), UserSearchTile (upval), p1 (copy), NavigateToUserInfo (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (upval)
			return RoactModule.createElement(UserSearchTile, {
				index = p1.index,
				user = p1.user,
				size = p1.size,
				searchParameters = p1.searchParameters,
				hasEmphasis = p1.hasEmphasis,
				profileInsight = p1.profileInsight,
				luaAppNavigation = { navigateToUserInfo = NavigateToUserInfo },
				fireAnalyticsEvent = p1.Analytics.fireAnalyticsEvent,
				shouldUseCompactTiles = p1.shouldUseCompactTiles,
				enablePresenceIndicator = p1.enablePresenceIndicator,
				subpage = p1.subpage,
				rowInSort = p1.rowInSort,
				positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.positionInRow else nil,
				feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.feedRowNumber else nil
			})
		end
	})
end