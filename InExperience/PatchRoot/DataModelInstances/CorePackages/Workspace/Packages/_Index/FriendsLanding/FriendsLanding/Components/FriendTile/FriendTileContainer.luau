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
local var1 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1)
	-- upvalues: fFlagFriendsPageUserListEnabled (ref), userProfilesModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), reactModule (ref), signalsModule (ref), var1 (ref), useSignalState (ref), friendTileModule (ref), dashModule (ref)
	local var2 = if fFlagFriendsPageUserListEnabled then nil else userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.user.id },
		query = userProfilesModule.Queries.userProfilesFriendsLandingQueryByUserIds
	})
	local var3 = nil
	
	if fFlagEnableBlackbirdCheck then
		var3 = useIsRobloxSubscriber(if p1.user and p1.user.id then p1.user.id else nil)
	end
	local _ = nil
	
	return reactModule.createElement(friendTileModule, dashModule.join(p1, {
		userProfile = if fFlagFriendsPageUserListEnabled then nil elseif var2.data then var2.data.userProfiles[1] else nil,
		trustedConnection = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p1 (ref), var1 (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: p1 (copy), var1 (copy)
				return if p1.user and p1.user.id and p1.user.id ~= "" then var1.getIsTrustedConnection(p1.user.id).data(p2) else nil
			end)
		end, { if p1.user then p1.user.id else nil })),
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var3 else nil
	}))
end