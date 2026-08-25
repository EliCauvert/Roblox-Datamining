local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local presenceType = require(parent.DataHydration).Presence.PresenceEnums.PresenceType
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.SduiCoreSystem)
local useGetOnlineFriends = require(parent.FriendsHydrationReact).useGetOnlineFriends
local fFlagSduiSocialDataMigrateOffLegacyPresence = require(parent.SharedFlags).FFlagSduiSocialDataMigrateOffLegacyPresence

local function useOnlineFriendsInGameByUniverseId()
	-- upvalues: useGetOnlineFriends (ref), reactModule (ref), presenceType (ref)
	local var4 = useGetOnlineFriends()
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), presenceType (copy)
		local t = {}
		
		for i, v in var4 or {} do
			local presence = v.presence
			
			if presence and presence.userPresenceType == presenceType.InGame and (presence.universeId and presence.universeId ~= "") then
				local universeId = t[presence.universeId] or {}
				universeId[v.id] = v.id
				t[presence.universeId] = universeId
			end
		end
		return t
	end, { var4 })
end

local function useFriendsInGame()
	-- upvalues: useSelector (ref), reactModule (ref)
	local var7 = useSelector(function(p0)
		return p0.LocalUserId
	end)
	local var8 = useSelector(function(p1)
		return p1.InGameUsersByGame
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref), var7 (ref)
		local t = {}
		
		for i, v in var8 do
			local t_1 = {}
			
			for i_1, v_1 in v do
				if i_1 ~= tostring(var7) then
					t_1[i_1] = i_1
				end
			end
			if next(t_1) then
				t[tostring(i)] = t_1
			end
		end
		return t
	end, { var7, var8 })
end

return function()
	-- upvalues: reactModule (ref), signalsModule (ref), fFlagSduiSocialDataMigrateOffLegacyPresence (ref), useOnlineFriendsInGameByUniverseId (ref), useFriendsInGame (ref)
	local var11, var12 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal({})
	end, {})
	var12(if fFlagSduiSocialDataMigrateOffLegacyPresence then useOnlineFriendsInGameByUniverseId() else useFriendsInGame())
	
	return reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return { getInGameFriendsByGame = var11 }
	end, { var11 })
end