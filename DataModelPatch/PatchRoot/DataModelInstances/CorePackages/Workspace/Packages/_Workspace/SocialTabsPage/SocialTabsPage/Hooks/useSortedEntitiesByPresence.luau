local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local UseSelectorFunction = require(SocialTabsPage.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local RoduxPresenceModule = require(SocialTabsPage.Rodux.RoduxPresence)
local PresenceType = RoduxPresenceModule.Enums.PresenceType
local config = {
	[PresenceType.InGame] = 3,
	[PresenceType.Online] = 2,
	[PresenceType.InStudio] = 1,
	[PresenceType.Offline] = 0
}

local function _(p1)
	-- upvalues: config (copy)
	return config[p1] or 0
end

local function usersOrderEqual(List, p1): boolean
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

return function(Users)
	-- upvalues: UseSelectorFunction (copy), RoduxPresenceModule (copy), PresenceType (copy), config (copy), usersOrderEqual (copy)
	return UseSelectorFunction(function(p2)
		-- upvalues: Users (copy), RoduxPresenceModule (upval), PresenceType (upval), config (upval)
		if #Users == 0 then
			return Users
		end
		local List = {}
		
		for OriginalIndex, user in Users do
			local UserPresenceByUserId = RoduxPresenceModule.Selectors.getUserPresenceByUserId(p2, user.id)
			table.insert(List, {
				user = user,
				weight = config[if UserPresenceByUserId then UserPresenceByUserId.userPresenceType else PresenceType.Offline] or 0,
				originalIndex = OriginalIndex
			})
		end
		table.sort(List, function(A, B): boolean
			return if A.weight == B.weight then A.originalIndex < B.originalIndex else B.weight < A.weight
		end)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, value.user)
		end
		return List1
	end, usersOrderEqual)
end