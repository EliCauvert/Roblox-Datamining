local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local colors = require(parent.Style).Colors
local useLocalization = require(parent.Localization).Hooks.useLocalization
local array = require(parent.LuauPolyfill).Array
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local coPlayFooter = UIBloxModule.App.Tile.ExperienceTileMetadata.CoPlayFooter
local userProfilesModule = require(parent.UserProfiles)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local sortFriendsByPresenceAndRecencyFactoryModule = require(gameTile.sortFriendsByPresenceAndRecencyFactory)
local fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix

local function useFetchSortedDisplayNames(p1)
	-- upvalues: useUserProfilesFetch (ref), userProfilesModule (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	local t = {}
	local var1 = useUserProfilesFetch({
		userIds = p1,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = not p1 or #p1 == 0
	})
	
	if var1 and var1.data and p1 then
		for i, v in p1 do
			table.insert(t, {
				userId = v,
				displayName = userProfilesModule.Selectors.getCombinedNameFromId(var1.data, v)
			})
		end
	end
	table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
	
	return t
end

return {
	GridTileFriendFooter = function(p2)
		-- upvalues: useStyle (ref), useDesignTokens (ref), useTextSizeOffset (ref), useLocalization (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useFetchSortedDisplayNames (ref), reactModule (ref), coPlayFooter (ref), array (ref), colors (ref)
		local var2 = if p2.useLargerFont then useStyle().Font.Body else useStyle().Font.CaptionHeader
		local global = useDesignTokens().Global
		local var3 = useTextSizeOffset()
		local var4 = useLocalization({
			friendsSeparator = "Feature.GameDetails.Label.FriendsSeparator"
		})
		local space50 = global.Space_50
		
		if not p2.showOnlineBorder then
			space50 -= 3
		end
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			local var5 = useFetchSortedDisplayNames(p2.friendUserIds or {})
			local createElement = reactModule.createElement
			local var6 = "TextButton"
			local t = {
				Size = UDim2.new(1, 0, 0, global.Space_250 + var3),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
				[reactModule.Event.Activated] = p2.onFriendFooterActivated,
				Selectable = false
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local var7 = coPlayFooter
			local t_2 = { faceGroupCount = 2 }
			local t_3 = {}
			
			for i = 1, #var5 do
				t_3[i] = var5[i].userId
			end
			t_2.users = t_3
			t_2.labelText = array.join(array.map(var5, function(p3)
				return p3.displayName
			end), var4.friendsSeparator)
			t_2.showEmphasisBorder = p2.showOnlineBorder
			t_2.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = global.Size_250,
				faceHeight = global.Size_250,
				faceGroupGap = -global.Space_75,
				containerGap = space50,
				badgeHeight = global.Size_250,
				fontStyle = var2,
				badgeSpacingLeading = global.Space_50,
				badgeSpacingTrailing = global.Space_50,
				badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = colors.White }
			}
			t_1.OnlineFriends = createElement_1(var7, t_2)
			
			return createElement(var6, t, t_1)
		else
			local createElement = reactModule.createElement
			local var8 = "Frame"
			local t = {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, global.Space_250 + var3)
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local t_2 = { faceGroupCount = 2 }
			local friends = p2.friends or {}
			local t_3 = {}
			
			for i_1 = 1, #friends do
				t_3[i_1] = friends[i_1].userId
			end
			t_2.users = t_3
			t_2.labelText = array.join(array.map(p2.friends or {}, function(p3)
				return p3.displayName
			end), var4.friendsSeparator)
			t_2.showEmphasisBorder = p2.showOnlineBorder
			t_2.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = global.Size_250,
				faceHeight = global.Size_250,
				faceGroupGap = -global.Space_75,
				containerGap = space50,
				badgeHeight = global.Size_250,
				fontStyle = var2,
				badgeSpacingLeading = global.Space_50,
				badgeSpacingTrailing = global.Space_50,
				badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = colors.White }
			}
			t_1.OnlineFriends = createElement_1(coPlayFooter, t_2)
			
			return createElement(var8, t, t_1)
		end
	end,
	getUserIdsForFacePile = function(p3)
		local t = {}
		
		for i = 1, #p3 do
			t[i] = p3[i].userId
		end
		return t
	end,
	getDisplayName = function(p4, p5)
		-- upvalues: array (ref)
		return array.join(array.map(p4, function(p6)
			return p6.displayName
		end), p5)
	end
}