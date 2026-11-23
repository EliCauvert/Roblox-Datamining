local Parent = script:FindFirstAncestor("FriendRequests").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local FollowingModule = require(Parent.DataHydration.Following)
local _ = require(Parent.DataHydration.FriendsRequests)
local SharedFlagsModule = require(Parent.SharedFlags)
local UserListModule = require(Parent.UserList)
local FFlagAddFriendsAcceptedRequestUx = SharedFlagsModule.FFlagAddFriendsAcceptedRequestUx
local FFlagAddFriendsClassmateFriendRequestSource = SharedFlagsModule.FFlagAddFriendsClassmateFriendRequestSource
local ContextInfoTypes = UserListModule.Enums.ContextInfoTypes
local FriendshipOriginSourceType = DataHydrationModule.Friends.Enums.FriendshipOriginSourceType
local Computed = SignalsModule.createComputed(function()
	return nil
end)

local function useFollowState(Id)
	-- upvalues: ReactModule (copy), FollowingModule (copy), SignalsReactModule (copy), Computed (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Id (copy), FollowingModule (upval)
		return if Id then FollowingModule.FollowingStore.get().GetIsFollowing(Id) else nil
	end, { Id })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Id (copy), FollowingModule (upval)
		return if Id then FollowingModule.FollowingStore.get().GetIsFollowed(Id) else nil
	end, { Id })
	
	return SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.data else Computed) == true, SignalsReactModule.useSignalState(if UseMemoResult1 then UseMemoResult1.data else Computed) == true
end

local function useSentFromExperienceName(SourceUniverseId)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local Text = if SourceUniverseId and SourceUniverseId ~= 0 then tostring(SourceUniverseId) else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: Text (copy), DataHydrationModule (upval), SignalsModule (upval)
		local AndFetchGameInfo = if Text then DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(Text, function(): boolean
			return true
		end) else nil
		
		return SignalsModule.createComputed(function(p1)
			-- upvalues: AndFetchGameInfo (copy)
			return if AndFetchGameInfo then AndFetchGameInfo.data(p1) else nil
		end)
	end, { Text })))
	
	return if Text and UseSignalStateResult and not UseSignalStateResult.isUnavailable and UseSignalStateResult.name ~= nil and UseSignalStateResult.name ~= "" then UseSignalStateResult.name else nil
end

return function(p1, FriendStatus)
	-- upvalues: useFollowState (copy), useSentFromExperienceName (copy), FFlagAddFriendsAcceptedRequestUx (copy), ReactModule (copy), ContextInfoTypes (copy), FriendshipOriginSourceType (copy), FFlagAddFriendsClassmateFriendRequestSource (copy)
	local v1 = p1 ~= nil
	local ContactName = if p1 then p1.contactName else nil
	local OriginSourceType = if p1 then p1.originSourceType else nil
	local CountMutualFriendsIds: number = if p1 and p1.mutualFriendsIds then #p1.mutualFriendsIds else 0
	local UseFollowStateResult, UseFollowStateResult2 = useFollowState(if p1 then p1.id else nil)
	local UseSentFromExperienceNameResult = useSentFromExperienceName(if p1 then p1.sourceUniverseId else nil)
	local IsFriendStatusMatch: boolean = FFlagAddFriendsAcceptedRequestUx and FriendStatus == Enum.FriendStatus.Friend
	
	return ReactModule.useMemo(function()
		-- upvalues: v1 (copy), IsFriendStatusMatch (copy), ContextInfoTypes (upval), ContactName (copy), OriginSourceType (copy), FriendshipOriginSourceType (upval), FFlagAddFriendsClassmateFriendRequestSource (upval), CountMutualFriendsIds (copy), UseSentFromExperienceNameResult (copy), UseFollowStateResult (copy), UseFollowStateResult2 (copy)
		if v1 then
			local NewFriend = if IsFriendStatusMatch then ContextInfoTypes.NewFriend elseif ContactName and ContactName ~= "" then ContextInfoTypes.HaveContact elseif OriginSourceType == FriendshipOriginSourceType.PhoneContactImporter then ContextInfoTypes.FromCI elseif OriginSourceType == FriendshipOriginSourceType.QrCode then ContextInfoTypes.FromQR elseif FFlagAddFriendsClassmateFriendRequestSource and OriginSourceType == FriendshipOriginSourceType.SchoolMemberList then ContextInfoTypes.SchoolMemberList elseif CountMutualFriendsIds > 0 then ContextInfoTypes.MutualFriends elseif UseSentFromExperienceNameResult == nil then if UseFollowStateResult then ContextInfoTypes.FollowingUser elseif UseFollowStateResult2 then ContextInfoTypes.FollowingMe else nil else ContextInfoTypes.FromExperience
			
			return {
				type = NewFriend,
				mutualFriendsCount = if NewFriend == ContextInfoTypes.MutualFriends then CountMutualFriendsIds else nil,
				contactName = if NewFriend == ContextInfoTypes.HaveContact then ContactName else nil,
				sentFromExperienceName = if NewFriend == ContextInfoTypes.FromExperience then UseSentFromExperienceNameResult else nil
			}
		else
			return nil
		end
	end, {
		v1, ContactName, OriginSourceType, CountMutualFriendsIds,
		UseSentFromExperienceNameResult, UseFollowStateResult, UseFollowStateResult2,
		IsFriendStatusMatch
	})
end