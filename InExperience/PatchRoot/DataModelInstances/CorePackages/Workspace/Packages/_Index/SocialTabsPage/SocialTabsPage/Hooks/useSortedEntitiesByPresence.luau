local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local var1 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var2 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
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

local var3 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then {
	[var2.InGame] = 3,
	[var2.Online] = 2,
	[var2.InStudio] = 1,
	[var2.Offline] = 0
} else nil

local _ = function(p1)
	-- upvalues: var3 (ref)
	return var3[p1] or 0
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
	-- upvalues: fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), var2 (ref), var3 (ref), usersOrderEqual (ref), signalsReactModule (ref), useSelector (ref), roduxPresenceModule (ref), presenceType (ref), t (ref)
	return if fFlagSocialTabsPagePresenceSignalsMigrationModule then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p3 (ref), var1 (copy), var2 (copy), var3 (copy), usersOrderEqual (copy)
		return signalsModule.createComputed(function(p4)
			-- upvalues: p3 (copy), var1 (copy), var2 (copy), var3 (copy)
			if #p3 == 0 then
				return p3
			end
			local t = {}
			
			for i, v in p3 do
				local var4 = var1.GetPresenceByUserId(tostring(v.id)).data(p4)
				table.insert(t, {
					user = v,
					weight = var3[if var4 then var4.userPresenceType else var2.Offline] or 0,
					originalIndex = i
				})
			end
			table.sort(t, function(p5, p6)
				return if p5.weight == p6.weight then p5.originalIndex < p6.originalIndex else p6.weight < p5.weight
			end)
			local t_1 = {}
			
			for i_1, v_1 in t do
				table.insert(t_1, v_1.user)
			end
			return t_1
		end, usersOrderEqual)
	end, { p3 })) else useSelector(function(p5)
		-- upvalues: p3 (ref), roduxPresenceModule (copy), presenceType (copy), t (copy)
		if #p3 == 0 then
			return p3
		end
		local t_1 = {}
		
		for i, v in p3 do
			local userPresenceByUserId = roduxPresenceModule.Selectors.getUserPresenceByUserId(p5, v.id)
			table.insert(t_1, {
				user = v,
				weight = t[if userPresenceByUserId then userPresenceByUserId.userPresenceType else presenceType.Offline] or 0,
				originalIndex = i
			})
		end
		table.sort(t_1, function(p6, p7)
			return if p6.weight == p7.weight then p6.originalIndex < p7.originalIndex else p7.weight < p6.weight
		end)
		local t_2 = {}
		
		for i_1, v_1 in t_1 do
			table.insert(t_2, v_1.user)
		end
		return t_2
	end, usersOrderEqual)
end