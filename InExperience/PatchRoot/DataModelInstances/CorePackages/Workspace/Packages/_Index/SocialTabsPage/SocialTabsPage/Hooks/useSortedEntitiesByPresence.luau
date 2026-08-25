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
local var7 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var8 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local t = {
	[presenceType.InGame] = 3,
	[presenceType.Online] = 2,
	[presenceType.InStudio] = 1,
	[presenceType.Offline] = 0
}

local function _(p0)
	-- upvalues: t (ref)
	return t[p0] or 0
end

local var10 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then {
	[var8.InGame] = 3,
	[var8.Online] = 2,
	[var8.InStudio] = 1,
	[var8.Offline] = 0
} else nil

local _ = function(p1)
	-- upvalues: var10 (ref)
	return var10[p1] or 0
end

local function usersOrderEqual(p2, p3)
	if p2 == p3 then
		return true
	elseif not p2 or not p3 or #p2 ~= #p3 then
		return false
	end
	for i, v in p2 do
		if v.id ~= p3[i].id then
			return false
		end
	end
	return true
end

return function(p4)
	-- upvalues: fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), reactModule (ref), signalsModule (ref), var7 (ref), var8 (ref), var10 (ref), usersOrderEqual (ref), signalsReactModule (ref), useSelector (ref), roduxPresenceModule (ref), presenceType (ref), t (ref)
	return if fFlagSocialTabsPagePresenceSignalsMigrationModule then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p4 (ref), var7 (copy), var8 (copy), var10 (copy), usersOrderEqual (copy)
		return signalsModule.createComputed(function(p8)
			-- upvalues: p4 (copy), var7 (copy), var8 (copy), var10 (copy)
			if #p4 == 0 then
				return p4
			end
			local t = {}
			
			for i, v in p4 do
				local var17 = var7.GetPresenceByUserId(tostring(v.id)).data(p8)
				table.insert(t, {
					user = v,
					weight = var10[if var17 then var17.userPresenceType else var8.Offline] or 0,
					originalIndex = i
				})
			end
			table.sort(t, function(p9, p10)
				return if p9.weight == p10.weight then p9.originalIndex < p10.originalIndex else p10.weight < p9.weight
			end)
			local t_1 = {}
			
			for i_1, v_1 in t do
				table.insert(t_1, v_1.user)
			end
			return t_1
		end, usersOrderEqual)
	end, { p4 })) else useSelector(function(p5)
		-- upvalues: p4 (ref), roduxPresenceModule (copy), presenceType (copy), t (copy)
		if #p4 == 0 then
			return p4
		end
		local t_1 = {}
		
		for i, v in p4 do
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