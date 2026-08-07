local parent = script:FindFirstAncestor("FriendsLanding").Parent
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local dashModule = require(parent.Dash)
local dataHydrationModule = require(parent.DataHydration)
local useSignalState = require(parent.SignalsReact).useSignalState
local signalsModule = require(parent.Signals)
local friendTileModule = require(script.Parent.FriendTile)
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = userProfilesModule.Hooks.useIsRobloxSubscriber
local var6 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0) --[[ line: 19 | named "FriendTileContainer" ]]
	-- upvalues: fFlagFriendsPageUserListEnabled (ref), userProfilesModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), reactModule (ref), signalsModule (ref), var6 (ref), useSignalState (ref), friendTileModule (ref), dashModule (ref)
	local var7 = if fFlagFriendsPageUserListEnabled then nil else userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0.user.id },
		query = userProfilesModule.Queries.userProfilesFriendsLandingQueryByUserIds
	})
	local var8 = nil
	
	if fFlagEnableBlackbirdCheck then
		var8 = useIsRobloxSubscriber(if p0.user and p0.user.id then p0.user.id else nil)
	end
	local _ = nil
	
	return reactModule.createElement(friendTileModule, dashModule.join(p0, {
		userProfile = if fFlagFriendsPageUserListEnabled then nil elseif var7.data then var7.data.userProfiles[1] else nil,
		trustedConnection = useSignalState(reactModule.useMemo(function() --[[ line: 33 ]]
			-- upvalues: signalsModule (copy), p0 (ref), var6 (copy)
			return signalsModule.createComputed(function(p1) --[[ line: 34 ]]
				-- upvalues: p0 (copy), var6 (copy)
				return if p0.user and p0.user.id and p0.user.id ~= "" then var6.getIsTrustedConnection(p0.user.id).data(p1) else nil
			end)
		end, { if p0.user then p0.user.id else nil })),
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var8 else nil
	}))
end