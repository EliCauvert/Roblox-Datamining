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
	local var1 = useGetOnlineFriends()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), presenceType (copy)
		local t = {}
		
		for i, v in var1 or {} do
			local presence = v.presence
			
			if presence and presence.userPresenceType == presenceType.InGame and (presence.universeId and presence.universeId ~= "") then
				local universeId = t[presence.universeId] or {}
				universeId[v.id] = v.id
				t[presence.universeId] = universeId
			end
		end
		return t
	end, { var1 })
end

local function useFriendsInGame()
	-- upvalues: useSelector (ref), reactModule (ref)
	local var2 = useSelector(function(p1)
		return p1.LocalUserId
	end)
	local var3 = useSelector(function(p1)
		return p1.InGameUsersByGame
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref)
		local t = {}
		
		for i, v in var3 do
			local t_1 = {}
			
			for i_1, v_1 in v do
				if i_1 ~= tostring(var2) then
					t_1[i_1] = i_1
				end
			end
			if next(t_1) then
				t[tostring(i)] = t_1
			end
		end
		return t
	end, { var2, var3 })
end

return function()
	-- upvalues: reactModule (ref), signalsModule (ref), fFlagSduiSocialDataMigrateOffLegacyPresence (ref), useOnlineFriendsInGameByUniverseId (ref), useFriendsInGame (ref)
	local var4, var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal({})
	end, {})
	var5(if fFlagSduiSocialDataMigrateOffLegacyPresence then useOnlineFriendsInGameByUniverseId() else useFriendsInGame())
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return { getInGameFriendsByGame = var4 }
	end, { var4 })
end