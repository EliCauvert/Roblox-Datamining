local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local FriendsMenuModule = require(Parent.FriendsMenu)
local HidePresenceInOtherExperienceModule = require(GameInvite.utils.hidePresenceInOtherExperience)
local FriendsMenuFriendsList = FriendsMenuModule.FriendsMenuFriendsList
local FriendsListContext = FriendsMenuModule.FriendsListContext

return function(p1)
	-- upvalues: ReactModule (copy), FriendsListContext (copy), HidePresenceInOtherExperienceModule (copy), FriendsMenuFriendsList (copy)
	local UseContextResult = ReactModule.useContext(FriendsListContext)
	local Friends = UseContextResult.friends
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HidePresenceInOtherExperienceModule (upval), Friends (copy)
		return HidePresenceInOtherExperienceModule(Friends, (tostring(game.GameId)))
	end, { Friends })
	
	return ReactModule.createElement(FriendsListContext.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseContextResult (copy), UseMemoResult (copy)
			local Copy = table.clone(UseContextResult)
			Copy.friends = UseMemoResult
			
			return Copy
		end, { UseContextResult, UseMemoResult })
	}, {
		FriendsList = ReactModule.createElement(FriendsMenuFriendsList, p1)
	})
end