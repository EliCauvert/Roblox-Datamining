local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local FriendsMenuModule = require(Parent.FriendsMenu)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GameDetailsContextModule = require(GameInvite.Context.GameDetailsContext)
local GameInviteFriendRowModule = require(script.Parent.GameInviteFriendRow)
local _ = require(script.Parent.GameInviteFriendsListView)
local CanShareGameInviteLinkModule = require(script.Parent.canShareGameInviteLink)
local User = require(Parent.UserList).Enums.EntityType.User

local function ignoreRowSelection() --[[ Line: 31 ]] end

return function(p1) --[[ Line: 33 | Named "useGameInviteFriendsListViewModel" ]]
	-- upvalues: ReactModule (copy), FriendsMenuModule (copy), GameDetailsContextModule (copy), UseAppPolicyFunction (copy), User (copy), GameInviteFriendRowModule (copy), ignoreRowSelection (copy), CanShareGameInviteLinkModule (copy)
	local Friends = ReactModule.useContext(FriendsMenuModule.FriendsListContext).friends
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: Friends (copy), User (upval)
		local Entities = {}
		local FriendsById = {}
		
		for _, friend in Friends do
			if not friend.isLoadingPlaceholder and FriendsById[friend.id] == nil then
				table.insert(Entities, { id = friend.id, type = User })
				FriendsById[friend.id] = friend
			end
		end
		return { entities = Entities, friendsById = FriendsById }
	end, { Friends })
	local FriendsById = UseMemoResult.friendsById
	
	return {
		layoutOrder = p1.layoutOrder,
		size = p1.size,
		entities = UseMemoResult.entities,
		renderRow = ReactModule.useCallback(function(CreateRow, p2, RowNumber) --[[ Line: 55 ]]
			-- upvalues: FriendsById (copy), ReactModule (upval), GameInviteFriendRowModule (upval)
			local FriendsByIdEntry = FriendsById[p2.id]
			
			return if FriendsByIdEntry == nil then nil else ReactModule.createElement(GameInviteFriendRowModule, {
				createRow = CreateRow,
				friend = FriendsByIdEntry,
				rowNumber = RowNumber
			})
		end, { FriendsById }),
		onRowSelected = ignoreRowSelection,
		showShareGameInviteLink = CanShareGameInviteLinkModule(game.GameId, ReactModule.useContext(GameDetailsContextModule), (UseAppPolicyFunction(function(p2) --[[ Line: 36 ]]
			return p2.getExperienceInviteShareLinkEnabled()
		end)))
	}
end