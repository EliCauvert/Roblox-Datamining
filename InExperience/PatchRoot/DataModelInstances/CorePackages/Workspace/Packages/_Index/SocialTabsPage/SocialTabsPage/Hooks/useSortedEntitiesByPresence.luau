local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local useSelector = require(socialTabsPage.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType
local t = {
	[presenceType.InGame] = 3,
	[presenceType.Online] = 2,
	[presenceType.InStudio] = 1,
	[presenceType.Offline] = 0
}

local function _(p0) --[[ line: 22 | named "getPresenceWeight" ]]
	-- upvalues: t (ref)
	return t[p0] or 0
end

local function usersOrderEqual(p1, p2) --[[ line: 28 ]]
	if p1 == p2 then
		return true
	elseif not p1 or not p2 or #p1 ~= #p2 then
		return false
	end
	for i, v in p1 do
		if v.id ~= p2[i].id then
			return false
		end
	end
	return true
end

return function(p3) --[[ line: 48 | named "useSortedUsersByPresence" ]]
	-- upvalues: useSelector (ref), roduxPresenceModule (ref), presenceType (ref), t (ref), usersOrderEqual (ref)
	return useSelector(function(p4) --[[ line: 49 ]]
		-- upvalues: p3 (ref), roduxPresenceModule (copy), presenceType (copy), t (copy)
		if #p3 == 0 then
			return p3
		end
		local t_1 = {}
		
		for i, v in p3 do
			local userPresenceByUserId = roduxPresenceModule.Selectors.getUserPresenceByUserId(p4, v.id)
			table.insert(t_1, {
				user = v,
				weight = t[if userPresenceByUserId then userPresenceByUserId.userPresenceType else presenceType.Offline] or 0,
				originalIndex = i
			})
		end
		table.sort(t_1, function(p5, p6) --[[ line: 65 ]]
			return if p5.weight == p6.weight then p5.originalIndex < p6.originalIndex else p6.weight < p5.weight
		end)
		local t_2 = {}
		
		for i_1, v_1 in t_1 do
			table.insert(t_2, v_1.user)
		end
		return t_2
	end, usersOrderEqual)
end