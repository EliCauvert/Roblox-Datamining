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

local function useFetchSortedDisplayNames(p0) --[[ line: 55 ]]
	-- upvalues: useUserProfilesFetch (ref), userProfilesModule (ref), sortFriendsByPresenceAndRecencyFactoryModule (ref)
	local t = {}
	local var7 = useUserProfilesFetch({
		userIds = p0,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = not p0 or #p0 == 0
	})
	
	if var7 and var7.data and p0 then
		for i, v in p0 do
			table.insert(t, {
				userId = v,
				displayName = userProfilesModule.Selectors.getCombinedNameFromId(var7.data, v)
			})
		end
	end
	table.sort(t, sortFriendsByPresenceAndRecencyFactoryModule("displayName"))
	
	return t
end

return {
	GridTileFriendFooter = function(p1) --[[ line: 77 ]]
		-- upvalues: useStyle (ref), useDesignTokens (ref), useTextSizeOffset (ref), useLocalization (ref), fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (ref), useFetchSortedDisplayNames (ref), reactModule (ref), coPlayFooter (ref), array (ref), colors (ref)
		local var8 = if p1.useLargerFont then useStyle().Font.Body else useStyle().Font.CaptionHeader
		local global = useDesignTokens().Global
		local var9 = useTextSizeOffset()
		local var10 = useLocalization({
			friendsSeparator = "Feature.GameDetails.Label.FriendsSeparator"
		})
		local space50 = global.Space_50
		
		if not p1.showOnlineBorder then
			space50 -= 3
		end
		if fFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			local var11 = useFetchSortedDisplayNames(p1.friendUserIds or {})
			local createElement = reactModule.createElement
			local var12 = "TextButton"
			local t = {
				Size = UDim2.new(1, 0, 0, global.Space_250 + var9),
				BackgroundTransparency = 1,
				Text = "",
				AutoButtonColor = false,
				[reactModule.Event.Activated] = p1.onFriendFooterActivated,
				Selectable = false
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local var15 = coPlayFooter
			local t_2 = { faceGroupCount = 2 }
			local t_3 = {}
			
			for i = 1, #var11 do
				t_3[i] = var11[i].userId
			end
			t_2.users = t_3
			t_2.labelText = array.join(array.map(var11, function(p2) --[[ line: 48 ]]
				return p2.displayName
			end), var10.friendsSeparator)
			t_2.showEmphasisBorder = p1.showOnlineBorder
			t_2.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = global.Size_250,
				faceHeight = global.Size_250,
				faceGroupGap = -global.Space_75,
				containerGap = space50,
				badgeHeight = global.Size_250,
				fontStyle = var8,
				badgeSpacingLeading = global.Space_50,
				badgeSpacingTrailing = global.Space_50,
				badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = colors.White }
			}
			t_1.OnlineFriends = createElement_1(var15, t_2)
			
			return createElement(var12, t, t_1)
		else
			local createElement = reactModule.createElement
			local var18 = "Frame"
			local t = {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, global.Space_250 + var9)
			}
			local t_1 = {}
			local createElement_1 = reactModule.createElement
			local t_2 = { faceGroupCount = 2 }
			local friends = p1.friends or {}
			local t_3 = {}
			
			for i_1 = 1, #friends do
				t_3[i_1] = friends[i_1].userId
			end
			t_2.users = t_3
			t_2.labelText = array.join(array.map(p1.friends or {}, function(p3) --[[ line: 48 ]]
				return p3.displayName
			end), var10.friendsSeparator)
			t_2.showEmphasisBorder = p1.showOnlineBorder
			t_2.styleProps = {
				badgeBorderWidth = 3,
				faceWidth = global.Size_250,
				faceHeight = global.Size_250,
				faceGroupGap = -global.Space_75,
				containerGap = space50,
				badgeHeight = global.Size_250,
				fontStyle = var8,
				badgeSpacingLeading = global.Space_50,
				badgeSpacingTrailing = global.Space_50,
				badgeBackgroundColor = { Transparency = 0, Color = colors.Smoke },
				badgeContentColor = { Transparency = 0, Color = colors.White }
			}
			t_1.OnlineFriends = createElement_1(coPlayFooter, t_2)
			
			return createElement(var18, t, t_1)
		end
	end,
	getUserIdsForFacePile = function(p4) --[[ line: 37 ]]
		local t = {}
		
		for i = 1, #p4 do
			t[i] = p4[i].userId
		end
		return t
	end,
	getDisplayName = function(p5, p6) --[[ line: 46 ]]
		-- upvalues: array (ref)
		return array.join(array.map(p5, function(p7) --[[ line: 48 ]]
			return p7.displayName
		end), p6)
	end
}