local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local GetResult = DataHydrationModule.Presence.PresenceStore.get()
local PresenceType = DataHydrationModule.Presence.PresenceEnums.PresenceType
local config = {
	[PresenceType.InGame] = 3,
	[PresenceType.Online] = 2,
	[PresenceType.InStudio] = 1,
	[PresenceType.Offline] = 0
}

local function _(p1) --[[ Line: 23 | Named "getStorePresenceWeight" ]]
	-- upvalues: config (copy)
	return config[p1] or 0
end

local function usersOrderEqual(List, p1): boolean --[[ Line: 29 ]]
	if List == p1 then
		return true
	end
	if not List or not p1 or #List ~= #p1 then
		return false
	end
	for i, value in List do
		if value.id ~= p1[i].id then
			return false
		end
	end
	return true
end

return function(Users) --[[ Line: 55 | Named "useSortedUsersByPresence" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetResult (copy), PresenceType (copy), config (copy), usersOrderEqual (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: SignalsModule (upval), Users (copy), GetResult (upval), PresenceType (upval), config (upval), usersOrderEqual (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 57 ]]
			-- upvalues: Users (upval), GetResult (upval), PresenceType (upval), config (upval)
			if #Users == 0 then
				return Users
			end
			local List = {}
			
			for OriginalIndex, user in Users do
				local DataResult = GetResult.GetPresenceByUserId((tostring(user.id))).data(p2)
				table.insert(List, {
					user = user,
					weight = config[if DataResult then DataResult.userPresenceType else PresenceType.Offline] or 0,
					originalIndex = OriginalIndex
				})
			end
			table.sort(List, function(A, B): boolean --[[ Line: 74 ]]
				return if A.weight == B.weight then A.originalIndex < B.originalIndex else B.weight < A.weight
			end)
			local List1 = {}
			
			for _, value in List do
				table.insert(List1, value.user)
			end
			return List1
		end, usersOrderEqual)
	end, { Users })))
end