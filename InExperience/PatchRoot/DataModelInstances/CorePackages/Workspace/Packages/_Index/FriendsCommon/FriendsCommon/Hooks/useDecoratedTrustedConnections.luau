local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagConnectionManagementChips = SharedFlagsModule.FFlagConnectionManagementChips
local FFlagFriendsDeepLinkScrollToCandidates = SharedFlagsModule.FFlagFriendsDeepLinkScrollToCandidates
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.GraphQLServer)
local GetResult = if FFlagConnectionManagementChips then DataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p1)
	-- upvalues: FFlagConnectionManagementChips (copy), FFlagFriendsDeepLinkScrollToCandidates (copy), GetResult (copy), SignalsReactModule (copy), ReactModule (copy), CryoModule (copy), DataHydrationModule (copy)
	if FFlagConnectionManagementChips then
		local UserTrustedConnections = GetResult.getUserTrustedConnections()
		local UseSignalStateResult = SignalsReactModule.useSignalState(UserTrustedConnections.data)
		local UseSignalStateResult1 = if FFlagFriendsDeepLinkScrollToCandidates then SignalsReactModule.useSignalState(UserTrustedConnections.status) else nil
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			if not p1 then
				return {}
			end
			local t = {}
			
			for _, value in p1 do
				t[value.id] = true
			end
			return t
		end, { p1 })
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy)
			if not UseSignalStateResult then
				return {}
			end
			local t = {}
			
			for _, value in UseSignalStateResult do
				t[value.id] = true
			end
			return t
		end, { UseSignalStateResult })
		local UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), CryoModule (upval), p1 (copy), UseMemoResult1 (copy), UseMemoResult (copy)
			return if UseSignalStateResult then CryoModule.List.join(CryoModule.List.filter(p1 or {}, function(p2): boolean
				-- upvalues: UseMemoResult1 (upval)
				return UseMemoResult1[p2.id] == true
			end), (CryoModule.List.filter(UseSignalStateResult, function(p2): boolean
				-- upvalues: UseMemoResult (upval)
				return UseMemoResult[p2.id] ~= true
			end))) else {}
		end, { UseMemoResult1, UseSignalStateResult, UseMemoResult })
		
		return if FFlagFriendsDeepLinkScrollToCandidates then {
			friends = UseMemoResult2,
			isLoading = UseSignalStateResult1 == DataHydrationModule.DataStatus.NotReady
		} else UseMemoResult2
	else
		return if FFlagFriendsDeepLinkScrollToCandidates then { isLoading = false, friends = {} } else nil
	end
end