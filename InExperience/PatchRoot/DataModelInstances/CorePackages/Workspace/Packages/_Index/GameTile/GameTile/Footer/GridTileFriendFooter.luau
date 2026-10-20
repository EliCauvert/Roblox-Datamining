local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local Colors = require(Parent.Style).Colors
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Array = require(Parent.LuauPolyfill).Array
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local CoPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local SortFriendsByPresenceAndRecencyFactoryModule = require(GameTile.sortFriendsByPresenceAndRecencyFactory)
local FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix

local function useFetchSortedDisplayNames(UserIds)
	-- upvalues: UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), SortFriendsByPresenceAndRecencyFactoryModule (copy)
	local List = {}
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = UserIds,
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = not UserIds or #UserIds == 0
	})
	
	if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data and UserIds then
		for _, userId in UserIds do
			table.insert(List, {
				userId = userId,
				displayName = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, userId)
			})
		end
	end
	table.sort(List, SortFriendsByPresenceAndRecencyFactoryModule("displayName"))
	
	return List
end

return {
	GridTileFriendFooter = function(p1)
		-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseLocalizationFunction (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), useFetchSortedDisplayNames (copy), ReactModule (copy), CoPlayFooter (copy), Array (copy), Colors (copy)
		local Body = if p1.useLargerFont then UseStyleFunction().Font.Body else UseStyleFunction().Font.CaptionHeader
		local Size = UseDesignTokensFunction().Size
		local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
		local UseLocalizationResult = UseLocalizationFunction({
			friendsSeparator = "Feature.GameDetails.Label.FriendsSeparator"
		})
		local Size100 = Size.Size_100
		
		if not p1.showOnlineBorder then
			Size100 -= 3
		end
		if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			local UseFetchSortedDisplayNamesResult = useFetchSortedDisplayNames(p1.friendUserIds or {})
			local CreateElementFunction1 = ReactModule.createElement
			local v1 = "TextButton"
			local config = {
				Size = UDim2.new(1, 0, 0, Size.Size_500 + UseTextSizeOffsetResult),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
				[ReactModule.Event.Activated] = p1.onFriendFooterActivated,
				Selectable = false
			}
			local t = {}
			local CreateElementFunction = ReactModule.createElement
			local config1 = { faceGroupCount = 2 }
			local Users = {}
			
			for i = 1, #UseFetchSortedDisplayNamesResult do
				Users[i] = UseFetchSortedDisplayNamesResult[i].userId
			end
			config1.users = Users
			config1.labelText = Array.join(Array.map(UseFetchSortedDisplayNamesResult, function(p2)
				return p2.displayName
			end), UseLocalizationResult.friendsSeparator)
			config1.showEmphasisBorder = p1.showOnlineBorder
			config1.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = Size.Size_500,
				faceHeight = Size.Size_500,
				faceGroupGap = -Size.Size_150,
				containerGap = Size100,
				badgeHeight = Size.Size_500,
				fontStyle = Body,
				badgeSpacingLeading = Size.Size_100,
				badgeSpacingTrailing = Size.Size_100,
				badgeBackgroundColor = { Transparency = 0, Color = Colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = Colors.White }
			}
			t.OnlineFriends = CreateElementFunction(CoPlayFooter, config1)
			
			return (CreateElementFunction1(v1, config, t))
		else
			local CreateElementFunction3 = ReactModule.createElement
			local v2 = "Frame"
			local config2 = {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, Size.Size_500 + UseTextSizeOffsetResult)
			}
			local t1 = {}
			local CreateElementFunction2 = ReactModule.createElement
			local config3 = { faceGroupCount = 2 }
			local Friends = p1.friends or {}
			local Users1 = {}
			
			for i1 = 1, #Friends do
				Users1[i1] = Friends[i1].userId
			end
			config3.users = Users1
			config3.labelText = Array.join(Array.map(p1.friends or {}, function(p2)
				return p2.displayName
			end), UseLocalizationResult.friendsSeparator)
			config3.showEmphasisBorder = p1.showOnlineBorder
			config3.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = Size.Size_500,
				faceHeight = Size.Size_500,
				faceGroupGap = -Size.Size_150,
				containerGap = Size100,
				badgeHeight = Size.Size_500,
				fontStyle = Body,
				badgeSpacingLeading = Size.Size_100,
				badgeSpacingTrailing = Size.Size_100,
				badgeBackgroundColor = { Transparency = 0, Color = Colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = Colors.White }
			}
			t1.OnlineFriends = CreateElementFunction2(CoPlayFooter, config3)
			
			return CreateElementFunction3(v2, config2, t1)
		end
	end,
	getUserIdsForFacePile = function(p2)
		local UserIds = {}
		
		for i = 1, #p2 do
			UserIds[i] = p2[i].userId
		end
		return UserIds
	end,
	getDisplayName = function(p3, p4)
		-- upvalues: Array (copy)
		return Array.join(Array.map(p3, function(p5)
			return p5.displayName
		end), p4)
	end
}