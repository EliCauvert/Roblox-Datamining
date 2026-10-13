local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local friendsMenuModule = require(parent.FriendsMenu)
local userListModule = require(parent.UserList)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local gameDetailsContextModule = require(gameInvite.Context.GameDetailsContext)
local gameInviteFriendRowModule = require(script.Parent.GameInviteFriendRow)
local _ = require(script.Parent.GameInviteFriendsListView)
local canShareGameInviteLinkModule = require(script.Parent.canShareGameInviteLink)
local user = userListModule.Enums.EntityType.User

local function ignoreRowSelection() end

return function(p1)
	-- upvalues: reactModule (ref), friendsMenuModule (ref), gameDetailsContextModule (ref), useAppPolicy (ref), user (ref), gameInviteFriendRowModule (ref), ignoreRowSelection (ref), canShareGameInviteLinkModule (ref)
	local friends = reactModule.useContext(friendsMenuModule.FriendsListContext).friends
	local var1 = reactModule.useContext(gameDetailsContextModule)
	local var2 = useAppPolicy(function(p2)
		return p2.getExperienceInviteShareLinkEnabled()
	end)
	local var3 = reactModule.useMemo(function()
		-- upvalues: friends (ref), user (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in friends do
			if not v.isLoadingPlaceholder and t_1[v.id] == nil then
				table.insert(t, { id = v.id, type = user })
				t_1[v.id] = v
			end
		end
		return { entities = t, friendsById = t_1 }
	end, { friends })
	local friendsById = var3.friendsById
	
	return {
		layoutOrder = p1.layoutOrder,
		size = p1.size,
		entities = var3.entities,
		renderRow = reactModule.useCallback(function(p2, p3, p4)
			-- upvalues: friendsById (ref), reactModule (copy), gameInviteFriendRowModule (copy)
			local id = friendsById[p3.id]
			
			return if id == nil then nil else reactModule.createElement(gameInviteFriendRowModule, { createRow = p2, friend = id, rowNumber = p4 })
		end, { friendsById }),
		onRowSelected = ignoreRowSelection,
		showShareGameInviteLink = canShareGameInviteLinkModule(game.GameId, var1, var2)
	}
end