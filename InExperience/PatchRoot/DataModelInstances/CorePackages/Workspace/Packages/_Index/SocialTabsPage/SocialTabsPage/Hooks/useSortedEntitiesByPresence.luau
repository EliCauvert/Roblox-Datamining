local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local var1 = dataHydrationModule.Presence.PresenceStore.get()
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local t = {
	[presenceType.InGame] = 3,
	[presenceType.Online] = 2,
	[presenceType.InStudio] = 1,
	[presenceType.Offline] = 0
}

local function _(p1)
	-- upvalues: t (ref)
	return t[p1] or 0
end

local function usersOrderEqual(p1, p2)
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

return function(p3)
	-- upvalues: reactModule (ref), signalsModule (ref), var1 (ref), presenceType (ref), t (ref), usersOrderEqual (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p3 (ref), var1 (copy), presenceType (copy), t (copy), usersOrderEqual (copy)
		return signalsModule.createComputed(function(p4)
			-- upvalues: p3 (copy), var1 (copy), presenceType (copy), t (copy)
			if #p3 == 0 then
				return p3
			end
			local t_1 = {}
			
			for i, v in p3 do
				local var2 = var1.GetPresenceByUserId(tostring(v.id)).data(p4)
				table.insert(t_1, {
					user = v,
					weight = t[if var2 then var2.userPresenceType else presenceType.Offline] or 0,
					originalIndex = i
				})
			end
			table.sort(t_1, function(p5, p6)
				return if p5.weight == p6.weight then p5.originalIndex < p6.originalIndex else p6.weight < p5.weight
			end)
			local t_2 = {}
			
			for i_1, v_1 in t_1 do
				table.insert(t_2, v_1.user)
			end
			return t_2
		end, usersOrderEqual)
	end, { p3 }))
end